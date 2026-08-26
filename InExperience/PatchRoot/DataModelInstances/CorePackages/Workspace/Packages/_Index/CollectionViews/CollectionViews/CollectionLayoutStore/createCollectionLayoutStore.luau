local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local signalsModule = require(parent.Signals)
local displayModule = require(parent.Display)
local collectionItemSize = require(collectionViews.CollectionViewTypes).CollectionItemSize
local collectionBreakpointConfigModule = require(script.Parent.CollectionBreakpointConfig)
local resolveBreakpoint = collectionBreakpointConfigModule.resolveBreakpoint
local getItemsPerRow = collectionBreakpointConfigModule.getItemsPerRow

return function(p1, p2)
	-- upvalues: displayModule (ref), signalsModule (ref), resolveBreakpoint (ref), collectionItemSize (ref), getItemsPerRow (ref)
	local getPlatformScale = displayModule.GetDisplayStore(false).getPlatformScale
	local var1 = signalsModule.createComputed(function(p3)
		-- upvalues: p1 (ref)
		return p1(p3) > 0
	end)
	local var2 = if p2 then signalsModule.createComputed(function(p3)
		-- upvalues: p1 (ref), p2 (ref)
		local var3 = p1(p3)
		
		return if var3 > 0 then var3 else p2.getContainerWidth(p3)
	end) else p1
	local var3 = signalsModule.createComputed(function(p3)
		-- upvalues: var2 (ref), getPlatformScale (ref)
		return var2(p3) / getPlatformScale(p3)
	end)
	local var4 = signalsModule.createComputed(function(p3)
		-- upvalues: resolveBreakpoint (copy), var3 (ref)
		return resolveBreakpoint(var3(p3))
	end)
	local t = {}
	
	for i, v in {
		collectionItemSize.XSmall,
		collectionItemSize.Small,
		collectionItemSize.Medium,
		collectionItemSize.Large,
		collectionItemSize.XLarge
	} do
		t[v] = signalsModule.createComputed(function(p3)
			-- upvalues: getItemsPerRow (copy), var4 (ref), v (ref)
			return getItemsPerRow(var4(p3), v)
		end)
	end
	return {
		getContainerWidth = var2,
		getDesignSpaceContainerWidth = var3,
		getItemsPerRow = t,
		getNumItemsForAllCategories = signalsModule.createComputed(function(p3)
			-- upvalues: t (ref)
			local t_1 = {}
			
			for i, v in t do
				t_1[i] = v(p3)
			end
			return t_1
		end),
		getIsContainerMeasured = var1
	}
end