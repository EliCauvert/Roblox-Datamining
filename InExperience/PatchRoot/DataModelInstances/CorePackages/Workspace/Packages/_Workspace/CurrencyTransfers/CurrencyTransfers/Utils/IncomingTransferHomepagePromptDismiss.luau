local parent = script:FindFirstAncestor("CurrencyTransfers").Parent
local setPromptDismissedInPageScope = require(parent.PromptsServerDrivenUi).setPromptDismissedInPageScope
local fFlagSduiDismissPromptPageScope = require(parent.SharedFlags).FFlagSduiDismissPromptPageScope
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

local var1 = if fFlagSduiDismissPromptPageScope then function(p3, p4)
	-- upvalues: setPromptDismissedInPageScope (ref)
	if typeof(p3) ~= "string" or p3 == "" then return end
	for i, v in p4 do
		setPromptDismissedInPageScope(p3, v)
	end
end else nil

local function reportDismissForAllPromptTypes(p5, p6, p7, p8)
	local var2 = nil
	
	for i, v in p7 do
		local var3 = p5(p6, v, p8)
		var2 = if var2 == nil then var3 else var2:andThen(function()
			-- upvalues: var3 (ref)
			return var3
		end)
	end
	return var2
end

return {
	createCallbacks = function(p9)
		-- upvalues: list (ref), parent (ref), fFlagSduiDismissPromptPageScope (ref), var1 (write), dismissPromptTypes (ref), reportDismissForAllPromptTypes (ref)
		local promptId = p9.promptId
		local onReportPromptDismissFailed = p9.onReportPromptDismissFailed
		
		return {
			optimisticHide = function()
				-- upvalues: parent (copy), fFlagSduiDismissPromptPageScope (copy), p9 (ref), var1 (copy), dismissPromptTypes (copy), list (ref)
				local dismissEntry = require(parent.SduiSharedUtilities).getSduiApiStore().dismissEntry
				
				if not fFlagSduiDismissPromptPageScope and dismissEntry == nil then return end
				local optimisticHidePromptType = p9.optimisticHidePromptType
				
				if typeof(optimisticHidePromptType) == "string" and optimisticHidePromptType ~= "" then
					if fFlagSduiDismissPromptPageScope then
						if dismissEntry ~= nil then
							dismissEntry(optimisticHidePromptType)
						end
						var1(p9.configKey, { optimisticHidePromptType })
						
						return
					else
						dismissEntry(optimisticHidePromptType)
						
						return
					end
				elseif not fFlagSduiDismissPromptPageScope then
					dismissPromptTypes(dismissEntry, list)
					
					return
				elseif dismissEntry ~= nil then
					dismissPromptTypes(dismissEntry, list)
				end
				var1(p9.configKey, list)
			end,
			commitDismiss = function()
				-- upvalues: parent (copy), fFlagSduiDismissPromptPageScope (copy), var1 (copy), p9 (ref), list (ref), dismissPromptTypes (copy), reportDismissForAllPromptTypes (copy), promptId (ref), onReportPromptDismissFailed (ref)
				local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
				local sduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore()
				local dismissEntry = sduiApiStore.dismissEntry
				local t = {}
				
				if fFlagSduiDismissPromptPageScope then
					var1(p9.configKey, list)
				end
				if dismissEntry ~= nil then
					t = dismissPromptTypes(dismissEntry, list)
				end
				local networking = p9.networking
				
				if networking == nil then
					return
				end
				reportDismissForAllPromptTypes(require(parent.SduiSharedContent).reportPromptDismiss, networking, list, promptId):andThen(function()
					-- upvalues: dismissEntry (ref), t (write), sduiApiStore (ref), sduiSharedUtilitiesModule (ref)
					if dismissEntry ~= nil then
						for i, v in t do
							sduiApiStore.refreshFromApi({
								configKey = v,
								loadTimer = sduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(v)
							})
						end
					end
				end):catch(function(p10)
					-- upvalues: onReportPromptDismissFailed (copy)
					if onReportPromptDismissFailed then
						onReportPromptDismissFailed(p10)
					end
				end)
			end
		}
	end,
	INCOMING_TRANSFER_HOMEPAGE_BANNER_PROMPT_TYPES = list
}