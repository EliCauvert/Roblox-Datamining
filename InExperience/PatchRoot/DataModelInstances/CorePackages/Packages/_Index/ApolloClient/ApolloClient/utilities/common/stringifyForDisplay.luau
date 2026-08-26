local t = {}
local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local string = luauPolyfillModule.String
local httpService = game:GetService("HttpService")
local makeUniqueId = require(script.Parent.makeUniqueId).makeUniqueId

function replaceUndefined(p1, p2)
	-- upvalues: array (ref)
	if not array.isArray(p1) then
		return p1
	end
	local t = {}
	
	for i = 1, #p1 do
		if p1[i] == nil then
			table.insert(t, p2)
		else
			table.insert(t, p1[i])
		end
	end
	return t
end

function t.stringifyForDisplay(p3)
	-- upvalues: makeUniqueId (ref), array (ref), string (ref), httpService (ref)
	local var1 = makeUniqueId("stringifyForDisplay")
	
	return array.join(string.split(httpService:JSONEncode(replaceUndefined(p3, var1)), httpService:JSONEncode(var1)), "<undefined>")
end

return t