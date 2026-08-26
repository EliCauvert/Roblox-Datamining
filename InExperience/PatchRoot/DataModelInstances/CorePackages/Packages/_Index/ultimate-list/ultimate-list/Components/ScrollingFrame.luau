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
	local var2 = reactModule.useState(function()
		-- upvalues: createVirtualizedListControllerModule (copy), p1 (ref)
		return createVirtualizedListControllerModule(p1.dataSource, p1.dimensions, p1.direction)
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			return var2.destroy()
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
	end, {})
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), var2 (ref), p1 (ref)
		var6(p2.AbsoluteWindowSize)
		var2.setWindowSize(p2.AbsoluteWindowSize)
		
		if p1.onAbsoluteWindowSizeChanged ~= nil then
			p1.onAbsoluteWindowSizeChanged(p2.AbsoluteWindowSize)
		end
	end, { p1.direction, p1.onAbsoluteWindowSizeChanged })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), exhaustiveMatchModule (copy), runService (copy), var2 (ref), var8 (ref)
		local var11 = if p1.direction == "x" then p2.CanvasPosition.X elseif p1.direction == "y" then p2.CanvasPosition.Y else exhaustiveMatchModule(p1.direction)
		runService.Heartbeat:Once(function()
			-- upvalues: var2 (copy), var11 (ref), var8 (copy), p1 (copy)
			var2.setScrollAxis(var11)
			var8(var11)
			
			if p1.onScrollAxisChanged ~= nil then
				p1.onScrollAxisChanged(var11)
			end
		end)
	end, { p1.direction, p1.onScrollAxisChanged })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.setDataSource(p1.dataSource)
	end, { p1.dataSource })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.setDimensions(p1.dimensions)
	end, { p1.dimensions })
	local t = {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = var3,
		[reactModule.Change.AbsoluteWindowSize] = var9,
		[reactModule.Change.CanvasPosition] = var10,
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
			Size = var5:map(function(p2)
				return UDim2.fromOffset(p2.X, p2.Y)
			end)
		}, {
			Renderer = if p1.renderer.type == "byState" then createElement(reactStateRendererModule, {
				virtualizedListController = var2,
				config = p1.renderer.config,
				dimensions = p1.dimensions,
				direction = p1.direction,
				callback = p1.renderer.callback,
				getKey = p1.getKey,
				scrollAxisBinding = var7
			}) elseif p1.renderer.type == "byBinding" then createElement(reactBindingsRendererModule, {
				virtualizedListController = var2,
				scrollAxisBinding = var7,
				dimensions = p1.dimensions,
				direction = p1.direction,
				callback = p1.renderer.callback,
				getKey = p1.getKey
			}) else exhaustiveMatchModule(p1.renderer.type)
		})
	})
end