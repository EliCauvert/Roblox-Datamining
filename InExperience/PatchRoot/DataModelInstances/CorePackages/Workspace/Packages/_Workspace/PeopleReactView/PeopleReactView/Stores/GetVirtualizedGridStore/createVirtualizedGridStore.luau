local parent = script:FindFirstAncestor("PeopleReactView").Parent
local signalsModule = require(parent.Signals)
local fFlagFixVirtualizedGridNumItems = require(parent.PeopleService).getService("Flags").FFlagFixVirtualizedGridNumItems
local peoplePageVirtualizedGridBuffer = game:DefineFastInt("PeoplePageVirtualizedGridBuffer", 200)

return function() --[[ line: 28 | named "createVirtualizedGridStore" ]]
	-- upvalues: signalsModule (ref), peoplePageVirtualizedGridBuffer (ref), fFlagFixVirtualizedGridNumItems (ref)
	local var2, var3 = signalsModule.createSignal(1)
	local var4, var5 = signalsModule.createSignal(0)
	
	return {
		getMinVirtualizedIndex = var2,
		getMaxVirtualizedIndex = var4,
		getNumVirtualizedItems = signalsModule.createComputed(function(p0) --[[ line: 32 ]]
			-- upvalues: var4 (ref), var2 (ref)
			return var4(p0) - var2(p0) + 1
		end),
		calculateVirtualizedGridLimits = function(p1, p2, _, p3, p4, p5) --[[ line: 38 ]]
			-- upvalues: peoplePageVirtualizedGridBuffer (copy), fFlagFixVirtualizedGridNumItems (copy), var3 (ref), var5 (ref)
			local var6 = math.floor((p1 - peoplePageVirtualizedGridBuffer) / (p3 + p5)) * p4 + 1
			
			if not fFlagFixVirtualizedGridNumItems then
				var6 = math.max(1, var6)
			end
			local var7 = var6 + math.ceil((p2 + 2 * peoplePageVirtualizedGridBuffer) / (p3 + p5)) * p4 - 1
			
			if fFlagFixVirtualizedGridNumItems then
				var6 = math.max(1, var6)
			end
			var3(var6)
			var5(var7)
		end
	}
end