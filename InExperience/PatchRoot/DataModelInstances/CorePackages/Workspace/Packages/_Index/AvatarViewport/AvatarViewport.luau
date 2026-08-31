local _ = require(script.Types)

return {
	["jest.config"] = script["jest.config"],
	CameraMath = require(script.CameraMath),
	Constants = require(script.Constants),
	ModelSources = {
		fromUserId = require(script.ModelSources.createUserIdModelSource)
	},
	useRotatableOrbitViewport = require(script.Hooks.useRotatableOrbitViewport),
	useAvatarViewportScene = require(script.Hooks.useAvatarViewportScene),
	useViewportModelLoader = require(script.Hooks.useViewportModelLoader),
	useViewportOrbitInteractions = require(script.Hooks.useViewportOrbitInteractions),
	useViewportGamepadOrbit = require(script.Hooks.useViewportGamepadOrbit),
	useOrbitHeadCamera = require(script.Hooks.useOrbitHeadCamera),
	AvatarViewportScene = require(script.Components.AvatarViewportScene),
	ViewportInteractionOverlay = require(script.Components.ViewportInteractionOverlay)
}