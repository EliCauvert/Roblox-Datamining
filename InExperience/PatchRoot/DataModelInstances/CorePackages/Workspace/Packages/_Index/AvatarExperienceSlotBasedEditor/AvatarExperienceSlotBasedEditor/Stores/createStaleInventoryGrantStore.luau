local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy), CryoModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local t = {}
	
	return {
		getStaleSearchUuids = Signal,
		getRemovedItemIds = function(p1)
			-- upvalues: t (copy)
			return t[p1]
		end,
		isSearchUuidStale = function(p1): boolean
			-- upvalues: Signal (copy)
			return Signal(false)[p1] == true
		end,
		markSearchUuidStale = function(Key, Tbl)
			-- upvalues: t (copy), CryoModule (upval), Signal (copy), Signal2 (copy)
			if Tbl then
				local Entry = t[Key]
				
				if Entry then
					for _, value in Tbl do
						if not CryoModule.List.find(Entry, value) then
							Entry[#Entry + 1] = value
						end
					end
				else
					t[Key] = table.clone(Tbl)
				end
			end
			if Signal(false)[Key] ~= true then
				Signal2(CryoModule.Dictionary.join(Signal(false), { [Key] = true }))
				
				return
			end
		end,
		clearSearchUuidStale = function(Key)
			-- upvalues: t (copy), Signal (copy), Signal2 (copy), CryoModule (upval)
			t[Key] = nil
			
			if Signal(false)[Key] == true then
				Signal2(CryoModule.Dictionary.join(Signal(false), { [Key] = CryoModule.None }))
				
				return
			end
		end
	}
end