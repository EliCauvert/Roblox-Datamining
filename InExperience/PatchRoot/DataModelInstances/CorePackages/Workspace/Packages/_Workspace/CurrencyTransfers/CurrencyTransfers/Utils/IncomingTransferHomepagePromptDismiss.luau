local parent = script:FindFirstAncestor("CurrencyTransfers").Parent
local list = {
	"HomeIncomingRobuxTransferParentalGateBanner",
	"HomeIncomingRobuxTransferAgeGateBanner"
}

local function dismissPromptTypes(p0, p1) --[[ line: 23 ]]
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		for i_1, v_1 in p0(v) do
			if not t[v_1] then
				t[v_1] = true
				table.insert(t_1, v_1)
			end
		end
	end
	return t_1
end

local function reportDismissForAllPromptTypes(p2, p3, p4, p5) --[[ line: 38 ]]
	local var5 = nil
	
	for i, v in p4 do
		local var6 = p2(p3, v, p5)
		var5 = if var5 == nil then var6 else var5:andThen(function() --[[ line: 50 ]]
			-- upvalues: var6 (ref)
			return var6
		end)
	end
	return var5
end

return {
	createCallbacks = function(p6) --[[ line: 58 ]]
		-- upvalues: list (ref), parent (ref), dismissPromptTypes (ref), reportDismissForAllPromptTypes (ref)
		local promptId = p6.promptId
		local onReportPromptDismissFailed = p6.onReportPromptDismissFailed
		
		return {
			optimisticHide = function() --[[ line: 63 ]]
				-- upvalues: parent (copy), p6 (ref), dismissPromptTypes (copy), list (ref)
				local dismissEntry = require(parent.SduiSharedUtilities).getSduiApiStore().dismissEntry
				
				if dismissEntry == nil then return end
				local optimisticHidePromptType = p6.optimisticHidePromptType
				
				if typeof(optimisticHidePromptType) == "string" and optimisticHidePromptType ~= "" then
					dismissEntry(optimisticHidePromptType)
					
					return
				end
				dismissPromptTypes(dismissEntry, list)
			end,
			commitDismiss = function() --[[ line: 78 ]]
				-- upvalues: parent (copy), dismissPromptTypes (copy), list (ref), p6 (ref), reportDismissForAllPromptTypes (copy), promptId (ref), onReportPromptDismissFailed (ref)
				local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
				local sduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore()
				local dismissEntry = sduiApiStore.dismissEntry
				local var9 = if dismissEntry ~= nil then dismissPromptTypes(dismissEntry, list) else {}
				local networking = p6.networking
				
				if networking == nil then
					return
				end
				reportDismissForAllPromptTypes(require(parent.SduiSharedContent).reportPromptDismiss, networking, list, promptId):andThen(function() --[[ line: 95 ]]
					-- upvalues: dismissEntry (ref), var9 (write), sduiApiStore (ref), sduiSharedUtilitiesModule (ref)
					if dismissEntry ~= nil then
						for i, v in var9 do
							sduiApiStore.refreshFromApi({
								configKey = v,
								loadTimer = sduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(v)
							})
						end
					end
				end):catch(function(p7) --[[ line: 105 ]]
					-- upvalues: onReportPromptDismissFailed (copy)
					if onReportPromptDismissFailed then
						onReportPromptDismissFailed(p7)
					end
				end)
			end
		}
	end,
	INCOMING_TRANSFER_HOMEPAGE_BANNER_PROMPT_TYPES = list
}