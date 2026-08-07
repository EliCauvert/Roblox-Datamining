local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local omniFeedTypes = require(parent.DiscoveryTypes).OmniFeedTypes
local _ = require(parent.LuauPolyfill)
local makeOmniRecommendationsRequest = require(parent.GraphQlShared).MakeOmniRecommendationsRequest
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local seedHomeOmniSduiV2PayloadModule = require(serverDrivenUi.Migration.seedHomeOmniSduiV2Payload)
local fStringLuaEnabledSduiTreatmentTypes = require(parent.SharedFlags).FStringLuaEnabledSduiTreatmentTypes
local t = {}

local function _(p0, p1, p2) --[[ line: 39 | named "getRefreshRequestKey" ]]
	return `{p0}:{p1}:{p2}`
end

local _ = function(p3, p4) --[[ line: 43 | named "isCurrentRequest" ]]
	-- upvalues: t (ref)
	return t[p3] == p4
end

local function getSupportedSduiTreatmentTypes() --[[ line: 47 ]]
	-- upvalues: runService (ref), fStringLuaEnabledSduiTreatmentTypes (ref)
	local var10 = tonumber(string.match(runService:GetRobloxVersion(), ".(%d+)."))
	local t = {}
	
	for i, v in ipairs(string.split(fStringLuaEnabledSduiTreatmentTypes, ",")) do
		if v ~= "" then
			local match, match_1 = string.match(v, "(.*):(.*)")
			local var14 = tonumber(match_1)
			
			if match and var14 and var14 <= var10 then
				table.insert(t, match)
			end
		end
	end
	return t
end

local function findSortByTopicId(p5, p6) --[[ line: 65 ]]
	for i, v in p5 do
		if typeof(v) == "table" and v.topicId and tostring(v.topicId) == p6 then
			return v
		end
	end
	return nil
end

local function hasPageEntryForFeedItemKey(p7, p8) --[[ line: 74 ]]
	local pageEntries = p7.pageEntries
	
	if typeof(pageEntries) ~= "table" then
		return false
	end
	for i, v in pageEntries do
		if v and typeof(v) == "table" and (v.pageEntry and v.pageEntry.identifier == p8) then
			return true
		end
	end
	return false
end

local _ = function(p9, p10, p11) --[[ line: 94 | named "reportValidationError" ]]
	p9(p11.errorType, {
		name = "discovery-api/omni-recommendation/sduiv2",
		message = `{p11.message}, topicIds: {p10}`
	})
end

local _ = function(p12, p13, p14) --[[ line: 101 | named "reportNetworkError" ]]
	-- upvalues: sduiErrors (ref), sduiParseHelpers (ref)
	p12(sduiErrors.SduiErrorType.FailedToFetchPage, {
		name = "discovery-api/omni-recommendation/sduiv2",
		message = `Omni recommendation feed item refresh failed: {sduiParseHelpers.stringifyValue(p14)}, topicIds: {p13}`
	})
end

local function validateResponseBody(p15, p16, p17) --[[ line: 108 ]]
	-- upvalues: sduiErrors (ref), findSortByTopicId (ref), omniFeedTypes (ref), hasPageEntryForFeedItemKey (ref)
	if p15 == nil or typeof(p15) ~= "table" then
		return false, {
			message = "No response data from omni recommendation feed item refresh",
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse
		}
	elseif p15.sorts == nil or typeof(p15.sorts) ~= "table" or #p15.sorts == 0 then
		return false, {
			message = "No sort data in omni recommendation feed item refresh response",
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse
		}
	end
	local var15 = findSortByTopicId(p15.sorts, p16)
	
	if var15 == nil then
		return false, {
			message = "Requested sort not found in omni recommendation feed item refresh response",
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse
		}
	elseif var15.treatmentType ~= omniFeedTypes.ServerDrivenUiV2 then
		return false, {
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse,
			message = `Requested sort is not SDUI V2 in omni recommendation feed item refresh response: {var15.treatmentType}`
		}
	end
	local var16 = if typeof(var15) == "table" then var15.feedItemKey else nil
	
	if typeof(var16) ~= "string" or var16 == "" then
		return false, {
			message = "Missing feedItemKey in omni recommendation feed item refresh response",
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse
		}
	elseif var16 ~= p17 then
		return false, {
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse,
			message = `Wrong feedItemKey in omni recommendation feed item refresh response: {var16}`
		}
	elseif p15.sduiv2 == nil or typeof(p15.sduiv2) ~= "table" then
		return false, {
			message = "No sduiv2 field in omni recommendation feed item refresh response",
			errorType = sduiErrors.SduiErrorType.NilSduiTreeInResponse
		}
	elseif hasPageEntryForFeedItemKey(p15.sduiv2, p17) then
		return true, nil
	end
	return false, {
		message = "Requested feed item not found in sduiv2 page entries",
		errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse
	}
end

return function(p18, p19, p20, p21, p22, p23, p24) --[[ line: 180 | named "refreshOmniRecommendationFeedItem" ]]
	-- upvalues: sduiLoadTimer (ref), omniFeedTypes (ref), getSupportedSduiTreatmentTypes (ref), httpService (ref), t (ref), makeOmniRecommendationsRequest (ref), validateResponseBody (ref), seedHomeOmniSduiV2PayloadModule (ref), sduiErrors (ref), sduiParseHelpers (ref)
	local loadTimer = p24.loadTimer or sduiLoadTimer.createLoadTimer(p19)
	loadTimer.start("feed-item-refresh")
	local t_1 = {}
	
	for i, v in pairs(omniFeedTypes) do
		table.insert(t_1, v)
	end
	local var19 = nil
	local ok, status = pcall(getSupportedSduiTreatmentTypes)
	
	if ok then
		var19 = status
	end
	local var20 = `{p19}:{p20}:{p21}`
	local var21 = httpService:GenerateGUID(false):lower()
	t[var20] = var21
	
	return makeOmniRecommendationsRequest(p18, p19, httpService:GenerateGUID(false):lower(), nil, t_1, p22, { p20 }, var19, p24.contextFeatures):andThen(function(p26) --[[ line: 218 ]]
		-- upvalues: var20 (ref), var21 (ref), t (copy), validateResponseBody (copy), p20 (ref), p21 (ref), p23 (ref), seedHomeOmniSduiV2PayloadModule (copy), p19 (ref), loadTimer (ref), sduiErrors (copy)
		if t[var20] ~= var21 then return end
		local var22 = if typeof(p26) == "table" then p26.responseBody else nil
		local var23, var24 = validateResponseBody(var22, p20, p21)
		
		if not var23 then
			assert(var24, "Validation error should exist when response is invalid")
			p23(var24.errorType, {
				name = "discovery-api/omni-recommendation/sduiv2",
				message = `{var24.message}, topicIds: {p20}`
			})
			
			return
		end
		local ok, status = pcall(function() --[[ line: 233 ]]
			-- upvalues: seedHomeOmniSduiV2PayloadModule (copy), var22 (ref), p19 (copy), loadTimer (copy)
			seedHomeOmniSduiV2PayloadModule(var22.sduiv2, p19, loadTimer)
		end)
		
		if ok then
			return
		end
		p23(sduiErrors.SduiErrorType.ErrorStoringOmniData, {
			name = "discovery-api/omni-recommendation/sduiv2",
			message = `Error seeding omni recommendation feed item: {status}, topicIds: {p20}`
		})
	end):catch(function(p25) --[[ line: 246 ]]
		-- upvalues: var20 (ref), var21 (ref), t (copy), p23 (ref), p20 (ref), sduiErrors (copy), sduiParseHelpers (copy)
		if t[var20] == var21 then
			p23(sduiErrors.SduiErrorType.FailedToFetchPage, {
				name = "discovery-api/omni-recommendation/sduiv2",
				message = `Omni recommendation feed item refresh failed: {sduiParseHelpers.stringifyValue(p25)}, topicIds: {p20}`
			})
			
			return
		end
	end):finally(function() --[[ line: 253 ]]
		-- upvalues: var20 (ref), var21 (ref), t (copy), loadTimer (ref)
		if t[var20] == var21 then
			loadTimer.logRefreshComplete()
			t[var20] = nil
		end
	end)
end