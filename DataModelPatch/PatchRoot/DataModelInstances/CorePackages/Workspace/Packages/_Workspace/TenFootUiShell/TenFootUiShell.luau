return {
	["jest.config"] = script["jest.config"],
	TenFootUiContainer = require(script.Components.TenFootUiContainer),
	TenFootUiOverflowScreen = require(script.Components.TenFootUiOverflowScreen),
	TenFootUiGlobalEffects = require(script.Components.TenFootUiGlobalEffects),
	Constants = require(script.Constants),
	getOrCreateSurfaceGuiContainer = require(script.getOrCreateSurfaceGuiContainer),
	getOrCreateWorkSpaceContainer = require(script.getOrCreateWorkSpaceContainer),
	Views = require(script.ReactNavigationExtend.Views)
}