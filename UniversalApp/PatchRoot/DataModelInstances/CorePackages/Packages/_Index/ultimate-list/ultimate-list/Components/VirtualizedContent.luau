local RunService = game:GetService("RunService")
local UltimateList = script:FindFirstAncestor("ultimate-list")
local _ = require(UltimateList.DataSources)
local _ = require(UltimateList.Dimensions)
local ReactModule = require(UltimateList.Parent.React)
local RendererOverlayModule = require(script.Parent.RendererOverlay)
local _ = require(UltimateList.Renderers)
local ExhaustiveMatchModule = require(UltimateList.Util.exhaustiveMatch)
local UseVirtualizedListModule = require(script.Parent.useVirtualizedList)
local CreateElementFunction = ReactModule.createElement

local function _(Vector, p1) --[[ Line: 14 | Named "getScrollAxis" ]]
	-- upvalues: ExhaustiveMatchModule (copy)
	return if p1 == "x" then Vector.X elseif p1 == "y" then Vector.Y else ExhaustiveMatchModule(p1)
end

local _ = function(XOffset, p1) --[[ Line: 21 | Named "getPosition" ]]
	-- upvalues: ExhaustiveMatchModule (copy)
	return if p1 == "x" then UDim2.fromOffset(XOffset, 0) elseif p1 == "y" then UDim2.fromOffset(0, XOffset) else ExhaustiveMatchModule(p1)
end

local function getContentSize(Vector, Direction) --[[ Line: 28 ]]
	-- upvalues: ExhaustiveMatchModule (copy)
	return if Direction == "x" then UDim2.new(0, Vector.X.Offset, 1, 0) elseif Direction == "y" then UDim2.new(1, 0, 0, Vector.Y.Offset) else ExhaustiveMatchModule(Direction)
end

return function(p1) --[[ Line: 35 | Named "VirtualizedContent" ]]
	-- upvalues: UseVirtualizedListModule (copy), ReactModule (copy), ExhaustiveMatchModule (copy), RunService (copy), CreateElementFunction (copy), getContentSize (copy), RendererOverlayModule (copy)
	local UseVirtualizedListModuleResult = UseVirtualizedListModule(p1)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.new())
	ReactModule.useEffect(function() --[[ Line: 53 ]]
		-- upvalues: p1 (copy), UseVirtualizedListModuleResult (copy), ExhaustiveMatchModule (upval), UseBindingResult2 (copy), RunService (upval)
		local Current = p1.scrollingFrameRef.current
		assert(Current ~= nil, "VirtualizedContent requires scrollingFrameRef.current to point to its ancestor ScrollingFrame")
		local AbsoluteWindowSize = nil
		local X = nil
		
		local function syncMetrics() --[[ Line: 63 ]]
			-- upvalues: Current (copy), AbsoluteWindowSize (ref), UseVirtualizedListModuleResult (upval), p1 (upval), ExhaustiveMatchModule (upval), UseBindingResult2 (upval), X (ref)
			local AbsoluteWindowSize1 = Current.AbsoluteWindowSize
			
			if AbsoluteWindowSize1 ~= AbsoluteWindowSize then
				AbsoluteWindowSize = AbsoluteWindowSize1
				UseVirtualizedListModuleResult.setWindowSize(AbsoluteWindowSize1)
				
				if p1.onAbsoluteWindowSizeChanged ~= nil then
					p1.onAbsoluteWindowSizeChanged(AbsoluteWindowSize1)
				end
			end
			local CanvasPosition = Current.CanvasPosition
			local Direction = p1.direction
			local X1 = if Direction == "x" then CanvasPosition.X elseif Direction == "y" then CanvasPosition.Y else ExhaustiveMatchModule(Direction)
			local Direction1 = p1.direction
			UseBindingResult2(if Direction1 == "x" then UDim2.fromOffset(X1, 0) elseif Direction1 == "y" then UDim2.fromOffset(0, X1) else ExhaustiveMatchModule(Direction1))
			UseVirtualizedListModuleResult.setScrollAxis(X1)
			
			if X1 ~= X then
				X = X1
				
				if p1.onScrollAxisChanged ~= nil then
					p1.onScrollAxisChanged(X1)
				end
			end
		end
		
		local Connections = {
			Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(syncMetrics),
			Current:GetPropertyChangedSignal("CanvasPosition"):Connect(syncMetrics),
			RunService.RenderStepped:Connect(syncMetrics)
		}
		syncMetrics()
		
		return function() --[[ Line: 99 ]]
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, {
		p1.scrollingFrameRef, p1.direction, p1.onAbsoluteWindowSizeChanged,
		p1.onScrollAxisChanged, UseVirtualizedListModuleResult.setWindowSize,
		UseVirtualizedListModuleResult.setScrollAxis
	})
	
	return CreateElementFunction("Frame", {
		BackgroundTransparency = 1,
		Size = UseVirtualizedListModuleResult.canvasSizeBinding:map(function(p2) --[[ Line: 115 ]]
			-- upvalues: getContentSize (upval), p1 (copy)
			return (getContentSize(p2, p1.direction))
		end)
	}, {
		RendererOverlay = CreateElementFunction(RendererOverlayModule, {
			fillNonDominantAxis = true,
			dimensions = p1.dimensions,
			renderer = p1.renderer,
			getKey = p1.getKey,
			direction = p1.direction,
			virtualizedListController = UseVirtualizedListModuleResult.virtualizedListController,
			windowSizeBinding = UseVirtualizedListModuleResult.windowSizeBinding,
			scrollAxisBinding = UseVirtualizedListModuleResult.scrollAxisBinding,
			positionBinding = UseBindingResult
		})
	})
end