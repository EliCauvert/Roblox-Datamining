local guiService = game:GetService("GuiService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local localization = require(parent.RobloxAppLocales).Localization
local localizationService = game:GetService("LocalizationService")
local localizationProvider = require(parent.Localization).LocalizationProvider
local chatBoxContextMenu = require(parent.ChatLineReporting).ChatBoxContextMenu
local constants = require(parent.ChatLineReporting).Constants
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local getFFlagMemoizeChatReportingMenu = require(parent.SharedFlags).GetFFlagMemoizeChatReportingMenu
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local UIBloxModule = require(parent.UIBlox)
local iconButton = UIBloxModule.App.Button.IconButton
local images = UIBloxModule.App.ImageSet.Images
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local view = foundationModule.View
local fFlagExpChatFocusViaLastModeFixModule = require(expChat.Flags.FFlagExpChatFocusViaLastModeFix)
local getFFlagChatWindowUseCallbackOptimizationsModule = require(expChat.Flags.getFFlagChatWindowUseCallbackOptimizations)
local replaceChatLineReportingIcon = game:DefineFastFlag("ReplaceChatLineReportingIcon", false)
local expChatTopBannerZIndexFix = game:DefineFastFlag("ExpChatTopBannerZIndexFix", false)
local var14 = require(expChat.Stores.GetFocusNavigationStore)(false)

local var15 = function(p0) --[[ line: 38 ]]
	-- upvalues: reactModule (ref), localization (ref), localizationService (ref), reactFocusNavigationModule (ref), fFlagExpChatFocusViaLastModeFixModule (ref), focusNavigationUtilsModule (ref), signalsReactModule (ref), var14 (ref), guiService (ref), signalsModule (ref), constants (ref), expChatTopBannerZIndexFix (ref), replaceChatLineReportingIcon (ref), view (ref), getFFlagChatWindowUseCallbackOptimizationsModule (ref), icon (ref), iconName (ref), iconSize (ref), iconButton (ref), images (ref), localizationProvider (ref), chatBoxContextMenu (ref), getFFlagMemoizeChatReportingMenu (ref)
	local var16 = reactModule.useRef(nil)
	local var17, var18 = reactModule.useState(false)
	local var19 = localization.new(localizationService.RobloxLocaleId)
	local var20 = reactFocusNavigationModule.useFocusGuiObject()
	local var21 = if fFlagExpChatFocusViaLastModeFixModule then nil else focusNavigationUtilsModule.useLastInputMode()
	local var22 = if fFlagExpChatFocusViaLastModeFixModule then signalsReactModule.useSignalState(var14.getChatInputBarFocused) else nil
	local var23 = reactModule.useCallback(function() --[[ line: 50 ]]
		-- upvalues: p0 (ref), fFlagExpChatFocusViaLastModeFixModule (copy), var22 (ref), var21 (ref), var16 (ref), var20 (ref), guiService (copy)
		p0.onUnfocus()
		
		if (fFlagExpChatFocusViaLastModeFixModule and var22 or not fFlagExpChatFocusViaLastModeFixModule and var21 == "Focus") and var16.current then
			var20(var16.current)
			guiService.SelectedCoreObject = nil
		end
	end, {
		if fFlagExpChatFocusViaLastModeFixModule then var22 else nil,
		var20,
		if fFlagExpChatFocusViaLastModeFixModule then nil else var21,
		p0.onUnfocus
	})
	local var24 = reactModule.useRef(var23)
	reactModule.useEffect(function() --[[ line: 74 ]]
		-- upvalues: var24 (ref), var23 (ref)
		var24.current = var23
	end, { var23 })
	reactModule.useEffect(function() --[[ line: 78 ]]
		-- upvalues: var17 (ref), var24 (ref)
		return function() --[[ line: 79 ]]
			-- upvalues: var17 (copy), var24 (copy)
			if var17 and var24.current then
				var24.current()
			end
		end
	end, { var17 })
	reactModule.useEffect(function() --[[ line: 87 ]]
		-- upvalues: fFlagExpChatFocusViaLastModeFixModule (copy), var22 (ref), var17 (ref), var18 (ref), var21 (ref), signalsModule (copy), var14 (copy)
		return if fFlagExpChatFocusViaLastModeFixModule then if var22 and var17 then function() --[[ line: 91 ]]
			-- upvalues: var18 (copy)
			var18(false)
		end else nil elseif var21 == "Focus" and var17 then signalsModule.createEffect(function(p1) --[[ line: 99 ]]
			-- upvalues: var14 (copy), var18 (copy)
			if not var14.getChatInputBarFocused(p1) then
				var18(false)
			end
		end) else nil
	end, {
		if fFlagExpChatFocusViaLastModeFixModule then var22 else nil,
		var17,
		if fFlagExpChatFocusViaLastModeFixModule then nil else var21
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constants.TopBannerSize),
		ZIndex = if expChatTopBannerZIndexFix then 2 else nil
	}, {
		DotMenu = if replaceChatLineReportingIcon then reactModule.createElement(view, {
			tag = "auto-xy padding-small radius-medium align-x-center align-y-center",
			Size = UDim2.new(0, constants.IconButtonSize, 0, constants.IconButtonSize),
			Position = UDim2.new(1, constants.IconButtonPositionXOffset, 0, constants.IconButtonPositionYOffset),
			onActivated = if getFFlagChatWindowUseCallbackOptimizationsModule() then reactModule.useCallback(function() --[[ line: 133 ]]
				-- upvalues: var18 (ref), p0 (ref)
				var18(true)
				p0.onFocus()
			end, { var18, p0.onFocus }) else function() --[[ line: 137 ]]
				-- upvalues: var18 (ref), p0 (ref)
				var18(true)
				p0.onFocus()
			end,
			ref = var16
		}, reactModule.createElement(icon, {
			name = iconName.ThreeDotsHorizontal,
			size = iconSize.Large,
			style = { Transparency = p0.iconTransparency }
		})) else reactModule.createElement(iconButton, {
			showBackground = true,
			backgroundTransparency = 1,
			size = UDim2.new(0, constants.IconButtonSize, 0, constants.IconButtonSize),
			position = UDim2.new(1, constants.IconButtonPositionXOffset, 0, constants.IconButtonPositionYOffset),
			icon = images["icons/menu/more_off"],
			iconTransparency = p0.iconTransparency,
			buttonRef = var16,
			onActivated = if getFFlagChatWindowUseCallbackOptimizationsModule() then reactModule.useCallback(function() --[[ line: 166 ]]
				-- upvalues: var18 (ref), p0 (ref)
				var18(true)
				p0.onFocus()
			end, { var18, p0.onFocus }) else function() --[[ line: 170 ]]
				-- upvalues: var18 (ref), p0 (ref)
				var18(true)
				p0.onFocus()
			end
		}),
		LocalizationProvider = reactModule.createElement(localizationProvider, { localization = var19 }, {
			ContextMenu = if var17 then reactModule.createElement(chatBoxContextMenu, {
				setContextMenuOpen = var18,
				backgroundColor3 = p0.backgroundColor3,
				backgroundTransparency = p0.backgroundTransparency,
				getMessages = if getFFlagMemoizeChatReportingMenu() then p0.getMessages else nil,
				messages = if not getFFlagMemoizeChatReportingMenu() then p0.messages else nil
			}) else nil
		})
	})
end

return if getFFlagMemoizeChatReportingMenu() then reactModule.memo(var15) else var15