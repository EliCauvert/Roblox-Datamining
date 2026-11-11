local Parent = script.Parent.Parent
local ExtraKeysEnumModule = require(Parent.Enums.ExtraKeysEnum)
local TouchControlsEnumModule = require(Parent.Enums.TouchControlsEnum)
local _ = require(script.Parent.ConfigTypes)
local ControlGroups = {
	CharacterMovement = {
		layoutOrder = 1,
		label = "CoreScripts.InGameMenu.Controls.CharacterMovementTitle",
		id = "CharacterMovement"
	},
	Accessories = {
		layoutOrder = 2,
		label = "CoreScripts.InGameMenu.Controls.AccessoriesTitle",
		id = "Accessories"
	},
	Misc = {
		layoutOrder = 3,
		label = "CoreScripts.InGameMenu.Controls.MiscellaneousTitle",
		id = "Misc"
	},
	CameraMovement = {
		layoutOrder = 4,
		label = "CoreScripts.InGameMenu.Controls.CameraMovementTitle",
		id = "CameraMovement"
	},
	MenuItems = {
		layoutOrder = 5,
		label = "CoreScripts.InGameMenu.Controls.MenuItemsTitle",
		id = "MenuItems"
	}
}
local Controls = {
	MoveForward = {
		label = "CoreScripts.InGameMenu.Controls.MoveForward",
		keyboardInput = {
			layoutOrder = 1,
			input = { { Enum.KeyCode.W }, { Enum.KeyCode.Up } },
			group = ControlGroups.CharacterMovement
		}
	},
	MoveBackward = {
		label = "CoreScripts.InGameMenu.Controls.MoveBackward",
		keyboardInput = {
			layoutOrder = 2,
			input = { { Enum.KeyCode.S }, { Enum.KeyCode.Down } },
			group = ControlGroups.CharacterMovement
		}
	},
	MoveLeft = {
		label = "CoreScripts.InGameMenu.Controls.MoveLeft",
		keyboardInput = {
			layoutOrder = 3,
			input = { { Enum.KeyCode.A }, { Enum.KeyCode.Left } },
			group = ControlGroups.CharacterMovement
		}
	},
	MoveRight = {
		label = "CoreScripts.InGameMenu.Controls.MoveRight",
		keyboardInput = {
			layoutOrder = 4,
			input = { { Enum.KeyCode.D }, { Enum.KeyCode.Right } },
			group = ControlGroups.CharacterMovement
		}
	},
	Move = {
		label = "CoreScripts.InGameMenu.Controls.MoveGamepad",
		gamepadInput = { input = { Enum.KeyCode.Thumbstick1 } },
		touchInput = {
			thumbstickInput = { TouchControlsEnumModule.BottomLeftRotate },
			tapToMoveInput = { TouchControlsEnumModule.BottomLeftTap }
		}
	},
	Jump = {
		label = "CoreScripts.InGameMenu.Controls.Jump",
		keyboardInput = {
			layoutOrder = 5,
			input = { { Enum.KeyCode.Space } },
			group = ControlGroups.CharacterMovement
		},
		gamepadInput = { input = { Enum.KeyCode.ButtonA } },
		touchInput = {
			thumbstickInput = { TouchControlsEnumModule.BottomRight },
			tapToMoveInput = { TouchControlsEnumModule.BottomRight }
		}
	},
	EquipUnequipTool = {
		label = "CoreScripts.InGameMenu.Controls.EquipUnequipTools",
		keyboardInput = {
			layoutOrder = 1,
			input = { { ExtraKeysEnumModule.NumSequence } },
			group = ControlGroups.Accessories
		},
		touchInput = {
			thumbstickInput = { TouchControlsEnumModule.BottomMid },
			tapToMoveInput = { TouchControlsEnumModule.BottomMid }
		}
	},
	DropTool = {
		label = "CoreScripts.InGameMenu.Controls.DropTool",
		keyboardInput = {
			layoutOrder = 2,
			input = { { Enum.KeyCode.Backspace } },
			group = ControlGroups.Accessories
		}
	},
	UseTool = {
		label = "CoreScripts.InGameMenu.Controls.UseTool",
		keyboardInput = {
			layoutOrder = 3,
			input = { { Enum.KeyCode.MouseLeftButton } },
			group = ControlGroups.Accessories
		},
		gamepadInput = {
			xboxInput = { Enum.KeyCode.ButtonR2 },
			playstationInput = { Enum.KeyCode.ButtonR2 }
		},
		touchInput = {
			thumbstickInput = { TouchControlsEnumModule.TopMidTap },
			tapToMoveInput = { TouchControlsEnumModule.TopRightTap }
		}
	},
	SwitchTool = {
		label = "CoreScripts.InGameMenu.Controls.SwitchToolGamepad",
		gamepadInput = {
			xboxInput = { Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1 },
			playstationInput = { Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1 }
		}
	},
	UISelectionToggle = {
		label = "CoreScripts.InGameMenu.Controls.GameMenuToggleGamepad",
		keyboardInput = {
			layoutOrder = 1,
			input = { { Enum.KeyCode.BackSlash } },
			group = ControlGroups.Misc
		}
	},
	Screenshot = {
		label = "CoreScripts.InGameMenu.Controls.Screenshot",
		keyboardInput = {
			layoutOrder = 2,
			macInput = { { Enum.KeyCode.RightAlt, Enum.KeyCode.One } },
			winInput = { { Enum.KeyCode.LeftAlt, Enum.KeyCode.One } },
			group = ControlGroups.Misc
		}
	},
	RecordVideo = {
		label = "CoreScripts.InGameMenu.Controls.RecordVideo",
		keyboardInput = {
			layoutOrder = 3,
			winInput = { { Enum.KeyCode.F12 } },
			group = ControlGroups.Misc
		}
	},
	DevConsole = {
		label = "CoreScripts.InGameMenu.Controls.DevConsole",
		keyboardInput = {
			layoutOrder = 4,
			macInput = {
				{ Enum.KeyCode.F9 },
				{ ExtraKeysEnumModule.Fn, Enum.KeyCode.F9 }
			},
			winInput = { { Enum.KeyCode.F9 } },
			group = ControlGroups.Misc
		}
	},
	Mouselock = {
		label = "CoreScripts.InGameMenu.Controls.MouseLock",
		keyboardInput = {
			layoutOrder = 5,
			input = { { Enum.KeyCode.LeftShift } },
			group = ControlGroups.Misc
		}
	},
	GraphicsLevel = {
		label = "CoreScripts.InGameMenu.Controls.GraphicsLevel",
		keyboardInput = {
			layoutOrder = 6,
			macInput = {
				{ Enum.KeyCode.F10 },
				{ ExtraKeysEnumModule.Fn, Enum.KeyCode.F10 }
			},
			winInput = { { Enum.KeyCode.F10 } },
			group = ControlGroups.Misc
		}
	},
	Fullscreen = {
		label = "CoreScripts.InGameMenu.Controls.ToggleFullscreen",
		keyboardInput = {
			layoutOrder = 7,
			macInput = {
				{
					Enum.KeyCode.LeftControl,
					Enum.KeyCode.LeftSuper,
					Enum.KeyCode.F
				}
			},
			winInput = { { Enum.KeyCode.F11 } },
			group = ControlGroups.Misc
		}
	},
	PerfStats = {
		label = "CoreScripts.InGameMenu.Controls.PerformanceStats",
		keyboardInput = {
			layoutOrder = 8,
			macInput = {
				{
					ExtraKeysEnumModule.Fn,
					Enum.KeyCode.RightAlt,
					Enum.KeyCode.LeftSuper,
					Enum.KeyCode.F7
				}
			},
			winInput = {
				{
					Enum.KeyCode.LeftControl,
					Enum.KeyCode.LeftShift,
					Enum.KeyCode.F7
				}
			},
			group = ControlGroups.Misc
		}
	},
	Rotate = {
		label = "CoreScripts.InGameMenu.Controls.RotateCamera",
		keyboardInput = {
			layoutOrder = 1,
			input = { { Enum.KeyCode.MouseRightButton } },
			group = ControlGroups.CameraMovement
		}
	},
	RotateCamera = {
		label = "CoreScripts.InGameMenu.Controls.RotateCameraGamepad",
		gamepadInput = {
			xboxInput = { Enum.KeyCode.Thumbstick2 },
			playstationInput = { Enum.KeyCode.Thumbstick2 }
		},
		touchInput = {
			thumbstickInput = { TouchControlsEnumModule.TopRightRotate },
			tapToMoveInput = { TouchControlsEnumModule.TopMidRotate }
		}
	},
	ZoomInOut = {
		label = "CoreScripts.InGameMenu.Controls.ZoomInOutCamera",
		keyboardInput = {
			layoutOrder = 2,
			input = { { ExtraKeysEnumModule.MouseWheel } },
			group = ControlGroups.CameraMovement
		},
		touchInput = {
			thumbstickInput = { TouchControlsEnumModule.TopLeft },
			tapToMoveInput = { TouchControlsEnumModule.TopLeft }
		}
	},
	ZoomIn = {
		label = "CoreScripts.InGameMenu.Controls.ZoomInCamera",
		keyboardInput = {
			layoutOrder = 3,
			input = { { Enum.KeyCode.I } },
			group = ControlGroups.CameraMovement
		}
	},
	ZoomOut = {
		label = "CoreScripts.InGameMenu.Controls.ZoomOutCamera",
		keyboardInput = {
			layoutOrder = 4,
			input = { { Enum.KeyCode.O } },
			group = ControlGroups.CameraMovement
		}
	},
	CameraZoomGamepad = {
		label = "CoreScripts.InGameMenu.Controls.CameraZoomGamepad",
		gamepadInput = {
			xboxInput = { Enum.KeyCode.ButtonR3 },
			playstationInput = { Enum.KeyCode.ButtonR3 }
		}
	},
	FirstPersonCamera = {
		label = "CoreScripts.InGameMenu.Controls.ToggleCameraView",
		gamepadInput = { spatialGamepadInput = { Enum.KeyCode.ButtonR3 } }
	},
	RobloxMenu = {
		label = "CoreScripts.InGameMenu.Controls.RobloxMenu",
		keyboardInput = {
			layoutOrder = 1,
			input = { { Enum.KeyCode.Escape } },
			group = ControlGroups.MenuItems
		},
		gamepadInput = {
			xboxInput = { Enum.KeyCode.ButtonStart },
			playstationInput = { Enum.KeyCode.ButtonStart },
			spatialGamepadInput = { Enum.KeyCode.ButtonSelect }
		}
	},
	MenuNavigationGamepad = {
		label = "CoreScripts.InGameMenu.Controls.MenuNavigationGamepad",
		gamepadInput = {
			xboxInput = { ExtraKeysEnumModule.DPad },
			playstationInput = { ExtraKeysEnumModule.DPad }
		}
	},
	GameMenuToggleGamepad = {
		label = "CoreScripts.InGameMenu.Controls.GameMenuToggle",
		gamepadInput = {
			playstationInput = { ExtraKeysEnumModule.TouchPad },
			xboxInput = { Enum.KeyCode.ButtonSelect }
		}
	},
	Backpack = {
		label = "CoreScripts.InGameMenu.Controls.Backpack",
		keyboardInput = {
			layoutOrder = 2,
			input = { { Enum.KeyCode.Backquote } },
			group = ControlGroups.MenuItems
		}
	},
	Playerlist = {
		label = "CoreScripts.InGameMenu.Controls.Playerlist",
		keyboardInput = {
			layoutOrder = 3,
			input = { { Enum.KeyCode.Tab } },
			group = ControlGroups.MenuItems
		}
	},
	Chat = {
		label = "CoreScripts.InGameMenu.Controls.Chat",
		keyboardInput = {
			layoutOrder = 4,
			input = { { Enum.KeyCode.Slash } },
			group = ControlGroups.MenuItems
		},
		gamepadInput = { xboxInput = { Enum.KeyCode.ButtonL2 } }
	},
	Back = {
		label = "CoreScripts.InGameMenu.Controls.BackGamepad",
		gamepadInput = { input = { Enum.KeyCode.ButtonB } }
	}
}

if not require(Parent.Parent.SharedFlags).FFlagEnableConsoleExpControls then
	Controls.Chat.gamepadInput = nil
end
return { ControlGroups = ControlGroups, Controls = Controls }