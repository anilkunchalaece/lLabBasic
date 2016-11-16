var app = angular.module("iotaApp", []);

app.directive('updateMaterialSelect', function () {
    return function (scope, element, attrs) {
        if (true) {
            scope.$eval('doUpdateMaterialSelect()');
        }
    };
});

app.factory("DataService", ["$http", function ($http) {
    return $http.get("data/devices.json");

}]);

/*
app.factory("MessageService", ["$rootScope", function ($rootScope) {

    var factory = {};
    var client;

    factory.connectToMessageService = function (messageServer, serverPort, userName, password) {
        // create mqtt client instance
        client = new Paho.MQTT.Client(messageServer, serverPort, userName); 

        // set callback handlers
        client.onConnectionLost = onConnectionLost;
        client.onMessageArrived = onMessageArrived;

        // connect the client
        $rootScope.connectionStatus = "Connecting..."
        console.log("Connecting...")
        client.connect({
            onSuccess: onConnect,
            onFailure: onFailure,
            userName: userName,
            password: password,
            useSSL: true
        });

        // callback functions
        function onConnect() {
            $rootScope.connectionStatus = "Connected";
            console.log("onConnect: connected to message server");
            client.subscribe("anilkunchalaece/feeds/command");
        };

        function onFailure(response){
            console.log("onFailure: failed to connect to message server. Reason: " + response.errorMessage);
        };

        function onConnectionLost(responseObject) {
            $rootScope.connectionStatus = "Not Connected";
            console.log("onConnectionLost:" + responseObject.errorMessage);
        };

        function onMessageArrived(message) {
            console.log("onMessageArrived: Message = " + message.payloadString);
            $rootScope.messagePayload = message.payloadString;
        };

    };

    factory.sendMessage = function (messagePayload) {
        message = new Paho.MQTT.Message(messagePayload);
        message.destinationName = "anilkunchalaece/feeds/data";
        client.send(message);
    };

    return factory;

}]);
*/

app.controller("DevicesController", ["$scope", "$interval", "DataService", function ($scope, $interval, DataService) {
    $scope.selectedDevice = null;
    $scope.connectionStatus = "Not Connected";
    $scope.messageServer = "wss://io.adafruit.com:443/mqtt";
    //$scope.serverPort = 443;
    //$scope.clientId = "ksrmic";
    $scope.userName = "anilkunchalaece";
    $scope.password = "e996656b9fe54f9fa298816e1fb9398f";
    $scope.messagePublishDestination = "anilkunchalaece/feeds/command";
    $scope.messageSubscribeDestination = "anilkunchalaece/feeds/data";
    $scope.recentCommand = {};
    $scope.updateTimeout = 15; // in seconds

    function doInitSensorData() {
        $scope.currentTemperature = "";
        $scope.currentHumidity = "";
        $scope.currentSoilMoisture = "";
        $scope.currentLuminance = "";
        $scope.currentPumpStatus = "";
    };

    // initialize sensor data
    doInitSensorData();

    var client; // mqtt client

    var timerRTEMP; // timers
    var timerRHUM;
    var timerRSMS;
    var timerRLUM;
    var timerRPSTATUS;

    // get devices list
    DataService.then(function (response) {
        $scope.devices = response.data;
        console.log($scope.devices);
        $scope.selectedDeviceId = $scope.devices[0].deviceid;
        $scope.selectedDevice = $scope.devices[0];
    });

    $scope.selectDevice = function (index) {
        $scope.selectedDevice = $scope.devices[index];
        doInitSensorData();
    };

    // connect to mqtt message server
    $scope.connectToMessageService = function () {
        // if already connected then disconnect
        if (angular.isDefined(client)) {
            if (client.connected) {
                client.end(true, 
                    function () {
                        $scope.$apply(function () {
                            $scope.connectionStatus = "Not Connected";
                        });
                        client = undefined;
                    });
                return;
            };
        };


        // return if already connected
        if ($scope.connectionStatus == "Connected") return;

        // connect to the message broker
        $scope.connectionStatus = "Connecting...";
        console.log("Connecting...");        
        client = mqtt($scope.messageServer,
            {
                username: $scope.userName,
                password: $scope.password
            }
        );

        // callback functions
        client.on('connect', function () {
            console.log("Connection sucess");
            $scope.$apply(function () {
                $scope.connectionStatus = "Connected";
            });
            console.log("Subscribing to feed...");
            client.subscribe($scope.messageSubscribeDestination);
            console.log("Subscription success");
        });

        client.on('error', function (errorMessage) {
            console.log("Connection failed");
            console.log('ERROR: ' + errorMessage);
            $scope.$apply(function () {
                $scope.connectionStatus = "Not Connected";
            });
        });

        client.on('message', function (topic, payload) {
            console.log('RECEIVED: ' + payload);
            var dataJson = angular.fromJson("{" + payload + "}");
            console.log(dataJson);
            console.log(dataJson.deviceid + ":" + $scope.recentCommand.deviceid);
            console.log(dataJson.data);
            if ($scope.recentCommand.deviceid == dataJson.deviceid) {
                // temperature
                if ($scope.recentCommand.command == "RTEMP" || $scope.recentCommand.command == "RALL") {
                    $scope.$apply(function () {
                        $scope.currentTemperature = dataJson.data.RTEMP;
                    });
                    if (angular.isDefined(timerRTEMP)) {
                        $interval.cancel(timerRTEMP);
                        timerRTEMP = undefined;
                    }
                };
                // humidity
                if ($scope.recentCommand.command == "RHUM" || $scope.recentCommand.command == "RALL") {
                    $scope.$apply(function () {
                        $scope.currentHumidity = dataJson.data.RHUM;
                    });
                    if (angular.isDefined(timerRHUM)) {
                        $interval.cancel(timerRHUM);
                        timerRHUM = undefined;
                    }
                };
                // soil moisture
                if ($scope.recentCommand.command == "RSMS" || $scope.recentCommand.command == "RALL") {
                    $scope.$apply(function () {
                        $scope.currentSoilMoisture = dataJson.data.RSMS;
                    });
                    if (angular.isDefined(timerRSMS)) {
                        $interval.cancel(timerRSMS);
                        timerRSMS = undefined;
                    }
                };
                // Luminance
                if ($scope.recentCommand.command == "RLUM" || $scope.recentCommand.command == "RALL") {
                    $scope.$apply(function () {
                        $scope.currentLuminance = dataJson.data.RLUM;
                    });
                    if (angular.isDefined(timerRLUM)) {
                        $interval.cancel(timerRLUM);
                        timerRLUM = undefined;
                    }
                };
                // pump status
                if ($scope.recentCommand.command == "RPSTATUS" || $scope.recentCommand.command == "RALL") {
                    $scope.$apply(function () {
                        $scope.currentPumpStatus = dataJson.data.RPSTATUS;
                    });
                    if (angular.isDefined(timerRPSTATUS)) {
                        $interval.cancel(timerRPSTATUS);
                        timerRPSTATUS = undefined;
                    }
                };
            };
        });
    };

    // publish command to get current sensor data
    $scope.sendCommand = function (command) {
        if ($scope.connectionStatus == "Connected") {
            // indicators for update...
            // temperature
            if (command == "RTEMP" || command == "RALL") {
                $scope.currentTemperature = "...";
                timerRTEMP = $interval( 
                    function () {
                        $scope.currentTemperature = "No response";
                        if (angular.isDefined(timerRTEMP)) {
                            $interval.cancel(timerRTEMP);
                            timerRTEMP = undefined;
                        }
                    },
                    $scope.updateTimeout*1000, 0, true
                );
            };

            // humidity
            if (command == "RHUM" || command == "RALL") {
                $scope.currentHumidity = "...";
                timerRHUM = $interval(
                    function () {
                        $scope.currentHumidity = "No response";
                        if (angular.isDefined(timerRHUM)) {
                            $interval.cancel(timerRHUM);
                            timerRHUM = undefined;
                        }
                    },
                    $scope.updateTimeout * 1000, 0, true
                );
            }

            // soil moisture 
            if (command == "RSMS" || command == "RALL") {
                $scope.currentSoilMoisture = "...";
                timerRSMS = $interval(
                    function () {
                        $scope.currentSoilMoisture = "No response";
                        if (angular.isDefined(timerRSMS)) {
                            $interval.cancel(timerRSMS);
                            timerRSMS = undefined;
                        }
                    },
                    $scope.updateTimeout * 1000, 0, true
                );
            }

            // luminance 
            if (command == "RLUM" || command == "RALL") {
                $scope.currentLuminance = "...";
                timerRLUM = $interval(
                    function () {
                        $scope.currentLuminance = "No response";
                        if (angular.isDefined(timerRLUM)) {
                            $interval.cancel(timerRLUM);
                            timerRLUM = undefined;
                        }
                    },
                    $scope.updateTimeout * 1000, 0, true
                );
            }

            // pump status 
            if (command == "RPSTATUS" || command == "RALL") {
                $scope.currentPumpStatus = "...";
                timerRPSTATUS = $interval(
                    function () {
                        $scope.currentPumpStatus = "No response";
                        if (angular.isDefined(timerRPSTATUS)) {
                            $interval.cancel(timerRPSTATUS);
                            timerRPSTATUS = undefined;
                        }
                    },
                    $scope.updateTimeout * 1000, 0, true
                );
            }

            // publish message/command
            var msg = '"deviceid": "' + $scope.selectedDevice.deviceid + '", "command": ' + '"' + command + '"';
            client.publish($scope.messagePublishDestination, msg);
            $scope.recentCommand = angular.fromJson("{" + msg + "}");
            console.log("Command sent:");
            console.log($scope.recentCommand.deviceid);
        };
    };

    $scope.$on('destroy', function () {
        if (angular.isDefined(timerRTEMP)) {
            $interval.cancel(timerRTEMP);
            timerRTEMP = undefined;
        }
    });

    /*
    $scope.doUpdateMaterialSelect = function () {
        $('select').material_select('destroy');
        $('select').material_select();
        console.log("Select is updated");
    };
    */
}]);
