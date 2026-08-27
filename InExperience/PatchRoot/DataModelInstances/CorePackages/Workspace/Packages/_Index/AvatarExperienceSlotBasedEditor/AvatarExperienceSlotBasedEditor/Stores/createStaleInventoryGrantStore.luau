local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)

return function()
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	local t = {}
	
	return {
		getStaleSearchUuids = var1,
		getRemovedItemIds = function(p1)
			-- upvalues: t (ref)
			return t[p1]
		end,
		isSearchUuidStale = function(p1)
			-- upvalues: var1 (ref)
			return var1(false)[p1] == true
		end,
		markSearchUuidStale = function(p1, p2)
			-- upvalues: t (ref), cryoModule (copy), var1 (ref), var2 (ref)
			if p2 then
				local var3 = t[p1]
				
				if var3 then
					for i, v in p2 do
						if not cryoModule.List.find(var3, v) then
							var3[#var3 + 1] = v
						end
					end
				else
					t[p1] = table.clone(p2)
				end
			end
			if var1(false)[p1] == true then
				return
			end
			var2(cryoModule.Dictionary.join(var1(false), { [p1] = true }))
		end,
		clearSearchUuidStale = function(p3)
			-- upvalues: t (ref), var1 (ref), var2 (ref), cryoModule (copy)
			t[p3] = nil
			
			if var1(false)[p3] == true then
				var2(cryoModule.Dictionary.join(var1(false), { [p3] = cryoModule.None }))
				
				return
			end
		end
	}
end