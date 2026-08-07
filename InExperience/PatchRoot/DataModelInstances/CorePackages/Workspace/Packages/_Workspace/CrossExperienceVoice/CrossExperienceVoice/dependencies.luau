local parent = script:FindFirstAncestor("CrossExperienceVoice").Parent

return {
	React = require(parent.React),
	ReactOtter = require(parent.ReactOtter),
	Rodux = require(parent.Rodux),
	Cryo = require(parent.Cryo),
	Dash = require(parent.Dash),
	t = require(parent.t),
	ExperienceService = require(parent.ExperienceService),
	RoactUtils = require(parent.RoactUtils),
	CrossExperience = require(parent.CrossExperience),
	SharedFlags = require(parent.SharedFlags),
	LoggingProtocol = require(parent.LoggingProtocol),
	Lumberyak = require(parent.Lumberyak),
	LuauPolyfill = require(parent.LuauPolyfill),
	SocialLuaAnalytics = require(parent.SocialLuaAnalytics),
	ExperimentCacheManager = require(parent.ExperimentCacheManager),
	Promise = require(parent.Promise)
}