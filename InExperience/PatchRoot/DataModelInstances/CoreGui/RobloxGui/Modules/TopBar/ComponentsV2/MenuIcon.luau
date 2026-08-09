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
local view = foundationModule.View
local icon = foundationModule.Icon
local controlState = foundationModule.Enums.ControlState
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
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

local _ = function() --[[ line: 58 ]]
	-- upvalues: isSpatial (ref), serviceModule (ref), UIManager (ref)
	return if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false
end

local list = { Enum.KeyCode.Escape }

return function(p0) --[[ line: 86 | named "MenuIcon" ]]
	-- upvalues: useTokens (ref), signalsReactModule (ref), displayModule (ref), constantsModule (ref), reactModule (ref), motionModule (ref), guiService (ref), serviceModule (ref), constantsModule_1 (ref), useCursor (ref), foundationModule (ref), list (ref), coreGuiService (ref), tooltipOrientation (ref), robloxTranslatorModule (ref), settingsShowSignal (ref), fFlagEnableSideSheet (ref), signalsModule (ref), getSideSheetVisibility (ref), focusUtils (ref), controlState (ref), isSpatial (ref), UIManager (ref), menuIconHoveredSignalModule (ref), fFlagShowUnibarOnVirtualCursor (ref), gamepadService (ref), parent_1 (ref), inGameMenuConstantsModule (ref), tooltipCallout (ref), SPATIAL_TOOLTIP_SPACING (ref), panel3DInSpatialUI (ref), panelType (ref), withTooltip (ref), view (ref), badgeOver12Module (ref), icon (ref)
	local var21 = useTokens()
	local var22 = signalsReactModule.useSignalState(function(p1) --[[ line: 89 ]]
		-- upvalues: displayModule (copy)
		return displayModule.GetDisplayStore(p1).getUIScale(p1)
	end)
	local _ = constantsModule.TopBarButtonHeight * var22
	local var23 = constantsModule.TopBarButtonPadding * var22
	local var24 = constantsModule.MENU_ICON_SIZE * var22
	local var25 = reactModule.useMemo(function() --[[ line: 96 ]]
		-- upvalues: motionModule (copy), var24 (ref), constantsModule (copy)
		return {
			menuOpen = motionModule.createState({ size = var24 * constantsModule.MenuIconOpenScale }),
			menuClosed = motionModule.createState({ size = var24 })
		}
	end, { var22 })
	local var26, var27 = motionModule.useMotion(var25.menuClosed)
	local var28, var29 = reactModule.useBinding(guiService.PreferredTransparency)
	local var30 = reactModule.useRef(false)
	local var31 = reactModule.useRef(false)
	local _ = nil
	local _ = nil
	local var32 = nil
	
	if p0.unibarMenuRef and p0.unibarMenuRef.current then
		local var33 = serviceModule:menuList():get()[1]
		local var34 = if var33 then constantsModule_1.ICON_NAME_PREFIX .. var33.id else nil
		var32 = if p0.unibarMenuRef.current and var34 then p0.unibarMenuRef.current:FindFirstChild(var34, true) else nil
	end
	local var35, var36 = reactModule.useState(false)
	local var37, var38 = reactModule.useState(Vector2.zero)
	local var39, var40 = reactModule.useState(Vector2.zero)
	local var41 = useCursor(foundationModule.Enums.CursorType.SkinToneCircle)
	local var42 = reactModule.useRef("Roblox Menu")
	local t = {
		textAlignment = Enum.TextXAlignment.Center,
		headerText = var42.current,
		hotkeyCodes = list
	}
	local t_1 = {
		DisplayOrder = 10,
		active = var35,
		guiTarget = coreGuiService,
		preferredOrientation = tooltipOrientation.Bottom
	}
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: var42 (ref), robloxTranslatorModule (copy), guiService (copy), var29 (ref), settingsShowSignal (copy), var27 (ref), var25 (ref), fFlagEnableSideSheet (copy), signalsModule (copy), getSideSheetVisibility (copy), p0 (ref), serviceModule (copy), focusUtils (copy)
		pcall(function() --[[ line: 146 ]]
			-- upvalues: var42 (copy), robloxTranslatorModule (copy)
			var42.current = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.RobloxMenu")
		end)
		local var48 = guiService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ line: 150 ]]
			-- upvalues: var29 (copy), guiService (copy)
			var29(guiService.PreferredTransparency)
		end)
		local var49 = settingsShowSignal:connect(function(p2) --[[ line: 153 ]]
			-- upvalues: var27 (copy), var25 (copy)
			var27(if p2 then var25.menuOpen else var25.menuClosed)
		end)
		local var50 = if fFlagEnableSideSheet then signalsModule.createEffect(function(p3) --[[ line: 159 ]]
			-- upvalues: getSideSheetVisibility (copy), var27 (copy), var25 (copy)
			var27(if getSideSheetVisibility(p3) then var25.menuOpen else var25.menuClosed)
		end) else nil
		local var51 = if p0.menuIconRef then serviceModule:onTriggerMenuIcon():connect(function() --[[ line: 167 ]]
			-- upvalues: guiService (copy), p0 (copy), focusUtils (copy)
			guiService.SelectedCoreObject = p0.menuIconRef.current
			focusUtils.MenuIconSelectedSignal:set(true)
		end) else nil
		
		return function() --[[ line: 173 ]]
			-- upvalues: fFlagEnableSideSheet (copy), var50 (write), var48 (ref), var49 (ref), var51 (write)
			if fFlagEnableSideSheet and var50 then
				var50()
			end
			var48:Disconnect()
			var49:Disconnect()
			
			if var51 then
				var51:disconnect()
			end
		end
	end, {})
	local var45 = reactModule.useRef(controlState.Default)
	local var46 = reactModule.useCallback(function(p4) --[[ line: 186 ]]
		-- upvalues: controlState (copy), isSpatial (copy), serviceModule (copy), UIManager (copy), var31 (ref), menuIconHoveredSignalModule (copy), var30 (ref), var36 (ref), focusUtils (copy), var45 (ref), fFlagShowUnibarOnVirtualCursor (copy), gamepadService (copy), guiService (copy), constantsModule_1 (copy)
		if p4 == controlState.Hover then
			if if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false then return end
			var31.current = true
			menuIconHoveredSignalModule:fire(true)
			task.delay(0.65, function() --[[ line: 194 ]]
				-- upvalues: var31 (copy), var30 (copy), isSpatial (copy), serviceModule (copy), UIManager (copy), var36 (copy)
				if var31.current and not var30.current then
					if if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false then return end
					var36(true)
				end
			end)
		elseif p4 == controlState.Selected then
			focusUtils.MenuIconSelectedSignal:set(true)
		elseif p4 == controlState.Default then
			if var45.current == controlState.Hover then
				var36(false)
				var31.current = false
				var30.current = false
			elseif var45.current == controlState.Selected then
				if (not fFlagShowUnibarOnVirtualCursor or not gamepadService.GamepadCursorEnabled) and (guiService.SelectedCoreObject and string.find(guiService.SelectedCoreObject.Name, constantsModule_1.ICON_NAME_PREFIX)) then
					serviceModule:enableFocusNav()
				end
				focusUtils.MenuIconSelectedSignal:set(false)
			end
		end
		var45.current = p4
	end, {})
	local var47 = reactModule.useCallback(function() --[[ line: 220 ]]
		-- upvalues: var36 (ref), var30 (ref), isSpatial (copy), serviceModule (copy), UIManager (copy), parent_1 (copy), inGameMenuConstantsModule (copy)
		var36(false)
		var30.current = true
		
		if if isSpatial() then not serviceModule:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false then
			return
		end
		require(parent_1.Settings.SettingsHub):ToggleVisibility(inGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
	end, {})
	
	return (function(p7, p8, p9) --[[ line: 231 | named "renderWithTooltipCompat" ]]
		-- upvalues: isSpatial (copy), var38 (ref), var40 (ref), reactModule (copy), tooltipCallout (copy), tooltipOrientation (copy), var39 (ref), var37 (ref), SPATIAL_TOOLTIP_SPACING (copy), panel3DInSpatialUI (copy), panelType (copy), withTooltip (copy)
		return if isSpatial() then reactModule.createElement(reactModule.Fragment, nil, {
			VRSpatialTooltip = if p8.active and var37 and panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
				panelType = panelType.ToolTipsContainer,
				renderFunction = reactModule.useCallback(function(p10) --[[ line: 238 ]]
					-- upvalues: reactModule (copy), tooltipCallout (copy), p7 (ref), tooltipOrientation (copy), var39 (copy), var37 (copy), SPATIAL_TOOLTIP_SPACING (copy)
					return reactModule.createElement(tooltipCallout, {
						distanceOffset = 0,
						textAlignment = Enum.TextXAlignment.Center,
						headerText = p7.headerText,
						orientation = tooltipOrientation.Top,
						triggerPointCenter = Vector2.new(var39.X + var37.X / 2, p10.Y - SPATIAL_TOOLTIP_SPACING),
						contentOffsetVector = Vector2.zero,
						triggerPointRadius = Vector2.zero
					})
				end, { p7, var39, var37 })
			}) else nil,
			MenuIconTriggerPoint = p9(function(p11) --[[ line: 234 ]]
				-- upvalues: var38 (copy), var40 (copy)
				var38(p11.AbsoluteSize)
				var40(p11.AbsolutePosition)
			end)
		}) else withTooltip(p7, p8, p9)
	end)(t, t_1, reactModule.useCallback(function(p5) --[[ line: 272 ]]
		-- upvalues: reactModule (copy), view (copy), fFlagEnableSideSheet (copy), var28 (ref), var21 (ref), var32 (write), var41 (ref), p0 (ref), var47 (ref), var46 (ref), badgeOver12Module (copy), var23 (ref), icon (copy), foundationModule (copy), var26 (ref)
		return reactModule.createElement(view, {
			tag = "radius-circle aspect-1-1",
			backgroundStyle = if not fFlagEnableSideSheet then var28:map(function(p6) --[[ line: 276 ]]
				-- upvalues: var21 (copy)
				local overMedia0 = var21.Color.OverMedia.OverMedia_0
				overMedia0.Transparency *= p6
				
				return overMedia0
			end) else nil,
			Size = UDim2.fromScale(1, 1),
			NextSelectionRight = var32,
			selection = { Selectable = true, SelectionImageObject = var41 },
			selectionGroup = {
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			},
			ref = p0.menuIconRef,
			onAbsoluteSizeChanged = p5,
			onAbsolutePositionChanged = p5,
			onActivated = if not fFlagEnableSideSheet then var47 else nil,
			onStateChanged = if not fFlagEnableSideSheet then var46 else nil
		}, {
			BadgeOver12 = if p0.showBadgeOver12 then reactModule.createElement(badgeOver12Module, { position = UDim2.new(0, 1, 1, -(var23 + 1)) }) else nil,
			Icon = reactModule.createElement(icon, {
				name = foundationModule.Enums.IconName.Tilt,
				size = var26.size,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				style = if fFlagEnableSideSheet then var21.Color.ActionEmphasis.Foreground else nil
			})
		})
	end, {
		var28, var32, var41, var47, var46, p0.showBadgeOver12
	}))
end