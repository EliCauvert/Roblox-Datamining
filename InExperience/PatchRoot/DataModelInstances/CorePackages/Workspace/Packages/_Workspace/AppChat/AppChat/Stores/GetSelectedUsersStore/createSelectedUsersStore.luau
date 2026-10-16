local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SignalsModule = require(Parent.Signals)
local Signal = require(Parent.AppCommonLib).Signal
local ArraySet = require(AppChat.DataStructures).ArraySet

return function() --[[ Line: 35 | Named "createSelectedUsersStore" ]]
	-- upvalues: SignalsModule (copy), ArraySet (copy), Signal (copy)
	local Signal1, Signal2 = SignalsModule.createSignal(0)
	local Signal3, Signal2_1 = SignalsModule.createSignal(ArraySet.new({}))
	local Computed = SignalsModule.createComputed(function(p1): boolean --[[ Line: 43 ]]
		-- upvalues: Signal3 (copy), Signal1 (copy)
		return Signal3(p1):size() < Signal1(p1)
	end)
	local Computed1 = SignalsModule.createComputed(function(p1) --[[ Line: 49 ]]
		-- upvalues: Signal3 (copy)
		return Signal3(p1):size()
	end)
	local Computed2 = SignalsModule.createComputed(function(p1) --[[ Line: 54 ]]
		-- upvalues: Signal3 (copy)
		return Signal3(p1):toArray()
	end)
	local NewSignal = Signal.new()
	local t = {}
	local t1 = {}
	
	local function _() --[[ Line: 66 | Named "emitMaxSizeExceeded" ]]
		-- upvalues: NewSignal (ref)
		NewSignal:fire()
	end
	
	local function addUserId(p1): boolean --[[ Line: 116 ]]
		-- upvalues: Signal3 (copy), Computed (copy), NewSignal (ref), Signal2_1 (copy)
		if Signal3(false):has(p1) then
			return true
		elseif Computed(false) then
			Signal2_1(function(p2) --[[ Line: 130 ]]
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
		setMaxSize = function(p1) --[[ Line: 70 ]]
			-- upvalues: Signal2 (copy)
			Signal2(function(_) --[[ Line: 71 ]]
				-- upvalues: p1 (copy)
				return p1
			end)
		end,
		getSelectedUserIdsCount = function() --[[ Line: 84 ]]
			-- upvalues: Computed1 (copy)
			return Computed1
		end,
		getSelectedUserIdAtIndex = function(Key) --[[ Line: 88 ]]
			-- upvalues: t (ref), SignalsModule (upval), Signal3 (copy)
			if not t[Key] then
				t[Key] = SignalsModule.createComputed(function(p1) --[[ Line: 90 ]]
					-- upvalues: Signal3 (upval), Key (copy)
					return Signal3(p1):at(Key)
				end)
			end
			return t[Key]
		end,
		getIsUserSelected = function(Key) --[[ Line: 98 ]]
			-- upvalues: t1 (ref), SignalsModule (upval), Signal3 (copy)
			if not t1[Key] then
				t1[Key] = SignalsModule.createComputed(function(p1) --[[ Line: 100 ]]
					-- upvalues: Signal3 (upval), Key (copy)
					return Signal3(p1):has(Key)
				end)
			end
			return t1[Key]
		end,
		getMaxSize = function() --[[ Line: 108 ]]
			-- upvalues: Signal1 (copy)
			return Signal1
		end,
		getSelectedUserIdsArray = function() --[[ Line: 112 ]]
			-- upvalues: Computed2 (copy)
			return Computed2
		end,
		addUserId = addUserId,
		removeUserId = function(p1) --[[ Line: 139 ]]
			-- upvalues: Signal2_1 (copy)
			Signal2_1(function(p2) --[[ Line: 140 ]]
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
		toggleUserId = function(p1) --[[ Line: 150 ]]
			-- upvalues: Signal3 (copy), Signal2_1 (copy), addUserId (copy)
			if Signal3(false):has(p1) then
				Signal2_1(function(p2) --[[ Line: 140 ]]
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
		clearStore = function() --[[ Line: 161 ]]
			-- upvalues: NewSignal (ref), Signal (upval), t (ref), t1 (ref), Signal2_1 (copy), ArraySet (upval)
			NewSignal = Signal.new()
			t = {}
			t1 = {}
			Signal2_1(function(_) --[[ Line: 165 ]]
				-- upvalues: ArraySet (upval)
				return ArraySet.new({})
			end)
		end,
		onMaxSizeExceeded = function(p1) --[[ Line: 76 ]]
			-- upvalues: NewSignal (ref)
			local Connection = NewSignal:connect(p1)
			
			return function() --[[ Line: 79 ]]
				-- upvalues: Connection (copy)
				Connection:disconnect()
			end
		end,
		hasUserId = function(p1) --[[ Line: 170 ]]
			-- upvalues: Signal3 (copy)
			return Signal3(false):has(p1)
		end,
		getCount = function() --[[ Line: 175 ]]
			-- upvalues: Signal3 (copy)
			return Signal3(false):size()
		end
	}
end