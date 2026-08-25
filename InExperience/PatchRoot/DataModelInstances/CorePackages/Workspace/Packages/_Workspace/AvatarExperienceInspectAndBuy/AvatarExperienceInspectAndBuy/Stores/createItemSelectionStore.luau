local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.AXCommon)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	local t = {}
	
	return {
		getItemDataMap = var1,
		getItemData = function(p0)
			-- upvalues: t (ref), signalsModule (copy), var1 (ref)
			if t[p0] == nil then
				t[p0] = signalsModule.createComputed(function(p1)
					-- upvalues: var1 (copy), p0 (ref)
					return var1(p1)[p0]
				end)
			end
			return t[p0]
		end,
		setItemData = function(value, p2)
			-- upvalues: var1 (ref), var2 (ref)
			local cloned = table.clone(var1(false))
			cloned[value] = p2
			var2(cloned)
		end,
		clearItemData = function(p3)
			-- upvalues: var1 (ref), var2 (ref)
			local cloned = table.clone(var1(false))
			cloned[p3] = nil
			var2(cloned)
		end,
		clearAll = function()
			-- upvalues: var2 (ref)
			var2({})
		end
	}
end