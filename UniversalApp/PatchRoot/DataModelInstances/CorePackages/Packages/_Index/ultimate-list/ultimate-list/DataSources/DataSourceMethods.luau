local _ = require(script.Parent)
local ExhaustiveMatchModule = require(script:FindFirstAncestor("ultimate-list").Util.exhaustiveMatch)

return {
	get = function(p1, p2: number) --[[ Line: 8 ]]
		-- upvalues: ExhaustiveMatchModule (copy)
		assert(p2 >= 1, "index < 1")
		
		if p1.type == "array" then
			local function get(p3: number) --[[ Line: 15 ]]
				-- upvalues: p1 (copy), get (copy)
				return if p3 < 1 or #p1.array < p3 then nil else {
					before = function() --[[ Line: 21 ]]
						-- upvalues: get (upval), p3 (copy)
						return get(p3 - 1)
					end,
					value = p1.array[p3],
					after = function() --[[ Line: 27 ]]
						-- upvalues: get (upval), p3 (copy)
						return get(p3 + 1)
					end
				}
			end
			
			return (get(p2))
		else
			return if p1.type == "mutableSource" then p1.methods.get(p2) else ExhaustiveMatchModule(p1.type)
		end
	end,
	getByRange = function(p1, Vector) --[[ Line: 41 ]]
		-- upvalues: ExhaustiveMatchModule (copy)
		if p1.type == "array" then
			return table.move(p1.array, Vector.X, Vector.Y, 1, {})
		end
		if p1.type ~= "mutableSource" then
			return ExhaustiveMatchModule(p1.type)
		end
		if p1.methods.getByRange ~= nil then
			return p1.methods.getByRange(Vector.X, Vector.Y)
		end
		local List = {}
		local GetResult = p1.methods.get(Vector.X)
		
		for _ = 0, Vector.Y - Vector.X do
			if GetResult == nil then break end
			table.insert(List, GetResult.value)
			GetResult = GetResult.after()
		end
		return List
	end,
	back = function(p2) --[[ Line: 67 ]]
		-- upvalues: ExhaustiveMatchModule (copy)
		if p2.type == "array" then
			return p2.array[#p2.array]
		elseif p2.type ~= "mutableSource" then
			return ExhaustiveMatchModule(p2.type)
		elseif p2.methods.back == nil then
			local GetResult = p2.methods.get(p2.methods.length())
			
			return GetResult and GetResult.value
		else
			return p2.methods.back()
		end
	end,
	length = function(p2) --[[ Line: 82 ]]
		-- upvalues: ExhaustiveMatchModule (copy)
		return if p2.type == "array" then #p2.array elseif p2.type == "mutableSource" then p2.methods.length() else ExhaustiveMatchModule(p2.type)
	end,
	equals = function(p2, p3) --[[ Line: 93 ]]
		-- upvalues: ExhaustiveMatchModule (copy)
		if p2.type ~= p3.type then
			return false
		elseif p2.type == "array" then
			assert(p3.type == "array", "Luau")
			
			return p2.array == p3.array
		elseif p2.type == "mutableSource" then
			assert(p3.type == "mutableSource", "Luau")
			
			return p2.methods == p3.methods
		else
			return ExhaustiveMatchModule(p2.type)
		end
	end
}