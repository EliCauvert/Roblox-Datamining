local Parent = script:FindFirstAncestor("CurrencyTransfers").Parent
local SetPromptDismissedInPageScopeFunction = require(Parent.PromptsServerDrivenUi).setPromptDismissedInPageScope
local FFlagSduiDismissPromptPageScope = require(Parent.SharedFlags).FFlagSduiDismissPromptPageScope
local list = {
	"HomeIncomingRobuxTransferParentalGateBanner",
	"HomeIncomingRobuxTransferAgeGateBanner"
}

local function dismissPromptTypes(Callback, List) --[[ Line: 27 ]]
	local t = {}
	local List1 = {}
	
	for _, value in List do
		for _, value1 in Callback(value) do
			if not t[value1] then
				t[value1] = true
				table.insert(List1, value1)
			end
		end
	end
	return List1
end

local Callback = if FFlagSduiDismissPromptPageScope then function(p1, List) --[[ Line: 44 ]]
	-- upvalues: SetPromptDismissedInPageScopeFunction (copy)
	if typeof(p1) ~= "string" or p1 == "" then return end
	for _, value in List do
		SetPromptDismissedInPageScopeFunction(p1, value)
	end
end else nil

local function reportDismissForAllPromptTypes(Callback, Networking, List, PromptId) --[[ Line: 55 ]]
	local Promise = nil
	
	for _, value in List do
		local CallbackResult = Callback(Networking, value, PromptId)
		
		if Promise == nil then
			Promise = CallbackResult
		else
			Promise = Promise:andThen(function() --[[ Line: 67 ]]
				-- upvalues: CallbackResult (copy)
				return CallbackResult
			end)
		end
	end
	return Promise
end

return {
	createCallbacks = function(p2) --[[ Line: 75 ]]
		-- upvalues: list (copy), Parent (copy), FFlagSduiDismissPromptPageScope (copy), Callback (ref), dismissPromptTypes (copy), reportDismissForAllPromptTypes (copy)
		local PromptId = p2.promptId
		local OnReportPromptDismissFailedFunction = p2.onReportPromptDismissFailed
		
		return {
			optimisticHide = function() --[[ Line: 80 ]]
				-- upvalues: Parent (upval), FFlagSduiDismissPromptPageScope (upval), p2 (copy), Callback (upval), dismissPromptTypes (upval), list (copy)
				local DismissEntryFunction: (any) -> () = require(Parent.SduiSharedUtilities).getSduiApiStore().dismissEntry
				
				if not FFlagSduiDismissPromptPageScope and DismissEntryFunction == nil then return end
				local OptimisticHidePromptType = p2.optimisticHidePromptType
				
				if typeof(OptimisticHidePromptType) == "string" and OptimisticHidePromptType ~= "" then
					if not FFlagSduiDismissPromptPageScope then
						DismissEntryFunction(OptimisticHidePromptType)
						
						return
					end
					if DismissEntryFunction ~= nil then
						DismissEntryFunction(OptimisticHidePromptType)
					end
					Callback(p2.configKey, { OptimisticHidePromptType })
					
					return
				else
					if not FFlagSduiDismissPromptPageScope then
						dismissPromptTypes(DismissEntryFunction, list)
						
						return
					end
					if DismissEntryFunction ~= nil then
						dismissPromptTypes(DismissEntryFunction, list)
					end
					Callback(p2.configKey, list)
				end
			end,
			commitDismiss = function() --[[ Line: 111 ]]
				-- upvalues: Parent (upval), FFlagSduiDismissPromptPageScope (upval), Callback (upval), p2 (copy), list (copy), dismissPromptTypes (upval), reportDismissForAllPromptTypes (upval), PromptId (copy), OnReportPromptDismissFailedFunction (copy)
				local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
				local SduiApiStore = SduiSharedUtilitiesModule.getSduiApiStore()
				local DismissEntry = SduiApiStore.dismissEntry
				local ConfigKeys = {}
				
				if FFlagSduiDismissPromptPageScope then
					Callback(p2.configKey, list)
				end
				if DismissEntry ~= nil then
					ConfigKeys = dismissPromptTypes(DismissEntry, list)
				end
				local Networking = p2.networking
				
				if Networking ~= nil then
					reportDismissForAllPromptTypes(require(Parent.SduiSharedContent).reportPromptDismiss, Networking, list, PromptId):andThen(function() --[[ Line: 131 ]]
						-- upvalues: DismissEntry (copy), ConfigKeys (ref), SduiApiStore (copy), SduiSharedUtilitiesModule (copy)
						if DismissEntry ~= nil then
							for _, configKey in ConfigKeys do
								SduiApiStore.refreshFromApi({
									configKey = configKey,
									loadTimer = SduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(configKey)
								})
							end
						end
					end):catch(function(Err) --[[ Line: 141 ]]
						-- upvalues: OnReportPromptDismissFailedFunction (upval)
						if OnReportPromptDismissFailedFunction then
							OnReportPromptDismissFailedFunction(Err)
						end
					end)
					
					return
				end
			end
		}
	end,
	INCOMING_TRANSFER_HOMEPAGE_BANNER_PROMPT_TYPES = list
}