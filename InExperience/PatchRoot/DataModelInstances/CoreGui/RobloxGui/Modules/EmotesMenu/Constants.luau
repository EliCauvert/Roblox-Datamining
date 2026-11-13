local Layouts = script.Parent.Layouts
local SmallModule = require(Layouts.Small)
local LargeModule = require(Layouts.Large)
local TenFootModule = require(Layouts.TenFoot)
local ConstantsModule = {
	EmotesPerPage = 8,
	ErrorDisplayTimeSeconds = 5,
	FallbackLocale = "en-us",
	LocalizationKeys = {
		SelectAnEmote = "InGame.EmotesMenu.SelectAnEmote",
		NoEmotesEquipped = "InGame.EmotesMenu.NoEmotesEquipped",
		EmotesDisabled = "InGame.EmotesMenu.EmotesDisabled",
		VisitShopToGetEmotes = "InGame.EmotesMenu.VisitShopToGetEmotes",
		ErrorMessages = {
			NotSupported = "InGame.EmotesMenu.ErrorMessageNotSupported",
			R15Only = "InGame.EmotesMenu.ErrorMessageR15Only",
			SwitchToR15 = "InGame.EmotesMenu.ErrorMessageSwitchToR15",
			NoMatchingEmote = "InGame.EmotesMenu.ErrorMessageNoMatchingEmote",
			TemporarilyUnavailable = "InGame.EmotesMenu.ErrorMessageTemporarilyUnavailable",
			AnimationPlaying = "InGame.EmotesMenu.ErrorMessageAnimationPlaying"
		}
	},
	ErrorTypes = {
		NotSupported = "NotSupported",
		R15Only = "R15Only",
		SwitchToR15 = "SwitchToR15",
		NoMatchingEmote = "NoMatchingEmote",
		TemporarilyUnavailable = "TemporarilyUnavailable",
		AnimationPlaying = "AnimationPlaying"
	},
	EmotesImage = "rbxthumb://type=Asset&id=%d&w=420&h=420",
	EmotesMenuZIndex = 50,
	ErrorFrameBorderSize = 0,
	ErrorFrameBackgroundTransparency = 0.3,
	WheelBackgroundTransparency = 0.4,
	TextPadding = 10,
	SegmentsStartRotation = -90,
	InnerCircleSizeRatio = 0.45,
	SlotNumberSize = 0.1,
	ImageOutsidePadding = 0.025,
	GradientTransparency = 0.5,
	CursorOverrideName = "EmotesMenuCursorOverride",
	GamepadInputTypes = {
		[Enum.UserInputType.Gamepad1] = true,
		[Enum.UserInputType.Gamepad2] = true,
		[Enum.UserInputType.Gamepad3] = true,
		[Enum.UserInputType.Gamepad4] = true,
		[Enum.UserInputType.Gamepad5] = true,
		[Enum.UserInputType.Gamepad6] = true,
		[Enum.UserInputType.Gamepad7] = true,
		[Enum.UserInputType.Gamepad8] = true
	},
	LeaveMenuNoSinkInputs = {
		Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D,
		Enum.KeyCode.Up, Enum.KeyCode.Left, Enum.KeyCode.Down, Enum.KeyCode.Right,
		Enum.KeyCode.Space, Enum.KeyCode.Tab, Enum.KeyCode.Slash,
		Enum.KeyCode.Backquote
	},
	EmoteSlotKeys = {
		Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three, Enum.KeyCode.Four,
		Enum.KeyCode.Five, Enum.KeyCode.Six, Enum.KeyCode.Seven, Enum.KeyCode.Eight
	},
	EmoteMenuOpenKey = Enum.KeyCode.Period,
	EmoteMenuOpenButton = Enum.KeyCode.DPadDown,
	EmoteMenuCloseKey = Enum.KeyCode.Escape,
	EmoteMenuCloseButton = Enum.KeyCode.ButtonB,
	EmoteMenuCloseButtonSecondary = Enum.KeyCode.ButtonStart,
	EmoteMenuNavUpButton = Enum.KeyCode.DPadUp,
	EmoteMenuNavDownButton = Enum.KeyCode.DPadDown,
	EmoteMenuPlayEmoteButton = Enum.KeyCode.DPadRight,
	SelectionThumbstick = Enum.KeyCode.Thumbstick1,
	ThumbstickThreshold = 0.8,
	PlayEmoteButton = Enum.KeyCode.ButtonA,
	ToggleMenuAction = "EmotesMenuToggleAction",
	CloseMenuAction = "EmotesMenuCloseAction",
	OpenMenuAction = "EmotesMenuOpenAction",
	EmoteSelectionAction = "EmotesMenuSelectionAction",
	ActivateEmoteSlotAction = "EmotesMenuActivateEmoteSlotAction",
	PlaySelectedAction = "EmotesMenuPlaySelectedAction",
	LeaveMenuDontSinkInputAction = "EmotesMenuLeaveMenuDontSinkInputAction",
	ShiftFocusUpAction = "EmotesMenuShiftFocusUpAction",
	ShiftFocusDownAction = "EmotesMenuShiftFocusDownAction",
	VirtualCursorSinkAction = "EmotesMenuVirtualCursorSinkAction",
	ScreenAvailable = UDim2.new(0.9, 0, 0.75, 0),
	SmallScreenMaxSize = Vector2.new(700, 500),
	Layout = { Small = 0, Large = 1, TenFoot = 2 },
	Colors = { White = Color3.new(1, 1, 1), Black = Color3.new(0, 0, 0) },
	OffScreen = require(game:GetService("CorePackages").Packages.enumerate)("OffScreen", { "Top", "Bottom" })
}
ConstantsModule.Layouts = {
	[ConstantsModule.Layout.Small] = SmallModule,
	[ConstantsModule.Layout.Large] = LargeModule,
	[ConstantsModule.Layout.TenFoot] = TenFootModule
}

local function makeTableConstant(p1, p2)
	setmetatable(p2, {
		__newindex = function() end,
		__index = function(_, p3)
			-- upvalues: p1 (copy)
			error(p1 .. " table has no index: " .. tostring(p3), 2)
		end
	})
end

for i, value in pairs({
	Constants = ConstantsModule,
	["Constants.Colors"] = ConstantsModule.Colors,
	["Constants.Layout"] = ConstantsModule.Layout,
	["Constants.LeaveMenuNoSinkInputs"] = ConstantsModule.LeaveMenuNoSinkInputs,
	["Constants.LocalizationKeys"] = ConstantsModule.LocalizationKeys,
	["Constants.LocalizationKeys.ErrorMessages"] = ConstantsModule.LocalizationKeys.ErrorMessages,
	["Constants.Layouts"] = ConstantsModule.Layouts,
	["Constants.Layouts.Small"] = ConstantsModule.Layouts[ConstantsModule.Layout.Small],
	["Constants.Layouts.Large"] = ConstantsModule.Layouts[ConstantsModule.Layout.Large],
	["Constants.Layouts.TenFoot"] = ConstantsModule.Layouts[ConstantsModule.Layout.TenFoot]
}) do
	makeTableConstant(i, value)
end
return ConstantsModule