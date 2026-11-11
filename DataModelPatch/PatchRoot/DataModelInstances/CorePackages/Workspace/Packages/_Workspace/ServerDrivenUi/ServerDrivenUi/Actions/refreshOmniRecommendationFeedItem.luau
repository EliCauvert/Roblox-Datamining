local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local OmniFeedTypes = require(Parent.DiscoveryTypes).OmniFeedTypes
local _ = require(Parent.LuauPolyfill)
local MakeOmniRecommendationsRequestFunction = require(Parent.GraphQlShared).MakeOmniRecommendationsRequest
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local SeedHomeOmniSduiV2PayloadModule = require(ServerDrivenUi.Migration.seedHomeOmniSduiV2Payload)
local FStringLuaEnabledSduiTreatmentTypes = require(Parent.SharedFlags).FStringLuaEnabledSduiTreatmentTypes
local t = {}

local function _(p1, p2, p3): string
	return `{p1}:{p2}:{p3}`
end

local _ = function(p1, p2): boolean
	-- upvalues: t (copy)
	return t[p1] == p2
end

local function getSupportedSduiTreatmentTypes()
	-- upvalues: RunService (copy), FStringLuaEnabledSduiTreatmentTypes (copy)
	local Number: number? = tonumber(string.match(RunService:GetRobloxVersion(), ".(%d+)."))
	local List = {}
	
	for _, value in ipairs((string.split(FStringLuaEnabledSduiTreatmentTypes, ","))) do
		if value ~= "" then
			local Match, Match2 = string.match(value, "(.*):(.*)")
			local Number1: number? = tonumber(Match2)
			
			if Match and Number1 and Number1 <= Number then
				table.insert(List, Match)
			end
		end
	end
	return List
end

local function findSortByTopicId(Sorts, p1)
	for _, sort in Sorts do
		if typeof(sort) == "table" and sort.topicId and tostring(sort.topicId) == p1 then
			return sort
		end
	end
	return nil
end

local function hasPageEntryForFeedItemKey(Sduiv, FeedItemKey): boolean
	local PageEntries = Sduiv.pageEntries
	
	if typeof(PageEntries) ~= "table" then
		return false
	end
	for _, pageEntry in PageEntries do
		if pageEntry and typeof(pageEntry) == "table" and pageEntry.pageEntry and pageEntry.pageEntry.identifier == FeedItemKey then
			return true
		end
	end
	return false
end

local _ = function(Callback: (any, any) -> (), p2, p3)
	Callback(p3.errorType, {
		name = "discovery-api/omni-recommendation/sduiv2",
		message = `{p3.message}, topicIds: {p2}`
	})
end

local _ = function(Callback: (any, any) -> (), p2, p3)
	-- upvalues: SduiErrors (copy), SduiParseHelpers (copy)
	Callback(SduiErrors.SduiErrorType.FailedToFetchPage, {
		name = "discovery-api/omni-recommendation/sduiv2",
		message = `Omni recommendation feed item refresh failed: {SduiParseHelpers.stringifyValue(p3)}, topicIds: {p2}`
	})
end

local function validateResponseBody(ResponseBody, p2, FeedItemKey)
	-- upvalues: SduiErrors (copy), findSortByTopicId (copy), OmniFeedTypes (copy), hasPageEntryForFeedItemKey (copy)
	if ResponseBody == nil or typeof(ResponseBody) ~= "table" then
		return false, {
			message = "No response data from omni recommendation feed item refresh",
			errorType = SduiErrors.SduiErrorType.InvalidFeedInResponse
		}
	elseif ResponseBody.sorts == nil or typeof(ResponseBody.sorts) ~= "table" or #ResponseBody.sorts == 0 then
		return false, {
			message = "No sort data in omni recommendation feed item refresh response",
			errorType = SduiErrors.SduiErrorType.InvalidFeedInResponse
		}
	else
		local SortByTopicId = findSortByTopicId(ResponseBody.sorts, p2)
		
		if SortByTopicId == nil then
			return false, {
				message = "Requested sort not found in omni recommendation feed item refresh response",
				errorType = SduiErrors.SduiErrorType.InvalidFeedInResponse
			}
		elseif SortByTopicId.treatmentType ~= OmniFeedTypes.ServerDrivenUiV2 then
			return false, {
				errorType = SduiErrors.SduiErrorType.InvalidFeedInResponse,
				message = `Requested sort is not SDUI V2 in omni recommendation feed item refresh response: {SortByTopicId.treatmentType}`
			}
		else
			local FeedItemKey1 = if typeof(SortByTopicId) == "table" then SortByTopicId.feedItemKey else nil
			
			if typeof(FeedItemKey1) ~= "string" or FeedItemKey1 == "" then
				return false, {
					message = "Missing feedItemKey in omni recommendation feed item refresh response",
					errorType = SduiErrors.SduiErrorType.InvalidFeedInResponse
				}
			elseif FeedItemKey1 ~= FeedItemKey then
				return false, {
					errorType = SduiErrors.SduiErrorType.InvalidFeedInResponse,
					message = `Wrong feedItemKey in omni recommendation feed item refresh response: {FeedItemKey1}`
				}
			elseif ResponseBody.sduiv2 == nil or typeof(ResponseBody.sduiv2) ~= "table" then
				return false, {
					message = "No sduiv2 field in omni recommendation feed item refresh response",
					errorType = SduiErrors.SduiErrorType.NilSduiTreeInResponse
				}
			elseif hasPageEntryForFeedItemKey(ResponseBody.sduiv2, FeedItemKey) then
				return true, nil
			else
				return false, {
					message = "Requested feed item not found in sduiv2 page entries",
					errorType = SduiErrors.SduiErrorType.InvalidFeedInResponse
				}
			end
		end
	end
end

return function(p2, p3, p4, p5, p6, Callback, p7)
	-- upvalues: SduiLoadTimer (copy), OmniFeedTypes (copy), getSupportedSduiTreatmentTypes (copy), HttpService (copy), t (copy), MakeOmniRecommendationsRequestFunction (copy), validateResponseBody (copy), SeedHomeOmniSduiV2PayloadModule (copy), SduiErrors (copy), SduiParseHelpers (copy)
	local LoadTimer = p7.loadTimer or SduiLoadTimer.createLoadTimer(p3)
	LoadTimer.start("feed-item-refresh")
	local List = {}
	
	for _, omniFeedType in pairs(OmniFeedTypes) do
		table.insert(List, omniFeedType)
	end
	local v1 = nil
	local Success, Result = pcall(getSupportedSduiTreatmentTypes)
	
	if Success then
		v1 = Result
	end
	local Text: string = `{p3}:{p4}:{p5}`
	local Lowered = HttpService:GenerateGUID(false):lower()
	t[Text] = Lowered
	
	return MakeOmniRecommendationsRequestFunction(p2, p3, HttpService:GenerateGUID(false):lower(), nil, List, p6, { p4 }, v1, p7.contextFeatures):andThen(function(Result)
		-- upvalues: Text (copy), Lowered (copy), t (upval), validateResponseBody (upval), p4 (copy), p5 (copy), Callback (copy), SeedHomeOmniSduiV2PayloadModule (upval), p3 (copy), LoadTimer (copy), SduiErrors (upval)
		if t[Text] ~= Lowered then return end
		local ResponseBody = if typeof(Result) == "table" then Result.responseBody else nil
		local ValidateResponseBodyResult, ValidateResponseBodyResult2 = validateResponseBody(ResponseBody, p4, p5)
		
		if not ValidateResponseBodyResult then
			assert(ValidateResponseBodyResult2, "Validation error should exist when response is invalid")
			Callback(ValidateResponseBodyResult2.errorType, {
				name = "discovery-api/omni-recommendation/sduiv2",
				message = `{ValidateResponseBodyResult2.message}, topicIds: {p4}`
			})
			
			return
		end
		local Success, Result1 = pcall(function()
			-- upvalues: SeedHomeOmniSduiV2PayloadModule (upval), ResponseBody (copy), p3 (upval), LoadTimer (upval)
			SeedHomeOmniSduiV2PayloadModule(ResponseBody.sduiv2, p3, LoadTimer)
		end)
		
		if not Success then
			Callback(SduiErrors.SduiErrorType.ErrorStoringOmniData, {
				name = "discovery-api/omni-recommendation/sduiv2",
				message = `Error seeding omni recommendation feed item: {Result1}, topicIds: {p4}`
			})
			
			return
		end
	end):catch(function(Err)
		-- upvalues: Text (copy), Lowered (copy), t (upval), Callback (copy), p4 (copy), SduiErrors (upval), SduiParseHelpers (upval)
		if t[Text] == Lowered then
			Callback(SduiErrors.SduiErrorType.FailedToFetchPage, {
				name = "discovery-api/omni-recommendation/sduiv2",
				message = `Omni recommendation feed item refresh failed: {SduiParseHelpers.stringifyValue(Err)}, topicIds: {p4}`
			})
			
			return
		end
	end):finally(function()
		-- upvalues: Text (copy), Lowered (copy), t (upval), LoadTimer (copy)
		if t[Text] == Lowered then
			LoadTimer.logRefreshComplete()
			t[Text] = nil
		end
	end)
end