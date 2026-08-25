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

return function(p1)
	-- upvalues: reactModule (ref), createVirtualizedListControllerModule (ref), exhaustiveMatchModule (ref), runService (ref), createElement (ref), reactStateRendererModule (ref), reactBindingsRendererModule (ref)
	local var1 = reactModule.useState(function()
		-- upvalues: createVirtualizedListControllerModule (copy), p1 (ref)
		return createVirtualizedListControllerModule(p1.dataSource, p1.dimensions, p1.direction)
	end)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			return var1.destroy()
		end
	end, {})
	local var2, var3 = reactModule.useBinding(var1.getCanvasSize())
	local var4, var5 = reactModule.useBinding(Vector2.zero)
	local var6, var7 = reactModule.useBinding(0)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		return var1.bindToUpdate(function()
			-- upvalues: var3 (copy), var1 (copy)
			var3(var1.getCanvasSize())
		end)
	end, {})
	local var8 = reactModule.useCallback(function(p1)
		-- upvalues: var5 (ref), var1 (ref), p1 (ref)
		var5(p1.AbsoluteWindowSize)
		var1.setWindowSize(p1.AbsoluteWindowSize)
		
		if p1.onAbsoluteWindowSizeChanged ~= nil then
			p1.onAbsoluteWindowSizeChanged(p1.AbsoluteWindowSize)
		end
	end, { p1.direction, p1.onAbsoluteWindowSizeChanged })
	local var9 = reactModule.useCallback(function(p1)
		-- upvalues: p1 (ref), exhaustiveMatchModule (copy), runService (copy), var1 (ref), var7 (ref)
		local var1 = if p1.direction == "x" then p1.CanvasPosition.X elseif p1.direction == "y" then p1.CanvasPosition.Y else exhaustiveMatchModule(p1.direction)
		runService.Heartbeat:Once(function()
			-- upvalues: var1 (copy), var1 (ref), var7 (copy), p1 (copy)
			var1.setScrollAxis(var1)
			var7(var1)
			
			if p1.onScrollAxisChanged ~= nil then
				p1.onScrollAxisChanged(var1)
			end
		end)
	end, { p1.direction, p1.onScrollAxisChanged })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		var1.setDataSource(p1.dataSource)
	end, { p1.dataSource })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		var1.setDimensions(p1.dimensions)
	end, { p1.dimensions })
	local t = {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = var2,
		[reactModule.Change.AbsoluteWindowSize] = var8,
		[reactModule.Change.CanvasPosition] = var9,
		[reactModule.Tag] = p1.tag,
		ref = p1.scrollingFrameRef
	}
	
	if p1.native ~= nil then
		for i, v in p1.native do
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
			Size = var4:map(function(p1)
				return UDim2.fromOffset(p1.X, p1.Y)
			end)
		}, {
			Renderer = if p1.renderer.type == "byState" then createElement(reactStateRendererModule, {
				virtualizedListController = var1,
				config = p1.renderer.config,
				dimensions = p1.dimensions,
				direction = p1.direction,
				callback = p1.renderer.callback,
				getKey = p1.getKey,
				scrollAxisBinding = var6
			}) elseif p1.renderer.type == "byBinding" then createElement(reactBindingsRendererModule, {
				virtualizedListController = var1,
				scrollAxisBinding = var6,
				dimensions = p1.dimensions,
				direction = p1.direction,
				callback = p1.renderer.callback,
				getKey = p1.getKey
			}) else exhaustiveMatchModule(p1.renderer.type)
		})
	})
end