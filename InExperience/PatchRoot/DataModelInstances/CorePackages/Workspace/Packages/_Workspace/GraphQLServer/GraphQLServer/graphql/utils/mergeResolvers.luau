local luauPolyfillModule = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local mergeDeepModule = require(script.Parent.mergeDeep)

local function mergeResolvers(p1, p2)
	-- upvalues: array (ref), mergeResolvers (ref), mergeDeepModule (ref), boolean (ref)
	if not p1 or array.isArray(p1) and #p1 == 0 then
		return {}
	elseif not array.isArray(p1) then
		return p1
	elseif #p1 == 1 then
		return p1[1] or {}
	end
	local t = {}
	
	for i, v in p1 do
		local v
		if array.isArray(v) then
			v = mergeResolvers(v)
		end
		if type(v) == "table" and v then
			table.insert(t, v)
		end
	end
	local var1 = mergeDeepModule(t, true)
	
	if p2 and p2.exclusions then
		for i_1, v_1 in p2.exclusions do
			local unpacked, unpacked_1 = table.unpack(v_1:split("."), 1, 2)
			
			if not unpacked_1 or unpacked_1 == "*" then
				var1[tostring(unpacked)] = nil
			elseif boolean.toJSBoolean(var1[tostring(unpacked)]) then
				var1[tostring(unpacked)][tostring(unpacked_1)] = nil
			end
		end
	end
	return var1
end

return mergeResolvers