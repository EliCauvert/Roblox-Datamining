local parent = script:FindFirstAncestor("MomentsCommon").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local image = foundationModule.Image
local useCallback = reactModule.useCallback
local _ = require(parent.MomentsTypes)

return function(p0)
	-- upvalues: reactModule (ref), useCallback (ref), view (ref), foundationModule (ref), image (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = useCallback(function(_, p1)
		-- upvalues: p0 (ref), var3 (ref)
		if p0.containerRef and p0.containerRef.current then
			var3.current = p1
		end
	end, { p0.containerRef })
	local var5 = useCallback(function(_, p2)
		-- upvalues: var3 (ref), p0 (ref)
		if var3.current == p2 and p0.onActivated then
			p0.onActivated()
		end
		if p0.onDragEnd then
			p0.onDragEnd()
		end
	end, { p0.onActivated, p0.onDragEnd })
	
	return reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center auto-xy",
		ref = p0.containerRef,
		onActivated = p0.onActivated,
		onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
		Position = p0.overlayEdit.position,
		Rotation = p0.overlayEdit.rotation,
		scale = p0.overlayEdit.scale * (p0.additionalScale or 1),
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = p0.overlayEdit.zIndex
	}, {
		UIDragDetector = reactModule.useMemo(function()
			-- upvalues: p0 (ref), reactModule (copy), var2 (ref), var4 (ref), var5 (ref)
			return if p0.draggable then reactModule.createElement("UIDragDetector", {
				BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
				BoundingUI = p0.boundingUI,
				DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
				ref = var2,
				ReferenceUIInstance = p0.referenceUI or p0.boundingUI,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
				[reactModule.Event.DragStart] = var4,
				[reactModule.Event.DragEnd] = var5
			}) else nil
		end, {
			p0.boundingUI,
			p0.draggable,
			p0.referenceUI,
			var4,
			var5
		}),
		StickerImage = reactModule.createElement(image, {
			Image = p0.overlayEdit.stickerURI,
			Size = UDim2.fromOffset(p0.overlayEdit.stickerSize, p0.overlayEdit.stickerSize),
			ZIndex = p0.overlayEdit.zIndex or 1
		})
	})
end