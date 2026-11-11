local GuiService = game:GetService("GuiService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local Localization = require(Parent.RobloxAppLocales).Localization
local LocalizationService = game:GetService("LocalizationService")
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local ChatBoxContextMenu = require(Parent.ChatLineReporting).ChatBoxContextMenu
local Constants = require(Parent.ChatLineReporting).Constants
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local GetFFlagMemoizeChatReportingMenuFunction = require(Parent.SharedFlags).GetFFlagMemoizeChatReportingMenu
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UIBloxModule = require(Parent.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local View = FoundationModule.View
local FFlagExpChatFocusViaLastModeFixModule = require(ExpChat.Flags.FFlagExpChatFocusViaLastModeFix)
local GetFFlagChatWindowUseCallbackOptimizationsModule = require(ExpChat.Flags.getFFlagChatWindowUseCallbackOptimizations)
local ReplaceChatLineReportingIcon = game:DefineFastFlag("ReplaceChatLineReportingIcon", false)
local ExpChatTopBannerZIndexFix = game:DefineFastFlag("ExpChatTopBannerZIndexFix", false)
local v1 = require(ExpChat.Stores.GetFocusNavigationStore)(false)

local function v26(p1)
	-- upvalues: ReactModule (copy), Localization (copy), LocalizationService (copy), ReactFocusNavigationModule (copy), FFlagExpChatFocusViaLastModeFixModule (copy), FocusNavigationUtilsModule (copy), SignalsReactModule (copy), v1 (copy), GuiService (copy), SignalsModule (copy), Constants (copy), ExpChatTopBannerZIndexFix (copy), ReplaceChatLineReportingIcon (copy), View (copy), GetFFlagChatWindowUseCallbackOptimizationsModule (copy), Icon (copy), IconName (copy), IconSize (copy), IconButton (copy), Images (copy), LocalizationProvider (copy), ChatBoxContextMenu (copy), GetFFlagMemoizeChatReportingMenuFunction (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseLastInputModeResult = if FFlagExpChatFocusViaLastModeFixModule then nil else FocusNavigationUtilsModule.useLastInputMode()
	local UseSignalStateResult = if FFlagExpChatFocusViaLastModeFixModule then SignalsReactModule.useSignalState(v1.getChatInputBarFocused) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FFlagExpChatFocusViaLastModeFixModule (upval), UseSignalStateResult (copy), UseLastInputModeResult (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy), GuiService (upval)
		p1.onUnfocus()
		
		if (FFlagExpChatFocusViaLastModeFixModule and UseSignalStateResult or not FFlagExpChatFocusViaLastModeFixModule and UseLastInputModeResult == "Focus") and UseRefResult.current then
			UseFocusGuiObjectResult(UseRefResult.current)
			GuiService.SelectedCoreObject = nil
		end
	end, {
		if FFlagExpChatFocusViaLastModeFixModule then UseSignalStateResult else nil,
		UseFocusGuiObjectResult,
		if FFlagExpChatFocusViaLastModeFixModule then nil else UseLastInputModeResult,
		p1.onUnfocus
	})
	local UseRefResult1 = ReactModule.useRef(UseResult)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseResult (copy)
		UseRefResult1.current = UseResult
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult1 (copy)
		return function()
			-- upvalues: UseStateResult (upval), UseRefResult1 (upval)
			if UseStateResult and UseRefResult1.current then
				UseRefResult1.current()
			end
		end
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: FFlagExpChatFocusViaLastModeFixModule (upval), UseSignalStateResult (copy), UseStateResult (copy), UseStateResult2 (copy), UseLastInputModeResult (copy), SignalsModule (upval), v1 (upval)
		return if FFlagExpChatFocusViaLastModeFixModule then if UseSignalStateResult and UseStateResult then function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end else nil elseif UseLastInputModeResult == "Focus" and UseStateResult then SignalsModule.createEffect(function(p2)
			-- upvalues: v1 (upval), UseStateResult2 (upval)
			if not v1.getChatInputBarFocused(p2) then
				UseStateResult2(false)
			end
		end) else nil
	end, {
		if FFlagExpChatFocusViaLastModeFixModule then UseSignalStateResult else nil,
		UseStateResult,
		if FFlagExpChatFocusViaLastModeFixModule then nil else UseLastInputModeResult
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, Constants.TopBannerSize),
		ZIndex = if ExpChatTopBannerZIndexFix then 2 else nil
	}, {
		DotMenu = if ReplaceChatLineReportingIcon then ReactModule.createElement(View, {
			tag = "auto-xy padding-small radius-medium align-x-center align-y-center",
			Size = UDim2.new(0, Constants.IconButtonSize, 0, Constants.IconButtonSize),
			Position = UDim2.new(1, Constants.IconButtonPositionXOffset, 0, Constants.IconButtonPositionYOffset),
			onActivated = if GetFFlagChatWindowUseCallbackOptimizationsModule() then ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy), p1 (copy)
				UseStateResult2(true)
				p1.onFocus()
			end, { UseStateResult2, p1.onFocus }) else function()
				-- upvalues: UseStateResult2 (copy), p1 (copy)
				UseStateResult2(true)
				p1.onFocus()
			end,
			ref = UseRefResult
		}, ReactModule.createElement(Icon, {
			name = IconName.ThreeDotsHorizontal,
			size = IconSize.Large,
			style = { Transparency = p1.iconTransparency }
		})) else ReactModule.createElement(IconButton, {
			showBackground = true,
			backgroundTransparency = 1,
			size = UDim2.new(0, Constants.IconButtonSize, 0, Constants.IconButtonSize),
			position = UDim2.new(1, Constants.IconButtonPositionXOffset, 0, Constants.IconButtonPositionYOffset),
			icon = Images["icons/menu/more_off"],
			iconTransparency = p1.iconTransparency,
			buttonRef = UseRefResult,
			onActivated = if GetFFlagChatWindowUseCallbackOptimizationsModule() then ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy), p1 (copy)
				UseStateResult2(true)
				p1.onFocus()
			end, { UseStateResult2, p1.onFocus }) else function()
				-- upvalues: UseStateResult2 (copy), p1 (copy)
				UseStateResult2(true)
				p1.onFocus()
			end
		}),
		LocalizationProvider = ReactModule.createElement(LocalizationProvider, { localization = NewLocalization }, {
			ContextMenu = if UseStateResult then ReactModule.createElement(ChatBoxContextMenu, {
				setContextMenuOpen = UseStateResult2,
				backgroundColor3 = p1.backgroundColor3,
				backgroundTransparency = p1.backgroundTransparency,
				getMessages = if GetFFlagMemoizeChatReportingMenuFunction() then p1.getMessages else nil,
				messages = if GetFFlagMemoizeChatReportingMenuFunction() then nil else p1.messages
			}) else nil
		})
	})
end

return if GetFFlagMemoizeChatReportingMenuFunction() then ReactModule.memo(v26) else v26