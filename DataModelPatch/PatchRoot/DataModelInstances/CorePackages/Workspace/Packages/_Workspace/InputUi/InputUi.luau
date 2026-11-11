return {
	["jest.config"] = script["jest.config"],
	Gamepad = {
		useGamepadDisconnectOverlayEffect = require(script.Gamepad.useGamepadDisconnectOverlayEffect),
		GamepadDisconnectedModal = require(script.Gamepad.GamepadDisconnectedModal),
		GamepadDisconnectedModalView = require(script.Gamepad.GamepadDisconnectedModalView),
		GamepadDisconnectTokenMapper = require(script.Gamepad.GamepadDisconnectTokenMapper),
		GamepadUtils = require(script.Gamepad.GamepadUtils)
	},
	getSafeAreaSize = require(script.getSafeAreaSize)
}