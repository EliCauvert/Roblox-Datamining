local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local signalsModule = require(parent.Signals)
local displayModule = require(parent.Display)
local collectionItemSize = require(collectionViews.CollectionViewTypes).CollectionItemSize
local collectionBreakpointConfigModule = require(script.Parent.CollectionBreakpointConfig)
local resolveBreakpoint = collectionBreakpointConfigModule.resolveBreakpoint
local getItemsPerRow = collectionBreakpointConfigModule.getItemsPerRow

return function(p0, p1)
	-- upvalues: displayModule (ref), signalsModule (ref), resolveBreakpoint (ref), collectionItemSize (ref), getItemsPerRow (ref)
	local getPlatformScale = displayModule.GetDisplayStore(false).getPlatformScale
	local var4 = signalsModule.createComputed(function(p2)
		-- upvalues: p0 (ref)
		return p0(p2) > 0
	end)
	local var5 = if p1 then signalsModule.createComputed(function(p3)
		-- upvalues: p0 (ref), p1 (ref)
		local var9 = p0(p3)
		
		return if var9 > 0 then var9 else p1.getContainerWidth(p3)
	end) else p0
	local var6 = signalsModule.createComputed(function(p4)
		-- upvalues: var5 (ref), getPlatformScale (ref)
		return var5(p4) / getPlatformScale(p4)
	end)
	local var7 = signalsModule.createComputed(function(p5)
		-- upvalues: resolveBreakpoint (copy), var6 (ref)
		return resolveBreakpoint(var6(p5))
	end)
	local t = {}
	
	for i, v in {
		collectionItemSize.XSmall,
		collectionItemSize.Small,
		collectionItemSize.Medium,
		collectionItemSize.Large,
		collectionItemSize.XLarge
	} do
		t[v] = signalsModule.createComputed(function(p6)
			-- upvalues: getItemsPerRow (copy), var7 (ref), v (ref)
			return getItemsPerRow(var7(p6), v)
		end)
	end
	return {
		getContainerWidth = var5,
		getDesignSpaceContainerWidth = var6,
		getItemsPerRow = t,
		getNumItemsForAllCategories = signalsModule.createComputed(function(p7)
			-- upvalues: t (ref)
			local t_1 = {}
			
			for i, v in t do
				t_1[i] = v(p7)
			end
			return t_1
		end),
		getIsContainerMeasured = var4
	}
end