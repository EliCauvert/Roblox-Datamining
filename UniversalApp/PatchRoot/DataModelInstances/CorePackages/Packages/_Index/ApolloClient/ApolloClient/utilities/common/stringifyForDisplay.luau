local LuauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local String = LuauPolyfillModule.String
local HttpService = game:GetService("HttpService")
local MakeUniqueIdFunction = require(script.Parent.makeUniqueId).makeUniqueId

function replaceUndefined(p1, p2) --[[ Line: 20 ]]
	-- upvalues: Array (copy)
	if not Array.isArray(p1) then
		return p1
	end
	local List = {}
	
	for i = 1, #p1 do
		if p1[i] == nil then
			table.insert(List, p2)
		else
			table.insert(List, p1[i])
		end
	end
	return List
end

return {
	stringifyForDisplay = function(p3) --[[ Line: 35 ]]
		-- upvalues: MakeUniqueIdFunction (copy), Array (copy), String (copy), HttpService (copy)
		local StringifyForDisplay = MakeUniqueIdFunction("stringifyForDisplay")
		
		return Array.join(String.split(HttpService:JSONEncode(replaceUndefined(p3, StringifyForDisplay)), HttpService:JSONEncode(StringifyForDisplay)), "<undefined>")
	end
}