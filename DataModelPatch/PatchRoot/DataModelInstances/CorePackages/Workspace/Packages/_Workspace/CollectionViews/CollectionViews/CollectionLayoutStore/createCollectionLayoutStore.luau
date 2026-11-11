local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local SignalsModule = require(Parent.Signals)
local DisplayModule = require(Parent.Display)
local CollectionItemSize = require(CollectionViews.CollectionViewTypes).CollectionItemSize
local CollectionBreakpointConfigModule = require(script.Parent.CollectionBreakpointConfig)
local ResolveBreakpointFunction = CollectionBreakpointConfigModule.resolveBreakpoint
local GetItemsPerRowFunction = CollectionBreakpointConfigModule.getItemsPerRow

return function(Callback, p1)
	-- upvalues: DisplayModule (copy), SignalsModule (copy), ResolveBreakpointFunction (copy), CollectionItemSize (copy), GetItemsPerRowFunction (copy)
	local GetPlatformScaleFunction = DisplayModule.GetDisplayStore(false).getPlatformScale
	local Computed = SignalsModule.createComputed(function(p2): boolean
		-- upvalues: Callback (copy)
		return Callback(p2) > 0
	end)
	local Computed1 = if p1 then SignalsModule.createComputed(function(p2)
		-- upvalues: Callback (copy), p1 (copy)
		local CallbackResult: number = Callback(p2)
		
		return if CallbackResult > 0 then CallbackResult else p1.getContainerWidth(p2)
	end) else Callback
	local Computed2 = SignalsModule.createComputed(function(p2)
		-- upvalues: Computed1 (copy), GetPlatformScaleFunction (copy)
		return Computed1(p2) / GetPlatformScaleFunction(p2)
	end)
	local Computed3 = SignalsModule.createComputed(function(p2)
		-- upvalues: ResolveBreakpointFunction (upval), Computed2 (copy)
		return ResolveBreakpointFunction(Computed2(p2))
	end)
	local GetItemsPerRow = {}
	
	for _, value in {
		CollectionItemSize.XSmall,
		CollectionItemSize.Small,
		CollectionItemSize.Medium,
		CollectionItemSize.Large,
		CollectionItemSize.XLarge
	} do
		GetItemsPerRow[value] = SignalsModule.createComputed(function(p2)
			-- upvalues: GetItemsPerRowFunction (upval), Computed3 (copy), value (copy)
			return GetItemsPerRowFunction(Computed3(p2), value)
		end)
	end
	return {
		getContainerWidth = Computed1,
		getDesignSpaceContainerWidth = Computed2,
		getItemsPerRow = GetItemsPerRow,
		getNumItemsForAllCategories = SignalsModule.createComputed(function(p2)
			-- upvalues: GetItemsPerRow (copy)
			local t = {}
			
			for i, value in GetItemsPerRow do
				t[i] = value(p2)
			end
			return t
		end),
		getIsContainerMeasured = Computed
	}
end