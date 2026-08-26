local parent = script:FindFirstAncestor("PeopleReactView").Parent
local signalsModule = require(parent.Signals)
local fFlagFixVirtualizedGridNumItems = require(parent.PeopleService).getService("Flags").FFlagFixVirtualizedGridNumItems
local peoplePageVirtualizedGridBuffer = game:DefineFastInt("PeoplePageVirtualizedGridBuffer", 200)

return function()
	-- upvalues: signalsModule (ref), peoplePageVirtualizedGridBuffer (ref), fFlagFixVirtualizedGridNumItems (ref)
	local var1, var2 = signalsModule.createSignal(1)
	local var3, var4 = signalsModule.createSignal(0)
	
	return {
		getMinVirtualizedIndex = var1,
		getMaxVirtualizedIndex = var3,
		getNumVirtualizedItems = signalsModule.createComputed(function(p1)
			-- upvalues: var3 (ref), var1 (ref)
			return var3(p1) - var1(p1) + 1
		end),
		calculateVirtualizedGridLimits = function(p1, p2, _, p3, p4, p5)
			-- upvalues: peoplePageVirtualizedGridBuffer (copy), fFlagFixVirtualizedGridNumItems (copy), var2 (ref), var4 (ref)
			local var5 = math.floor((p1 - peoplePageVirtualizedGridBuffer) / (p3 + p5)) * p4 + 1
			
			if not fFlagFixVirtualizedGridNumItems then
				var5 = math.max(1, var5)
			end
			local var6 = var5 + math.ceil((p2 + 2 * peoplePageVirtualizedGridBuffer) / (p3 + p5)) * p4 - 1
			
			if fFlagFixVirtualizedGridNumItems then
				var5 = math.max(1, var5)
			end
			var2(var5)
			var4(var6)
		end
	}
end