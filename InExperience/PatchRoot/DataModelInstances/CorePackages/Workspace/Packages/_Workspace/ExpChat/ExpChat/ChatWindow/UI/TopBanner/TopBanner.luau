local GuiService = game:GetService("GuiService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local Localization = require(Parent.RobloxAppLocales).Localization
local LocalizationService = game:GetService("LocalizationService")
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local ChatBoxContextMenu = require(Parent.ChatLineReporting).ChatBoxContextMenu
local Constants = require(Parent.ChatLineReporting).Constants
local GetFFlagMemoizeChatReportingMenuFunction = require(Parent.SharedFlags).GetFFlagMemoizeChatReportingMenu
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local View = FoundationModule.View
local GetFFlagChatWindowUseCallbackOptimizationsModule = require(ExpChat.Flags.getFFlagChatWindowUseCallbackOptimizations)
local ExpChatTopBannerZIndexFix = game:DefineFastFlag("ExpChatTopBannerZIndexFix", false)
local v1 = require(ExpChat.Stores.GetFocusNavigationStore)(false)

local function v19(p1) --[[ Line: 29 ]]
	-- upvalues: ReactModule (copy), Localization (copy), LocalizationService (copy), ReactFocusNavigationModule (copy), SignalsReactModule (copy), v1 (copy), GuiService (copy), Constants (copy), ExpChatTopBannerZIndexFix (copy), View (copy), GetFFlagChatWindowUseCallbackOptimizationsModule (copy), Icon (copy), IconName (copy), IconSize (copy), LocalizationProvider (copy), ChatBoxContextMenu (copy), GetFFlagMemoizeChatReportingMenuFunction (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseSignalStateResult = SignalsReactModule.useSignalState(v1.getChatInputBarFocused)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 37 ]]
		-- upvalues: p1 (copy), UseSignalStateResult (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy), GuiService (upval)
		p1.onUnfocus()
		
		if UseSignalStateResult and UseRefResult.current then
			UseFocusGuiObjectResult(UseRefResult.current)
			GuiService.SelectedCoreObject = nil
		end
	end, {
		UseSignalStateResult,
		UseFocusGuiObjectResult,
		p1.onUnfocus
	})
	local UseRefResult1 = ReactModule.useRef(UseResult)
	ReactModule.useEffect(function() --[[ Line: 55 ]]
		-- upvalues: UseRefResult1 (copy), UseResult (copy)
		UseRefResult1.current = UseResult
	end, { UseResult })
	ReactModule.useEffect(function() --[[ Line: 59 ]]
		-- upvalues: UseStateResult (copy), UseRefResult1 (copy)
		return function() --[[ Line: 60 ]]
			-- upvalues: UseStateResult (upval), UseRefResult1 (upval)
			if UseStateResult and UseRefResult1.current then
				UseRefResult1.current()
			end
		end
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 68 ]]
		-- upvalues: UseSignalStateResult (copy), UseStateResult (copy), UseStateResult2 (copy)
		return if UseSignalStateResult and UseStateResult then function() --[[ Line: 71 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end else nil
	end, { UseSignalStateResult, UseStateResult })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, Constants.TopBannerSize),
		ZIndex = if ExpChatTopBannerZIndexFix then 2 else nil
	}, {
		DotMenu = ReactModule.createElement(View, {
			tag = "auto-xy padding-small radius-medium align-x-center align-y-center",
			Size = UDim2.new(0, Constants.IconButtonSize, 0, Constants.IconButtonSize),
			Position = UDim2.new(1, Constants.IconButtonPositionXOffset, 0, Constants.IconButtonPositionYOffset),
			onActivated = if GetFFlagChatWindowUseCallbackOptimizationsModule() then ReactModule.useCallback(function() --[[ Line: 98 ]]
				-- upvalues: UseStateResult2 (copy), p1 (copy)
				UseStateResult2(true)
				p1.onFocus()
			end, { UseStateResult2, p1.onFocus }) else function() --[[ Line: 102 ]]
				-- upvalues: UseStateResult2 (copy), p1 (copy)
				UseStateResult2(true)
				p1.onFocus()
			end,
			ref = UseRefResult
		}, ReactModule.createElement(Icon, {
			name = IconName.ThreeDotsHorizontal,
			size = IconSize.Large,
			style = { Transparency = p1.iconTransparency }
		})),
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

return if GetFFlagMemoizeChatReportingMenuFunction() then ReactModule.memo(v19) else v19