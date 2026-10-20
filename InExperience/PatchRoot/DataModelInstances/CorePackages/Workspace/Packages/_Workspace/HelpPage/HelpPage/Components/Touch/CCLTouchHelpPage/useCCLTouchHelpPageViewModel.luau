local HelpPage = script:FindFirstAncestor("HelpPage")
local Parent = HelpPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local DisplayModule = require(Parent.Display)
local SignalsReactModule = require(Parent.SignalsReact)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local ConstantsModule = require(HelpPage.Constants)
local BindingConfigsModule = require(HelpPage.Configs.BindingConfigs)
local UseKeybindsModule = require(HelpPage.Hooks.useKeybinds)
local _ = require(HelpPage.Components.Touch.TouchControlList)
local _ = require(script.Parent.CCLTouchHelpPageView)
local DeviceOrientationMode = require(Parent.RobloxAppEnums).DeviceOrientationMode

local function createMockLayout(UseTokensResult, SmallButtonSize: number)
	local SmallButtonSizeRatio = SmallButtonSize / UseTokensResult.Size.Size_400
	local ScaledSize = UseTokensResult.Size.Size_700 * SmallButtonSizeRatio
	local Y = ScaledSize / 1.4142135623730951
	local X = SmallButtonSize * 20
	local _Vector2 = Vector2.new(X, X / 2.1621621621621623)
	local ScaledXSmall = UseTokensResult.Gap.XSmall * SmallButtonSizeRatio
	
	return {
		size = _Vector2,
		smallButtonSize = SmallButtonSize,
		jumpSize = SmallButtonSize * 1.625,
		inset = ScaledXSmall,
		cornerRadius = UseTokensResult.Radius.Large * SmallButtonSizeRatio,
		jumpPosition = _Vector2 - Vector2.new(ScaledXSmall, ScaledXSmall) - Vector2.new(UseTokensResult.Padding.XLarge * SmallButtonSizeRatio + SmallButtonSize / 2 + Y, UseTokensResult.Padding.Medium * SmallButtonSizeRatio + SmallButtonSize / 2 + Y),
		slotOffsets = {
			Vector2.new(-Y, -Y), Vector2.new(-Y, Y), Vector2.new(Y, -Y),
			Vector2.new(-ScaledSize, 0), Vector2.new(0, -ScaledSize), Vector2.new(Y, Y)
		},
		topPadding = UseTokensResult.Padding.Medium * SmallButtonSizeRatio,
		sidePadding = UseTokensResult.Padding.XLarge * SmallButtonSizeRatio,
		topGap = UseTokensResult.Gap.XSmall * SmallButtonSizeRatio
	}
end

return function()
	-- upvalues: UseKeybindsModule (copy), FoundationModule (copy), RobloxAppHooksModule (copy), SignalsReactModule (copy), DisplayModule (copy), ReactModule (copy), ConstantsModule (copy), BindingConfigsModule (copy), createMockLayout (copy), DeviceOrientationMode (copy)
	local UseKeybindsModuleResult = UseKeybindsModule()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseDeviceOrientationResult = RobloxAppHooksModule.useDeviceOrientation()
	local UseSignalStateResult = SignalsReactModule.useSignalState(SignalsReactModule.useSignalState(DisplayModule.GetDisplayStore).getViewportSize)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.X)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize.Y)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(Frame.AbsoluteSize.Y)
	end, {})
	local Controls = UseKeybindsModuleResult.controls or {}
	local LeftControls = {}
	
	for _, value in ipairs({
		{
			id = "UseTool",
			icon = ConstantsModule.HELP_PAGE.TOUCH_ICONS.TAP
		},
		{
			id = "RotateCamera",
			icon = ConstantsModule.HELP_PAGE.TOUCH_ICONS.ROTATE
		},
		{
			id = "ZoomInOut",
			icon = ConstantsModule.HELP_PAGE.TOUCH_ICONS.ZOOM
		},
		{
			id = "Move",
			icon = ConstantsModule.HELP_PAGE.TOUCH_ICONS.ROTATE
		}
	}) do
		local Control = Controls[value.id] or BindingConfigsModule.Controls[value.id]
		
		if Control then
			table.insert(LeftControls, {
				id = value.id,
				label = Control.label,
				icon = value.icon,
				disabled = Control.disabled
			})
		end
	end
	local Slots = {}
	
	for i = 1, 6 do
		local Text = "AbilityAction" .. i
		local Control = Controls[Text]
		table.insert(Slots, {
			id = Text,
			label = if Control then Control.label else "InGame.HelpMenu.GenericAction",
			icon = FoundationModule.Enums.IconName.DiamondSimplified,
			disabled = Control == nil or Control.disabled == true
		})
	end
	local List = {
		{
			id = "Jump",
			label = BindingConfigsModule.Controls.Jump.label,
			icon = FoundationModule.Enums.IconName.KeyShift
		}
	}
	
	for _, slot in ipairs(Slots) do
		table.insert(List, slot)
	end
	table.insert(List, {
		id = "MoreActions",
		label = "InGame.HelpMenu.GenericAction",
		icon = FoundationModule.Enums.IconName.DiamondSimplified
	})
	local IsXBelow: boolean = UseDeviceOrientationResult == DeviceOrientationMode.Portrait and (UseSignalStateResult.X < ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X or UseSignalStateResult.Y < ConstantsModule.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_Y)
	local UseStateResult4 = if IsXBelow then UseStateResult else math.max(0, UseStateResult * 0.5 - 2 * UseTokensResult.Gap.Large)
	local Y = UseStateResult4 / 2.1621621621621623
	local Largest = math.max(Y, UseStateResult1, UseStateResult3)
	local NewY = Y + UseTokensResult.Gap.Large
	
	return {
		abilitiesAvailable = UseKeybindsModuleResult.abilitiesAvailable == true,
		leftControls = LeftControls,
		rightControls = List,
		slots = Slots,
		layout = {
			columnScale = 1,
			leftAnchor = if IsXBelow then Vector2.zero else Vector2.new(1, 0),
			leftPosition = if IsXBelow then UDim2.fromOffset(0, NewY) else UDim2.new(0.25, 0, 0, (Largest - UseStateResult1) / 2),
			rightAnchor = if IsXBelow then Vector2.new(1, 0) else Vector2.zero,
			rightPosition = if IsXBelow then UDim2.new(1, 0, 0, NewY) else UDim2.new(0.75, 0, 0, (Largest - UseStateResult3) / 2),
			columnWidth = if IsXBelow then 0.5 else 0.25,
			diagramSize = Vector2.new(UseStateResult4, Y),
			diagramOffsetY = if IsXBelow then 0 else (Largest - Y) / 2,
			topPadding = UDim.new(0, UseTokensResult.Padding.Small),
			bottomPadding = UDim.new(0, UseTokensResult.Padding.XXLarge)
		},
		onSizeChanged = UseResult,
		onLeftSizeChanged = UseResult1,
		onRightSizeChanged = UseResult2,
		mockLayout = createMockLayout(UseTokensResult, UseTokensResult.Size.Size_500)
	}
end