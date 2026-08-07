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
local expChatShowPresetTooltipToNonAgeChecked2 = game:DefineFastFlag("ExpChatShowPresetTooltipToNonAgeChecked2", false)
local _ = require(corePackagesService.Workspace.Packages.Chrome)

return function(p0) --[[ line: 38 | named "ChatNotificationBadge" ]]
	-- upvalues: textChatService (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStore (ref), signalsReactModule (ref), fFlagExpChatPresetChatEnabled (ref), reactModule (ref), expChatShowPresetTooltipToNonAgeChecked2 (ref), getGlobalChatTooltipStore (ref), getChatStatusStore (ref), isUserChatEnabled (ref), getFFlagTextChatEnableUniverseChatTabs (ref)
	local var10, var11, var18
	local iconHostProps = p0.iconHostProps
	local isChat = iconHostProps.integration.id == "chat"
	local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	local var9 = if chatWindowConfiguration ~= nil then chatWindowConfiguration.HorizontalAlignment == Enum.HorizontalAlignment.Left and chatWindowConfiguration.VerticalAlignment == Enum.VerticalAlignment.Top else true
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagExpChatUseUnifiedTooltipStore then
		var10 = getChatTooltipStore(false)
		var11 = signalsReactModule.useSignalState(var10.getIsChatWindowOpen)
		local var19 = signalsReactModule.useSignalState(var10.getActiveTooltipKey)
		local var20 = signalsReactModule.useSignalState(var10.getIsChatInputBarVisible)
		local var9_1 = isChat and (signalsReactModule.useSignalState(var10.getIsScreenWideEnough) and var9)
		local var22 = var19 == "GlobalChatTooltip" and var9_1
		local var23 = fFlagExpChatPresetChatEnabled and (var19 == "PresetChatTooltip" and var9_1)
		reactModule.useEffect(function() --[[ line: 65 ]]
			-- upvalues: isChat (ref), expChatShowPresetTooltipToNonAgeChecked2 (copy), var23 (ref), var20 (ref), var11 (write), var10 (write), var22 (ref), fFlagExpChatPresetChatEnabled (copy)
			if not isChat then return end
			local _ = false
			local var27 = if expChatShowPresetTooltipToNonAgeChecked2 then var23 and (var20 or var11) else var23 and var20
			var10.setShouldShow("GlobalChatTooltip", var22 and var11)
			
			if fFlagExpChatPresetChatEnabled then
				var10.setShouldShow("PresetChatTooltip", var27)
			end
		end, {
			isChat, var22, var23, var20, var11, var10.setShouldShow
		})
		var18 = var22 or var23
	else
		var10 = getGlobalChatTooltipStore(false)
		var11 = signalsReactModule.useSignalState(var10.getIsChatWindowOpen)
		local var12 = isUserChatEnabled(signalsReactModule.useSignalState(getChatStatusStore(false).getChatStatus))
		local var13 = signalsReactModule.useSignalState(var10.getIsGlobalChatTooltipDismissed)
		local var14 = signalsReactModule.useSignalState(var10.getIsGlobalChatTooltipEligible)
		local var15 = signalsReactModule.useSignalState(var10.getIsScreenWideEnough)
		local var16, var17 = reactModule.useState(false)
		reactModule.useEffect(function() --[[ line: 107 ]]
			-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), textChatService (copy), var17 (ref)
			if not getFFlagTextChatEnableUniverseChatTabs() then return end
			if textChatService:HasAllocatedUniverseChatContext("global") then
				var17(true)
			end
			local universeChatChannelAllocatedConnection = textChatService.UniverseChatChannelAllocated:Connect(function(p1) --[[ line: 116 ]]
				-- upvalues: var17 (copy)
				if p1 == "global" then
					var17(true)
				end
			end)
			
			return function() --[[ line: 122 ]]
				-- upvalues: universeChatChannelAllocatedConnection (ref)
				universeChatChannelAllocatedConnection:Disconnect()
			end
		end, {})
		var18 = isChat and (var12 and (var14 and (var16 and (var9 and (var15 and not var13)))))
		local setShouldShowGlobalChatTooltip = var10.setShouldShowGlobalChatTooltip
		reactModule.useEffect(function() --[[ line: 136 ]]
			-- upvalues: isChat (ref), setShouldShowGlobalChatTooltip (ref), var18 (write), var11 (write)
			if isChat then
				setShouldShowGlobalChatTooltip(var18 and var11)
			end
		end, { isChat, var18, var11, setShouldShowGlobalChatTooltip })
	end
	local var24, var25 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 144 ]]
		-- upvalues: var18 (write), var11 (write), var25 (ref)
		if var18 and var11 then
			var25(true)
		end
	end, { var18, var11 })
	local cloned = table.clone(iconHostProps)
	
	if var18 and not var24 then
		cloned.minBadgeCount = 1
	end
	return reactModule.createElement(p0.NotificationBadge, cloned)
end