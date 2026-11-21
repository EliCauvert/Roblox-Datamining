local Parent = script:FindFirstAncestor("AvatarExperienceSearch").Parent
local _ = require(Parent.LuauPolyfill)
local Url = require(Parent.Http).Url

local function normalizeQueries(ResponseBody)
	if ResponseBody == nil or ResponseBody.error ~= nil or type(ResponseBody.queries) ~= "table" then
		return {}
	end
	local List = {}
	
	for _, query in ResponseBody.queries do
		if type(query) == "string" and query ~= "" then
			table.insert(List, query)
		end
	end
	return List
end

return function(Callback)
	-- upvalues: Url (copy), normalizeQueries (copy)
	local POST, POST2 = Callback(`{Url.CATALOG_URL}v1/topic/get-topics`, "POST", { postBody = "{}" })
	
	return POST:andThen(function(Result)
		-- upvalues: normalizeQueries (upval)
		return (normalizeQueries(Result.responseBody))
	end), POST2
end