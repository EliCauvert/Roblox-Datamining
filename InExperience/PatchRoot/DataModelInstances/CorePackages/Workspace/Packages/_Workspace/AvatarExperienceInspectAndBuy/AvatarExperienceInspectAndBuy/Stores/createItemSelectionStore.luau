local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.AXCommon)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	local t = {}
	
	return {
		getItemDataMap = var1,
		getItemData = function(p1)
			-- upvalues: t (ref), signalsModule (copy), var1 (ref)
			if t[p1] == nil then
				t[p1] = signalsModule.createComputed(function(p2)
					-- upvalues: var1 (copy), p1 (ref)
					return var1(p2)[p1]
				end)
			end
			return t[p1]
		end,
		setItemData = function(value, p1)
			-- upvalues: var1 (ref), var2 (ref)
			local cloned = table.clone(var1(false))
			cloned[value] = p1
			var2(cloned)
		end,
		clearItemData = function(p1)
			-- upvalues: var1 (ref), var2 (ref)
			local cloned = table.clone(var1(false))
			cloned[p1] = nil
			var2(cloned)
		end,
		clearAll = function()
			-- upvalues: var2 (ref)
			var2({})
		end
	}
end