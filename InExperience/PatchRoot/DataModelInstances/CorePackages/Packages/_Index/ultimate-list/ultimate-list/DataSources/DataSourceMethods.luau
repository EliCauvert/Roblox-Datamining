local _ = require(script.Parent)
local exhaustiveMatchModule = require(script:FindFirstAncestor("ultimate-list").Util.exhaustiveMatch)

return {
	get = function(p0, p1)
		-- upvalues: exhaustiveMatchModule (ref)
		assert(p1 >= 1, "index < 1")
		
		if p0.type == "array" then
			local function get(p2)
				-- upvalues: p0 (ref), get (ref)
				return if p2 < 1 or #p0.array < p2 then nil else {
					before = function()
						-- upvalues: get (copy), p2 (ref)
						return get(p2 - 1)
					end,
					value = p0.array[p2],
					after = function()
						-- upvalues: get (copy), p2 (ref)
						return get(p2 + 1)
					end
				}
			end
			
			return get(p1)
		end
		return if p0.type == "mutableSource" then p0.methods.get(p1) else exhaustiveMatchModule(p0.type)
	end,
	getByRange = function(p3, p4)
		-- upvalues: exhaustiveMatchModule (ref)
		if p3.type == "array" then
			return table.move(p3.array, p4.X, p4.Y, 1, {})
		elseif p3.type ~= "mutableSource" then
			return exhaustiveMatchModule(p3.type)
		elseif p3.methods.getByRange ~= nil then
			return p3.methods.getByRange(p4.X, p4.Y)
		end
		local t = {}
		local var3 = p3.methods.get(p4.X)
		
		for _ = 0, p4.Y - p4.X do
			if var3 == nil then break end
			table.insert(t, var3.value)
			var3 = var3.after()
		end
		return t
	end,
	back = function(p5)
		-- upvalues: exhaustiveMatchModule (ref)
		if p5.type == "array" then
			return p5.array[#p5.array]
		elseif p5.type ~= "mutableSource" then
			return exhaustiveMatchModule(p5.type)
		elseif p5.methods.back == nil then
			local var4 = p5.methods.get(p5.methods.length())
			
			return var4 and var4.value
		end
		return p5.methods.back()
	end,
	length = function(p6)
		-- upvalues: exhaustiveMatchModule (ref)
		return if p6.type == "array" then #p6.array elseif p6.type == "mutableSource" then p6.methods.length() else exhaustiveMatchModule(p6.type)
	end,
	equals = function(p7, p8)
		-- upvalues: exhaustiveMatchModule (ref)
		if p7.type ~= p8.type then
			return false
		elseif p7.type == "array" then
			assert(p8.type == "array", "Luau")
			
			return p7.array == p8.array
		elseif p7.type == "mutableSource" then
			assert(p8.type == "mutableSource", "Luau")
			
			return p7.methods == p8.methods
		end
		return exhaustiveMatchModule(p7.type)
	end
}