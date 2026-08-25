local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local useRefCache = require(parent.ReactUtils).useRefCache
local _ = require(foundation.Components.Types)

return function(p0, p1, p2)
	-- upvalues: useRefCache (ref), reactModule (ref)
	local var2 = useRefCache()
	local var3 = p0[1]
	local var4 = reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref), var3 (ref), p2 (ref)
		local var6 = var2[p3]
		
		return if var3 == p3 and p2 ~= nil then function(p4)
			-- upvalues: var6 (ref), p2 (copy)
			var6.current = p4
			p2(p4)
		end else var6
	end, { var3, p2, var2 })
	local var5 = reactModule.useCallback(function(p5)
		-- upvalues: p0 (ref), var2 (ref), p1 (ref)
		local index = table.find(p0, p5)
		
		return if index == nil then { Selectable = false, ref = var2[p5] } else {
			Selectable = true,
			ref = var2[p5],
			NextSelectionLeft = if index > 1 then var2[p0[index - 1]] else nil,
			NextSelectionRight = if index < #p0 then var2[p0[index + 1]] else nil,
			NextSelectionUp = p1 and p1.NextSelectionUp,
			NextSelectionDown = p1 and p1.NextSelectionDown
		}
	end, { p0, var2, p1 })
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var5 (ref), var4 (ref)
		return {
			firstSlotId = var3,
			getSlotBindings = var5,
			getSlotRef = var4
		}
	end, { var3, var5, var4 })
end