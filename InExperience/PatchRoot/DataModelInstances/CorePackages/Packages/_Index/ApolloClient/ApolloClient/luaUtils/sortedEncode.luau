local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local httpService = game:GetService("HttpService")

function sortedEncode(p0) --[[ line: 14 ]]
	-- upvalues: array (ref), object (ref), httpService (ref)
	return if array.isArray(p0) or typeof(p0) ~= "table" then httpService:JSONEncode(p0) else "{" .. array.join(array.map(array.sort(object.keys(p0)), function(p1) --[[ line: 16 ]]
		-- upvalues: httpService (copy), p0 (ref)
		return httpService:JSONEncode(p1) .. ":" .. sortedEncode(p0[p1])
	end), ",") .. "}"
end

return { sortedEncode = sortedEncode }