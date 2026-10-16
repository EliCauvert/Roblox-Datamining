local Parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.AXCommon)

return function() --[[ Line: 38 | Named "createItemSelectionStore" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local t = {}
	
	return {
		getItemDataMap = Signal,
		getItemData = function(Key) --[[ Line: 44 ]]
			-- upvalues: t (copy), SignalsModule (upval), Signal (copy)
			if t[Key] == nil then
				t[Key] = SignalsModule.createComputed(function(p1) --[[ Line: 46 ]]
					-- upvalues: Signal (upval), Key (copy)
					return Signal(p1)[Key]
				end)
			end
			return t[Key]
		end,
		setItemData = function(Key, p1) --[[ Line: 54 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local Copy = table.clone(Signal(false))
			Copy[Key] = p1
			Signal2(Copy)
		end,
		clearItemData = function(Key) --[[ Line: 60 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local Copy = table.clone(Signal(false))
			Copy[Key] = nil
			Signal2(Copy)
		end,
		clearAll = function() --[[ Line: 66 ]]
			-- upvalues: Signal2 (copy)
			Signal2({})
		end
	}
end