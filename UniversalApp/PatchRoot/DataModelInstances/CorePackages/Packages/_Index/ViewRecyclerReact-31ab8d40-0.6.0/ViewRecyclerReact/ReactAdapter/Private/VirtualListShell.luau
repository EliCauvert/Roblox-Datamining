local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerRobloxModule = require(viewRecyclerReact.Parent.ViewRecyclerRoblox)
local axis = require(viewRecyclerReact.Parent.ViewRecycler).Axis
local reactModule = require(viewRecyclerReact.Parent.React)
local scrollbarOverlay = viewRecyclerRobloxModule.Internal.ScrollbarOverlay
local createElement = reactModule.createElement

return function(p1)
	-- upvalues: reactModule (ref), scrollbarOverlay (ref), axis (ref), createElement (ref)
	local var1 = reactModule.useRef(nil)
	
	local function _()
		-- upvalues: var1 (ref), p1 (ref), scrollbarOverlay (copy)
		local current = var1.current
		
		if current ~= nil then
			var1.current = nil
			current()
		end
		local current_1 = p1.internalRef.current
		local current_2 = p1.viewportOverlayRef.current
		
		if current_1 ~= nil and current_2 ~= nil then
			var1.current = scrollbarOverlay.connect(current_1, current_2, p1.axis)
		end
	end
	
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
		-- upvalues: p1 (ref), var1 (ref), scrollbarOverlay (copy)
		p1.internalRef.current = p2
		p1.onScrollingFrameChanged(p2)
		local current = var1.current
		
		if current ~= nil then
			var1.current = nil
			current()
		end
		local current_1 = p1.internalRef.current
		local current_2 = p1.viewportOverlayRef.current
		
		if current_1 ~= nil and current_2 ~= nil then
			var1.current = scrollbarOverlay.connect(current_1, current_2, p1.axis)
		end
	end, {
		p1.axis,
		p1.internalRef,
		p1.onScrollingFrameChanged,
		p1.viewportOverlayRef
	})
	
	return createElement("Frame", t_1, {
		ScrollingFrame = createElement("ScrollingFrame", t),
		ViewRecyclerOverlay = createElement("Frame", {
			Active = false,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Name = "ViewRecyclerOverlay",
			Selectable = false,
			ZIndex = t.ZIndex,
			ref = reactModule.useCallback(function(p2)
				-- upvalues: p1 (ref), var1 (ref), scrollbarOverlay (copy)
				p1.viewportOverlayRef.current = p2
				p1.onViewportOverlayChanged(p2)
				local current = var1.current
				
				if current ~= nil then
					var1.current = nil
					current()
				end
				local current_1 = p1.internalRef.current
				local current_2 = p1.viewportOverlayRef.current
				
				if current_1 ~= nil and current_2 ~= nil then
					var1.current = scrollbarOverlay.connect(current_1, current_2, p1.axis)
				end
			end, {
				p1.axis,
				p1.internalRef,
				p1.onViewportOverlayChanged,
				p1.viewportOverlayRef
			})
		})
	})
end