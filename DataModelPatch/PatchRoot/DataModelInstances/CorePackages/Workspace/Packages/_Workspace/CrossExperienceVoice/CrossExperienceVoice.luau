local _ = require(script.Common.Types)

return {
	Analytics = require(script.Analytics),
	Common = require(script.Common),
	Component = require(script.Component),
	CrossExperienceVoiceAnalytics = require(script.CrossExperienceVoiceAnalytics),
	CrossExperienceVoiceManager = require(script.CrossExperienceVoiceManager),
	Hooks = require(script.Hooks),
	installReducer = require(script.dependencies).CrossExperience.installReducer,
	Utils = require(script.Utils),
	IXPManager = require(script.IXPManager)
}