local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local Axis = require(ViewRecyclerReact.Parent.ViewRecycler).Axis
local ReactModule = require(ViewRecyclerReact.Parent.React)
local CreateElementFunction = ReactModule.createElement

return function(p1)
	-- upvalues: ReactModule (copy), Axis (copy), CreateElementFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		thickness = 12,
		verticalPosition = Enum.VerticalScrollBarPosition.Right
	})
	local UseRefResult = ReactModule.useRef(nil)
	local config = {
		Size = UDim2.fromScale(1, 1),
		ScrollingDirection = if p1.axis == Axis.X then Enum.ScrollingDirection.X else Enum.ScrollingDirection.Y,
		[ReactModule.Tag] = p1.tag
	}
	local config1 = { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }
	local config2 = {
		CanvasSize = true,
		CanvasPosition = true,
		ref = true,
		[ReactModule.Tag] = true,
		[ReactModule.Change.AbsoluteWindowSize] = true,
		[ReactModule.Change.CanvasPosition] = true
	}
	
	if p1.scrollingFrameProps ~= nil then
		for i, scrollingFrameProp in p1.scrollingFrameProps do
			if config[i] ~= nil or config2[i] then
				error(`VirtualList: {tostring(i)} is already used by ViewRecycler`)
			end
			if i == "AnchorPoint" or i == "LayoutOrder" or i == "Position" or i == "Rotation" then
				config1[i] = scrollingFrameProp
			else
				config[i] = scrollingFrameProp
			end
		end
	end
	if config.Visible ~= nil then
		config1.Visible = config.Visible
	end
	if config.ZIndex ~= nil then
		config1.ZIndex = config.ZIndex
	end
	config.ref = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseRefResult (copy), p1 (copy), UseStateResult2 (copy)
		local CurrentFunction: () -> () = UseRefResult.current
		
		if CurrentFunction ~= nil then
			UseRefResult.current = nil
			CurrentFunction()
		end
		p1.internalRef.current = ScrollFrame
		p1.onScrollingFrameChanged(ScrollFrame)
		
		if ScrollFrame ~= nil then
			local function updateScrollBarState()
				-- upvalues: UseStateResult2 (upval), ScrollFrame (copy)
				UseStateResult2({
					thickness = ScrollFrame.ScrollBarThickness,
					verticalPosition = ScrollFrame.VerticalScrollBarPosition
				})
			end
			
			UseStateResult2({
				thickness = ScrollFrame.ScrollBarThickness,
				verticalPosition = ScrollFrame.VerticalScrollBarPosition
			})
			local Connection = ScrollFrame:GetPropertyChangedSignal("ScrollBarThickness"):Connect(updateScrollBarState)
			local Connection1 = ScrollFrame:GetPropertyChangedSignal("VerticalScrollBarPosition"):Connect(updateScrollBarState)
			
			function UseRefResult.current()
				-- upvalues: Connection (copy), Connection1 (copy)
				Connection:Disconnect()
				Connection1:Disconnect()
			end
			
			return
		end
	end, { p1.internalRef, p1.onScrollingFrameChanged })
	
	return CreateElementFunction("Frame", config1, {
		ScrollingFrame = CreateElementFunction("ScrollingFrame", config),
		ViewRecyclerOverlay = CreateElementFunction("Frame", {
			Active = false,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Name = "ViewRecyclerOverlay",
			Selectable = false,
			Position = UDim2.fromOffset(if p1.axis == Axis.Y and UseStateResult.verticalPosition == Enum.VerticalScrollBarPosition.Left then UseStateResult.thickness else 0, 0),
			Size = if p1.axis == Axis.X then UDim2.new(1, 0, 1, -UseStateResult.thickness) else UDim2.new(1, -UseStateResult.thickness, 1, 0),
			ZIndex = config.ZIndex,
			ref = ReactModule.useCallback(function(Current)
				-- upvalues: p1 (copy)
				p1.viewportOverlayRef.current = Current
				p1.onViewportOverlayChanged(Current)
			end, { p1.onViewportOverlayChanged, p1.viewportOverlayRef })
		})
	})
end