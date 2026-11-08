local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.MomentsTypes)
local SignalsModule = require(Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local t = {}
	
	return {
		getCards = Signal,
		add = function(p1)
			-- upvalues: t (ref), Signal (copy), Signal2 (copy)
			if not t[p1.id] then
				t[p1.id] = true
				local Copy = table.clone(Signal(false))
				table.insert(Copy, 1, p1)
				Signal2(Copy)
				
				return
			end
		end,
		dismiss = function(Id)
			-- upvalues: Signal (copy), Signal2 (copy)
			local List = {}
			
			for _, value in Signal(false) do
				if value.id ~= Id then
					table.insert(List, value)
				end
			end
			Signal2(List)
		end,
		reset = function()
			-- upvalues: t (ref), Signal2 (copy)
			t = {}
			Signal2({})
		end
	}
end