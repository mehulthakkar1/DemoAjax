function TESTCONTROLLER() {
	var ajaxMethod = new AjaxMethod();
	ajaxMethod.initialize('/api/Test');
	this.Delete = function(id) {
		return new Promise(function(resolve, reject) {
			ajaxMethod.invokeWebApi('',{'ControllerType':'WebApi', 'httpVerb':'DELETE', 'onSuccess': resolve, 'onError': reject},
				{'id':id},
				{}
			)
		});
	};
	this.Get = function() {
		return new Promise(function(resolve, reject) {
			ajaxMethod.invokeWebApi('',{'ControllerType':'WebApi', 'httpVerb':'GET', 'onSuccess': resolve, 'onError': reject},
				{},
				{}
			)
		});
	};
	this.GetByid = function(id) {
		return new Promise(function(resolve, reject) {
			ajaxMethod.invokeWebApi('',{'ControllerType':'WebApi', 'httpVerb':'GET', 'onSuccess': resolve, 'onError': reject},
				{'id':id},
				{}
			)
		});
	};
	this.Post = function(value) {
		return new Promise(function(resolve, reject) {
			ajaxMethod.invokeWebApi('',{'ControllerType':'WebApi', 'httpVerb':'POST', 'onSuccess': resolve, 'onError': reject},
				{},
				{'value':value}
			)
		});
	};
	this.Put = function(id, value) {
		return new Promise(function(resolve, reject) {
			ajaxMethod.invokeWebApi('',{'ControllerType':'WebApi', 'httpVerb':'PUT', 'onSuccess': resolve, 'onError': reject},
				{'id':id},
				{'value':value}
			)
		});
	};
	this.Abort = function() { ajaxMethod.Abort(); };
}; var TestController = new TESTCONTROLLER();
