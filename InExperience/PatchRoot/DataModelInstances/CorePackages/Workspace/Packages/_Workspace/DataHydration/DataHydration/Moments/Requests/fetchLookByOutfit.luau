local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("DataHydration").Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)

local function _(p1)
	return if type(p1) == "string" and p1 ~= "" then p1 else nil
end

local function normalizeLookByOutfit(p1)
	if type(p1) ~= "table" then
		return nil, `Type table required, got {type(p1)}.`
	elseif type(p1.look) ~= "table" then
		return {}, "look normalization failed with: \"look\" is absent or not a table"
	end
	local look = p1.look
	local lookId = look.lookId
	
	if type(lookId) ~= "string" then
		return nil, "look normalization failed with: required field \"lookId\" is absent or not a string"
	end
	local t = {}
	local t_1 = {
		lookId = lookId,
		outfitId = if type(look.outfitId) == "number" then look.outfitId else nil
	}
	local name = look.name
	t_1.name = if type(name) == "string" and name ~= "" then name else nil
	name = look.description
	t_1.description = if type(name) == "string" and name ~= "" then name else nil
	t_1.totalPrice = if type(look.totalPrice) == "number" then look.totalPrice else nil
	t_1.itemCount = if type(look.items) == "table" then #look.items else 0
	t.look = t_1
	
	return t, nil
end

local function isLookNotFound(p1)
	-- upvalues: httpService (ref)
	if type(p1) ~= "table" then
		return false
	elseif p1.responseCode ~= 400 then
		return false
	end
	local var1 = nil
	local response = p1.response
	
	if type(response) == "table" then
		var1 = response.responseBody
	elseif type(p1.errorMessage) == "string" then
		local _, matchIndex = string.find(p1.errorMessage, "^http %d+: ")
		
		if matchIndex then
			var1 = string.sub(p1.errorMessage, matchIndex + 1)
		end
	end
	if type(var1) == "string" then
		local ok, status = pcall(httpService.JSONDecode, httpService, var1)
		var1 = if ok then status else nil
	end
	return type(var1) == "table" and var1.errorCode == 98
end

return function(p1, p2)
	-- upvalues: httpModule (ref), httpClientModule (ref), normalizeLookByOutfit (ref), isLookNotFound (ref), promiseModule (ref)
	p2 = p2 or {}
	
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "GET",
		analyticsKey = "look-api.get-by-outfit",
		network = p2.network,
		url = (p2.baseUrl or httpModule.Url.APIS_URL) .. "look-api/v2/looks/by-outfit/" .. tostring(p1),
		decode = function(p3)
			-- upvalues: normalizeLookByOutfit (copy)
			local var1, _ = normalizeLookByOutfit(p3)
			
			return var1 or {}
		end
	})):catch(function(p3)
		-- upvalues: isLookNotFound (copy), promiseModule (copy)
		return if isLookNotFound(p3) then {} else promiseModule.reject(p3)
	end)
end