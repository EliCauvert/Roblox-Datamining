local var1 = script:FindFirstAncestor("ultimate-list")
local _ = require(var1.DataSources)
local _ = require(var1.Dimensions)
local reactModule = require(var1.Parent.React)
local createVirtualizedListControllerModule = require(var1.createVirtualizedListController)

return function(p1)
	-- upvalues: reactModule (ref), createVirtualizedListControllerModule (ref)
	local var2 = reactModule.useState(function()
		-- upvalues: createVirtualizedListControllerModule (copy), p1 (ref)
		return createVirtualizedListControllerModule(p1.dataSource, p1.dimensions, p1.direction)
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			var2.destroy()
		end
	end, {})
	local var3, var4 = reactModule.useBinding(var2.getCanvasSize())
	local var5, var6 = reactModule.useBinding(Vector2.zero)
	local var7, var8 = reactModule.useBinding(0)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		return var2.bindToUpdate(function()
			-- upvalues: var4 (copy), var2 (copy)
			var4(var2.getCanvasSize())
		end)
	end, { var2 })
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), var2 (ref)
		var6(p2)
		var2.setWindowSize(p2)
	end, { var2 })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var8 (ref)
		var2.setScrollAxis(p2)
		var8(p2)
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.setDataSource(p1.dataSource)
	end, { p1.dataSource })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.setDimensions(p1.dimensions)
	end, { p1.dimensions })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.setOverscan(p1.overscan or 0)
	end, { p1.overscan })
	
	return {
		virtualizedListController = var2,
		canvasSizeBinding = var3,
		windowSizeBinding = var5,
		scrollAxisBinding = var7,
		setWindowSize = var9,
		setScrollAxis = var10
	}
end