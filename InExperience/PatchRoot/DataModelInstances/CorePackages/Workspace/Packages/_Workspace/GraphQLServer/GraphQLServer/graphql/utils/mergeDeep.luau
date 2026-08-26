local luauPolyfillModule = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill)
local object = luauPolyfillModule.Object
local array = luauPolyfillModule.Array

local function _(p1)
	-- upvalues: array (ref)
	local var1 = false
	
	if typeof(p1) == "table" then
		var1 = not (array.isArray(p1) and #p1 > 0)
	end
	return var1
end

local function mergeDeep(p1, p2)
	-- upvalues: array (ref), object (ref), mergeDeep (ref)
	local var1 = p1[1] or {}
	local t = {}
	
	for i, v in p1 do
		local var2 = false
		
		if typeof(var1) == "table" then
			var2 = not (array.isArray(var1) and #var1 > 0)
		end
		if var2 then
			var2 = false
			
			if typeof(v) == "table" then
				var2 = not (array.isArray(v) and #v > 0)
			end
			if var2 then
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