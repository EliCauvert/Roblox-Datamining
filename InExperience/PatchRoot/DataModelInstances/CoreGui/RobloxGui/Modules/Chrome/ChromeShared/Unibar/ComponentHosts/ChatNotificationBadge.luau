local corePackagesService = game:GetService("CorePackages")
local textChatService = game:GetService("TextChatService")
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local getGlobalChatTooltipStore = expChatModule.Stores.GetGlobalChatTooltipStore
local getChatTooltipStore = expChatModule.Stores.GetChatTooltipStore
local getChatStatusStore = expChatModule.Stores.GetChatStatusStore
local isUserChatEnabled = expChatModule.isUserChatEnabled
local expChatSharedModule = require(corePackagesService.Workspace.Packages.ExpChatShared)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local expChatPresetChatBadgeFTUXExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ExpChatPresetChatBadgeFTUXExperimentation
local expChatShowPresetTooltipToNonAgeChecked2 = game:DefineFastFlag("ExpChatShowPresetTooltipToNonAgeChecked2", false)
local _ = require(corePackagesService.Workspace.Packages.Chrome)

return function(p1)
	-- upvalues: textChatService (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStore (ref), signalsReactModule (ref), fFlagExpChatPresetChatEnabled (ref), reactModule (ref), expChatShowPresetTooltipToNonAgeChecked2 (ref), getGlobalChatTooltipStore (ref), getChatStatusStore (ref), isUserChatEnabled (ref), getFFlagTextChatEnableUniverseChatTabs (ref), expChatPresetChatBadgeFTUXExperimentation (ref)
	local var1, var2, var3
	local iconHostProps = p1.iconHostProps
	local isChat = iconHostProps.integration.id == "chat"
	local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	local var4 = if chatWindowConfiguration ~= nil then chatWindowConfiguration.HorizontalAlignment == Enum.HorizontalAlignment.Left and chatWindowConfiguration.VerticalAlignment == Enum.VerticalAlignment.Top else true
	local _ = nil
	local _ = nil
	local _ = nil
	local var5 = false
	
	if fFlagExpChatUseUnifiedTooltipStore then
		var1 = getChatTooltipStore(false)
		var2 = signalsReactModule.useSignalState(var1.getIsChatWindowOpen)
		local var6 = signalsReactModule.useSignalState(var1.getActiveTooltipKey)
		local var7 = signalsReactModule.useSignalState(var1.getIsChatInputBarVisible)
		local var8 = isChat and (signalsReactModule.useSignalState(var1.getIsScreenWideEnough) and var4)
		local var9 = var6 == "GlobalChatTooltip" and var8
		var5 = fFlagExpChatPresetChatEnabled and (var6 == "PresetChatTooltip" and var8)
		reactModule.useEffect(function()
			-- upvalues: isChat (ref), expChatShowPresetTooltipToNonAgeChecked2 (copy), var5 (write), var7 (ref), var2 (write), var1 (write), var9 (ref), fFlagExpChatPresetChatEnabled (copy)
			if not isChat then return end
			local _ = false
			local var10 = if expChatShowPresetTooltipToNonAgeChecked2 then var5 and (var7 or var2) else var5 and var7
			var1.setShouldShow("GlobalChatTooltip", var9 and var2)
			
			if fFlagExpChatPresetChatEnabled then
				var1.setShouldShow("PresetChatTooltip", var10)
			end
		end, {
			isChat, var9, var5, var7, var2, var1.setShouldShow
		})
		var3 = var9 or var5
	else
		var1 = getGlobalChatTooltipStore(false)
		var2 = signalsReactModule.useSignalState(var1.getIsChatWindowOpen)
		local var10 = isUserChatEnabled(signalsReactModule.useSignalState(getChatStatusStore(false).getChatStatus))
		local var11 = signalsReactModule.useSignalState(var1.getIsGlobalChatTooltipDismissed)
		local var12 = signalsReactModule.useSignalState(var1.getIsGlobalChatTooltipEligible)
		local var13 = signalsReactModule.useSignalState(var1.getIsScreenWideEnough)
		local var14, var15 = reactModule.useState(false)
		reactModule.useEffect(function()
			-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), textChatService (copy), var15 (ref)
			if not getFFlagTextChatEnableUniverseChatTabs() then return end
			if textChatService:HasAllocatedUniverseChatContext("global") then
				var15(true)
			end
			local universeChatChannelAllocatedConnection = textChatService.UniverseChatChannelAllocated:Connect(function(p2)
				-- upvalues: var15 (copy)
				if p2 == "global" then
					var15(true)
				end
			end)
			
			return function()
				-- upvalues: universeChatChannelAllocatedConnection (ref)
				universeChatChannelAllocatedConnection:Disconnect()
			end
		end, {})
		var3 = isChat and (var10 and (var12 and (var14 and (var4 and (var13 and not var11)))))
		local setShouldShowGlobalChatTooltip = var1.setShouldShowGlobalChatTooltip
		reactModule.useEffect(function()
			-- upvalues: isChat (ref), setShouldShowGlobalChatTooltip (ref), var3 (write), var2 (write)
			if isChat then
				setShouldShowGlobalChatTooltip(var3 and var2)
			end
		end, { isChat, var3, var2, setShouldShowGlobalChatTooltip })
	end
	local var16, var17 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var3 (write), var2 (write), var17 (ref)
		if var3 and var2 then
			var17(true)
		end
	end, { var3, var2 })
	local cloned = table.clone(iconHostProps)
	
	if var3 and not var16 and (not var5 or expChatPresetChatBadgeFTUXExperimentation.getShouldShowPresetChatIconBadge()) then
		cloned.minBadgeCount = 1
	end
	return reactModule.createElement(p1.NotificationBadge, cloned)
end