local parent = script:FindFirstAncestor("CurrencyTransfers").Parent
local list = {
	"HomeIncomingRobuxTransferParentalGateBanner",
	"HomeIncomingRobuxTransferAgeGateBanner"
}

local function dismissPromptTypes(p1, p2)
	local t = {}
	local t_1 = {}
	
	for i, v in p2 do
		for i_1, v_1 in p1(v) do
			if not t[v_1] then
				t[v_1] = true
				table.insert(t_1, v_1)
			end
		end
	end
	return t_1
end

local function reportDismissForAllPromptTypes(p3, p4, p5, p6)
	local var1 = nil
	
	for i, v in p5 do
		local var2 = p3(p4, v, p6)
		var1 = if var1 == nil then var2 else var1:andThen(function()
			-- upvalues: var2 (ref)
			return var2
		end)
	end
	return var1
end

return {
	createCallbacks = function(p7)
		-- upvalues: list (ref), parent (ref), dismissPromptTypes (ref), reportDismissForAllPromptTypes (ref)
		local promptId = p7.promptId
		local onReportPromptDismissFailed = p7.onReportPromptDismissFailed
		
		return {
			optimisticHide = function()
				-- upvalues: parent (copy), p7 (ref), dismissPromptTypes (copy), list (ref)
				local dismissEntry = require(parent.SduiSharedUtilities).getSduiApiStore().dismissEntry
				
				if dismissEntry == nil then return end
				local optimisticHidePromptType = p7.optimisticHidePromptType
				
				if typeof(optimisticHidePromptType) == "string" and optimisticHidePromptType ~= "" then
					dismissEntry(optimisticHidePromptType)
					
					return
				end
				dismissPromptTypes(dismissEntry, list)
			end,
			commitDismiss = function()
				-- upvalues: parent (copy), dismissPromptTypes (copy), list (ref), p7 (ref), reportDismissForAllPromptTypes (copy), promptId (ref), onReportPromptDismissFailed (ref)
				local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
				local sduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore()
				local dismissEntry = sduiApiStore.dismissEntry
				local var3 = if dismissEntry ~= nil then dismissPromptTypes(dismissEntry, list) else {}
				local networking = p7.networking
				
				if networking == nil then
					return
				end
				reportDismissForAllPromptTypes(require(parent.SduiSharedContent).reportPromptDismiss, networking, list, promptId):andThen(function()
					-- upvalues: dismissEntry (ref), var3 (write), sduiApiStore (ref), sduiSharedUtilitiesModule (ref)
					if dismissEntry ~= nil then
						for i, v in var3 do
							sduiApiStore.refreshFromApi({
								configKey = v,
								loadTimer = sduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(v)
							})
						end
					end
				end):catch(function(p8)
					-- upvalues: onReportPromptDismissFailed (copy)
					if onReportPromptDismissFailed then
						onReportPromptDismissFailed(p8)
					end
				end)
			end
		}
	end,
	INCOMING_TRANSFER_HOMEPAGE_BANNER_PROMPT_TYPES = list
}