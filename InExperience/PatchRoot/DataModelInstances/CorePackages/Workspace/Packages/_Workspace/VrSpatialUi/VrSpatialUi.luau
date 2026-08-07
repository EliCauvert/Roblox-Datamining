return {
	UIManager = require(script.UIManager),
	Constants = require(script.Constants),
	registerRoactPanel = require(script.registerRoactPanel),
	Panel3DInSpatialUI = if require(script.Parent.SharedExperimentDefinition).isInExperienceUIVREnabled then require(script.Panel3DInSpatialUI) else nil,
	VrEnvironmentScene = require(script.VrEnvironmentScene),
	["jest.config"] = script["jest.config"]
}