local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SignalsModule = require(Parent.Signals)
local Signal = require(Parent.AppCommonLib).Signal
local ArraySet = require(AppChat.DataStructures).ArraySet

return function()
	-- upvalues: SignalsModule (copy), ArraySet (copy), Signal (copy)
	local Signal1, Signal2 = SignalsModule.createSignal(0)
	local Signal3, Signal2_1 = SignalsModule.createSignal(ArraySet.new({}))
	local Computed = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: Signal3 (copy), Signal1 (copy)
		return Signal3(p1):size() < Signal1(p1)
	end)
	local Computed1 = SignalsModule.createComputed(function(p1)
		-- upvalues: Signal3 (copy)
		return Signal3(p1):size()
	end)
	local Computed2 = SignalsModule.createComputed(function(p1)
		-- upvalues: Signal3 (copy)
		return Signal3(p1):toArray()
	end)
	local NewSignal = Signal.new()
	local t = {}
	local t1 = {}
	
	local function _()
		-- upvalues: NewSignal (ref)
		NewSignal:fire()
	end
	
	local function addUserId(p1): boolean
		-- upvalues: Signal3 (copy), Computed (copy), NewSignal (ref), Signal2_1 (copy)
		if Signal3(false):has(p1) then
			return true
		elseif Computed(false) then
			Signal2_1(function(p2)
				-- upvalues: p1 (copy)
				local Copy = p2:clone()
				Copy:add(p1)
				
				return Copy
			end)
			
			return true
		else
			NewSignal:fire()
			
			return false
		end
	end
	
	return {
		setMaxSize = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(function(_)
				-- upvalues: p1 (copy)
				return p1
			end)
		end,
		getSelectedUserIdsCount = function()
			-- upvalues: Computed1 (copy)
			return Computed1
		end,
		getSelectedUserIdAtIndex = function(Key)
			-- upvalues: t (ref), SignalsModule (upval), Signal3 (copy)
			if not t[Key] then
				t[Key] = SignalsModule.createComputed(function(p1)
					-- upvalues: Signal3 (upval), Key (copy)
					return Signal3(p1):at(Key)
				end)
			end
			return t[Key]
		end,
		getIsUserSelected = function(Key)
			-- upvalues: t1 (ref), SignalsModule (upval), Signal3 (copy)
			if not t1[Key] then
				t1[Key] = SignalsModule.createComputed(function(p1)
					-- upvalues: Signal3 (upval), Key (copy)
					return Signal3(p1):has(Key)
				end)
			end
			return t1[Key]
		end,
		getMaxSize = function()
			-- upvalues: Signal1 (copy)
			return Signal1
		end,
		getSelectedUserIdsArray = function()
			-- upvalues: Computed2 (copy)
			return Computed2
		end,
		addUserId = addUserId,
		removeUserId = function(p1)
			-- upvalues: Signal2_1 (copy)
			Signal2_1(function(p2)
				-- upvalues: p1 (copy)
				if p2:has(p1) then
					local Copy = p2:clone()
					Copy:remove(p1)
					
					return Copy
				else
					return p2
				end
			end)
		end,
		toggleUserId = function(p1)
			-- upvalues: Signal3 (copy), Signal2_1 (copy), addUserId (copy)
			if Signal3(false):has(p1) then
				Signal2_1(function(p2)
					-- upvalues: p1 (copy)
					if p2:has(p1) then
						local Copy = p2:clone()
						Copy:remove(p1)
						
						return Copy
					else
						return p2
					end
				end)
				
				return true
			else
				return (addUserId(p1))
			end
		end,
		clearStore = function()
			-- upvalues: NewSignal (ref), Signal (upval), t (ref), t1 (ref), Signal2_1 (copy), ArraySet (upval)
			NewSignal = Signal.new()
			t = {}
			t1 = {}
			Signal2_1(function(_)
				-- upvalues: ArraySet (upval)
				return ArraySet.new({})
			end)
		end,
		onMaxSizeExceeded = function(p1)
			-- upvalues: NewSignal (ref)
			local Connection = NewSignal:connect(p1)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:disconnect()
			end
		end,
		hasUserId = function(p1)
			-- upvalues: Signal3 (copy)
			return Signal3(false):has(p1)
		end,
		getCount = function()
			-- upvalues: Signal3 (copy)
			return Signal3(false):size()
		end
	}
end