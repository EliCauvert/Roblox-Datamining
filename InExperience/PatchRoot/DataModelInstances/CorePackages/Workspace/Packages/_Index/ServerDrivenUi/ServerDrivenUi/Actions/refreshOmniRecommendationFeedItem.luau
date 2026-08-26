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

local function _(p1, p2, p3)
	return `{p1}:{p2}:{p3}`
end

local _ = function(p1, p2)
	-- upvalues: t (ref)
	return t[p1] == p2
end

local function getSupportedSduiTreatmentTypes()
	-- upvalues: runService (ref), fStringLuaEnabledSduiTreatmentTypes (ref)
	local var1 = tonumber(string.match(runService:GetRobloxVersion(), ".(%d+)."))
	local t = {}
	
	for i, v in ipairs(string.split(fStringLuaEnabledSduiTreatmentTypes, ",")) do
		if v ~= "" then
			local match, match_1 = string.match(v, "(.*):(.*)")
			local var2 = tonumber(match_1)
			
			if match and var2 and var2 <= var1 then
				table.insert(t, match)
			end
		end
	end
	return t
end

local function findSortByTopicId(p1, p2)
	for i, v in p1 do
		if typeof(v) == "table" and v.topicId and tostring(v.topicId) == p2 then
			return v
		end
	end
	return nil
end

local function hasPageEntryForFeedItemKey(p3, p4)
	local pageEntries = p3.pageEntries
	
	if typeof(pageEntries) ~= "table" then
		return false
	end
	for i, v in pageEntries do
		if v and typeof(v) == "table" and (v.pageEntry and v.pageEntry.identifier == p4) then
			return true
		end
	end
	return false
end

local _ = function(p5, p6, p7)
	p5(p7.errorType, {
		name = "discovery-api/omni-recommendation/sduiv2",
		message = `{p7.message}, topicIds: {p6}`
	})
end

local _ = function(p5, p6, p7)
	-- upvalues: sduiErrors (ref), sduiParseHelpers (ref)
	p5(sduiErrors.SduiErrorType.FailedToFetchPage, {
		name = "discovery-api/omni-recommendation/sduiv2",
		message = `Omni recommendation feed item refresh failed: {sduiParseHelpers.stringifyValue(p7)}, topicIds: {p6}`
	})
end

local function validateResponseBody(p5, p6, p7)
	-- upvalues: sduiErrors (ref), findSortByTopicId (ref), omniFeedTypes (ref), hasPageEntryForFeedItemKey (ref)
	if p5 == nil or typeof(p5) ~= "table" then
		return false, {
			message = "No response data from omni recommendation feed item refresh",
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse
		}
	elseif p5.sorts == nil or typeof(p5.sorts) ~= "table" or #p5.sorts == 0 then
		return false, {
			message = "No sort data in omni recommendation feed item refresh response",
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse
		}
	end
	local var3 = findSortByTopicId(p5.sorts, p6)
	
	if var3 == nil then
		return false, {
			message = "Requested sort not found in omni recommendation feed item refresh response",
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse
		}
	elseif var3.treatmentType ~= omniFeedTypes.ServerDrivenUiV2 then
		return false, {
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse,
			message = `Requested sort is not SDUI V2 in omni recommendation feed item refresh response: {var3.treatmentType}`
		}
	end
	local var4 = if typeof(var3) == "table" then var3.feedItemKey else nil
	
	if typeof(var4) ~= "string" or var4 == "" then
		return false, {
			message = "Missing feedItemKey in omni recommendation feed item refresh response",
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse
		}
	elseif var4 ~= p7 then
		return false, {
			errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse,
			message = `Wrong feedItemKey in omni recommendation feed item refresh response: {var4}`
		}
	elseif p5.sduiv2 == nil or typeof(p5.sduiv2) ~= "table" then
		return false, {
			message = "No sduiv2 field in omni recommendation feed item refresh response",
			errorType = sduiErrors.SduiErrorType.NilSduiTreeInResponse
		}
	elseif hasPageEntryForFeedItemKey(p5.sduiv2, p7) then
		return true, nil
	end
	return false, {
		message = "Requested feed item not found in sduiv2 page entries",
		errorType = sduiErrors.SduiErrorType.InvalidFeedInResponse
	}
end

return function(p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: sduiLoadTimer (ref), omniFeedTypes (ref), getSupportedSduiTreatmentTypes (ref), httpService (ref), t (ref), makeOmniRecommendationsRequest (ref), validateResponseBody (ref), seedHomeOmniSduiV2PayloadModule (ref), sduiErrors (ref), sduiParseHelpers (ref)
	local loadTimer = p11.loadTimer or sduiLoadTimer.createLoadTimer(p6)
	loadTimer.start("feed-item-refresh")
	local t_1 = {}
	
	for i, v in pairs(omniFeedTypes) do
		table.insert(t_1, v)
	end
	local var3 = nil
	local ok, status = pcall(getSupportedSduiTreatmentTypes)
	
	if ok then
		var3 = status
	end
	local var4 = `{p6}:{p7}:{p8}`
	local var5 = httpService:GenerateGUID(false):lower()
	t[var4] = var5
	
	return makeOmniRecommendationsRequest(p5, p6, httpService:GenerateGUID(false):lower(), nil, t_1, p9, { p7 }, var3, p11.contextFeatures):andThen(function(p12)
		-- upvalues: var4 (ref), var5 (ref), t (copy), validateResponseBody (copy), p7 (ref), p8 (ref), p10 (ref), seedHomeOmniSduiV2PayloadModule (copy), p6 (ref), loadTimer (ref), sduiErrors (copy)
		if t[var4] ~= var5 then return end
		local var6 = if typeof(p12) == "table" then p12.responseBody else nil
		local var7, var8 = validateResponseBody(var6, p7, p8)
		
		if not var7 then
			assert(var8, "Validation error should exist when response is invalid")
			p10(var8.errorType, {
				name = "discovery-api/omni-recommendation/sduiv2",
				message = `{var8.message}, topicIds: {p7}`
			})
			
			return
		end
		local ok, status = pcall(function()
			-- upvalues: seedHomeOmniSduiV2PayloadModule (copy), var6 (ref), p6 (copy), loadTimer (copy)
			seedHomeOmniSduiV2PayloadModule(var6.sduiv2, p6, loadTimer)
		end)
		
		if ok then
			return
		end
		p10(sduiErrors.SduiErrorType.ErrorStoringOmniData, {
			name = "discovery-api/omni-recommendation/sduiv2",
			message = `Error seeding omni recommendation feed item: {status}, topicIds: {p7}`
		})
	end):catch(function(p12)
		-- upvalues: var4 (ref), var5 (ref), t (copy), p10 (ref), p7 (ref), sduiErrors (copy), sduiParseHelpers (copy)
		if t[var4] == var5 then
			p10(sduiErrors.SduiErrorType.FailedToFetchPage, {
				name = "discovery-api/omni-recommendation/sduiv2",
				message = `Omni recommendation feed item refresh failed: {sduiParseHelpers.stringifyValue(p12)}, topicIds: {p7}`
			})
			
			return
		end
	end):finally(function()
		-- upvalues: var4 (ref), var5 (ref), t (copy), loadTimer (ref)
		if t[var4] == var5 then
			loadTimer.logRefreshComplete()
			t[var4] = nil
		end
	end)
end