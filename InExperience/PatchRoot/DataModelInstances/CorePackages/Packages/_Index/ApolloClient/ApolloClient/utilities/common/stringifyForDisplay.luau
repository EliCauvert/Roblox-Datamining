local t = {}
local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local string = luauPolyfillModule.String
local httpService = game:GetService("HttpService")
local makeUniqueId = require(script.Parent.makeUniqueId).makeUniqueId

function replaceUndefined(p0, p1)
	-- upvalues: array (ref)
	if not array.isArray(p0) then
		return p0
	end
	local t = {}
	
	for i = 1, #p0 do
		if p0[i] == nil then
			table.insert(t, p1)
		else
			table.insert(t, p0[i])
		end
	end
	return t
end

function t.stringifyForDisplay(p2)
	-- upvalues: makeUniqueId (ref), array (ref), string (ref), httpService (ref)
	local var4 = makeUniqueId("stringifyForDisplay")
	
	return array.join(string.split(httpService:JSONEncode(replaceUndefined(p2, var4)), httpService:JSONEncode(var4)), "<undefined>")
end

return t