local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)

local function mapValues(Endpoints, Callback)
	local t = {}
	
	for i, endpoint in pairs(Endpoints) do
		t[i] = Callback(endpoint, i)
	end
	return t
end

local function _(p1, p2)
	-- upvalues: mapValues (copy)
	return if type(p2._collectionFormat) == "table" then mapValues(p1, function(List, p3)
		-- upvalues: p2 (copy)
		return if p2._collectionFormat[p3] == "csv" then table.concat(List, ",") else List
	end) else p1
end

local function getBody(p1, Body): string?
	-- upvalues: HttpService (copy)
	local Input = nil
	
	if type(Body) == "table" then
		Input = {}
		
		for _, value in ipairs(Body) do
			Input[value] = p1[value]
			
			if Input[value] == nil then
				Input[value] = "##NULL##TOKEN##"
			end
		end
	else
		if type(Body) ~= "string" then
			return nil
		end
		Input = p1[Body]
	end
	return (string.gsub(HttpService:JSONEncode(Input), "\"##NULL##TOKEN##\"", "null"))
end

local ApiWrapperModule = {
	endpoint = function(p2, Definitions)
		-- upvalues: ArgCheckModule (copy), mapValues (copy), UrlBuilderModule (copy), getBody (copy)
		return function(Callback, p3)
			-- upvalues: ArgCheckModule (upval), p2 (copy), Definitions (copy), mapValues (upval), UrlBuilderModule (upval), getBody (upval)
			ArgCheckModule.matchesInterface(p3, p2.input, "input", Definitions)
			local Input = p2.input
			local MapValuesResult = if type(Input._collectionFormat) == "table" then mapValues(p3, function(List, p4)
				-- upvalues: Input (copy)
				return if Input._collectionFormat[p4] == "csv" then table.concat(List, ",") else List
			end) else p3
			local v1 = UrlBuilderModule.fromString(p2.url)(MapValuesResult)
			local t = {}
			
			if p2.body then
				t.postBody = getBody(MapValuesResult, p2.body)
			end
			return Callback(v1, p2.method, t):andThen(function(Result)
				-- upvalues: ArgCheckModule (upval), p2 (upval), Definitions (upval)
				ArgCheckModule.matchesInterface(Result.responseBody, p2.output, "output", Definitions)
				
				return Result
			end)
		end
	end
}

function ApiWrapperModule.new(p2)
	-- upvalues: mapValues (copy), ApiWrapperModule (copy)
	local Definitions = p2.definitions
	
	return (mapValues(p2.endpoints, function(p3)
		-- upvalues: ApiWrapperModule (upval), Definitions (copy)
		return ApiWrapperModule.endpoint(p3, Definitions)
	end))
end

return ApiWrapperModule