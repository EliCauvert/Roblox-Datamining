local Parent = script:FindFirstAncestor("MomentsCommon").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local Image = FoundationModule.Image
local UseCallbackFunction = ReactModule.useCallback
local _ = require(Parent.MomentsTypes)

return function(p1) --[[ Line: 30 | Named "StickerOverlay" ]]
	-- upvalues: ReactModule (copy), UseCallbackFunction (copy), View (copy), FoundationModule (copy), Image (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseCallbackResult = UseCallbackFunction(function(_, Current) --[[ Line: 34 ]]
		-- upvalues: p1 (copy), UseRefResult1 (copy)
		if p1.containerRef and p1.containerRef.current then
			UseRefResult1.current = Current
		end
	end, { p1.containerRef })
	local UseCallbackResult1 = UseCallbackFunction(function(_, Current) --[[ Line: 40 ]]
		-- upvalues: UseRefResult1 (copy), p1 (copy)
		if UseRefResult1.current == Current and p1.onActivated then
			p1.onActivated()
		end
		if p1.onDragEnd then
			p1.onDragEnd()
		end
	end, { p1.onActivated, p1.onDragEnd })
	
	return ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center auto-xy",
		ref = p1.containerRef,
		onActivated = p1.onActivated,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		Position = p1.overlayEdit.position,
		Rotation = p1.overlayEdit.rotation,
		scale = p1.overlayEdit.scale * (p1.additionalScale or 1),
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = p1.overlayEdit.zIndex
	}, {
		UIDragDetector = ReactModule.useMemo(function() --[[ Line: 50 ]]
			-- upvalues: p1 (copy), ReactModule (upval), UseRefResult (copy), UseCallbackResult (copy), UseCallbackResult1 (copy)
			return if p1.draggable then ReactModule.createElement("UIDragDetector", {
				BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
				BoundingUI = p1.boundingUI,
				DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
				ref = UseRefResult,
				ReferenceUIInstance = p1.referenceUI or p1.boundingUI,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
				[ReactModule.Event.DragStart] = UseCallbackResult,
				[ReactModule.Event.DragEnd] = UseCallbackResult1
			}) else nil
		end, {
			p1.boundingUI,
			p1.draggable,
			p1.referenceUI,
			UseCallbackResult,
			UseCallbackResult1
		}),
		StickerImage = ReactModule.createElement(Image, {
			Image = p1.overlayEdit.stickerURI,
			Size = UDim2.fromOffset(p1.overlayEdit.stickerSize, p1.overlayEdit.stickerSize),
			ZIndex = p1.overlayEdit.zIndex or 1
		})
	})
end