local _ = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local gamepadService = game:GetService("GamepadService")
local guiService = game:GetService("GuiService")
local _ = game:GetService("VRService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local chrome = parent_1.Chrome
local serviceModule = require(chrome.Service)
local constantsModule = require(parent.Constants)
local inGameMenuConstantsModule = require(parent_1.InGameMenuConstants)
local constantsModule_1 = require(chrome.ChromeShared.Unibar.Constants)
local focusUtils = require(corePackagesService.Workspace.Packages.Chrome).FocusUtils
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local foundationModule = require(corePackagesService.Packages.Foundation)
local motionModule = require(corePackagesService.Packages.Motion)
local reactModule = require(corePackagesService.Packages.React)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local fFlagShowUnibarOnVirtualCursor = sharedFlagsModule.FFlagShowUnibarOnVirtualCursor
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local fFlagEnablePlaytestModeUnibar = sharedFlagsModule.FFlagEnablePlaytestModeUnibar
local view = foundationModule.View
local icon = foundationModule.Icon
local controlState = foundationModule.Enums.ControlState
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
local useIsPlaytestModeModule = require(chrome.ChromeShared.Hooks.useIsPlaytestMode)
local getSideSheetVisibility = require(corePackagesService.Workspace.Packages.InExperienceSideSheet).getSideSheetVisibility
local menuIconHoveredSignalModule = require(parent.Components.Presentation.menuIconHoveredSignal)
local badgeOver12Module = require(parent.Components.Presentation.BadgeOver12)
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local tooltipCallout = UIBloxModule.App.Dialog.TooltipCallout
local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
local UIManager = vrSpatialUiModule.UIManager
local panel3DInSpatialUI = vrSpatialUiModule.Panel3DInSpatialUI
local panelType = vrSpatialUiModule.Constants.PanelType
local SPATIAL_TOOLTIP_SPACING = vrSpatialUiModule.Constants.SPATIAL_TOOLTIP_SPACING

local _ = function()
	-- upvalues: isSpatial (ref), serviceModule (ref), UIManager (ref)
	return if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false
end

local var1 = if fFlagEnablePlaytestModeUnibar then foundationModule.Utility.getTokens(foundationModule.Enums.ColorMode.Light) else nil
local list = { Enum.KeyCode.Escape }

return function(p1)
	-- upvalues: useTokens (ref), fFlagEnablePlaytestModeUnibar (ref), useIsPlaytestModeModule (ref), var1 (ref), fFlagEnableSideSheet (ref), signalsReactModule (ref), displayModule (ref), constantsModule (ref), reactModule (ref), motionModule (ref), guiService (ref), serviceModule (ref), constantsModule_1 (ref), useCursor (ref), foundationModule (ref), list (ref), coreGuiService (ref), tooltipOrientation (ref), robloxTranslatorModule (ref), settingsShowSignal (ref), signalsModule (ref), getSideSheetVisibility (ref), focusUtils (ref), controlState (ref), isSpatial (ref), UIManager (ref), menuIconHoveredSignalModule (ref), fFlagShowUnibarOnVirtualCursor (ref), gamepadService (ref), parent_1 (ref), inGameMenuConstantsModule (ref), tooltipCallout (ref), SPATIAL_TOOLTIP_SPACING (ref), panel3DInSpatialUI (ref), panelType (ref), withTooltip (ref), view (ref), fFlagSideSheetFocusNav (ref), badgeOver12Module (ref), icon (ref)
	local var2 = useTokens()
	local var3 = if fFlagEnablePlaytestModeUnibar then useIsPlaytestModeModule() else nil
	local var4 = if fFlagEnablePlaytestModeUnibar and var3 then var1.Color.Content.Emphasis elseif fFlagEnableSideSheet then var2.Color.ActionEmphasis.Foreground else nil
	local var5 = if fFlagEnablePlaytestModeUnibar and var3 then var1.Color.OverMedia.OverMedia_0 else var2.Color.OverMedia.OverMedia_0
	local var6 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: displayModule (copy)
		return displayModule.GetDisplayStore(p2).getUIScale(p2)
	end)
	local _ = constantsModule.TopBarButtonHeight * var6
	local var7 = constantsModule.TopBarButtonPadding * var6
	local var8 = constantsModule.MENU_ICON_SIZE * var6
	local var9 = reactModule.useMemo(function()
		-- upvalues: motionModule (copy), var8 (ref), constantsModule (copy)
		return {
			menuOpen = motionModule.createState({ size = var8 * constantsModule.MenuIconOpenScale }),
			menuClosed = motionModule.createState({ size = var8 })
		}
	end, { var6 })
	local var10, var11 = motionModule.useMotion(var9.menuClosed)
	local var12, var13 = reactModule.useBinding(guiService.PreferredTransparency)
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useRef(false)
	local _ = nil
	local _ = nil
	local var16 = nil
	
	if p1.unibarMenuRef and p1.unibarMenuRef.current then
		local var17 = serviceModule:menuList():get()[1]
		local var18 = if var17 then constantsModule_1.ICON_NAME_PREFIX .. var38.id else nil
		var16 = if p1.unibarMenuRef.current and var18 then p1.unibarMenuRef.current:FindFirstChild(var18, true) else nil
	end
	local var19, var20 = reactModule.useState(false)
	local var21, var22 = reactModule.useState(Vector2.zero)
	local var23, var24 = reactModule.useState(Vector2.zero)
	local var25 = useCursor(foundationModule.Enums.CursorType.SkinToneCircle)
	local var26 = reactModule.useRef("Roblox Menu")
	local t = {
		textAlignment = Enum.TextXAlignment.Center,
		headerText = var26.current,
		hotkeyCodes = list
	}
	local t_1 = {
		DisplayOrder = 10,
		active = var19,
		guiTarget = coreGuiService,
		preferredOrientation = tooltipOrientation.Bottom
	}
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), robloxTranslatorModule (copy), guiService (copy), var13 (ref), settingsShowSignal (copy), var11 (ref), var9 (ref), fFlagEnableSideSheet (copy), signalsModule (copy), getSideSheetVisibility (copy), p1 (ref), serviceModule (copy), focusUtils (copy)
		pcall(function()
			-- upvalues: var26 (copy), robloxTranslatorModule (copy)
			var26.current = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.RobloxMenu")
		end)
		local var27 = guiService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
			-- upvalues: var13 (copy), guiService (copy)
			var13(guiService.PreferredTransparency)
		end)
		local var28 = settingsShowSignal:connect(function(p2)
			-- upvalues: var11 (copy), var9 (copy)
			var11(if p2 then var9.menuOpen else var9.menuClosed)
		end)
		local var29 = if fFlagEnableSideSheet then signalsModule.createEffect(function(p2)
			-- upvalues: getSideSheetVisibility (copy), var11 (copy), var9 (copy)
			var11(if getSideSheetVisibility(p2) then var9.menuOpen else var9.menuClosed)
		end) else nil
		local var30 = if p1.menuIconRef then serviceModule:onTriggerMenuIcon():connect(function()
			-- upvalues: guiService (copy), p1 (copy), focusUtils (copy)
			guiService.SelectedCoreObject = p1.menuIconRef.current
			focusUtils.MenuIconSelectedSignal:set(true)
		end) else nil
		
		return function()
			-- upvalues: fFlagEnableSideSheet (copy), var29 (write), var27 (ref), var28 (ref), var30 (write)
			if fFlagEnableSideSheet and var29 then
				var29()
			end
			var27:Disconnect()
			var28:Disconnect()
			
			if var30 then
				var30:disconnect()
			end
		end
	end, {})
	local var27 = reactModule.useRef(controlState.Default)
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: controlState (copy), isSpatial (copy), serviceModule (copy), UIManager (copy), var15 (ref), menuIconHoveredSignalModule (copy), var14 (ref), var20 (ref), focusUtils (copy), var27 (ref), fFlagShowUnibarOnVirtualCursor (copy), gamepadService (copy), guiService (copy), constantsModule_1 (copy)
		if p2 == controlState.Hover then
			if if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false then return end
			var15.current = true
			menuIconHoveredSignalModule:fire(true)
			task.delay(0.65, function()
				-- upvalues: var15 (copy), var14 (copy), isSpatial (copy), serviceModule (copy), UIManager (copy), var20 (copy)
				if var15.current and not var14.current then
					if if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false then return end
					var20(true)
				end
			end)
		elseif p2 == controlState.Selected then
			focusUtils.MenuIconSelectedSignal:set(true)
		elseif p2 == controlState.Default then
			if var27.current == controlState.Hover then
				var20(false)
				var15.current = false
				var14.current = false
			elseif var27.current == controlState.Selected then
				if (not fFlagShowUnibarOnVirtualCursor or not gamepadService.GamepadCursorEnabled) and (guiService.SelectedCoreObject and string.find(guiService.SelectedCoreObject.Name, constantsModule_1.ICON_NAME_PREFIX)) then
					serviceModule:enableFocusNav()
				end
				focusUtils.MenuIconSelectedSignal:set(false)
			end
		end
		var27.current = p2
	end, {})
	local var29 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), var14 (ref), isSpatial (copy), serviceModule (copy), UIManager (copy), parent_1 (copy), inGameMenuConstantsModule (copy)
		var20(false)
		var14.current = true
		
		if if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false then
			return
		end
		require(parent_1.Settings.SettingsHub):ToggleVisibility(inGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
	end, {})
	
	return (function(p2, p3, p4)
		-- upvalues: isSpatial (copy), var22 (ref), var24 (ref), reactModule (copy), tooltipCallout (copy), tooltipOrientation (copy), var23 (ref), var21 (ref), SPATIAL_TOOLTIP_SPACING (copy), panel3DInSpatialUI (copy), panelType (copy), withTooltip (copy)
		return if isSpatial() then reactModule.createElement(reactModule.Fragment, nil, {
			VRSpatialTooltip = if p3.active and var21 and panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
				panelType = panelType.ToolTipsContainer,
				renderFunction = reactModule.useCallback(function(p5)
					-- upvalues: reactModule (copy), tooltipCallout (copy), p2 (ref), tooltipOrientation (copy), var23 (copy), var21 (copy), SPATIAL_TOOLTIP_SPACING (copy)
					return reactModule.createElement(tooltipCallout, {
						distanceOffset = 0,
						textAlignment = Enum.TextXAlignment.Center,
						headerText = p2.headerText,
						orientation = tooltipOrientation.Top,
						triggerPointCenter = Vector2.new(var23.X + var21.X / 2, p5.Y - SPATIAL_TOOLTIP_SPACING),
						contentOffsetVector = Vector2.zero,
						triggerPointRadius = Vector2.zero
					})
				end, { p2, var23, var21 })
			}) else nil,
			MenuIconTriggerPoint = p4(function(p5)
				-- upvalues: var22 (copy), var24 (copy)
				var22(p5.AbsoluteSize)
				var24(p5.AbsolutePosition)
			end)
		}) else withTooltip(p2, p3, p4)
	end)(t, t_1, reactModule.useCallback(function(p2)
		-- upvalues: reactModule (copy), view (copy), fFlagEnableSideSheet (copy), var12 (ref), var5 (ref), var16 (write), fFlagSideSheetFocusNav (copy), var25 (ref), p1 (ref), var29 (ref), var28 (ref), badgeOver12Module (copy), var7 (ref), icon (copy), foundationModule (copy), var10 (ref), var4 (ref)
		return reactModule.createElement(view, {
			tag = "radius-circle aspect-1-1",
			backgroundStyle = if not fFlagEnableSideSheet then var12:map(function(p3)
				-- upvalues: var5 (copy)
				var5.Transparency *= p3
				
				return var5
			end) else nil,
			Size = UDim2.fromScale(1, 1),
			NextSelectionRight = var16,
			selection = if fFlagEnableSideSheet and fFlagSideSheetFocusNav then { Selectable = false } else { Selectable = true, SelectionImageObject = var25 },
			selectionGroup = {
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			},
			ref = p1.menuIconRef,
			onAbsoluteSizeChanged = p2,
			onAbsolutePositionChanged = p2,
			onActivated = if not fFlagEnableSideSheet then var29 else nil,
			onStateChanged = if not fFlagEnableSideSheet then var28 else nil
		}, {
			BadgeOver12 = if p1.showBadgeOver12 then reactModule.createElement(badgeOver12Module, { position = UDim2.new(0, 1, 1, -(var7 + 1)) }) else nil,
			Icon = reactModule.createElement(icon, {
				name = foundationModule.Enums.IconName.Tilt,
				size = var10.size,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				style = var4
			})
		})
	end, {
		var12, var16, var25, var29, var28, p1.showBadgeOver12, var4, var5
	}))
end