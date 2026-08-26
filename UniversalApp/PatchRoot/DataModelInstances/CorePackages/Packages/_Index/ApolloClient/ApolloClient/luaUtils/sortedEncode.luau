local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local httpService = game:GetService("HttpService")

function sortedEncode(p1)
	-- upvalues: array (ref), object (ref), httpService (ref)
	return if array.isArray(p1) or typeof(p1) ~= "table" then httpService:JSONEncode(p1) else "{" .. array.join(array.map(array.sort(object.keys(p1)), function(p2)
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONEncode(p2) .. ":" .. sortedEncode(p1[p2])
	end), ",") .. "}"
end

return { sortedEncode = sortedEncode }