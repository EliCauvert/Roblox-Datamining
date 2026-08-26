local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local axis = require(viewRecyclerReact.Parent.ViewRecycler).Axis
local reactModule = require(viewRecyclerReact.Parent.React)
local createElement = reactModule.createElement

return function(p1)
	-- upvalues: reactModule (ref), axis (ref), createElement (ref)
	local var1, var2 = reactModule.useState({
		thickness = 12,
		verticalPosition = Enum.VerticalScrollBarPosition.Right
	})
	local var3 = reactModule.useRef(nil)
	local t = {
		Size = UDim2.fromScale(1, 1),
		ScrollingDirection = if p1.axis == axis.X then Enum.ScrollingDirection.X else Enum.ScrollingDirection.Y,
		[reactModule.Tag] = p1.tag
	}
	local t_1 = { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }
	local t_2 = {
		CanvasSize = true,
		CanvasPosition = true,
		ref = true,
		[reactModule.Tag] = true,
		[reactModule.Change.AbsoluteWindowSize] = true,
		[reactModule.Change.CanvasPosition] = true
	}
	
	if p1.scrollingFrameProps ~= nil then
		for i, v in p1.scrollingFrameProps do
			if t[i] ~= nil or t_2[i] then
				error(`VirtualList: {tostring(i)} is already used by ViewRecycler`)
			end
			if i == "AnchorPoint" or i == "LayoutOrder" or (i == "Position" or i == "Rotation") then
				t_1[i] = v
			else
				t[i] = v
			end
		end
	end
	if t.Visible ~= nil then
		t_1.Visible = t.Visible
	end
	if t.ZIndex ~= nil then
		t_1.ZIndex = t.ZIndex
	end
	t.ref = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), p1 (ref), var2 (ref)
		local current = var3.current
		
		if current ~= nil then
			var3.current = nil
			current()
		end
		p1.internalRef.current = p2
		p1.onScrollingFrameChanged(p2)
		
		if p2 == nil then
			return
		end
		local function updateScrollBarState()
			-- upvalues: var2 (copy), p2 (ref)
			var2({
				thickness = p2.ScrollBarThickness,
				verticalPosition = p2.VerticalScrollBarPosition
			})
		end
		
		var2({
			thickness = p2.ScrollBarThickness,
			verticalPosition = p2.VerticalScrollBarPosition
		})
		local var4 = p2:GetPropertyChangedSignal("ScrollBarThickness"):Connect(updateScrollBarState)
		local var5 = p2:GetPropertyChangedSignal("VerticalScrollBarPosition"):Connect(updateScrollBarState)
		
		function var4.current()
			-- upvalues: var4 (ref), var5 (ref)
			var4:Disconnect()
			var5:Disconnect()
		end
	end, { p1.internalRef, p1.onScrollingFrameChanged })
	
	return createElement("Frame", t_1, {
		ScrollingFrame = createElement("ScrollingFrame", t),
		ViewRecyclerOverlay = createElement("Frame", {
			Active = false,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Name = "ViewRecyclerOverlay",
			Selectable = false,
			Position = UDim2.fromOffset(if p1.axis == axis.Y and var1.verticalPosition == Enum.VerticalScrollBarPosition.Left then var1.thickness else 0, 0),
			Size = if p1.axis == axis.X then UDim2.new(1, 0, 1, -var1.thickness) else UDim2.new(1, -var1.thickness, 1, 0),
			ZIndex = t.ZIndex,
			ref = reactModule.useCallback(function(p2)
				-- upvalues: p1 (ref)
				p1.viewportOverlayRef.current = p2
				p1.onViewportOverlayChanged(p2)
			end, { p1.onViewportOverlayChanged, p1.viewportOverlayRef })
		})
	})
end