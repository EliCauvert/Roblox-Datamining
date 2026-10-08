local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Types)
local createEventModule = require(viewRecycler.Internal.createEvent)
local readDenseRangeModule = require(script.Parent.readDenseRange)

return function(p1, p2, p3, p4)
	-- upvalues: createEventModule (ref), readDenseRangeModule (ref)
	local var1 = createEventModule()
	local var2 = 0
	local var3 = nil
	
	return {
		getItemCount = p1,
		getItem = p2,
		getItemKey = p3,
		getItems = function(p5, p6)
			-- upvalues: readDenseRangeModule (copy), p1 (ref), p2 (ref)
			return readDenseRangeModule(p1(), p2, p5, p6)
		end,
		subscribe = function(p5)
			-- upvalues: var2 (write), var3 (write), p4 (ref), var1 (ref)
			if var2 == 0 then
				var3 = p4(var1.fire)
			end
			var2 += 1
			local var4 = var1.connect(p5)
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