local luauPolyfillModule = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill)
local object = luauPolyfillModule.Object
local array = luauPolyfillModule.Array

local function _(p0) --[[ line: 9 | named "isObject" ]]
	-- upvalues: array (ref)
	local var2 = false
	
	if typeof(p0) == "table" then
		var2 = not (array.isArray(p0) and #p0 > 0)
	end
	return var2
end

local function mergeDeep(p1, p2) --[[ line: 13 ]]
	-- upvalues: array (ref), object (ref), mergeDeep (ref)
	local var3 = p1[1] or {}
	local t = {}
	
	for i, v in p1 do
		local var5 = false
		
		if typeof(var3) == "table" then
			var5 = not (array.isArray(var3) and #var3 > 0)
		end
		if var5 then
			var5 = false
			
			if typeof(v) == "table" then
				var5 = not (array.isArray(v) and #v > 0)
			end
			if var5 then
				for i_1, v_1 in v do
					if type(v_1) ~= "table" then
						object.assign(t, { [i_1] = v_1 })
					elseif t[i_1] == nil then
						object.assign(t, { [i_1] = v_1 })
					else
						t[i_1] = mergeDeep({ t[i_1], v_1 }, p2)
					end
				end
			end
		end
	end
	return t
end

return mergeDeep