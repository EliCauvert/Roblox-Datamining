local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local axis = require(viewRecyclerReact.Parent.ViewRecycler).Axis
local reactModule = require(viewRecyclerReact.Parent.React)
local createElement = reactModule.createElement

return function(p0) --[[ line: 19 | named "VirtualListShell" ]]
	-- upvalues: reactModule (ref), axis (ref), createElement (ref)
	local var2, var3 = reactModule.useState({
		thickness = 12,
		verticalPosition = Enum.VerticalScrollBarPosition.Right
	})
	local var4 = reactModule.useRef(nil)
	local t = {
		Size = UDim2.fromScale(1, 1),
		ScrollingDirection = if p0.axis == axis.X then Enum.ScrollingDirection.X else Enum.ScrollingDirection.Y,
		[reactModule.Tag] = p0.tag
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
	
	if p0.scrollingFrameProps ~= nil then
		for i, v in p0.scrollingFrameProps do
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
	t.ref = reactModule.useCallback(function(p1) --[[ line: 63 ]]
		-- upvalues: var4 (ref), p0 (ref), var3 (ref)
		local current = var4.current
		
		if current ~= nil then
			var4.current = nil
			current()
		end
		p0.internalRef.current = p1
		p0.onScrollingFrameChanged(p1)
		
		if p1 == nil then
			return
		end
		local function updateScrollBarState() --[[ line: 74 ]]
			-- upvalues: var3 (copy), p1 (ref)
			var3({
				thickness = p1.ScrollBarThickness,
				verticalPosition = p1.VerticalScrollBarPosition
			})
		end
		
		var3({
			thickness = p1.ScrollBarThickness,
			verticalPosition = p1.VerticalScrollBarPosition
		})
		local var9 = p1:GetPropertyChangedSignal("ScrollBarThickness"):Connect(updateScrollBarState)
		local var10 = p1:GetPropertyChangedSignal("VerticalScrollBarPosition"):Connect(updateScrollBarState)
		
		function var4.current() --[[ line: 85 ]]
			-- upvalues: var9 (ref), var10 (ref)
			var9:Disconnect()
			var10:Disconnect()
		end
	end, { p0.internalRef, p0.onScrollingFrameChanged })
	
	return createElement("Frame", t_1, {
		ScrollingFrame = createElement("ScrollingFrame", t),
		ViewRecyclerOverlay = createElement("Frame", {
			Active = false,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Name = "ViewRecyclerOverlay",
			Selectable = false,
			Position = UDim2.fromOffset(if p0.axis == axis.Y and var2.verticalPosition == Enum.VerticalScrollBarPosition.Left then var2.thickness else 0, 0),
			Size = if p0.axis == axis.X then UDim2.new(1, 0, 1, -var2.thickness) else UDim2.new(1, -var2.thickness, 1, 0),
			ZIndex = t.ZIndex,
			ref = reactModule.useCallback(function(p2) --[[ line: 100 ]]
				-- upvalues: p0 (ref)
				p0.viewportOverlayRef.current = p2
				p0.onViewportOverlayChanged(p2)
			end, { p0.onViewportOverlayChanged, p0.viewportOverlayRef })
		})
	})
end