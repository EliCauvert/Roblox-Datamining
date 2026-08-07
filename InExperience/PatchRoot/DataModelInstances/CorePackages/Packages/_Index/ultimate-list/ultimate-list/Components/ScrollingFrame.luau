local runService = game:GetService("RunService")
local var1 = script:FindFirstAncestor("ultimate-list")
local _ = require(var1.DataSources)
local _ = require(var1.Dimensions)
local reactModule = require(var1.Parent.React)
local reactBindingsRendererModule = require(var1.Renderers.ReactBindingsRenderer)
local reactStateRendererModule = require(var1.Renderers.ReactStateRenderer)
local _ = require(var1.Renderers)
local createVirtualizedListControllerModule = require(var1.createVirtualizedListController)
local exhaustiveMatchModule = require(var1.Util.exhaustiveMatch)
local createElement = reactModule.createElement

return function(p0) --[[ line: 15 | named "ScrollingFrame" ]]
	-- upvalues: reactModule (ref), createVirtualizedListControllerModule (ref), exhaustiveMatchModule (ref), runService (ref), createElement (ref), reactStateRendererModule (ref), reactBindingsRendererModule (ref)
	local var7 = reactModule.useState(function() --[[ line: 34 ]]
		-- upvalues: createVirtualizedListControllerModule (copy), p0 (ref)
		return createVirtualizedListControllerModule(p0.dataSource, p0.dimensions, p0.direction)
	end)
	reactModule.useEffect(function() --[[ line: 38 ]]
		-- upvalues: var7 (ref)
		return function() --[[ line: 39 ]]
			-- upvalues: var7 (copy)
			return var7.destroy()
		end
	end, {})
	local var8, var9 = reactModule.useBinding(var7.getCanvasSize())
	local var10, var11 = reactModule.useBinding(Vector2.zero)
	local var12, var13 = reactModule.useBinding(0)
	reactModule.useEffect(function() --[[ line: 48 ]]
		-- upvalues: var7 (ref), var9 (ref)
		return var7.bindToUpdate(function() --[[ line: 49 ]]
			-- upvalues: var9 (copy), var7 (copy)
			var9(var7.getCanvasSize())
		end)
	end, {})
	local var14 = reactModule.useCallback(function(p1) --[[ line: 54 ]]
		-- upvalues: var11 (ref), var7 (ref), p0 (ref)
		var11(p1.AbsoluteWindowSize)
		var7.setWindowSize(p1.AbsoluteWindowSize)
		
		if p0.onAbsoluteWindowSizeChanged ~= nil then
			p0.onAbsoluteWindowSizeChanged(p1.AbsoluteWindowSize)
		end
	end, { p0.direction, p0.onAbsoluteWindowSizeChanged })
	local var15 = reactModule.useCallback(function(p2) --[[ line: 63 ]]
		-- upvalues: p0 (ref), exhaustiveMatchModule (copy), runService (copy), var7 (ref), var13 (ref)
		local var17 = if p0.direction == "x" then p2.CanvasPosition.X elseif p0.direction == "y" then p2.CanvasPosition.Y else exhaustiveMatchModule(p0.direction)
		runService.Heartbeat:Once(function() --[[ line: 71 ]]
			-- upvalues: var7 (copy), var17 (ref), var13 (copy), p0 (copy)
			var7.setScrollAxis(var17)
			var13(var17)
			
			if p0.onScrollAxisChanged ~= nil then
				p0.onScrollAxisChanged(var17)
			end
		end)
	end, { p0.direction, p0.onScrollAxisChanged })
	reactModule.useEffect(function() --[[ line: 81 ]]
		-- upvalues: var7 (ref), p0 (ref)
		var7.setDataSource(p0.dataSource)
	end, { p0.dataSource })
	reactModule.useEffect(function() --[[ line: 85 ]]
		-- upvalues: var7 (ref), p0 (ref)
		var7.setDimensions(p0.dimensions)
	end, { p0.dimensions })
	local t = {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = var8,
		[reactModule.Change.AbsoluteWindowSize] = var14,
		[reactModule.Change.CanvasPosition] = var15,
		[reactModule.Tag] = p0.tag,
		ref = p0.scrollingFrameRef
	}
	
	if p0.native ~= nil then
		for i, v in p0.native do
			if t[i] ~= nil then
				error(`{i} is already used by UltimateList`)
			end
			t[i] = v
		end
	end
	return createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		ScrollingFrame = createElement("ScrollingFrame", t),
		RendererOverlay = createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			ZIndex = 2,
			Size = var10:map(function(p3) --[[ line: 124 ]]
				return UDim2.fromOffset(p3.X, p3.Y)
			end)
		}, {
			Renderer = if p0.renderer.type == "byState" then createElement(reactStateRendererModule, {
				virtualizedListController = var7,
				config = p0.renderer.config,
				dimensions = p0.dimensions,
				direction = p0.direction,
				callback = p0.renderer.callback,
				getKey = p0.getKey,
				scrollAxisBinding = var12
			}) elseif p0.renderer.type == "byBinding" then createElement(reactBindingsRendererModule, {
				virtualizedListController = var7,
				scrollAxisBinding = var12,
				dimensions = p0.dimensions,
				direction = p0.direction,
				callback = p0.renderer.callback,
				getKey = p0.getKey
			}) else exhaustiveMatchModule(p0.renderer.type)
		})
	})
end