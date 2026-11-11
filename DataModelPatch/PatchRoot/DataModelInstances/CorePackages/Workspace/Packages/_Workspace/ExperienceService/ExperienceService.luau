local _ = require(script.GameProtocolTypes)

return {
	GameProtocol = require(script.GameProtocol),
	GameParams = require(script.GameParams),
	ExperienceService = require(script.ExperienceServiceWrapper),
	Flags = {
		GetFFlagMoveLuaExpLaunchBegin = require(script.Flags.GetFFlagMoveLuaExpLaunchBegin)
	}
}