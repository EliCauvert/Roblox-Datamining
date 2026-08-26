local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Types)
local createEventModule = require(viewRecycler.Internal.createEvent)

local function getItems(p1, p2, p3, p4)
	local list = table.create(math.max(0, p4 - p3 + 1))
	
	for i = p3, math.min(p4, p1) do
		table.insert(list, p2(i))
	end
	return list
end

return function(p5, p6, p7, p8)
	-- upvalues: createEventModule (ref), getItems (ref)
	local var1 = createEventModule()
	local var2 = 0
	local var3 = nil
	
	return {
		getItemCount = p5,
		getItem = p6,
		getItemKey = p7,
		getItems = function(p9, p10)
			-- upvalues: getItems (copy), p5 (ref), p6 (ref)
			return getItems(p5(), p6, p9, p10)
		end,
		subscribe = function(p9)
			-- upvalues: var2 (write), var3 (write), p8 (ref), var1 (ref)
			if var2 == 0 then
				var3 = p8(var1.fire)
			end
			var2 += 1
			local var4 = var1.connect(p9)
			local var5 = true
			
			return function()
				-- upvalues: var5 (write), var4 (ref), var2 (copy), var3 (copy)
				if not var5 then return end
				var5 = false
				var4()
				var2 -= 1
				
				if var2 == 0 and var3 ~= nil then
					var3()
					var3 = nil
				end
			end
		end
	}
end