local _ = game:GetService("ContextActionService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local _ = game:GetService("VRService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Chrome = Parent1.Chrome
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Parent.Constants)
local InGameMenuConstantsModule = require(Parent1.InGameMenuConstants)
local ConstantsModule1 = require(Chrome.ChromeShared.Unibar.Constants)
local FocusUtils = require(CorePackages.Workspace.Packages.Chrome).FocusUtils
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local FoundationModule = require(CorePackages.Packages.Foundation)
local MotionModule = require(CorePackages.Packages.Motion)
local ReactModule = require(CorePackages.Packages.React)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local SignalsModule = require(CorePackages.Packages.Signals)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local FFlagShowUnibarOnVirtualCursor = SharedFlagsModule.FFlagShowUnibarOnVirtualCursor
local FFlagEnableSideSheet = SharedFlagsModule.FFlagEnableSideSheet
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local ControlState = FoundationModule.Enums.ControlState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCursorFunction = FoundationModule.Hooks.useCursor
local GetSideSheetVisibilityFunction = require(CorePackages.Workspace.Packages.InExperienceSideSheet).getSideSheetVisibility
local MenuIconHoveredSignalModule = require(Parent.Components.Presentation.menuIconHoveredSignal)
local BadgeOver12Module = require(Parent.Components.Presentation.BadgeOver12)
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local TooltipCallout = UIBloxModule.App.Dialog.TooltipCallout
local VrSpatialUiModule = require(CorePackages.Workspace.Packages.VrSpatialUi)
local UIManager = VrSpatialUiModule.UIManager
local Panel3DInSpatialUI = VrSpatialUiModule.Panel3DInSpatialUI
local PanelType = VrSpatialUiModule.Constants.PanelType
local SPATIALTOOLTIPSPACING = VrSpatialUiModule.Constants.SPATIAL_TOOLTIP_SPACING

local function _(): boolean
	-- upvalues: IsSpatialFunction (copy), ServiceModule (copy), UIManager (copy)
	if IsSpatialFunction() then
		local IsBottomBarInteractionOnAnimationSupported = UIManager.getInstance():isBottomBarInteractionOnAnimationSupported()
		
		return not ServiceModule:showTopBar() and not IsBottomBarInteractionOnAnimationSupported
	else
		return false
	end
end

local HotkeyCodes = { Enum.KeyCode.Escape }

return function(p1)
	-- upvalues: UseTokensFunction (copy), SignalsReactModule (copy), DisplayModule (copy), ConstantsModule (copy), ReactModule (copy), MotionModule (copy), GuiService (copy), ServiceModule (copy), ConstantsModule1 (copy), UseCursorFunction (copy), FoundationModule (copy), HotkeyCodes (copy), CoreGui (copy), TooltipOrientation (copy), RobloxTranslatorModule (copy), SettingsShowSignal (copy), FFlagEnableSideSheet (copy), SignalsModule (copy), GetSideSheetVisibilityFunction (copy), FocusUtils (copy), ControlState (copy), IsSpatialFunction (copy), UIManager (copy), MenuIconHoveredSignalModule (copy), FFlagShowUnibarOnVirtualCursor (copy), GamepadService (copy), Parent1 (copy), InGameMenuConstantsModule (copy), TooltipCallout (copy), SPATIALTOOLTIPSPACING (copy), Panel3DInSpatialUI (copy), PanelType (copy), WithTooltipFunction (copy), View (copy), BadgeOver12Module (copy), Icon (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(function(p2)
		-- upvalues: DisplayModule (upval)
		return DisplayModule.GetDisplayStore(p2).getUIScale(p2)
	end)
	local _ = ConstantsModule.TopBarButtonHeight * UseSignalStateResult
	local ScaledTopBarButtonPadding = ConstantsModule.TopBarButtonPadding * UseSignalStateResult
	local ScaledMENUICONSIZE = ConstantsModule.MENU_ICON_SIZE * UseSignalStateResult
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: MotionModule (upval), ScaledMENUICONSIZE (copy), ConstantsModule (upval)
		return {
			menuOpen = MotionModule.createState({
				size = ScaledMENUICONSIZE * ConstantsModule.MenuIconOpenScale
			}),
			menuClosed = MotionModule.createState({ size = ScaledMENUICONSIZE })
		}
	end, { UseSignalStateResult })
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion(UseMemoResult.menuClosed)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(GuiService.PreferredTransparency)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local Child = nil
	
	if p1.unibarMenuRef and p1.unibarMenuRef.current then
		local GetResultEntry = ServiceModule:menuList():get()[1]
		local Text = if GetResultEntry then ConstantsModule1.ICON_NAME_PREFIX .. GetResultEntry.id else nil
		Child = if p1.unibarMenuRef.current and Text then p1.unibarMenuRef.current:FindFirstChild(Text, true) else nil
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.zero)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Vector2.zero)
	local UseCursorResult = UseCursorFunction(FoundationModule.Enums.CursorType.SkinToneCircle)
	local RobloxMenu = ReactModule.useRef("Roblox Menu")
	local config = {
		textAlignment = Enum.TextXAlignment.Center,
		headerText = RobloxMenu.current,
		hotkeyCodes = HotkeyCodes
	}
	local config1 = {
		DisplayOrder = 10,
		active = UseStateResult,
		guiTarget = CoreGui,
		preferredOrientation = TooltipOrientation.Bottom
	}
	ReactModule.useEffect(function()
		-- upvalues: RobloxMenu (copy), RobloxTranslatorModule (upval), GuiService (upval), UseBindingResult2 (copy), SettingsShowSignal (upval), UseMotionResult2 (copy), UseMemoResult (copy), FFlagEnableSideSheet (upval), SignalsModule (upval), GetSideSheetVisibilityFunction (upval), p1 (copy), ServiceModule (upval), FocusUtils (upval)
		pcall(function()
			-- upvalues: RobloxMenu (upval), RobloxTranslatorModule (upval)
			RobloxMenu.current = RobloxTranslatorModule:FormatByKey("CoreScripts.TopBar.RobloxMenu")
		end)
		local Connection = GuiService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
			-- upvalues: UseBindingResult2 (upval), GuiService (upval)
			UseBindingResult2(GuiService.PreferredTransparency)
		end)
		local Connection1 = SettingsShowSignal:connect(function(p2)
			-- upvalues: UseMotionResult2 (upval), UseMemoResult (upval)
			UseMotionResult2(if p2 then UseMemoResult.menuOpen else UseMemoResult.menuClosed)
		end)
		local Effect = if FFlagEnableSideSheet then SignalsModule.createEffect(function(p2)
			-- upvalues: GetSideSheetVisibilityFunction (upval), UseMotionResult2 (upval), UseMemoResult (upval)
			UseMotionResult2(if GetSideSheetVisibilityFunction(p2) then UseMemoResult.menuOpen else UseMemoResult.menuClosed)
		end) else nil
		local Connection2 = if p1.menuIconRef then ServiceModule:onTriggerMenuIcon():connect(function()
			-- upvalues: GuiService (upval), p1 (upval), FocusUtils (upval)
			GuiService.SelectedCoreObject = p1.menuIconRef.current
			FocusUtils.MenuIconSelectedSignal:set(true)
		end) else nil
		
		return function()
			-- upvalues: FFlagEnableSideSheet (upval), Effect (ref), Connection (copy), Connection1 (copy), Connection2 (ref)
			if FFlagEnableSideSheet and Effect then
				Effect()
			end
			Connection:Disconnect()
			Connection1:Disconnect()
			
			if Connection2 then
				Connection2:disconnect()
			end
		end
	end, {})
	local UseRefResult2 = ReactModule.useRef(ControlState.Default)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: ControlState (upval), IsSpatialFunction (upval), ServiceModule (upval), UIManager (upval), UseRefResult1 (copy), MenuIconHoveredSignalModule (upval), UseRefResult (copy), UseStateResult2 (copy), FocusUtils (upval), UseRefResult2 (copy), FFlagShowUnibarOnVirtualCursor (upval), GamepadService (upval), GuiService (upval), ConstantsModule1 (upval)
		if Current == ControlState.Hover then
			local NoIsBottomBarInteractionOnAnimationSupported = nil
			if IsSpatialFunction() then
				local IsBottomBarInteractionOnAnimationSupported = UIManager.getInstance():isBottomBarInteractionOnAnimationSupported()
				NoIsBottomBarInteractionOnAnimationSupported = not ServiceModule:showTopBar() and not IsBottomBarInteractionOnAnimationSupported
			else
				NoIsBottomBarInteractionOnAnimationSupported = false
			end
			if NoIsBottomBarInteractionOnAnimationSupported then return end
			UseRefResult1.current = true
			MenuIconHoveredSignalModule:fire(true)
			task.delay(0.65, function()
				-- upvalues: UseRefResult1 (upval), UseRefResult (upval), IsSpatialFunction (upval), ServiceModule (upval), UIManager (upval), UseStateResult2 (upval)
				if UseRefResult1.current and not UseRefResult.current then
					local NoIsBottomBarInteractionOnAnimationSupported = nil
					if IsSpatialFunction() then
						local IsBottomBarInteractionOnAnimationSupported = UIManager.getInstance():isBottomBarInteractionOnAnimationSupported()
						NoIsBottomBarInteractionOnAnimationSupported = not ServiceModule:showTopBar() and not IsBottomBarInteractionOnAnimationSupported
					else
						NoIsBottomBarInteractionOnAnimationSupported = false
					end
					if NoIsBottomBarInteractionOnAnimationSupported then return end
					UseStateResult2(true)
				end
			end)
		elseif Current == ControlState.Selected then
			FocusUtils.MenuIconSelectedSignal:set(true)
		elseif Current == ControlState.Default then
			if UseRefResult2.current == ControlState.Hover then
				UseStateResult2(false)
				UseRefResult1.current = false
				UseRefResult.current = false
			elseif UseRefResult2.current == ControlState.Selected then
				if (not FFlagShowUnibarOnVirtualCursor or not GamepadService.GamepadCursorEnabled) and (GuiService.SelectedCoreObject and string.find(GuiService.SelectedCoreObject.Name, ConstantsModule1.ICON_NAME_PREFIX)) then
					ServiceModule:enableFocusNav()
				end
				FocusUtils.MenuIconSelectedSignal:set(false)
			end
		end
		UseRefResult2.current = Current
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseRefResult (copy), IsSpatialFunction (upval), ServiceModule (upval), UIManager (upval), Parent1 (upval), InGameMenuConstantsModule (upval)
		UseStateResult2(false)
		UseRefResult.current = true
		local NoIsBottomBarInteractionOnAnimationSupported = nil
		
		if IsSpatialFunction() then
			local IsBottomBarInteractionOnAnimationSupported = UIManager.getInstance():isBottomBarInteractionOnAnimationSupported()
			NoIsBottomBarInteractionOnAnimationSupported = not ServiceModule:showTopBar() and not IsBottomBarInteractionOnAnimationSupported
		else
			NoIsBottomBarInteractionOnAnimationSupported = false
		end
		if not NoIsBottomBarInteractionOnAnimationSupported then
			require(Parent1.Settings.SettingsHub):ToggleVisibility(InGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
			
			return
		end
	end, {})
	
	return (function(p2, p3, Callback)
		-- upvalues: IsSpatialFunction (upval), UseStateResult2_1 (copy), UseStateResult2_2 (copy), ReactModule (upval), TooltipCallout (upval), TooltipOrientation (upval), UseStateResult3 (copy), UseStateResult1 (copy), SPATIALTOOLTIPSPACING (upval), Panel3DInSpatialUI (upval), PanelType (upval), WithTooltipFunction (upval)
		if IsSpatialFunction() then
			local UseResult = ReactModule.useCallback(function(p4)
				-- upvalues: ReactModule (upval), TooltipCallout (upval), p2 (copy), TooltipOrientation (upval), UseStateResult3 (upval), UseStateResult1 (upval), SPATIALTOOLTIPSPACING (upval)
				return ReactModule.createElement(TooltipCallout, {
					distanceOffset = 0,
					textAlignment = Enum.TextXAlignment.Center,
					headerText = p2.headerText,
					orientation = TooltipOrientation.Top,
					triggerPointCenter = Vector2.new(UseStateResult3.X + UseStateResult1.X / 2, p4.Y - SPATIALTOOLTIPSPACING),
					contentOffsetVector = Vector2.zero,
					triggerPointRadius = Vector2.zero
				})
			end, { p2, UseStateResult3, UseStateResult1 })
			
			return ReactModule.createElement(ReactModule.Fragment, nil, {
				VRSpatialTooltip = if p3.active and UseStateResult1 and Panel3DInSpatialUI then ReactModule.createElement(Panel3DInSpatialUI, {
					panelType = PanelType.ToolTipsContainer,
					renderFunction = UseResult
				}) else nil,
				MenuIconTriggerPoint = Callback(function(Frame: Frame)
					-- upvalues: UseStateResult2_1 (upval), UseStateResult2_2 (upval)
					UseStateResult2_1(Frame.AbsoluteSize)
					UseStateResult2_2(Frame.AbsolutePosition)
				end)
			})
		else
			return WithTooltipFunction(p2, p3, Callback)
		end
	end)(config, config1, (ReactModule.useCallback(function(OnAbsolutePositionChanged)
		-- upvalues: ReactModule (upval), View (upval), FFlagEnableSideSheet (upval), UseBindingResult (copy), UseTokensResult (copy), Child (ref), UseCursorResult (copy), p1 (copy), UseResult1 (copy), UseResult (copy), BadgeOver12Module (upval), ScaledTopBarButtonPadding (copy), Icon (upval), FoundationModule (upval), UseMotionResult (copy)
		return ReactModule.createElement(View, {
			tag = "radius-circle aspect-1-1",
			backgroundStyle = if FFlagEnableSideSheet then nil else UseBindingResult:map(function(p2)
				-- upvalues: UseTokensResult (upval)
				local OverMedia0 = UseTokensResult.Color.OverMedia.OverMedia_0
				OverMedia0.Transparency *= p2
				
				return OverMedia0
			end),
			Size = UDim2.fromScale(1, 1),
			NextSelectionRight = Child,
			selection = {
				Selectable = true,
				SelectionImageObject = UseCursorResult
			},
			selectionGroup = {
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			},
			ref = p1.menuIconRef,
			onAbsoluteSizeChanged = OnAbsolutePositionChanged,
			onAbsolutePositionChanged = OnAbsolutePositionChanged,
			onActivated = if FFlagEnableSideSheet then nil else UseResult1,
			onStateChanged = if FFlagEnableSideSheet then nil else UseResult
		}, {
			BadgeOver12 = if p1.showBadgeOver12 then ReactModule.createElement(BadgeOver12Module, {
				position = UDim2.new(0, 1, 1, -(ScaledTopBarButtonPadding + 1))
			}) else nil,
			Icon = ReactModule.createElement(Icon, {
				name = FoundationModule.Enums.IconName.Tilt,
				size = UseMotionResult.size,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				style = if FFlagEnableSideSheet then UseTokensResult.Color.ActionEmphasis.Foreground else nil
			})
		})
	end, {
		UseBindingResult, Child, UseCursorResult, UseResult1, UseResult,
		p1.showBadgeOver12
	})))
end