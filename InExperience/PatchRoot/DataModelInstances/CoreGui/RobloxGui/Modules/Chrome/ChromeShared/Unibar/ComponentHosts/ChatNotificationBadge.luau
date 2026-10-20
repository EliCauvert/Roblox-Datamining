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
local ExpChatPresetChatBadgeFTUXExperimentation = require(CorePackages.Workspace.Packages.SocialExperiments).ExpChatPresetChatBadgeFTUXExperimentation
local FFlagExpChatPresetChatBadgeExperimentCleanup = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExpChatPresetChatBadgeExperimentCleanup
local ExpChatShowPresetTooltipToNonAgeChecked2 = game:DefineFastFlag("ExpChatShowPresetTooltipToNonAgeChecked2", false)
local _ = require(CorePackages.Workspace.Packages.Chrome)

return function(p1)
	-- upvalues: TextChatService (copy), FFlagExpChatUseUnifiedTooltipStore (copy), GetChatTooltipStoreFunction (copy), SignalsReactModule (copy), FFlagExpChatPresetChatEnabled (copy), ReactModule (copy), ExpChatShowPresetTooltipToNonAgeChecked2 (copy), GetGlobalChatTooltipStoreFunction (copy), GetChatStatusStoreFunction (copy), IsUserChatEnabledFunction (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatPresetChatBadgeExperimentCleanup (copy), ExpChatPresetChatBadgeFTUXExperimentation (copy)
	local IconHostProps = p1.iconHostProps
	local IsChat = IconHostProps.integration.id == "chat"
	local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	local NoChatWindowConfiguration: boolean = ChatWindowConfiguration == nil or ChatWindowConfiguration.HorizontalAlignment == Enum.HorizontalAlignment.Left and ChatWindowConfiguration.VerticalAlignment == Enum.VerticalAlignment.Top
	local NoChatWindowConfiguration1_1_1 = nil
	local ChatTooltipStore = nil
	local UseSignalStateResult = nil
	local v1 = false
	
	if FFlagExpChatUseUnifiedTooltipStore then
		ChatTooltipStore = GetChatTooltipStoreFunction(false)
		UseSignalStateResult = SignalsReactModule.useSignalState(ChatTooltipStore.getIsChatWindowOpen)
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(ChatTooltipStore.getActiveTooltipKey)
		local UseSignalStateResult2 = SignalsReactModule.useSignalState(ChatTooltipStore.getIsChatInputBarVisible)
		local UseSignalStateResult3 = SignalsReactModule.useSignalState(ChatTooltipStore.getIsScreenWideEnough)
		local NoChatWindowConfiguration1: boolean = IsChat and (UseSignalStateResult3 and NoChatWindowConfiguration)
		local NoChatWindowConfiguration1_1: boolean = UseSignalStateResult1 == "GlobalChatTooltip" and NoChatWindowConfiguration1
		v1 = FFlagExpChatPresetChatEnabled and (UseSignalStateResult1 == "PresetChatTooltip" and NoChatWindowConfiguration1)
		ReactModule.useEffect(function()
			-- upvalues: IsChat (copy), ExpChatShowPresetTooltipToNonAgeChecked2 (upval), v1 (ref), UseSignalStateResult2 (copy), UseSignalStateResult (ref), ChatTooltipStore (ref), NoChatWindowConfiguration1_1 (copy), FFlagExpChatPresetChatEnabled (upval)
			if not IsChat then return end
			local UseSignalStateResult2_1 = if ExpChatShowPresetTooltipToNonAgeChecked2 then v1 and (UseSignalStateResult2 or UseSignalStateResult) else v1 and UseSignalStateResult2
			ChatTooltipStore.setShouldShow("GlobalChatTooltip", NoChatWindowConfiguration1_1 and UseSignalStateResult)
			
			if FFlagExpChatPresetChatEnabled then
				ChatTooltipStore.setShouldShow("PresetChatTooltip", UseSignalStateResult2_1)
			end
		end, {
			IsChat, NoChatWindowConfiguration1_1, v1, UseSignalStateResult2,
			UseSignalStateResult, ChatTooltipStore.setShouldShow
		})
		NoChatWindowConfiguration1_1_1 = NoChatWindowConfiguration1_1 or v1
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
	local NoUseStateResult1: boolean = NoChatWindowConfiguration1_1_1 and not UseStateResult1
	
	if FFlagExpChatPresetChatBadgeExperimentCleanup then
		local NoUseSignalStateResult: boolean = NoUseStateResult1 and (v1 and not UseSignalStateResult)
		ReactModule.useEffect(function()
			-- upvalues: NoUseSignalStateResult (copy), ExpChatPresetChatBadgeFTUXExperimentation (upval)
			if NoUseSignalStateResult and ExpChatPresetChatBadgeFTUXExperimentation.isExperimentEnabled then
				ExpChatPresetChatBadgeFTUXExperimentation.logExposure()
				
				return
			end
		end, { NoUseSignalStateResult })
	end
	local Copy = table.clone(IconHostProps)
	
	if NoUseStateResult1 and (not v1 or ExpChatPresetChatBadgeFTUXExperimentation.getShouldShowPresetChatIconBadge()) then
		Copy.minBadgeCount = 1
	end
	return ReactModule.createElement(p1.NotificationBadge, Copy)
end