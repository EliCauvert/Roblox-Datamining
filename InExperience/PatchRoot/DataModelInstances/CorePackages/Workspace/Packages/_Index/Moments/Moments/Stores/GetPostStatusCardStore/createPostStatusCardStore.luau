local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.MomentsTypes)
local SignalsModule = require(Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local t = {}
	local t1 = {}
	local t2 = {}
	local t3 = {}
	local t4 = {}
	
	return {
		getCards = Signal,
		add = function(p1)
			-- upvalues: t2 (ref), t3 (ref), t (ref), Signal (copy), Signal2 (copy)
			if t2[p1.id] then return end
			t2[p1.id] = true
			
			if p1.cardType == "Live" then
				t3[p1.id] = true
			end
			t[p1.id] = nil
			local Copy = table.clone(Signal(false))
			table.insert(Copy, 1, p1)
			Signal2(Copy)
		end,
		awaitLiveCard = function(Key)
			-- upvalues: t2 (ref), t (ref)
			if not t2[Key] then
				t[Key] = true
			end
		end,
		isAwaitingLiveCard = function(p1): boolean
			-- upvalues: t (ref)
			return t[p1] == true
		end,
		markToastHiddenFor = function(Key)
			-- upvalues: t1 (ref)
			t1[Key] = true
		end,
		hadToastHidden = function(p1): boolean
			-- upvalues: t1 (ref)
			return t1[p1] == true
		end,
		stopAwaitingLiveCard = function(Key, p1)
			-- upvalues: t (ref), t1 (ref), t2 (ref), t3 (ref), Signal (copy), Signal2 (copy)
			if not t[Key] then return end
			t[Key] = nil
			
			if p1 ~= nil and t1[Key] then
				if t2[p1.id] then return end
				t2[p1.id] = true
				
				if p1.cardType == "Live" then
					t3[p1.id] = true
				end
				t[p1.id] = nil
				local Copy = table.clone(Signal(false))
				table.insert(Copy, 1, p1)
				Signal2(Copy)
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
		hasHadLiveCard = function(p1): boolean
			-- upvalues: t3 (ref)
			return t3[p1] == true
		end,
		markShown = function(Key): boolean
			-- upvalues: t4 (ref)
			if t4[Key] then
				return false
			else
				t4[Key] = true
				
				return true
			end
		end,
		reset = function()
			-- upvalues: t (ref), t1 (ref), t2 (ref), t3 (ref), t4 (ref), Signal2 (copy)
			t = {}
			t1 = {}
			t2 = {}
			t3 = {}
			t4 = {}
			Signal2({})
		end
	}
end