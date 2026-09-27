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

local function _(p1, p2)
	-- upvalues: exhaustiveMatchModule (ref)
	return if p2 == "x" then p1.X elseif p2 == "y" then p1.Y else exhaustiveMatchModule(p2)
end

local _ = function(p1, p2)
	-- upvalues: exhaustiveMatchModule (ref)
	return if p2 == "x" then UDim2.fromOffset(p1, 0) elseif p2 == "y" then UDim2.fromOffset(0, p1) else exhaustiveMatchModule(p2)
end

local function getContentSize(p1, p2)
	-- upvalues: exhaustiveMatchModule (ref)
	return if p2 == "x" then UDim2.new(0, p1.X.Offset, 1, 0) elseif p2 == "y" then UDim2.new(1, 0, 0, p1.Y.Offset) else exhaustiveMatchModule(p2)
end

return function(p1)
	-- upvalues: useVirtualizedListModule (ref), reactModule (ref), exhaustiveMatchModule (ref), runService (ref), createElement (ref), getContentSize (ref), rendererOverlayModule (ref)
	local var2 = useVirtualizedListModule(p1)
	local var3, var4 = reactModule.useBinding(UDim2.new())
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), exhaustiveMatchModule (copy), var4 (ref), runService (copy)
		local current = p1.scrollingFrameRef.current
		assert(current ~= nil, "VirtualizedContent requires scrollingFrameRef.current to point to its ancestor ScrollingFrame")
		local var5 = nil
		local var6 = nil
		
		local function syncMetrics()
			-- upvalues: current (ref), var5 (write), var2 (copy), p1 (copy), exhaustiveMatchModule (copy), var4 (copy), var6 (write)
			local absoluteWindowSize = current.AbsoluteWindowSize
			
			if absoluteWindowSize ~= var5 then
				var5 = absoluteWindowSize
				var2.setWindowSize(absoluteWindowSize)
				
				if p1.onAbsoluteWindowSizeChanged ~= nil then
					p1.onAbsoluteWindowSizeChanged(absoluteWindowSize)
				end
			end
			local canvasPosition = current.CanvasPosition
			local direction = p1.direction
			local var7 = if direction == "x" then canvasPosition.X elseif direction == "y" then canvasPosition.Y else exhaustiveMatchModule(direction)
			local direction_1 = p1.direction
			var4(if direction_1 == "x" then UDim2.fromOffset(var7, 0) elseif direction_1 == "y" then UDim2.fromOffset(0, var7) else exhaustiveMatchModule(direction_1))
			var2.setScrollAxis(var7)
			
			if var7 ~= var6 then
				var6 = var7
				
				if p1.onScrollAxisChanged ~= nil then
					p1.onScrollAxisChanged(var7)
				end
			end
		end
		
		local list = {
			current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(syncMetrics),
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(syncMetrics),
			runService.RenderStepped:Connect(syncMetrics)
		}
		syncMetrics()
		
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, {
		p1.scrollingFrameRef, p1.direction, p1.onAbsoluteWindowSizeChanged,
		p1.onScrollAxisChanged, var2.setWindowSize, var2.setScrollAxis
	})
	
	return createElement("Frame", {
		BackgroundTransparency = 1,
		Size = var2.canvasSizeBinding:map(function(p2)
			-- upvalues: getContentSize (copy), p1 (ref)
			return getContentSize(p2, p1.direction)
		end)
	}, {
		RendererOverlay = createElement(rendererOverlayModule, {
			fillNonDominantAxis = true,
			dimensions = p1.dimensions,
			renderer = p1.renderer,
			getKey = p1.getKey,
			direction = p1.direction,
			virtualizedListController = var2.virtualizedListController,
			windowSizeBinding = var2.windowSizeBinding,
			scrollAxisBinding = var2.scrollAxisBinding,
			positionBinding = var3
		})
	})
end