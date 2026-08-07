local parent = script.Parent.Parent
local parent_1 = parent.Parent
local extraKeysEnumModule = require(parent.Enums.ExtraKeysEnum)
local touchControlsEnumModule = require(parent.Enums.TouchControlsEnum)
local _ = require(script.Parent.ConfigTypes)
local fFlagEnableConsoleExpControls = require(parent_1.SharedFlags).FFlagEnableConsoleExpControls
local t = {
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
local t_1 = {
	MoveForward = {
		label = "CoreScripts.InGameMenu.Controls.MoveForward",
		keyboardInput = {
			layoutOrder = 1,
			input = { { Enum.KeyCode.W }, { Enum.KeyCode.Up } },
			group = t.CharacterMovement
		}
	},
	MoveBackward = {
		label = "CoreScripts.InGameMenu.Controls.MoveBackward",
		keyboardInput = {
			layoutOrder = 2,
			input = { { Enum.KeyCode.S }, { Enum.KeyCode.Down } },
			group = t.CharacterMovement
		}
	},
	MoveLeft = {
		label = "CoreScripts.InGameMenu.Controls.MoveLeft",
		keyboardInput = {
			layoutOrder = 3,
			input = { { Enum.KeyCode.A }, { Enum.KeyCode.Left } },
			group = t.CharacterMovement
		}
	},
	MoveRight = {
		label = "CoreScripts.InGameMenu.Controls.MoveRight",
		keyboardInput = {
			layoutOrder = 4,
			input = { { Enum.KeyCode.D }, { Enum.KeyCode.Right } },
			group = t.CharacterMovement
		}
	},
	Move = {
		label = "CoreScripts.InGameMenu.Controls.MoveGamepad",
		gamepadInput = { input = { Enum.KeyCode.Thumbstick1 } },
		touchInput = {
			thumbstickInput = { touchControlsEnumModule.BottomLeftRotate },
			tapToMoveInput = { touchControlsEnumModule.BottomLeftTap }
		}
	},
	Jump = {
		label = "CoreScripts.InGameMenu.Controls.Jump",
		keyboardInput = {
			layoutOrder = 5,
			input = { { Enum.KeyCode.Space } },
			group = t.CharacterMovement
		},
		gamepadInput = { input = { Enum.KeyCode.ButtonA } },
		touchInput = {
			thumbstickInput = { touchControlsEnumModule.BottomRight },
			tapToMoveInput = { touchControlsEnumModule.BottomRight }
		}
	},
	EquipUnequipTool = {
		label = "CoreScripts.InGameMenu.Controls.EquipUnequipTools",
		keyboardInput = {
			layoutOrder = 1,
			input = { { extraKeysEnumModule.NumSequence } },
			group = t.Accessories
		},
		touchInput = {
			thumbstickInput = { touchControlsEnumModule.BottomMid },
			tapToMoveInput = { touchControlsEnumModule.BottomMid }
		}
	},
	DropTool = {
		label = "CoreScripts.InGameMenu.Controls.DropTool",
		keyboardInput = {
			layoutOrder = 2,
			input = { { Enum.KeyCode.Backspace } },
			group = t.Accessories
		}
	},
	UseTool = {
		label = "CoreScripts.InGameMenu.Controls.UseTool",
		keyboardInput = {
			layoutOrder = 3,
			input = { { Enum.KeyCode.MouseLeftButton } },
			group = t.Accessories
		},
		gamepadInput = {
			xboxInput = { Enum.KeyCode.ButtonR2 },
			playstationInput = { Enum.KeyCode.ButtonR2 }
		},
		touchInput = {
			thumbstickInput = { touchControlsEnumModule.TopMidTap },
			tapToMoveInput = { touchControlsEnumModule.TopRightTap }
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
			group = t.Misc
		}
	},
	Screenshot = {
		label = "CoreScripts.InGameMenu.Controls.Screenshot",
		keyboardInput = {
			layoutOrder = 2,
			macInput = { { Enum.KeyCode.RightAlt, Enum.KeyCode.One } },
			winInput = { { Enum.KeyCode.LeftAlt, Enum.KeyCode.One } },
			group = t.Misc
		}
	},
	RecordVideo = {
		label = "CoreScripts.InGameMenu.Controls.RecordVideo",
		keyboardInput = {
			layoutOrder = 3,
			winInput = { { Enum.KeyCode.F12 } },
			group = t.Misc
		}
	},
	DevConsole = {
		label = "CoreScripts.InGameMenu.Controls.DevConsole",
		keyboardInput = {
			layoutOrder = 4,
			macInput = {
				{ Enum.KeyCode.F9 },
				{ extraKeysEnumModule.Fn, Enum.KeyCode.F9 }
			},
			winInput = { { Enum.KeyCode.F9 } },
			group = t.Misc
		}
	},
	Mouselock = {
		label = "CoreScripts.InGameMenu.Controls.MouseLock",
		keyboardInput = {
			layoutOrder = 5,
			input = { { Enum.KeyCode.LeftShift } },
			group = t.Misc
		}
	},
	GraphicsLevel = {
		label = "CoreScripts.InGameMenu.Controls.GraphicsLevel",
		keyboardInput = {
			layoutOrder = 6,
			macInput = {
				{ Enum.KeyCode.F10 },
				{ extraKeysEnumModule.Fn, Enum.KeyCode.F10 }
			},
			winInput = { { Enum.KeyCode.F10 } },
			group = t.Misc
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
			group = t.Misc
		}
	},
	PerfStats = {
		label = "CoreScripts.InGameMenu.Controls.PerformanceStats",
		keyboardInput = {
			layoutOrder = 8,
			macInput = {
				{
					extraKeysEnumModule.Fn,
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
			group = t.Misc
		}
	},
	Rotate = {
		label = "CoreScripts.InGameMenu.Controls.RotateCamera",
		keyboardInput = {
			layoutOrder = 1,
			input = { { Enum.KeyCode.MouseRightButton } },
			group = t.CameraMovement
		}
	},
	RotateCamera = {
		label = "CoreScripts.InGameMenu.Controls.RotateCameraGamepad",
		gamepadInput = {
			xboxInput = { Enum.KeyCode.Thumbstick2 },
			playstationInput = { Enum.KeyCode.Thumbstick2 }
		},
		touchInput = {
			thumbstickInput = { touchControlsEnumModule.TopRightRotate },
			tapToMoveInput = { touchControlsEnumModule.TopMidRotate }
		}
	},
	ZoomInOut = {
		label = "CoreScripts.InGameMenu.Controls.ZoomInOutCamera",
		keyboardInput = {
			layoutOrder = 2,
			input = { { extraKeysEnumModule.MouseWheel } },
			group = t.CameraMovement
		},
		touchInput = {
			thumbstickInput = { touchControlsEnumModule.TopLeft },
			tapToMoveInput = { touchControlsEnumModule.TopLeft }
		}
	},
	ZoomIn = {
		label = "CoreScripts.InGameMenu.Controls.ZoomInCamera",
		keyboardInput = {
			layoutOrder = 3,
			input = { { Enum.KeyCode.I } },
			group = t.CameraMovement
		}
	},
	ZoomOut = {
		label = "CoreScripts.InGameMenu.Controls.ZoomOutCamera",
		keyboardInput = {
			layoutOrder = 4,
			input = { { Enum.KeyCode.O } },
			group = t.CameraMovement
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
			group = t.MenuItems
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
			xboxInput = { extraKeysEnumModule.DPad },
			playstationInput = { extraKeysEnumModule.DPad }
		}
	},
	GameMenuToggleGamepad = {
		label = "CoreScripts.InGameMenu.Controls.GameMenuToggle",
		gamepadInput = {
			playstationInput = { extraKeysEnumModule.TouchPad },
			xboxInput = { Enum.KeyCode.ButtonSelect }
		}
	},
	Backpack = {
		label = "CoreScripts.InGameMenu.Controls.Backpack",
		keyboardInput = {
			layoutOrder = 2,
			input = { { Enum.KeyCode.Backquote } },
			group = t.MenuItems
		}
	},
	Playerlist = {
		label = "CoreScripts.InGameMenu.Controls.Playerlist",
		keyboardInput = {
			layoutOrder = 3,
			input = { { Enum.KeyCode.Tab } },
			group = t.MenuItems
		}
	},
	Chat = {
		label = "CoreScripts.InGameMenu.Controls.Chat",
		keyboardInput = {
			layoutOrder = 4,
			input = { { Enum.KeyCode.Slash } },
			group = t.MenuItems
		},
		gamepadInput = { xboxInput = { Enum.KeyCode.ButtonL2 } }
	},
	Back = {
		label = "CoreScripts.InGameMenu.Controls.BackGamepad",
		gamepadInput = { input = { Enum.KeyCode.ButtonB } }
	}
}

if not fFlagEnableConsoleExpControls then
	t_1.Chat.gamepadInput = nil
end
return { ControlGroups = t, Controls = t_1 }