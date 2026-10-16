local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiRequestConcurrencyPolicy = SduiSharedUtilitiesModule.SduiRequestConcurrencyPolicy
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local HomeConstantsModule = require(Home.HomeConstants)
local RequestIds = {}
local RequestId = 0

local function _() --[[ Line: 30 | Named "getMountedInputData" ]]
	-- upvalues: GetSduiApiStoreFunction (copy), HomeConstantsModule (copy)
	return GetSduiApiStoreFunction().getInputData(HomeConstantsModule.ConfigKey, HomeConstantsModule.ContentIdentifier)
end

local _ = function(p1): boolean --[[ Line: 34 | Named "isTargetMounted" ]]
	-- upvalues: GetSduiApiStoreFunction (copy), HomeConstantsModule (copy)
	local InputData = GetSduiApiStoreFunction().getInputData(HomeConstantsModule.ConfigKey, HomeConstantsModule.ContentIdentifier)
	
	return typeof(InputData) == "table" and typeof(InputData.entry_map) == "table" and InputData.entry_map[p1] ~= nil
end

local HomePageFocusedFetchUtils = {
	isCurrent = function(p1): boolean --[[ Line: 41 ]]
		-- upvalues: GetSduiApiStoreFunction (copy), RequestIds (copy), HomeConstantsModule (copy)
		local SduiApiStore = GetSduiApiStoreFunction()
		local HasEntry = false
		
		if RequestIds[p1.options.feedItemKey] == p1.requestId then
			HasEntry = false
			
			if SduiApiStore.getDataUpdatedTimestamp(HomeConstantsModule.ConfigKey, false, HomeConstantsModule.FeedEntryCacheKey) == p1.capturedTimestamp then
				local FeedItemKey = p1.options.feedItemKey
				local InputData = GetSduiApiStoreFunction().getInputData(HomeConstantsModule.ConfigKey, HomeConstantsModule.ContentIdentifier)
				HasEntry = typeof(InputData) == "table" and typeof(InputData.entry_map) == "table" and InputData.entry_map[FeedItemKey] ~= nil
			end
		end
		return HasEntry
	end,
	register = function(Options) --[[ Line: 48 ]]
		-- upvalues: GetSduiApiStoreFunction (copy), HomeConstantsModule (copy), RequestId (ref), RequestIds (copy)
		local DataUpdatedTimestamp = GetSduiApiStoreFunction().getDataUpdatedTimestamp(HomeConstantsModule.ConfigKey, false, HomeConstantsModule.FeedEntryCacheKey)
		
		if DataUpdatedTimestamp ~= nil then
			local FeedItemKey = Options.feedItemKey
			local InputData = GetSduiApiStoreFunction().getInputData(HomeConstantsModule.ConfigKey, HomeConstantsModule.ContentIdentifier)
			
			if typeof(InputData) == "table" and (typeof(InputData.entry_map) == "table" and InputData.entry_map[FeedItemKey] ~= nil) then
				RequestId += 1
				RequestIds[Options.feedItemKey] = RequestId
				
				return {
					foundTarget = false,
					options = Options,
					requestId = RequestId,
					capturedTimestamp = DataUpdatedTimestamp
				}
			end
		end
		return nil
	end
}

function HomePageFocusedFetchUtils.applyToRequestConfig(p1, p2) --[[ Line: 65 ]]
	-- upvalues: HomeConstantsModule (copy), SduiRequestConcurrencyPolicy (copy), HomePageFocusedFetchUtils (copy)
	p1.concurrencyKey = `{HomeConstantsModule.ConfigKey}_{p2.options.feedItemKey}`
	p1.concurrencyPolicy = SduiRequestConcurrencyPolicy.LatestWins
	
	function p1.isResponseCurrent() --[[ Line: 68 ]]
		-- upvalues: HomePageFocusedFetchUtils (upval), p2 (copy)
		return HomePageFocusedFetchUtils.isCurrent(p2)
	end
	
	p1.enableInputDataMerge = true
	p1.cacheSingleEntryWithIdentifier = true
	
	function p1.mergeStrategy(Entry) --[[ Line: 73 ]]
		-- upvalues: p2 (copy)
		if #Entry == 1 then
			return if Entry[1] == "entry_map" then nil elseif Entry[1] == "content_pools" then "merge" else "preserve"
		elseif #Entry ~= 2 or Entry[1] ~= "entry_map" then
			return nil
		elseif Entry[2] == p2.options.feedItemKey then
			p2.foundTarget = true
			
			return "replace"
		else
			return "preserve"
		end
	end
end

local _ = function(p1, p2, p3) --[[ Line: 91 | Named "reportError" ]]
	-- upvalues: HomeConstantsModule (copy)
	p1.options.reportError(p2, {
		name = HomeConstantsModule.ApiName,
		message = `{p3}, topicIds: {p1.options.topicId}`
	})
end

function HomePageFocusedFetchUtils.resolve(Promise, p1) --[[ Line: 98 ]]
	-- upvalues: HomePageFocusedFetchUtils (copy), SduiCoreSystemModule (copy), HomeConstantsModule (copy)
	return Promise:andThen(function(): boolean --[[ Line: 99 ]]
		-- upvalues: HomePageFocusedFetchUtils (upval), p1 (copy), SduiCoreSystemModule (upval), HomeConstantsModule (upval)
		if not HomePageFocusedFetchUtils.isCurrent(p1) then
			return false
		elseif p1.foundTarget then
			return true
		else
			p1.options.reportError(SduiCoreSystemModule.SduiErrors.SduiErrorType.InvalidFeedInResponse, {
				name = HomeConstantsModule.ApiName,
				message = `Focused response omitted target, topicIds: {p1.options.topicId}`
			})
			
			return false
		end
	end, function(p2): boolean --[[ Line: 112 ]]
		-- upvalues: HomePageFocusedFetchUtils (upval), p1 (copy), SduiCoreSystemModule (upval), HomeConstantsModule (upval)
		if HomePageFocusedFetchUtils.isCurrent(p1) then
			p1.options.reportError(SduiCoreSystemModule.SduiErrors.SduiErrorType.FailedToFetchPage, {
				name = HomeConstantsModule.ApiName,
				message = `{SduiCoreSystemModule.SduiParseHelpers.stringifyValue(p2)}, topicIds: {p1.options.topicId}`
			})
		end
		return false
	end)
end

return HomePageFocusedFetchUtils