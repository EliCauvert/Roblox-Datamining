local UltimateList = script:FindFirstAncestor("ultimate-list")
local _ = require(UltimateList.DataSources)
local _ = require(UltimateList.Dimensions)
local ReactModule = require(UltimateList.Parent.React)
local CreateVirtualizedListControllerModule = require(UltimateList.createVirtualizedListController)

return function(p1) --[[ Line: 19 | Named "useVirtualizedList" ]]
	-- upvalues: ReactModule (copy), CreateVirtualizedListControllerModule (copy)
	local UseStateResult = ReactModule.useState(function() --[[ Line: 25 ]]
		-- upvalues: CreateVirtualizedListControllerModule (upval), p1 (copy)
		return CreateVirtualizedListControllerModule(p1.dataSource, p1.dimensions, p1.direction)
	end)
	ReactModule.useEffect(function() --[[ Line: 29 ]]
		-- upvalues: UseStateResult (copy)
		return function() --[[ Line: 30 ]]
			-- upvalues: UseStateResult (upval)
			UseStateResult.destroy()
		end
	end, {})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UseStateResult.getCanvasSize())
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(Vector2.zero)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(0)
	ReactModule.useEffect(function() --[[ Line: 39 ]]
		-- upvalues: UseStateResult (copy), UseBindingResult2 (copy)
		return UseStateResult.bindToUpdate(function() --[[ Line: 40 ]]
			-- upvalues: UseBindingResult2 (upval), UseStateResult (upval)
			UseBindingResult2(UseStateResult.getCanvasSize())
		end)
	end, { UseStateResult })
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 45 ]]
		-- upvalues: UseBindingResult2_1 (copy), UseStateResult (copy)
		UseBindingResult2_1(p2)
		UseStateResult.setWindowSize(p2)
	end, { UseStateResult })
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 50 ]]
		-- upvalues: UseStateResult (copy), UseBindingResult2_2 (copy)
		UseStateResult.setScrollAxis(p2)
		UseBindingResult2_2(p2)
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 55 ]]
		-- upvalues: UseStateResult (copy), p1 (copy)
		UseStateResult.setDataSource(p1.dataSource)
	end, { p1.dataSource })
	ReactModule.useEffect(function() --[[ Line: 59 ]]
		-- upvalues: UseStateResult (copy), p1 (copy)
		UseStateResult.setDimensions(p1.dimensions)
	end, { p1.dimensions })
	ReactModule.useEffect(function() --[[ Line: 63 ]]
		-- upvalues: UseStateResult (copy), p1 (copy)
		UseStateResult.setOverscan(p1.overscan or 0)
	end, { p1.overscan })
	
	return {
		virtualizedListController = UseStateResult,
		canvasSizeBinding = UseBindingResult,
		windowSizeBinding = UseBindingResult1,
		scrollAxisBinding = UseBindingResult3,
		setWindowSize = UseResult,
		setScrollAxis = UseResult1
	}
end