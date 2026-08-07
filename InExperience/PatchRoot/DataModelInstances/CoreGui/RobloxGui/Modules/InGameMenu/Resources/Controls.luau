local userInputService = game:GetService("UserInputService")
local keyCode = Enum.KeyCode
local userInputType = Enum.UserInputType
local t = { KEYBOARD = "Keyboard", GAMEPAD = "Gamepad" }
local t_1 = {
	[Enum.UserInputType.MouseButton2] = t.KEYBOARD,
	[Enum.UserInputType.MouseButton3] = t.KEYBOARD,
	[Enum.UserInputType.MouseWheel] = t.KEYBOARD,
	[Enum.UserInputType.MouseMovement] = t.KEYBOARD,
	[Enum.UserInputType.Keyboard] = t.KEYBOARD,
	[Enum.UserInputType.Gamepad1] = t.GAMEPAD,
	[Enum.UserInputType.Gamepad2] = t.GAMEPAD,
	[Enum.UserInputType.Gamepad3] = t.GAMEPAD,
	[Enum.UserInputType.Gamepad4] = t.GAMEPAD,
	[Enum.UserInputType.Gamepad5] = t.GAMEPAD,
	[Enum.UserInputType.Gamepad6] = t.GAMEPAD,
	[Enum.UserInputType.Gamepad7] = t.GAMEPAD,
	[Enum.UserInputType.Gamepad8] = t.GAMEPAD
}
local list = {
	{
		title = "CoreScripts.InGameMenu.Controls.CharacterMovementTitle",
		controls = {
			{
				desc = "CoreScripts.InGameMenu.Controls.MoveForward",
				inputs = { keyCode.Up, keyCode.W }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.MoveBackward",
				inputs = { keyCode.Down, keyCode.S }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.MoveLeft",
				inputs = { keyCode.A }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.MoveRight",
				inputs = { keyCode.D }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.Jump",
				inputs = { keyCode.Space }
			}
		}
	},
	{
		title = "CoreScripts.InGameMenu.Controls.CameraMovementTitle",
		controls = {
			{
				desc = "CoreScripts.InGameMenu.Controls.RotateCamera",
				inputs = { keyCode.Left, keyCode.Right, userInputType.MouseButton2 }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.ZoomInOutCamera",
				inputs = { userInputType.MouseWheel }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.ZoomInCamera",
				inputs = { keyCode.I }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.ZoomOutCamera",
				inputs = { keyCode.O }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.MouseLock",
				inputs = { keyCode.LeftShift }
			}
		}
	},
	{
		title = "CoreScripts.InGameMenu.Controls.AccessoriesTitle",
		controls = {
			{
				desc = "CoreScripts.InGameMenu.Controls.EquipUnequipTools",
				list = true,
				inputs = { keyCode.One, keyCode.Two, keyCode.Three }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.DropTool",
				inputs = { keyCode.Backspace }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.UseTool",
				inputs = { userInputType.MouseButton1 }
			}
		}
	},
	{
		title = "CoreScripts.InGameMenu.Controls.MenuItemsTitle",
		controls = {
			{
				desc = "CoreScripts.InGameMenu.Controls.RobloxMenu",
				inputs = { keyCode.Escape }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.Backpack",
				inputs = { keyCode.Tilde }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.Playerlist",
				inputs = { keyCode.Tab }
			},
			{
				desc = "CoreScripts.InGameMenu.Controls.Chat",
				inputs = { keyCode.Slash }
			}
		}
	}
}
local t_2 = {
	title = "CoreScripts.InGameMenu.Controls.MiscellaneousTitle",
	controls = {
		{
			desc = "CoreScripts.InGameMenu.Controls.GameMenuToggleGamepad",
			inputs = { keyCode.BackSlash }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.Screenshot",
			inputs = { { keyCode.LeftSuper, keyCode.LeftShift, keyCode.Three } }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.DevConsole",
			inputs = { { keyCode.LeftMeta, keyCode.F9 }, keyCode.F9 }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.GraphicsLevelUp",
			inputs = { { keyCode.LeftMeta, keyCode.F10 }, keyCode.F10 }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.GraphicsLevelDown",
			inputs = {
				{ keyCode.LeftMeta, keyCode.LeftShift, keyCode.F10 },
				{ keyCode.LeftShift, keyCode.F10 }
			}
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.ToggleFullscreen",
			inputs = { { keyCode.LeftControl, keyCode.LeftSuper, keyCode.F } }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.PerformanceStats",
			inputs = {
				{
					keyCode.LeftMeta,
					keyCode.LeftAlt,
					keyCode.LeftSuper,
					keyCode.F7
				}
			}
		}
	}
}
local t_3 = {
	title = "CoreScripts.InGameMenu.Controls.MiscellaneousTitle",
	controls = {
		{
			desc = "CoreScripts.InGameMenu.Controls.GameMenuToggleGamepad",
			inputs = { keyCode.BackSlash }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.Screenshot",
			inputs = { keyCode.Print }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.RecordVideo",
			inputs = { keyCode.F12 }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.DevConsole",
			inputs = { keyCode.F9 }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.GraphicsLevelUp",
			inputs = { keyCode.F10 }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.GraphicsLevelDown",
			inputs = { { keyCode.LeftShift, keyCode.F10 } }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.ToggleFullscreen",
			inputs = { keyCode.F11 }
		},
		{
			desc = "CoreScripts.InGameMenu.Controls.PerformanceStats",
			inputs = { { keyCode.LeftControl, keyCode.LeftShift, keyCode.F7 } }
		}
	}
}

if userInputService:GetPlatform() == Enum.Platform.OSX then
	table.insert(list, t_2)
else
	table.insert(list, t_3)
end
return {
	ControlLayouts = t,
	keybinds = list,
	inputToControlTypeMap = t_1,
	gamepadLabels = {
		left = {
			"CoreScripts.InGameMenu.Controls.SwitchToolGamepad",
			"CoreScripts.InGameMenu.Controls.GameMenuToggleGamepad",
			"CoreScripts.InGameMenu.Controls.MoveGamepad",
			"CoreScripts.InGameMenu.Controls.MenuNavigationGamepad"
		},
		right = {
			"CoreScripts.InGameMenu.Controls.UseTool",
			"CoreScripts.InGameMenu.Controls.RobloxMenu",
			"CoreScripts.InGameMenu.Controls.BackGamepad",
			"CoreScripts.InGameMenu.Controls.Jump"
		},
		camera = {
			"CoreScripts.InGameMenu.Controls.RotateCameraGamepad",
			"CoreScripts.InGameMenu.Controls.CameraZoomGamepad"
		}
	},
	questGamepadLabels = {
		{
			labelKey = "ResetCameraLabel",
			xPosition = -0.015,
			yPosition = 0.335,
			width = 0.17,
			xAlignment = Enum.TextXAlignment.Right
		},
		{
			labelKey = "MenuLabel",
			xPosition = -0.015,
			yPosition = 0.397,
			width = 0.17,
			xAlignment = Enum.TextXAlignment.Right
		},
		{
			labelKey = "SelectItemLabel",
			xPosition = 0.442,
			yPosition = 0.621,
			width = 0.09,
			xAlignment = Enum.TextXAlignment.Center
		},
		{
			labelKey = "BackExitLabel",
			xPosition = 0.818,
			yPosition = 0.287,
			width = 0.17,
			xAlignment = Enum.TextXAlignment.Left
		},
		{
			labelKey = "FirstPersonCameraLabel",
			xPosition = 0.818,
			yPosition = 0.342,
			width = 0.17,
			xAlignment = Enum.TextXAlignment.Left
		},
		{
			labelKey = "JumpSelectLabel",
			xPosition = 0.818,
			yPosition = 0.413,
			width = 0.17,
			xAlignment = Enum.TextXAlignment.Left
		}
	}
}