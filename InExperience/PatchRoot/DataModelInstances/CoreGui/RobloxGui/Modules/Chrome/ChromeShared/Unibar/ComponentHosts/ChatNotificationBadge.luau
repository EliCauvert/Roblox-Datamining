local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local textChatService = game:GetService("TextChatService")
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local serviceModule = require(chromeShared.Service)
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local getGlobalChatTooltipStore = expChatModule.Stores.GetGlobalChatTooltipStore
local getChatTooltipStore = expChatModule.Stores.GetChatTooltipStore
local getChatStatusStore = expChatModule.Stores.GetChatStatusStore
local getTransparencyStore = expChatModule.Stores.GetTransparencyStore
local isUserChatEnabled = expChatModule.isUserChatEnabled
local expChatSharedModule = require(corePackagesService.Workspace.Packages.ExpChatShared)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local expChatPresetChatBadgeFTUXExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ExpChatPresetChatBadgeFTUXExperimentation
local expChatShowPresetTooltipToNonAgeChecked2 = game:DefineFastFlag("ExpChatShowPresetTooltipToNonAgeChecked2", false)
local expChatFixTooltipBadgeTransientOpen = game:DefineFastFlag("ExpChatFixTooltipBadgeTransientOpen", false)
local _ = require(corePackagesService.Workspace.Packages.Chrome)

return function(p0)
	-- upvalues: textChatService (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStore (ref), signalsReactModule (ref), fFlagExpChatPresetChatEnabled (ref), reactModule (ref), expChatShowPresetTooltipToNonAgeChecked2 (ref), getGlobalChatTooltipStore (ref), getChatStatusStore (ref), isUserChatEnabled (ref), getFFlagTextChatEnableUniverseChatTabs (ref), expChatFixTooltipBadgeTransientOpen (ref), getTransparencyStore (ref), serviceModule (ref), expChatPresetChatBadgeFTUXExperimentation (ref)
	local var14, var15, var22
	local iconHostProps = p0.iconHostProps
	local isChat = iconHostProps.integration.id == "chat"
	local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	local var12 = if chatWindowConfiguration ~= nil then chatWindowConfiguration.HorizontalAlignment == Enum.HorizontalAlignment.Left and chatWindowConfiguration.VerticalAlignment == Enum.VerticalAlignment.Top else true
	local _ = nil
	local _ = nil
	local _ = nil
	local var13 = false
	
	if fFlagExpChatUseUnifiedTooltipStore then
		var14 = getChatTooltipStore(false)
		var15 = signalsReactModule.useSignalState(var14.getIsChatWindowOpen)
		local var23 = signalsReactModule.useSignalState(var14.getActiveTooltipKey)
		local var24 = signalsReactModule.useSignalState(var14.getIsChatInputBarVisible)
		local var12_1 = isChat and (signalsReactModule.useSignalState(var14.getIsScreenWideEnough) and var12)
		local var26 = var23 == "GlobalChatTooltip" and var12_1
		var13 = fFlagExpChatPresetChatEnabled and (var23 == "PresetChatTooltip" and var12_1)
		reactModule.useEffect(function()
			-- upvalues: isChat (ref), expChatShowPresetTooltipToNonAgeChecked2 (copy), var13 (write), var24 (ref), var15 (write), var14 (write), var26 (ref), fFlagExpChatPresetChatEnabled (copy)
			if not isChat then return end
			local _ = false
			local var32 = if expChatShowPresetTooltipToNonAgeChecked2 then var13 and (var24 or var15) else var13 and var24
			var14.setShouldShow("GlobalChatTooltip", var26 and var15)
			
			if fFlagExpChatPresetChatEnabled then
				var14.setShouldShow("PresetChatTooltip", var32)
			end
		end, {
			isChat, var26, var13, var24, var15, var14.setShouldShow
		})
		var22 = var26 or var13
	else
		var14 = getGlobalChatTooltipStore(false)
		var15 = signalsReactModule.useSignalState(var14.getIsChatWindowOpen)
		local var16 = isUserChatEnabled(signalsReactModule.useSignalState(getChatStatusStore(false).getChatStatus))
		local var17 = signalsReactModule.useSignalState(var14.getIsGlobalChatTooltipDismissed)
		local var18 = signalsReactModule.useSignalState(var14.getIsGlobalChatTooltipEligible)
		local var19 = signalsReactModule.useSignalState(var14.getIsScreenWideEnough)
		local var20, var21 = reactModule.useState(false)
		reactModule.useEffect(function()
			-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), textChatService (copy), var21 (ref)
			if not getFFlagTextChatEnableUniverseChatTabs() then return end
			if textChatService:HasAllocatedUniverseChatContext("global") then
				var21(true)
			end
			local universeChatChannelAllocatedConnection = textChatService.UniverseChatChannelAllocated:Connect(function(p1)
				-- upvalues: var21 (copy)
				if p1 == "global" then
					var21(true)
				end
			end)
			
			return function()
				-- upvalues: universeChatChannelAllocatedConnection (ref)
				universeChatChannelAllocatedConnection:Disconnect()
			end
		end, {})
		var22 = isChat and (var16 and (var18 and (var20 and (var12 and (var19 and not var17)))))
		local setShouldShowGlobalChatTooltip = var14.setShouldShowGlobalChatTooltip
		reactModule.useEffect(function()
			-- upvalues: isChat (ref), setShouldShowGlobalChatTooltip (ref), var22 (write), var15 (write)
			if isChat then
				setShouldShowGlobalChatTooltip(var22 and var15)
			end
		end, { isChat, var22, var15, setShouldShowGlobalChatTooltip })
	end
	local var27, var28 = reactModule.useState(false)
	
	if expChatFixTooltipBadgeTransientOpen then
		local var29 = signalsReactModule.useSignalState(getTransparencyStore(false).getIsTextBoxFocused)
		reactModule.useEffect(function()
			-- upvalues: var22 (write), var29 (ref), var28 (ref), serviceModule (copy), var15 (write)
			if var22 and var29 then
				var28(true)
			end
			if var22 then
				local var34 = serviceModule:onIntegrationActivated():connect(function(p2)
					-- upvalues: var15 (copy), var28 (copy)
					if p2 == "chat" and not var15 then
						var28(true)
					end
				end)
				
				return function()
					-- upvalues: var34 (ref)
					var34:disconnect()
				end
			end
		end, { var22, var29, var15 })
	else
		reactModule.useEffect(function()
			-- upvalues: var22 (write), var15 (write), var28 (ref)
			if var22 and var15 then
				var28(true)
			end
		end, { var22, var15 })
	end
	local var30 = var22 and not var27
	
	if expChatFixTooltipBadgeTransientOpen then
		reactModule.useEffect(function()
			-- upvalues: var30 (ref), var13 (write), expChatPresetChatBadgeFTUXExperimentation (copy)
			if var30 and var13 and expChatPresetChatBadgeFTUXExperimentation.isExperimentEnabled then
				expChatPresetChatBadgeFTUXExperimentation.logExposure()
			end
		end, { var30, var13 })
	end
	local cloned = table.clone(iconHostProps)
	
	if var30 and (not var13 or expChatPresetChatBadgeFTUXExperimentation.getShouldShowPresetChatIconBadge()) then
		cloned.minBadgeCount = 1
	end
	return reactModule.createElement(p0.NotificationBadge, cloned)
end