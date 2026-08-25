local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Types)
local createEventModule = require(viewRecycler.Internal.createEvent)

local function getItems(p0, p1, p2, p3)
	local list = table.create(math.max(0, p3 - p2 + 1))
	
	for i = p2, math.min(p3, p0) do
		table.insert(list, p1(i))
	end
	return list
end

return function(p4, p5, p6, p7)
	-- upvalues: createEventModule (ref), getItems (ref)
	local var4 = createEventModule()
	local var5 = 0
	local var6 = nil
	
	return {
		getItemCount = p4,
		getItem = p5,
		getItemKey = p6,
		getItems = function(p8, p9)
			-- upvalues: getItems (copy), p4 (ref), p5 (ref)
			return getItems(p4(), p5, p8, p9)
		end,
		subscribe = function(p10)
			-- upvalues: var5 (write), var6 (write), p7 (ref), var4 (ref)
			if var5 == 0 then
				var6 = p7(var4.fire)
			end
			var5 += 1
			local var7 = var4.connect(p10)
			local var8 = true
			
			return function()
				-- upvalues: var8 (write), var7 (ref), var5 (copy), var6 (copy)
				if not var8 then return end
				var8 = false
				var7()
				var5 -= 1
				
				if var5 == 0 and var6 ~= nil then
					var6()
					var6 = nil
				end
			end
		end
	}
end