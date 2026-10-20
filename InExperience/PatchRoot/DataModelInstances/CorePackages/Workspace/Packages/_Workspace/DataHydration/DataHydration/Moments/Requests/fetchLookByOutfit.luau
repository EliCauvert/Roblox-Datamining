local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)

local function _(p1)
	return if type(p1) == "string" and p1 ~= "" then p1 else nil
end

local function normalizeLookByOutfit(p1)
	if type(p1) ~= "table" then
		return nil, `Type table required, got {type(p1)}.`
	elseif type(p1.look) ~= "table" then
		return {}, "look normalization failed with: \"look\" is absent or not a table"
	else
		local Look = p1.look
		local LookId = Look.lookId
		
		if type(LookId) == "string" then
			local Name = Look.name
			local Name1 = if type(Name) == "string" and Name ~= "" then Name else nil
			local Description = Look.description
			
			return {
				look = {
					lookId = LookId,
					outfitId = if type(Look.outfitId) == "number" then Look.outfitId else nil,
					name = Name1,
					description = if type(Description) == "string" and Description ~= "" then Description else nil,
					totalPrice = if type(Look.totalPrice) == "number" then Look.totalPrice else nil,
					itemCount = if type(Look.items) == "table" then #Look.items else 0
				}
			}, nil
		else
			return nil, "look normalization failed with: required field \"lookId\" is absent or not a string"
		end
	end
end

local function isLookNotFound(p1): boolean
	-- upvalues: HttpService (copy)
	if type(p1) ~= "table" then
		return false
	end
	if p1.responseCode ~= 400 then
		return false
	end
	local ResponseBody = nil
	local Response = p1.response
	
	if type(Response) == "table" then
		ResponseBody = Response.responseBody
	elseif type(p1.errorMessage) == "string" then
		local _, EndIndex = string.find(p1.errorMessage, "^http %d+: ")
		
		if EndIndex then
			ResponseBody = string.sub(p1.errorMessage, EndIndex + 1)
		end
	end
	if type(ResponseBody) == "string" then
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, ResponseBody)
		ResponseBody = if Success then Result else nil
	end
	return type(ResponseBody) == "table" and ResponseBody.errorCode == 98
end

return function(p1, p2)
	-- upvalues: HttpModule (copy), HttpClientModule (copy), normalizeLookByOutfit (copy), isLookNotFound (copy), PromiseModule (copy)
	local P4 = p2 or {}
	
	return HttpClientModule.asPromise((HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "look-api.get-by-outfit",
		network = P4.network,
		url = (P4.baseUrl or HttpModule.Url.APIS_URL) .. "look-api/v2/looks/by-outfit/" .. tostring(p1),
		decode = function(p3)
			-- upvalues: normalizeLookByOutfit (upval)
			local NormalizeLookByOutfitResult, _ = normalizeLookByOutfit(p3)
			
			if not NormalizeLookByOutfitResult then
				NormalizeLookByOutfitResult = {}
			end
			return NormalizeLookByOutfitResult
		end
	}))):catch(function(Err)
		-- upvalues: isLookNotFound (upval), PromiseModule (upval)
		return if isLookNotFound(Err) then {} else PromiseModule.reject(Err)
	end)
end