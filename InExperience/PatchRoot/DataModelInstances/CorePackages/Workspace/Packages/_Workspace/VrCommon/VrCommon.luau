return {
	VRControllerModel = require(script.VRControllerModel),
	LaserPointer = require(script.LaserPointer),
	Panel3D = require(script.Panel3D),
	VRUtil = require(script.VRUtil),
	VRHub = require(script.VRHub),
	FIntSafetyBubbleRadius = require(script.FIntSafetyBubbleRadius),
	FIntSafetyBubbleTransparencyPercent = require(script.FIntSafetyBubbleTransparencyPercent),
	getWebTask = function()
		return require(script.webtask)
	end,
	["jest.config"] = script["jest.config"]
}