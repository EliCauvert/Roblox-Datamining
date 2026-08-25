local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local string = luauPolyfillModule.String
local t = {}
local mergeDeep = require(parent.Utils).mergeDeep

local function mergeResolvers(p0, p1)
	-- upvalues: boolean (ref), array (ref), mergeResolvers (ref), mergeDeep (ref), string (ref)
	if not boolean.toJSBoolean(p0) or array.isArray(p0) and #p0 == 0 then
		return {}
	elseif not boolean.toJSBoolean(array.isArray(p0)) then
		return p0
	elseif #p0 == 1 then
		return if boolean.toJSBoolean(p0[1]) then p0[1] else {}
	end
	local t = {}
	
	for i, v in p0 do
		local v
		if boolean.toJSBoolean(array.isArray(v)) then
			v = mergeResolvers(v)
		end
		if boolean.toJSBoolean(typeof(v) == "table" and v) then
			table.insert(t, v)
		end
	end
	local var4 = mergeDeep(t, true)
	
	if boolean.toJSBoolean(if typeof(p1) == "table" then p1.exclusions else nil) then
		for i_1, v_1 in p1.exclusions do
			local unpacked, unpacked_1 = table.unpack(string.split(v_1, "."), 1, 2)
			
			if not boolean.toJSBoolean(unpacked_1) or unpacked_1 == "*" then
				var4[unpacked] = nil
			elseif boolean.toJSBoolean(var4[unpacked]) then
				var4[unpacked][unpacked_1] = nil
			end
		end
	end
	return var4
end

t.mergeResolvers = mergeResolvers

return t