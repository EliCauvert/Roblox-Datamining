local UltimateList = script:FindFirstAncestor("ultimate-list")
local _ = require(UltimateList.Dimensions)
local ReactBindingsRendererModule = require(UltimateList.Renderers.ReactBindingsRenderer)
local ReactStateRendererModule = require(UltimateList.Renderers.ReactStateRenderer)
local _ = require(UltimateList.Renderers)
local _ = require(UltimateList.createVirtualizedListController)
local ExhaustiveMatchModule = require(UltimateList.Util.exhaustiveMatch)
local CreateElementFunction = require(UltimateList.Parent.React).createElement

return function(p1)
	-- upvalues: CreateElementFunction (copy), ExhaustiveMatchModule (copy), ReactStateRendererModule (copy), ReactBindingsRendererModule (copy)
	return CreateElementFunction("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 2,
		Position = p1.positionBinding,
		Size = p1.windowSizeBinding:map(function(Vector)
			-- upvalues: p1 (copy), ExhaustiveMatchModule (upval)
			return if p1.fillNonDominantAxis == true then if p1.direction == "x" then UDim2.new(0, Vector.X, 1, 0) elseif p1.direction == "y" then UDim2.new(1, 0, 0, Vector.Y) else ExhaustiveMatchModule(p1.direction) else UDim2.fromOffset(Vector.X, Vector.Y)
		end)
	}, {
		Renderer = if p1.renderer.type == "byState" then CreateElementFunction(ReactStateRendererModule, {
			virtualizedListController = p1.virtualizedListController,
			config = p1.renderer.config,
			dimensions = p1.dimensions,
			direction = p1.direction,
			callback = p1.renderer.callback,
			getKey = p1.getKey,
			scrollAxisBinding = p1.scrollAxisBinding
		}) elseif p1.renderer.type == "byBinding" then CreateElementFunction(ReactBindingsRendererModule, {
			virtualizedListController = p1.virtualizedListController,
			scrollAxisBinding = p1.scrollAxisBinding,
			dimensions = p1.dimensions,
			direction = p1.direction,
			callback = p1.renderer.callback,
			getKey = p1.getKey
		}) else ExhaustiveMatchModule(p1.renderer.type)
	})
end