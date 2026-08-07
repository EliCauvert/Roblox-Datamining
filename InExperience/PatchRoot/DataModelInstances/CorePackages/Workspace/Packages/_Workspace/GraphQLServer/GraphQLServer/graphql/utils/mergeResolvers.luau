local luauPolyfillModule = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local mergeDeepModule = require(script.Parent.mergeDeep)

local function mergeResolvers(p0, p1) --[[ line: 14 ]]
	-- upvalues: array (ref), mergeResolvers (ref), mergeDeepModule (ref), boolean (ref)
	if not p0 or array.isArray(p0) and #p0 == 0 then
		return {}
	elseif not array.isArray(p0) then
		return p0
	elseif #p0 == 1 then
		return p0[1] or {}
	end
	local t = {}
	
	for i, v in p0 do
		local v
		if array.isArray(v) then
			v = mergeResolvers(v)
		end
		if type(v) == "table" and v then
			table.insert(t, v)
		end
	end
	local var4 = mergeDeepModule(t, true)
	
	if p1 and p1.exclusions then
		for i_1, v_1 in p1.exclusions do
			local unpacked, unpacked_1 = table.unpack(v_1:split("."), 1, 2)
			
			if not unpacked_1 or unpacked_1 == "*" then
				var4[tostring(unpacked)] = nil
			elseif boolean.toJSBoolean(var4[tostring(unpacked)]) then
				var4[tostring(unpacked)][tostring(unpacked_1)] = nil
			end
		end
	end
	return var4
end

return mergeResolvers