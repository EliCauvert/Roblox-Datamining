local var1 = script:FindFirstAncestor("ultimate-list")
local _ = require(var1.Dimensions)
local reactModule = require(var1.Parent.React)
local reactBindingsRendererModule = require(var1.Renderers.ReactBindingsRenderer)
local reactStateRendererModule = require(var1.Renderers.ReactStateRenderer)
local _ = require(var1.Renderers)
local _ = require(var1.createVirtualizedListController)
local exhaustiveMatchModule = require(var1.Util.exhaustiveMatch)
local createElement = reactModule.createElement

return function(p1)
	-- upvalues: createElement (ref), exhaustiveMatchModule (ref), reactStateRendererModule (ref), reactBindingsRendererModule (ref)
	return createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 2,
		Position = p1.positionBinding,
		Size = p1.windowSizeBinding:map(function(p2)
			-- upvalues: p1 (ref), exhaustiveMatchModule (copy)
			return if p1.fillNonDominantAxis == true then if p1.direction == "x" then UDim2.new(0, p2.X, 1, 0) elseif p1.direction == "y" then UDim2.new(1, 0, 0, p2.Y) else exhaustiveMatchModule(p1.direction) else UDim2.fromOffset(p2.X, p2.Y)
		end)
	}, {
		Renderer = if p1.renderer.type == "byState" then createElement(reactStateRendererModule, {
			virtualizedListController = p1.virtualizedListController,
			config = p1.renderer.config,
			dimensions = p1.dimensions,
			direction = p1.direction,
			callback = p1.renderer.callback,
			getKey = p1.getKey,
			scrollAxisBinding = p1.scrollAxisBinding
		}) elseif p1.renderer.type == "byBinding" then createElement(reactBindingsRendererModule, {
			virtualizedListController = p1.virtualizedListController,
			scrollAxisBinding = p1.scrollAxisBinding,
			dimensions = p1.dimensions,
			direction = p1.direction,
			callback = p1.renderer.callback,
			getKey = p1.getKey
		}) else exhaustiveMatchModule(p1.renderer.type)
	})
end