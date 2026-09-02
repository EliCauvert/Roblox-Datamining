local _ = require(script.AsyncQueue.AsyncQueueTypes)

return {
	["jest.config"] = script["jest.config"],
	Signal = require(script.Signal),
	Immutable = require(script.Immutable),
	IsVRAppBuild = require(script.IsVRAppBuild),
	isSpatial = require(script.isSpatial),
	connectToIsSpatialChanged = require(script.connectToIsSpatialChanged),
	GetDefaultQualityLevel = require(script.GetDefaultQualityLevel),
	Color = require(script.Color),
	Functional = require(script.Functional),
	callOnce = require(script.callOnce),
	memoize = require(script.memoize),
	OrderedMap = require(script.OrderedMap),
	Text = require(script.Text),
	Symbol = require(script.Symbol),
	ThrottleUserId = require(script.Release.ThrottleUserId),
	rolloutByApplicationId = require(script.Release.rolloutByApplicationId),
	AsyncQueue = require(script.AsyncQueue.AsyncQueue),
	Utils = require(script.utils),
	isRunningInStudio = require(script.isRunningInStudio),
	getDeviceType = require(script.getDeviceType),
	Create = require(script.Create),
	Logging = require(script.Logging),
	GenerateStringId = require(script.GenerateStringId),
	isPlatformSingleSignOnSupported = function(value)
		return not not (value and (value.IsSingleSignOnSupported and value:IsSingleSignOnSupported()))
	end
}