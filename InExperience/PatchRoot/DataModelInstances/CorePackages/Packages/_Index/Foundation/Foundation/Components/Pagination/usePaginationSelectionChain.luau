local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local useRefCache = require(parent.ReactUtils).useRefCache
local _ = require(foundation.Components.Types)

return function(p1, p2, p3)
	-- upvalues: useRefCache (ref), reactModule (ref)
	local var1 = useRefCache()
	local var2 = p1[1]
	local var3 = reactModule.useCallback(function(p4)
		-- upvalues: var1 (ref), var2 (ref), p3 (ref)
		local var4 = var1[p4]
		
		return if var2 == p4 and p3 ~= nil then function(p5)
			-- upvalues: var4 (ref), p3 (copy)
			var4.current = p5
			p3(p5)
		end else var4
	end, { var2, p3, var1 })
	local var4 = reactModule.useCallback(function(p4)
		-- upvalues: p1 (ref), var1 (ref), p2 (ref)
		local index = table.find(p1, p4)
		
		return if index == nil then { Selectable = false, ref = var1[p4] } else {
			Selectable = true,
			ref = var1[p4],
			NextSelectionLeft = if index > 1 then var1[p1[index - 1]] else nil,
			NextSelectionRight = if index < #p1 then var1[p1[index + 1]] else nil,
			NextSelectionUp = p2 and p2.NextSelectionUp,
			NextSelectionDown = p2 and p2.NextSelectionDown
		}
	end, { p1, var1, p2 })
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), var4 (ref), var3 (ref)
		return {
			firstSlotId = var2,
			getSlotBindings = var4,
			getSlotRef = var3
		}
	end, { var2, var4, var3 })
end