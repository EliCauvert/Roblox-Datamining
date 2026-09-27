local runService = game:GetService("RunService")
local var1 = script:FindFirstAncestor("ultimate-list")
local _ = require(var1.DataSources)
local _ = require(var1.Dimensions)
local reactModule = require(var1.Parent.React)
local rendererOverlayModule = require(script.Parent.RendererOverlay)
local _ = require(var1.Renderers)
local exhaustiveMatchModule = require(var1.Util.exhaustiveMatch)
local useVirtualizedListModule = require(script.Parent.useVirtualizedList)
local createElement = reactModule.createElement

return function(p1)
	-- upvalues: useVirtualizedListModule (ref), reactModule (ref), exhaustiveMatchModule (ref), runService (ref), createElement (ref), rendererOverlayModule (ref)
	local var2 = useVirtualizedListModule(p1)
	local t = {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = var2.canvasSizeBinding,
		[reactModule.Change.AbsoluteWindowSize] = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref), p1 (ref)
			var2.setWindowSize(p2.AbsoluteWindowSize)
			
			if p1.onAbsoluteWindowSizeChanged ~= nil then
				p1.onAbsoluteWindowSizeChanged(p2.AbsoluteWindowSize)
			end
		end, { p1.direction, p1.onAbsoluteWindowSizeChanged }),
		[reactModule.Change.CanvasPosition] = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), exhaustiveMatchModule (copy), runService (copy), var2 (ref)
			local var3 = if p1.direction == "x" then p2.CanvasPosition.X elseif p1.direction == "y" then p2.CanvasPosition.Y else exhaustiveMatchModule(p1.direction)
			runService.Heartbeat:Once(function()
				-- upvalues: var2 (copy), var3 (ref), p1 (copy)
				var2.setScrollAxis(var3)
				
				if p1.onScrollAxisChanged ~= nil then
					p1.onScrollAxisChanged(var3)
				end
			end)
		end, { p1.direction, p1.onScrollAxisChanged }),
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
		RendererOverlay = createElement(rendererOverlayModule, {
			dimensions = p1.dimensions,
			renderer = p1.renderer,
			getKey = p1.getKey,
			direction = p1.direction,
			virtualizedListController = var2.virtualizedListController,
			windowSizeBinding = var2.windowSizeBinding,
			scrollAxisBinding = var2.scrollAxisBinding
		})
	})
end