local RunService = game:GetService("RunService")
local UltimateList = script:FindFirstAncestor("ultimate-list")
local _ = require(UltimateList.DataSources)
local _ = require(UltimateList.Dimensions)
local ReactModule = require(UltimateList.Parent.React)
local ReactBindingsRendererModule = require(UltimateList.Renderers.ReactBindingsRenderer)
local ReactStateRendererModule = require(UltimateList.Renderers.ReactStateRenderer)
local _ = require(UltimateList.Renderers)
local CreateVirtualizedListControllerModule = require(UltimateList.createVirtualizedListController)
local ExhaustiveMatchModule = require(UltimateList.Util.exhaustiveMatch)
local CreateElementFunction = ReactModule.createElement

return function(p1)
	-- upvalues: ReactModule (copy), CreateVirtualizedListControllerModule (copy), ExhaustiveMatchModule (copy), RunService (copy), CreateElementFunction (copy), ReactStateRendererModule (copy), ReactBindingsRendererModule (copy)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: CreateVirtualizedListControllerModule (upval), p1 (copy)
		return CreateVirtualizedListControllerModule(p1.dataSource, p1.dimensions, p1.direction)
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy)
		return function()
			-- upvalues: UseStateResult (upval)
			return UseStateResult.destroy()
		end
	end, {})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UseStateResult.getCanvasSize())
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(Vector2.zero)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseBindingResult2 (copy)
		return UseStateResult.bindToUpdate(function()
			-- upvalues: UseBindingResult2 (upval), UseStateResult (upval)
			UseBindingResult2(UseStateResult.getCanvasSize())
		end)
	end, {})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult2_1 (copy), UseStateResult (copy), p1 (copy)
		UseBindingResult2_1(p2.AbsoluteWindowSize)
		UseStateResult.setWindowSize(p2.AbsoluteWindowSize)
		
		if p1.onAbsoluteWindowSizeChanged ~= nil then
			p1.onAbsoluteWindowSizeChanged(p2.AbsoluteWindowSize)
		end
	end, { p1.direction, p1.onAbsoluteWindowSizeChanged })
	local UseResult1 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: p1 (copy), ExhaustiveMatchModule (upval), RunService (upval), UseStateResult (copy), UseBindingResult2_2 (copy)
		local X = if p1.direction == "x" then ScrollFrame.CanvasPosition.X elseif p1.direction == "y" then ScrollFrame.CanvasPosition.Y else ExhaustiveMatchModule(p1.direction)
		RunService.Heartbeat:Once(function()
			-- upvalues: UseStateResult (upval), X (copy), UseBindingResult2_2 (upval), p1 (upval)
			UseStateResult.setScrollAxis(X)
			UseBindingResult2_2(X)
			
			if p1.onScrollAxisChanged ~= nil then
				p1.onScrollAxisChanged(X)
			end
		end)
	end, { p1.direction, p1.onScrollAxisChanged })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), p1 (copy)
		UseStateResult.setDataSource(p1.dataSource)
	end, { p1.dataSource })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), p1 (copy)
		UseStateResult.setDimensions(p1.dimensions)
	end, { p1.dimensions })
	local config = {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = UseBindingResult,
		[ReactModule.Change.AbsoluteWindowSize] = UseResult,
		[ReactModule.Change.CanvasPosition] = UseResult1,
		[ReactModule.Tag] = p1.tag,
		ref = p1.scrollingFrameRef
	}
	
	if p1.native ~= nil then
		for i, value in p1.native do
			if config[i] ~= nil then
				error(`{i} is already used by UltimateList`)
			end
			config[i] = value
		end
	end
	return CreateElementFunction("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		ScrollingFrame = CreateElementFunction("ScrollingFrame", config),
		RendererOverlay = CreateElementFunction("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			ZIndex = 2,
			Size = UseBindingResult1:map(function(Vector): UDim2
				return UDim2.fromOffset(Vector.X, Vector.Y)
			end)
		}, {
			Renderer = if p1.renderer.type == "byState" then CreateElementFunction(ReactStateRendererModule, {
				virtualizedListController = UseStateResult,
				config = p1.renderer.config,
				dimensions = p1.dimensions,
				direction = p1.direction,
				callback = p1.renderer.callback,
				getKey = p1.getKey,
				scrollAxisBinding = UseBindingResult3
			}) elseif p1.renderer.type == "byBinding" then CreateElementFunction(ReactBindingsRendererModule, {
				virtualizedListController = UseStateResult,
				scrollAxisBinding = UseBindingResult3,
				dimensions = p1.dimensions,
				direction = p1.direction,
				callback = p1.renderer.callback,
				getKey = p1.getKey
			}) else ExhaustiveMatchModule(p1.renderer.type)
		})
	})
end