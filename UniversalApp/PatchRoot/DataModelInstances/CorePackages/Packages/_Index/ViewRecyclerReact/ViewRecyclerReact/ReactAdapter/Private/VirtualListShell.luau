local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local Axis = require(ViewRecyclerReact.Parent.ViewRecycler).Axis
local ReactModule = require(ViewRecyclerReact.Parent.React)
local ScrollbarOverlay = require(ViewRecyclerReact.Parent.ViewRecyclerRoblox).Internal.ScrollbarOverlay
local CreateElementFunction = ReactModule.createElement

return function(p1)
	-- upvalues: ReactModule (copy), ScrollbarOverlay (copy), Axis (copy), CreateElementFunction (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	local function _()
		-- upvalues: UseRefResult (copy), p1 (copy), ScrollbarOverlay (upval)
		local CurrentFunction: () -> () = UseRefResult.current
		
		if CurrentFunction ~= nil then
			UseRefResult.current = nil
			CurrentFunction()
		end
		local Current = p1.internalRef.current
		local Current1 = p1.viewportOverlayRef.current
		
		if Current ~= nil and Current1 ~= nil then
			UseRefResult.current = ScrollbarOverlay.connect(Current, Current1, p1.axis)
		end
	end
	
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
	config.ref = ReactModule.useCallback(function(Current)
		-- upvalues: p1 (copy), UseRefResult (copy), ScrollbarOverlay (upval)
		p1.internalRef.current = Current
		p1.onScrollingFrameChanged(Current)
		local CurrentFunction: () -> () = UseRefResult.current
		
		if CurrentFunction ~= nil then
			UseRefResult.current = nil
			CurrentFunction()
		end
		local Current1 = p1.internalRef.current
		local Current2 = p1.viewportOverlayRef.current
		
		if Current1 ~= nil and Current2 ~= nil then
			UseRefResult.current = ScrollbarOverlay.connect(Current1, Current2, p1.axis)
		end
	end, {
		p1.axis,
		p1.internalRef,
		p1.onScrollingFrameChanged,
		p1.viewportOverlayRef
	})
	
	return CreateElementFunction("Frame", config1, {
		ScrollingFrame = CreateElementFunction("ScrollingFrame", config),
		ViewRecyclerOverlay = CreateElementFunction("Frame", {
			Active = false,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Name = "ViewRecyclerOverlay",
			Selectable = false,
			ZIndex = config.ZIndex,
			ref = ReactModule.useCallback(function(Current)
				-- upvalues: p1 (copy), UseRefResult (copy), ScrollbarOverlay (upval)
				p1.viewportOverlayRef.current = Current
				p1.onViewportOverlayChanged(Current)
				local CurrentFunction: () -> () = UseRefResult.current
				
				if CurrentFunction ~= nil then
					UseRefResult.current = nil
					CurrentFunction()
				end
				local Current1 = p1.internalRef.current
				local Current2 = p1.viewportOverlayRef.current
				
				if Current1 ~= nil and Current2 ~= nil then
					UseRefResult.current = ScrollbarOverlay.connect(Current1, Current2, p1.axis)
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