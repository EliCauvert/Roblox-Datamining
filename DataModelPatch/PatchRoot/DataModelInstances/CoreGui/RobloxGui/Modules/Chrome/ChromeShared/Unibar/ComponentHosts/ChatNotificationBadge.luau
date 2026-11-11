local CorePackages = game:GetService("CorePackages")
local TextChatService = game:GetService("TextChatService")
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local ExpChatModule = require(CorePackages.Workspace.Packages.ExpChat)
local GetGlobalChatTooltipStoreFunction = ExpChatModule.Stores.GetGlobalChatTooltipStore
local GetChatTooltipStoreFunction = ExpChatModule.Stores.GetChatTooltipStore
local GetChatStatusStoreFunction = ExpChatModule.Stores.GetChatStatusStore
local IsUserChatEnabledFunction = ExpChatModule.isUserChatEnabled
local ExpChatSharedModule = require(CorePackages.Workspace.Packages.ExpChatShared)
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatUseUnifiedTooltipStore = ExpChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local _ = require(CorePackages.Workspace.Packages.Chrome)

return function(p1)
	-- upvalues: TextChatService (copy), FFlagExpChatUseUnifiedTooltipStore (copy), GetChatTooltipStoreFunction (copy), SignalsReactModule (copy), FFlagExpChatPresetChatEnabled (copy), ReactModule (copy), GetGlobalChatTooltipStoreFunction (copy), GetChatStatusStoreFunction (copy), IsUserChatEnabledFunction (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy)
	local IconHostProps = p1.iconHostProps
	local IsChat = IconHostProps.integration.id == "chat"
	local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	local NoChatWindowConfiguration: boolean = ChatWindowConfiguration == nil or ChatWindowConfiguration.HorizontalAlignment == Enum.HorizontalAlignment.Left and ChatWindowConfiguration.VerticalAlignment == Enum.VerticalAlignment.Top
	local NoChatWindowConfiguration1_1_1 = nil
	local ChatTooltipStore = nil
	local UseSignalStateResult = nil
	
	if FFlagExpChatUseUnifiedTooltipStore then
		ChatTooltipStore = GetChatTooltipStoreFunction(false)
		UseSignalStateResult = SignalsReactModule.useSignalState(ChatTooltipStore.getIsChatWindowOpen)
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(ChatTooltipStore.getActiveTooltipKey)
		local UseSignalStateResult2 = SignalsReactModule.useSignalState(ChatTooltipStore.getIsChatInputBarVisible)
		local UseSignalStateResult3 = SignalsReactModule.useSignalState(ChatTooltipStore.getIsScreenWideEnough)
		local NoChatWindowConfiguration1: boolean = IsChat and (UseSignalStateResult3 and NoChatWindowConfiguration)
		local NoChatWindowConfiguration1_1: boolean = UseSignalStateResult1 == "GlobalChatTooltip" and NoChatWindowConfiguration1
		local NoChatWindowConfiguration1_2: boolean = FFlagExpChatPresetChatEnabled and (UseSignalStateResult1 == "PresetChatTooltip" and NoChatWindowConfiguration1)
		ReactModule.useEffect(function()
			-- upvalues: IsChat (copy), ChatTooltipStore (ref), NoChatWindowConfiguration1_1 (copy), UseSignalStateResult (ref), FFlagExpChatPresetChatEnabled (upval), NoChatWindowConfiguration1_2 (copy), UseSignalStateResult2 (copy)
			if not IsChat then return end
			ChatTooltipStore.setShouldShow("GlobalChatTooltip", NoChatWindowConfiguration1_1 and UseSignalStateResult)
			
			if FFlagExpChatPresetChatEnabled then
				ChatTooltipStore.setShouldShow("PresetChatTooltip", NoChatWindowConfiguration1_2 and UseSignalStateResult2)
			end
		end, {
			IsChat, NoChatWindowConfiguration1_1, NoChatWindowConfiguration1_2,
			UseSignalStateResult2, UseSignalStateResult, ChatTooltipStore.setShouldShow
		})
		NoChatWindowConfiguration1_1_1 = NoChatWindowConfiguration1_1 or NoChatWindowConfiguration1_2
	else
		ChatTooltipStore = GetGlobalChatTooltipStoreFunction(false)
		local ChatStatusStore = GetChatStatusStoreFunction(false)
		UseSignalStateResult = SignalsReactModule.useSignalState(ChatTooltipStore.getIsChatWindowOpen)
		local IsUserChatEnabled = IsUserChatEnabledFunction((SignalsReactModule.useSignalState(ChatStatusStore.getChatStatus)))
		local UseSignalStateResult4 = SignalsReactModule.useSignalState(ChatTooltipStore.getIsGlobalChatTooltipDismissed)
		local UseSignalStateResult5 = SignalsReactModule.useSignalState(ChatTooltipStore.getIsGlobalChatTooltipEligible)
		local UseSignalStateResult6 = SignalsReactModule.useSignalState(ChatTooltipStore.getIsScreenWideEnough)
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		ReactModule.useEffect(function()
			-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), TextChatService (upval), UseStateResult2 (copy)
			if not GetFFlagTextChatEnableUniverseChatTabsFunction() then return end
			if TextChatService:HasAllocatedUniverseChatContext("global") then
				UseStateResult2(true)
			end
			local UniverseChatChannelAllocatedConnection = TextChatService.UniverseChatChannelAllocated:Connect(function(Context)
				-- upvalues: UseStateResult2 (upval)
				if Context == "global" then
					UseStateResult2(true)
				end
			end)
			
			return function()
				-- upvalues: UniverseChatChannelAllocatedConnection (copy)
				UniverseChatChannelAllocatedConnection:Disconnect()
			end
		end, {})
		NoChatWindowConfiguration1_1_1 = IsChat and (IsUserChatEnabled and (UseSignalStateResult5 and (UseStateResult and (NoChatWindowConfiguration and (UseSignalStateResult6 and not UseSignalStateResult4)))))
		local SetShouldShowGlobalChatTooltipFunction = ChatTooltipStore.setShouldShowGlobalChatTooltip
		ReactModule.useEffect(function()
			-- upvalues: IsChat (copy), SetShouldShowGlobalChatTooltipFunction (copy), NoChatWindowConfiguration1_1_1 (ref), UseSignalStateResult (ref)
			if IsChat then
				SetShouldShowGlobalChatTooltipFunction(NoChatWindowConfiguration1_1_1 and UseSignalStateResult)
			end
		end, {
			IsChat,
			NoChatWindowConfiguration1_1_1,
			UseSignalStateResult,
			SetShouldShowGlobalChatTooltipFunction
		})
	end
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: NoChatWindowConfiguration1_1_1 (ref), UseSignalStateResult (ref), UseStateResult2_1 (copy)
		if NoChatWindowConfiguration1_1_1 and UseSignalStateResult then
			UseStateResult2_1(true)
		end
	end, { NoChatWindowConfiguration1_1_1, UseSignalStateResult })
	local Copy = table.clone(IconHostProps)
	
	if NoChatWindowConfiguration1_1_1 and not UseStateResult1 then
		Copy.minBadgeCount = 1
	end
	return ReactModule.createElement(p1.NotificationBadge, Copy)
end