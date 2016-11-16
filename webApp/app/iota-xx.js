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

app.controller("DevicesController", ["$scope", "DataService", function ($scope, DataService) {
    $scope.selectedDevice = null;
    $scope.connectionStatus = "Not Connected";
    $scope.messageServer = "io.adafruit.com";
    $scope.serverPort = 443;
    $scope.clientId = "ksrmice996656b9fe54f9fa298816e1fb9398f";
    $scope.userName = "anilkunchalaece";
    $scope.password = "e996656b9fe54f9fa298816e1fb9398f";
    $scope.messagePublishDestination = "anilkunchalaece/feeds/command";
    $scope.messageSubscribeDestination = "anilkunchalaece/feeds/#";

    var client = null;

    // get devices list
    DataService.then(function (response) {
        $scope.devices = response.data;
        console.log($scope.devices);
        $scope.selectedDeviceId = $scope.devices[0].deviceid;
        $scope.selectedDevice = $scope.devices[0];
    });

    $scope.selectDevice = function (index) {
        $scope.selectedDevice = $scope.devices[index];
    };

    // connect to mqtt message server
    $scope.connectToMessageService = function () {
        // return if already connected
        if ($scope.connectionStatus == "Connected") return;
        
        // create mqtt client instance
        client = new Paho.MQTT.Client($scope.messageServer, $scope.serverPort, $scope.clientId);

        // set callback handlers
        client.onConnectionLost = onConnectionLost;
        client.onMessageArrived = onMessageArrived;

        // connect to the client
        $scope.connectionStatus = "Connecting..."
        console.log("Connecting...")
        client.connect({
            onSuccess: onConnect,
            onFailure: onFailure,
            userName: $scope.userName,
            password: $scope.password,
            useSSL: true,
            keepAliveInterval: 0,
            timeout: 120
        });

        // callback functions
        function onConnect() {
            $scope.$apply(function () {
                $scope.connectionStatus = "Connected";
            });
            console.log("onConnect: connection status: " + $scope.connectionStatus);
            console.log("Subscribing to feed 'data'...");
            client.subscribe($scope.messageSubscribeDestination,
                {
                    onSuccess: onSubscriptionSuccess,
                    onFailure: onSubscriptionFailure
                }
            );
            
            function onSubscriptionSuccess(responseObject) {
                console.log("subscription done with QoS: " + responseObject.grantedQos);
            };

            function onSubscriptionFailure(responseObject) {
                console.log("subscription failed with error code: " + responseObject.errorCode);
            };
        };

        function onFailure(responseObject) {
            console.log("onFailure: failed to connect to message server. Reason: " + responseObject.errorMessage);
            $scope.$apply(function () {
                $scope.connectionStatus = "Not Connected";
            });
        };

        function onConnectionLost(responseObject) {
            $scope.$apply(function () {
                $scope.connectionStatus = "Not Connected";
            });
            console.log("onConnectionLost:" + responseObject.errorMessage);
        };

        // callback for receiving messages
        
        function onMessageArrived(message) {
            console.log("onMessageArrived: Message = " + message.payloadString);
            var payloadJson = JSON.parse("{" + message.payloadString + "}");
            if (payloadJson.deviceid == $scope.selectedDevice.deviceid) {
                console.log(payloadJson);
            };
        };
        
    };

    // publish command to get current sensor data
    $scope.sendCommand = function (command) {
        if ($scope.connectionStatus == "Connected") {
            var msgjson = '"deviceid": "' + $scope.selectedDevice.deviceid + '", "command": ' + '"' + command + '"';
            var message = new Paho.MQTT.Message(msgjson);
            message.destinationName = $scope.messagePublishDestination;
            client.send(message);
            console.log("Command sent: " + msgjson);
        };
    };

    /*
    $scope.update = function (deviceid, parameter) {
        var client = new Paho.MQTT.Client("io.adafruit.com", 443, "anil");
        // connect the client
        client.connect({
            onSuccess: onBtnFcn,
            userName: "anilkunchalaece",
            password: "e996656b9fe54f9fa298816e1fb9398f",
            useSSL: true
        });

        // called when the client connects
        function onBtnFcn() {
            // Once a connection has been made, make a subscription and send a message.
            console.log("On Fcn");
            //client.subscribe("anilkunchalaece/feeds/rly");
            var msgjson = '"deviceid": "' + $scope.selectedDevice.deviceid + '", "command": ' + '"RTEMP"'
            var message = new Paho.MQTT.Message(msgjson);
            message.destinationName = "anilkunchalaece/feeds/command";
            client.send(message);
            console.log("Message ON Published" + msgjson);
            client.disconnect();
        }
        console.log(deviceid + parameter);
    };
    */

    /*
    $scope.doUpdateMaterialSelect = function () {
        $('select').material_select('destroy');
        $('select').material_select();
        console.log("Select is updated");
    };
    */
}]);
