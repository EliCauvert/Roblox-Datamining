local Parent = script:FindFirstAncestor("CrossExperienceVoice").Parent

return {
	React = require(Parent.React),
	ReactOtter = require(Parent.ReactOtter),
	Rodux = require(Parent.Rodux),
	Cryo = require(Parent.Cryo),
	Dash = require(Parent.Dash),
	t = require(Parent.t),
	ExperienceService = require(Parent.ExperienceService),
	RoactUtils = require(Parent.RoactUtils),
	CrossExperience = require(Parent.CrossExperience),
	SharedFlags = require(Parent.SharedFlags),
	LoggingProtocol = require(Parent.LoggingProtocol),
	Lumberyak = require(Parent.Lumberyak),
	LuauPolyfill = require(Parent.LuauPolyfill),
	SocialLuaAnalytics = require(Parent.SocialLuaAnalytics),
	ExperimentCacheManager = require(Parent.ExperimentCacheManager),
	Promise = require(Parent.Promise)
}