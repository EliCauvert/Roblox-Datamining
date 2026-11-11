return {
	["jest.config"] = script["jest.config"],
	SessionType = require(script.SessionType),
	ExperienceMenuSessionManagerInstance = require(script.ExperienceMenuSessionManager).new(require(script.Parent.SessionizationUtil).SessionServiceWrapper)
}