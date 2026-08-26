local _ = require(script.Parent)
local exhaustiveMatchModule = require(script:FindFirstAncestor("ultimate-list").Util.exhaustiveMatch)

return {
	get = function(p1, p2)
		-- upvalues: exhaustiveMatchModule (ref)
		assert(p2 >= 1, "index < 1")
		
		if p1.type == "array" then
			local function get(p3)
				-- upvalues: p1 (ref), get (ref)
				return if p3 < 1 or #p1.array < p3 then nil else {
					before = function()
						-- upvalues: get (copy), p3 (ref)
						return get(p3 - 1)
					end,
					value = p1.array[p3],
					after = function()
						-- upvalues: get (copy), p3 (ref)
						return get(p3 + 1)
					end
				}
			end
			
			return get(p2)
		end
		return if p1.type == "mutableSource" then p1.methods.get(p2) else exhaustiveMatchModule(p1.type)
	end,
	getByRange = function(p1, p2)
		-- upvalues: exhaustiveMatchModule (ref)
		if p1.type == "array" then
			return table.move(p1.array, p2.X, p2.Y, 1, {})
		elseif p1.type ~= "mutableSource" then
			return exhaustiveMatchModule(p1.type)
		elseif p1.methods.getByRange ~= nil then
			return p1.methods.getByRange(p2.X, p2.Y)
		end
		local t = {}
		local var1 = p1.methods.get(p2.X)
		
		for _ = 0, p2.Y - p2.X do
			if var1 == nil then break end
			table.insert(t, var1.value)
			var1 = var1.after()
		end
		return t
	end,
	back = function(p3)
		-- upvalues: exhaustiveMatchModule (ref)
		if p3.type == "array" then
			return p3.array[#p3.array]
		elseif p3.type ~= "mutableSource" then
			return exhaustiveMatchModule(p3.type)
		elseif p3.methods.back == nil then
			local var2 = p3.methods.get(p3.methods.length())
			
			return var2 and var2.value
		end
		return p3.methods.back()
	end,
	length = function(p3)
		-- upvalues: exhaustiveMatchModule (ref)
		return if p3.type == "array" then #p3.array elseif p3.type == "mutableSource" then p3.methods.length() else exhaustiveMatchModule(p3.type)
	end,
	equals = function(p3, p4)
		-- upvalues: exhaustiveMatchModule (ref)
		if p3.type ~= p4.type then
			return false
		elseif p3.type == "array" then
			assert(p4.type == "array", "Luau")
			
			return p3.array == p4.array
		elseif p3.type == "mutableSource" then
			assert(p4.type == "mutableSource", "Luau")
			
			return p3.methods == p4.methods
		end
		return exhaustiveMatchModule(p3.type)
	end
}