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

return function(p1) --[[ Line: 14 | Named "ScrollingFrame" ]]
	-- upvalues: UseVirtualizedListModule (copy), ReactModule (copy), ExhaustiveMatchModule (copy), RunService (copy), CreateElementFunction (copy), RendererOverlayModule (copy)
	local UseVirtualizedListModuleResult = UseVirtualizedListModule(p1)
	local config = {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = UseVirtualizedListModuleResult.canvasSizeBinding,
		[ReactModule.Change.AbsoluteWindowSize] = ReactModule.useCallback(function(p2) --[[ Line: 36 ]]
			-- upvalues: UseVirtualizedListModuleResult (copy), p1 (copy)
			UseVirtualizedListModuleResult.setWindowSize(p2.AbsoluteWindowSize)
			
			if p1.onAbsoluteWindowSizeChanged ~= nil then
				p1.onAbsoluteWindowSizeChanged(p2.AbsoluteWindowSize)
			end
		end, { p1.direction, p1.onAbsoluteWindowSizeChanged }),
		[ReactModule.Change.CanvasPosition] = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 44 ]]
			-- upvalues: p1 (copy), ExhaustiveMatchModule (upval), RunService (upval), UseVirtualizedListModuleResult (copy)
			local X = if p1.direction == "x" then ScrollFrame.CanvasPosition.X elseif p1.direction == "y" then ScrollFrame.CanvasPosition.Y else ExhaustiveMatchModule(p1.direction)
			RunService.Heartbeat:Once(function() --[[ Line: 52 ]]
				-- upvalues: UseVirtualizedListModuleResult (upval), X (copy), p1 (upval)
				UseVirtualizedListModuleResult.setScrollAxis(X)
				
				if p1.onScrollAxisChanged ~= nil then
					p1.onScrollAxisChanged(X)
				end
			end)
		end, { p1.direction, p1.onScrollAxisChanged }),
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
		RendererOverlay = CreateElementFunction(RendererOverlayModule, {
			dimensions = p1.dimensions,
			renderer = p1.renderer,
			getKey = p1.getKey,
			direction = p1.direction,
			virtualizedListController = UseVirtualizedListModuleResult.virtualizedListController,
			windowSizeBinding = UseVirtualizedListModuleResult.windowSizeBinding,
			scrollAxisBinding = UseVirtualizedListModuleResult.scrollAxisBinding
		})
	})
end