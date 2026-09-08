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
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local view = foundationModule.View
local fFlagExpChatFocusViaLastModeFixModule = require(expChat.Flags.FFlagExpChatFocusViaLastModeFix)
local getFFlagChatWindowUseCallbackOptimizationsModule = require(expChat.Flags.getFFlagChatWindowUseCallbackOptimizations)
local expChatTopBannerZIndexFix = game:DefineFastFlag("ExpChatTopBannerZIndexFix", false)
local var1 = require(expChat.Stores.GetFocusNavigationStore)(false)

local var2 = function(p1)
	-- upvalues: reactModule (ref), localization (ref), localizationService (ref), reactFocusNavigationModule (ref), fFlagExpChatFocusViaLastModeFixModule (ref), focusNavigationUtilsModule (ref), signalsReactModule (ref), var1 (ref), guiService (ref), signalsModule (ref), constants (ref), expChatTopBannerZIndexFix (ref), view (ref), getFFlagChatWindowUseCallbackOptimizationsModule (ref), icon (ref), iconName (ref), iconSize (ref), localizationProvider (ref), chatBoxContextMenu (ref), getFFlagMemoizeChatReportingMenu (ref)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(false)
	local var6 = localization.new(localizationService.RobloxLocaleId)
	local var7 = reactFocusNavigationModule.useFocusGuiObject()
	local var8 = if fFlagExpChatFocusViaLastModeFixModule then nil else focusNavigationUtilsModule.useLastInputMode()
	local var9 = if fFlagExpChatFocusViaLastModeFixModule then signalsReactModule.useSignalState(var1.getChatInputBarFocused) else nil
	local var10 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), fFlagExpChatFocusViaLastModeFixModule (copy), var9 (ref), var8 (ref), var3 (ref), var7 (ref), guiService (copy)
		p1.onUnfocus()
		
		if (fFlagExpChatFocusViaLastModeFixModule and var9 or not fFlagExpChatFocusViaLastModeFixModule and var8 == "Focus") and var3.current then
			var7(var3.current)
			guiService.SelectedCoreObject = nil
		end
	end, {
		if fFlagExpChatFocusViaLastModeFixModule then var9 else nil,
		var7,
		if fFlagExpChatFocusViaLastModeFixModule then nil else var8,
		p1.onUnfocus
	})
	local var11 = reactModule.useRef(var10)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var10 (ref)
		var11.current = var10
	end, { var10 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var11 (ref)
		return function()
			-- upvalues: var4 (copy), var11 (copy)
			if var4 and var11.current then
				var11.current()
			end
		end
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatFocusViaLastModeFixModule (copy), var9 (ref), var4 (ref), var5 (ref), var8 (ref), signalsModule (copy), var1 (copy)
		return if fFlagExpChatFocusViaLastModeFixModule then if var9 and var4 then function()
			-- upvalues: var5 (copy)
			var5(false)
		end else nil elseif var8 == "Focus" and var4 then signalsModule.createEffect(function(p2)
			-- upvalues: var1 (copy), var5 (copy)
			if not var1.getChatInputBarFocused(p2) then
				var5(false)
			end
		end) else nil
	end, {
		if fFlagExpChatFocusViaLastModeFixModule then var9 else nil,
		var4,
		if fFlagExpChatFocusViaLastModeFixModule then nil else var8
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constants.TopBannerSize),
		ZIndex = if expChatTopBannerZIndexFix then 2 else nil
	}, {
		DotMenu = reactModule.createElement(view, {
			tag = "auto-xy padding-small radius-medium align-x-center align-y-center",
			Size = UDim2.new(0, constants.IconButtonSize, 0, constants.IconButtonSize),
			Position = UDim2.new(1, constants.IconButtonPositionXOffset, 0, constants.IconButtonPositionYOffset),
			onActivated = if getFFlagChatWindowUseCallbackOptimizationsModule() then reactModule.useCallback(function()
				-- upvalues: var5 (ref), p1 (ref)
				var5(true)
				p1.onFocus()
			end, { var5, p1.onFocus }) else function()
				-- upvalues: var5 (ref), p1 (ref)
				var5(true)
				p1.onFocus()
			end,
			ref = var3
		}, reactModule.createElement(icon, {
			name = iconName.ThreeDotsHorizontal,
			size = iconSize.Large,
			style = { Transparency = p1.iconTransparency }
		})),
		LocalizationProvider = reactModule.createElement(localizationProvider, { localization = var6 }, {
			ContextMenu = if var4 then reactModule.createElement(chatBoxContextMenu, {
				setContextMenuOpen = var5,
				backgroundColor3 = p1.backgroundColor3,
				backgroundTransparency = p1.backgroundTransparency,
				getMessages = if getFFlagMemoizeChatReportingMenu() then p1.getMessages else nil,
				messages = if not getFFlagMemoizeChatReportingMenu() then p1.messages else nil
			}) else nil
		})
	})
end

return if getFFlagMemoizeChatReportingMenu() then reactModule.memo(var2) else var2