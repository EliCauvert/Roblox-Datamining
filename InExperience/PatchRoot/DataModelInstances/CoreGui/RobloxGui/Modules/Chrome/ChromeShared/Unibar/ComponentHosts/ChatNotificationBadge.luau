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
local _ = require(corePackagesService.Workspace.Packages.Chrome)

return function(p0) --[[ line: 35 | named "ChatNotificationBadge" ]]
	-- upvalues: textChatService (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStore (ref), signalsReactModule (ref), fFlagExpChatPresetChatEnabled (ref), reactModule (ref), getGlobalChatTooltipStore (ref), getChatStatusStore (ref), isUserChatEnabled (ref), getFFlagTextChatEnableUniverseChatTabs (ref)
	local var9, var10, var17
	local iconHostProps = p0.iconHostProps
	local isChat = iconHostProps.integration.id == "chat"
	local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	local var8 = if chatWindowConfiguration ~= nil then chatWindowConfiguration.HorizontalAlignment == Enum.HorizontalAlignment.Left and chatWindowConfiguration.VerticalAlignment == Enum.VerticalAlignment.Top else true
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagExpChatUseUnifiedTooltipStore then
		var9 = getChatTooltipStore(false)
		var10 = signalsReactModule.useSignalState(var9.getIsChatWindowOpen)
		local var18 = signalsReactModule.useSignalState(var9.getActiveTooltipKey)
		local var19 = signalsReactModule.useSignalState(var9.getIsChatInputBarVisible)
		local var8_1 = isChat and (signalsReactModule.useSignalState(var9.getIsScreenWideEnough) and var8)
		local var21 = var18 == "GlobalChatTooltip" and var8_1
		local var22 = fFlagExpChatPresetChatEnabled and (var18 == "PresetChatTooltip" and var8_1)
		reactModule.useEffect(function() --[[ line: 62 ]]
			-- upvalues: isChat (ref), var9 (write), var21 (ref), var10 (write), fFlagExpChatPresetChatEnabled (copy), var22 (ref), var19 (ref)
			if not isChat then return end
			var9.setShouldShow("GlobalChatTooltip", var21 and var10)
			
			if fFlagExpChatPresetChatEnabled then
				var9.setShouldShow("PresetChatTooltip", var22 and var19)
			end
		end, {
			isChat, var21, var22, var19, var10, var9.setShouldShow
		})
		var17 = var21 or var22
	else
		var9 = getGlobalChatTooltipStore(false)
		var10 = signalsReactModule.useSignalState(var9.getIsChatWindowOpen)
		local var11 = isUserChatEnabled(signalsReactModule.useSignalState(getChatStatusStore(false).getChatStatus))
		local var12 = signalsReactModule.useSignalState(var9.getIsGlobalChatTooltipDismissed)
		local var13 = signalsReactModule.useSignalState(var9.getIsGlobalChatTooltipEligible)
		local var14 = signalsReactModule.useSignalState(var9.getIsScreenWideEnough)
		local var15, var16 = reactModule.useState(false)
		reactModule.useEffect(function() --[[ line: 97 ]]
			-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), textChatService (copy), var16 (ref)
			if not getFFlagTextChatEnableUniverseChatTabs() then return end
			if textChatService:HasAllocatedUniverseChatContext("global") then
				var16(true)
			end
			local universeChatChannelAllocatedConnection = textChatService.UniverseChatChannelAllocated:Connect(function(p1) --[[ line: 106 ]]
				-- upvalues: var16 (copy)
				if p1 == "global" then
					var16(true)
				end
			end)
			
			return function() --[[ line: 112 ]]
				-- upvalues: universeChatChannelAllocatedConnection (ref)
				universeChatChannelAllocatedConnection:Disconnect()
			end
		end, {})
		var17 = isChat and (var11 and (var13 and (var15 and (var8 and (var14 and not var12)))))
		local setShouldShowGlobalChatTooltip = var9.setShouldShowGlobalChatTooltip
		reactModule.useEffect(function() --[[ line: 126 ]]
			-- upvalues: isChat (ref), setShouldShowGlobalChatTooltip (ref), var17 (write), var10 (write)
			if isChat then
				setShouldShowGlobalChatTooltip(var17 and var10)
			end
		end, { isChat, var17, var10, setShouldShowGlobalChatTooltip })
	end
	local var23, var24 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 134 ]]
		-- upvalues: var17 (write), var10 (write), var24 (ref)
		if var17 and var10 then
			var24(true)
		end
	end, { var17, var10 })
	local cloned = table.clone(iconHostProps)
	
	if var17 and not var23 then
		cloned.minBadgeCount = 1
	end
	return reactModule.createElement(p0.NotificationBadge, cloned)
end