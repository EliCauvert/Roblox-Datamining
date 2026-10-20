local LuauPolyfillModule = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill)
local Object = LuauPolyfillModule.Object
local Array = LuauPolyfillModule.Array

local function _(p1): boolean
	-- upvalues: Array (copy)
	return typeof(p1) == "table" and not (Array.isArray(p1) and #p1 > 0)
end

local function mergeDeep(Entry, p1)
	-- upvalues: Array (copy), Object (copy), mergeDeep (copy)
	local Entry1 = Entry[1] or {}
	local t = {}
	
	for _, value in Entry do
		if typeof(Entry1) == "table" and not (Array.isArray(Entry1) and #Entry1 > 0) and (typeof(value) == "table" and not (Array.isArray(value) and #value > 0)) then
			for i, value1 in value do
				if type(value1) ~= "table" then
					Object.assign(t, { [i] = value1 })
					continue
				end
				if t[i] == nil then
					Object.assign(t, { [i] = value1 })
				else
					t[i] = mergeDeep({ t[i], value1 }, p1)
				end
			end
		end
	end
	return t
end

return mergeDeep