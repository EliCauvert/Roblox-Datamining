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
	local t5 = {}
	local t6 = {}
	
	local function add(p1)
		-- upvalues: t4 (ref), t5 (ref), t (ref), t1 (ref), Signal (copy), Signal2 (copy)
		if t4[p1.id] then return end
		t4[p1.id] = true
		
		if p1.cardType == "Live" then
			t5[p1.id] = true
		end
		t[p1.id] = nil
		t1[p1.id] = nil
		local Copy = table.clone(Signal(false))
		table.insert(Copy, 1, p1)
		Signal2(Copy)
	end
	
	return {
		getCards = Signal,
		add = add,
		markUploading = function(Key)
			-- upvalues: t4 (ref), t1 (ref)
			if not t4[Key] then
				t1[Key] = true
			end
		end,
		isUploading = function(p1): boolean
			-- upvalues: t1 (ref)
			return t1[p1] == true
		end,
		awaitLiveCard = function(Key)
			-- upvalues: t1 (ref), t4 (ref), t (ref)
			t1[Key] = nil
			
			if not t4[Key] then
				t[Key] = true
			end
		end,
		isAwaitingLiveCard = function(p1): boolean
			-- upvalues: t (ref)
			return t[p1] == true
		end,
		markToastHiddenFor = function(Key)
			-- upvalues: t2 (ref)
			t2[Key] = true
		end,
		hadToastHidden = function(p1): boolean
			-- upvalues: t2 (ref)
			return t2[p1] == true
		end,
		markToastProbablySpentFor = function(Key)
			-- upvalues: t3 (ref)
			t3[Key] = true
		end,
		hadToastProbablySpent = function(p1): boolean
			-- upvalues: t3 (ref)
			return t3[p1] == true
		end,
		stopAwaitingLiveCard = function(Key, p1)
			-- upvalues: t1 (ref), t (ref), t2 (ref), add (copy)
			t1[Key] = nil
			
			if not t[Key] then return end
			t[Key] = nil
			
			if p1 ~= nil and t2[Key] then
				add(p1)
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
			-- upvalues: t5 (ref)
			return t5[p1] == true
		end,
		markShown = function(Key): boolean
			-- upvalues: t6 (ref)
			if t6[Key] then
				return false
			else
				t6[Key] = true
				
				return true
			end
		end,
		reset = function()
			-- upvalues: t (ref), t1 (ref), t2 (ref), t3 (ref), t4 (ref), t5 (ref), t6 (ref), Signal2 (copy)
			t = {}
			t1 = {}
			t2 = {}
			t3 = {}
			t4 = {}
			t5 = {}
			t6 = {}
			Signal2({})
		end
	}
end