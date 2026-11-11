local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local SignalsModule = require(Parent.Signals)
local FFlagFixVirtualizedGridNumItems = require(Parent.PeopleService).getService("Flags").FFlagFixVirtualizedGridNumItems
local PeoplePageVirtualizedGridBuffer = game:DefineFastInt("PeoplePageVirtualizedGridBuffer", 200)

return function()
	-- upvalues: SignalsModule (copy), PeoplePageVirtualizedGridBuffer (copy), FFlagFixVirtualizedGridNumItems (copy)
	local Signal, Signal2 = SignalsModule.createSignal(1)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	
	return {
		getMinVirtualizedIndex = Signal,
		getMaxVirtualizedIndex = Signal1,
		getNumVirtualizedItems = SignalsModule.createComputed(function(p1): number
			-- upvalues: Signal1 (copy), Signal (copy)
			return Signal1(p1) - Signal(p1) + 1
		end),
		calculateVirtualizedGridLimits = function(p1: number, p2, _, p3, p4, p5)
			-- upvalues: PeoplePageVirtualizedGridBuffer (upval), FFlagFixVirtualizedGridNumItems (upval), Signal2 (copy), Signal2_1 (copy)
			local NewFloored = math.floor((p1 - PeoplePageVirtualizedGridBuffer) / (p3 + p5)) * p4 + 1
			
			if not FFlagFixVirtualizedGridNumItems then
				NewFloored = math.max(1, NewFloored)
			end
			local NewFlooredDelta = NewFloored + math.ceil((p2 + 2 * PeoplePageVirtualizedGridBuffer) / (p3 + p5)) * p4 - 1
			
			if FFlagFixVirtualizedGridNumItems then
				NewFloored = math.max(1, NewFloored)
			end
			Signal2(NewFloored)
			Signal2_1(NewFlooredDelta)
		end
	}
end