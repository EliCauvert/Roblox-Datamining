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

local _ = function() --[[ line: 61 ]]
	-- upvalues: isSpatial (ref), serviceModule (ref), UIManager (ref)
	return if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false
end

local var21 = if fFlagEnablePlaytestModeUnibar then foundationModule.Utility.getTokens(foundationModule.Enums.Theme.Light) else nil
local list = { Enum.KeyCode.Escape }

return function(p0) --[[ line: 93 | named "MenuIcon" ]]
	-- upvalues: useTokens (ref), fFlagEnablePlaytestModeUnibar (ref), useIsPlaytestModeModule (ref), var21 (ref), fFlagEnableSideSheet (ref), signalsReactModule (ref), displayModule (ref), constantsModule (ref), reactModule (ref), motionModule (ref), guiService (ref), serviceModule (ref), constantsModule_1 (ref), useCursor (ref), foundationModule (ref), list (ref), coreGuiService (ref), tooltipOrientation (ref), robloxTranslatorModule (ref), settingsShowSignal (ref), signalsModule (ref), getSideSheetVisibility (ref), focusUtils (ref), controlState (ref), isSpatial (ref), UIManager (ref), menuIconHoveredSignalModule (ref), fFlagShowUnibarOnVirtualCursor (ref), gamepadService (ref), parent_1 (ref), inGameMenuConstantsModule (ref), tooltipCallout (ref), SPATIAL_TOOLTIP_SPACING (ref), panel3DInSpatialUI (ref), panelType (ref), withTooltip (ref), view (ref), badgeOver12Module (ref), icon (ref)
	local var23 = useTokens()
	local var24 = if fFlagEnablePlaytestModeUnibar then useIsPlaytestModeModule() else nil
	local var25 = if fFlagEnablePlaytestModeUnibar and var24 then var21.Color.Content.Emphasis elseif fFlagEnableSideSheet then var23.Color.ActionEmphasis.Foreground else nil
	local var26 = if fFlagEnablePlaytestModeUnibar and var24 then var21.Color.OverMedia.OverMedia_0 else var23.Color.OverMedia.OverMedia_0
	local var27 = signalsReactModule.useSignalState(function(p1) --[[ line: 110 ]]
		-- upvalues: displayModule (copy)
		return displayModule.GetDisplayStore(p1).getUIScale(p1)
	end)
	local _ = constantsModule.TopBarButtonHeight * var27
	local var28 = constantsModule.TopBarButtonPadding * var27
	local var29 = constantsModule.MENU_ICON_SIZE * var27
	local var30 = reactModule.useMemo(function() --[[ line: 117 ]]
		-- upvalues: motionModule (copy), var29 (ref), constantsModule (copy)
		return {
			menuOpen = motionModule.createState({ size = var29 * constantsModule.MenuIconOpenScale }),
			menuClosed = motionModule.createState({ size = var29 })
		}
	end, { var27 })
	local var31, var32 = motionModule.useMotion(var30.menuClosed)
	local var33, var34 = reactModule.useBinding(guiService.PreferredTransparency)
	local var35 = reactModule.useRef(false)
	local var36 = reactModule.useRef(false)
	local _ = nil
	local _ = nil
	local var37 = nil
	
	if p0.unibarMenuRef and p0.unibarMenuRef.current then
		local var38 = serviceModule:menuList():get()[1]
		local var39 = if var38 then constantsModule_1.ICON_NAME_PREFIX .. var38.id else nil
		var37 = if p0.unibarMenuRef.current and var39 then p0.unibarMenuRef.current:FindFirstChild(var39, true) else nil
	end
	local var40, var41 = reactModule.useState(false)
	local var42, var43 = reactModule.useState(Vector2.zero)
	local var44, var45 = reactModule.useState(Vector2.zero)
	local var46 = useCursor(foundationModule.Enums.CursorType.SkinToneCircle)
	local var47 = reactModule.useRef("Roblox Menu")
	local t = {
		textAlignment = Enum.TextXAlignment.Center,
		headerText = var47.current,
		hotkeyCodes = list
	}
	local t_1 = {
		DisplayOrder = 10,
		active = var40,
		guiTarget = coreGuiService,
		preferredOrientation = tooltipOrientation.Bottom
	}
	reactModule.useEffect(function() --[[ line: 166 ]]
		-- upvalues: var47 (ref), robloxTranslatorModule (copy), guiService (copy), var34 (ref), settingsShowSignal (copy), var32 (ref), var30 (ref), fFlagEnableSideSheet (copy), signalsModule (copy), getSideSheetVisibility (copy), p0 (ref), serviceModule (copy), focusUtils (copy)
		pcall(function() --[[ line: 167 ]]
			-- upvalues: var47 (copy), robloxTranslatorModule (copy)
			var47.current = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.RobloxMenu")
		end)
		local var53 = guiService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ line: 171 ]]
			-- upvalues: var34 (copy), guiService (copy)
			var34(guiService.PreferredTransparency)
		end)
		local var54 = settingsShowSignal:connect(function(p2) --[[ line: 174 ]]
			-- upvalues: var32 (copy), var30 (copy)
			var32(if p2 then var30.menuOpen else var30.menuClosed)
		end)
		local var55 = if fFlagEnableSideSheet then signalsModule.createEffect(function(p3) --[[ line: 180 ]]
			-- upvalues: getSideSheetVisibility (copy), var32 (copy), var30 (copy)
			var32(if getSideSheetVisibility(p3) then var30.menuOpen else var30.menuClosed)
		end) else nil
		local var56 = if p0.menuIconRef then serviceModule:onTriggerMenuIcon():connect(function() --[[ line: 188 ]]
			-- upvalues: guiService (copy), p0 (copy), focusUtils (copy)
			guiService.SelectedCoreObject = p0.menuIconRef.current
			focusUtils.MenuIconSelectedSignal:set(true)
		end) else nil
		
		return function() --[[ line: 194 ]]
			-- upvalues: fFlagEnableSideSheet (copy), var55 (write), var53 (ref), var54 (ref), var56 (write)
			if fFlagEnableSideSheet and var55 then
				var55()
			end
			var53:Disconnect()
			var54:Disconnect()
			
			if var56 then
				var56:disconnect()
			end
		end
	end, {})
	local var50 = reactModule.useRef(controlState.Default)
	local var51 = reactModule.useCallback(function(p4) --[[ line: 207 ]]
		-- upvalues: controlState (copy), isSpatial (copy), serviceModule (copy), UIManager (copy), var36 (ref), menuIconHoveredSignalModule (copy), var35 (ref), var41 (ref), focusUtils (copy), var50 (ref), fFlagShowUnibarOnVirtualCursor (copy), gamepadService (copy), guiService (copy), constantsModule_1 (copy)
		if p4 == controlState.Hover then
			if if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false then return end
			var36.current = true
			menuIconHoveredSignalModule:fire(true)
			task.delay(0.65, function() --[[ line: 215 ]]
				-- upvalues: var36 (copy), var35 (copy), isSpatial (copy), serviceModule (copy), UIManager (copy), var41 (copy)
				if var36.current and not var35.current then
					if if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false then return end
					var41(true)
				end
			end)
		elseif p4 == controlState.Selected then
			focusUtils.MenuIconSelectedSignal:set(true)
		elseif p4 == controlState.Default then
			if var50.current == controlState.Hover then
				var41(false)
				var36.current = false
				var35.current = false
			elseif var50.current == controlState.Selected then
				if (not fFlagShowUnibarOnVirtualCursor or not gamepadService.GamepadCursorEnabled) and (guiService.SelectedCoreObject and string.find(guiService.SelectedCoreObject.Name, constantsModule_1.ICON_NAME_PREFIX)) then
					serviceModule:enableFocusNav()
				end
				focusUtils.MenuIconSelectedSignal:set(false)
			end
		end
		var50.current = p4
	end, {})
	local var52 = reactModule.useCallback(function() --[[ line: 241 ]]
		-- upvalues: var41 (ref), var35 (ref), isSpatial (copy), serviceModule (copy), UIManager (copy), parent_1 (copy), inGameMenuConstantsModule (copy)
		var41(false)
		var35.current = true
		
		if if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false then
			return
		end
		require(parent_1.Settings.SettingsHub):ToggleVisibility(inGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
	end, {})
	
	return (function(p7, p8, p9) --[[ line: 252 | named "renderWithTooltipCompat" ]]
		-- upvalues: isSpatial (copy), var43 (ref), var45 (ref), reactModule (copy), tooltipCallout (copy), tooltipOrientation (copy), var44 (ref), var42 (ref), SPATIAL_TOOLTIP_SPACING (copy), panel3DInSpatialUI (copy), panelType (copy), withTooltip (copy)
		return if isSpatial() then reactModule.createElement(reactModule.Fragment, nil, {
			VRSpatialTooltip = if p8.active and var42 and panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
				panelType = panelType.ToolTipsContainer,
				renderFunction = reactModule.useCallback(function(p10) --[[ line: 259 ]]
					-- upvalues: reactModule (copy), tooltipCallout (copy), p7 (ref), tooltipOrientation (copy), var44 (copy), var42 (copy), SPATIAL_TOOLTIP_SPACING (copy)
					return reactModule.createElement(tooltipCallout, {
						distanceOffset = 0,
						textAlignment = Enum.TextXAlignment.Center,
						headerText = p7.headerText,
						orientation = tooltipOrientation.Top,
						triggerPointCenter = Vector2.new(var44.X + var42.X / 2, p10.Y - SPATIAL_TOOLTIP_SPACING),
						contentOffsetVector = Vector2.zero,
						triggerPointRadius = Vector2.zero
					})
				end, { p7, var44, var42 })
			}) else nil,
			MenuIconTriggerPoint = p9(function(p11) --[[ line: 255 ]]
				-- upvalues: var43 (copy), var45 (copy)
				var43(p11.AbsoluteSize)
				var45(p11.AbsolutePosition)
			end)
		}) else withTooltip(p7, p8, p9)
	end)(t, t_1, reactModule.useCallback(function(p5) --[[ line: 293 ]]
		-- upvalues: reactModule (copy), view (copy), fFlagEnableSideSheet (copy), var33 (ref), var26 (ref), var37 (write), var46 (ref), p0 (ref), var52 (ref), var51 (ref), badgeOver12Module (copy), var28 (ref), icon (copy), foundationModule (copy), var31 (ref), var25 (ref)
		return reactModule.createElement(view, {
			tag = "radius-circle aspect-1-1",
			backgroundStyle = if not fFlagEnableSideSheet then var33:map(function(p6) --[[ line: 297 ]]
				-- upvalues: var26 (copy)
				var26.Transparency *= p6
				
				return var26
			end) else nil,
			Size = UDim2.fromScale(1, 1),
			NextSelectionRight = var37,
			selection = { Selectable = true, SelectionImageObject = var46 },
			selectionGroup = {
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			},
			ref = p0.menuIconRef,
			onAbsoluteSizeChanged = p5,
			onAbsolutePositionChanged = p5,
			onActivated = if not fFlagEnableSideSheet then var52 else nil,
			onStateChanged = if not fFlagEnableSideSheet then var51 else nil
		}, {
			BadgeOver12 = if p0.showBadgeOver12 then reactModule.createElement(badgeOver12Module, { position = UDim2.new(0, 1, 1, -(var28 + 1)) }) else nil,
			Icon = reactModule.createElement(icon, {
				name = foundationModule.Enums.IconName.Tilt,
				size = var31.size,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				style = var25
			})
		})
	end, {
		var33, var37, var46, var52, var51, p0.showBadgeOver12, var25, var26
	}))
end