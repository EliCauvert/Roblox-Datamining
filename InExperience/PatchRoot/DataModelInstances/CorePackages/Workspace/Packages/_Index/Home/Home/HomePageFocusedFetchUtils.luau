local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiRequestConcurrencyPolicy = sduiSharedUtilitiesModule.SduiRequestConcurrencyPolicy
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local homeConstantsModule = require(home.HomeConstants)
local t = {}
local var1 = 0
local t_1 = {
	isCurrent = function(p1)
		-- upvalues: getSduiApiStore (ref), t (ref), homeConstantsModule (ref)
		local var2 = getSduiApiStore()
		local var3 = false
		
		if t[p1.options.feedItemKey] == p1.requestId then
			var3 = false
			
			if var2.getDataUpdatedTimestamp(homeConstantsModule.ConfigKey, false, homeConstantsModule.FeedEntryCacheKey) == p1.capturedTimestamp then
				local inputData = getSduiApiStore().getInputData(homeConstantsModule.ConfigKey, homeConstantsModule.ContentIdentifier)
				var3 = typeof(inputData) == "table" and (typeof(inputData.entry_map) == "table" and inputData.entry_map[p1.options.feedItemKey] ~= nil)
			end
		end
		return var3
	end,
	register = function(p1)
		-- upvalues: getSduiApiStore (ref), homeConstantsModule (ref), var1 (write), t (ref)
		local dataUpdatedTimestamp = getSduiApiStore().getDataUpdatedTimestamp(homeConstantsModule.ConfigKey, false, homeConstantsModule.FeedEntryCacheKey)
		
		if dataUpdatedTimestamp ~= nil then
			local inputData = getSduiApiStore().getInputData(homeConstantsModule.ConfigKey, homeConstantsModule.ContentIdentifier)
			
			if typeof(inputData) == "table" and (typeof(inputData.entry_map) == "table" and inputData.entry_map[p1.feedItemKey] ~= nil) then
				var1 += 1
				t[p1.feedItemKey] = var1
				
				return {
					foundTarget = false,
					options = p1,
					requestId = var1,
					capturedTimestamp = dataUpdatedTimestamp
				}
			end
		end
		return nil
	end
}

local function _()
	-- upvalues: getSduiApiStore (ref), homeConstantsModule (ref)
	return getSduiApiStore().getInputData(homeConstantsModule.ConfigKey, homeConstantsModule.ContentIdentifier)
end

local _ = function(p1)
	-- upvalues: getSduiApiStore (ref), homeConstantsModule (ref)
	local inputData = getSduiApiStore().getInputData(homeConstantsModule.ConfigKey, homeConstantsModule.ContentIdentifier)
	
	return typeof(inputData) == "table" and (typeof(inputData.entry_map) == "table" and inputData.entry_map[p1] ~= nil)
end

function t_1.applyToRequestConfig(p1, p2)
	-- upvalues: homeConstantsModule (ref), sduiRequestConcurrencyPolicy (ref), t_1 (ref)
	p1.concurrencyKey = `{homeConstantsModule.ConfigKey}_{p2.options.feedItemKey}`
	p1.concurrencyPolicy = sduiRequestConcurrencyPolicy.LatestWins
	
	function p3.isResponseCurrent()
		-- upvalues: t_1 (copy), p2 (ref)
		return t_1.isCurrent(p2)
	end
	
	p1.enableInputDataMerge = true
	p1.cacheSingleEntryWithIdentifier = true
	
	function p3.mergeStrategy(p3)
		-- upvalues: p2 (ref)
		if #p3 == 1 then
			return if p3[1] == "entry_map" then nil elseif p3[1] == "content_pools" then "merge" else "preserve"
		elseif #p3 ~= 2 or p3[1] ~= "entry_map" then
			return nil
		elseif p3[2] == p2.options.feedItemKey then
			p2.foundTarget = true
			
			return "replace"
		end
		return "preserve"
	end
end

local _ = function(p1, p2, p3)
	-- upvalues: homeConstantsModule (ref)
	p1.options.reportError(p2, {
		name = homeConstantsModule.ApiName,
		message = `{p3}, topicIds: {p1.options.topicId}`
	})
end

function t_1.resolve(p1, p2)
	-- upvalues: t_1 (ref), sduiCoreSystemModule (ref), homeConstantsModule (ref)
	return p1:andThen(function()
		-- upvalues: t_1 (copy), p2 (ref), sduiCoreSystemModule (copy), homeConstantsModule (copy)
		if not t_1.isCurrent(p2) then
			return false
		elseif p2.foundTarget then
			return true
		end
		p2.options.reportError(sduiCoreSystemModule.SduiErrors.SduiErrorType.InvalidFeedInResponse, {
			name = homeConstantsModule.ApiName,
			message = `Focused response omitted target, topicIds: {p2.options.topicId}`
		})
		
		return false
	end, function(p3)
		-- upvalues: t_1 (copy), p2 (ref), sduiCoreSystemModule (copy), homeConstantsModule (copy)
		if t_1.isCurrent(p2) then
			local var2 = p2
			var2.options.reportError(sduiCoreSystemModule.SduiErrors.SduiErrorType.FailedToFetchPage, {
				name = homeConstantsModule.ApiName,
				message = `{sduiCoreSystemModule.SduiParseHelpers.stringifyValue(p3)}, topicIds: {var2.options.topicId}`
			})
		end
		return false
	end)
end

return t_1