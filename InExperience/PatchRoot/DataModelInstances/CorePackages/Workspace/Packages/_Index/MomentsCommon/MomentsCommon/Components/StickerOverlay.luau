local parent = script:FindFirstAncestor("MomentsCommon").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local image = foundationModule.Image
local useCallback = reactModule.useCallback
local _ = require(parent.MomentsTypes)

return function(p1)
	-- upvalues: reactModule (ref), useCallback (ref), view (ref), foundationModule (ref), image (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = useCallback(function(_, p2)
		-- upvalues: p1 (ref), var2 (ref)
		if p1.containerRef and p1.containerRef.current then
			var2.current = p2
		end
	end, { p1.containerRef })
	local var4 = useCallback(function(_, p2)
		-- upvalues: var2 (ref), p1 (ref)
		if var2.current == p2 and p1.onActivated then
			p1.onActivated()
		end
		if p1.onDragEnd then
			p1.onDragEnd()
		end
	end, { p1.onActivated, p1.onDragEnd })
	
	return reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center auto-xy",
		ref = p1.containerRef,
		onActivated = p1.onActivated,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		Position = p1.overlayEdit.position,
		Rotation = p1.overlayEdit.rotation,
		scale = p1.overlayEdit.scale * (p1.additionalScale or 1),
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = p1.overlayEdit.zIndex
	}, {
		UIDragDetector = reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), var1 (ref), var3 (ref), var4 (ref)
			return if p1.draggable then reactModule.createElement("UIDragDetector", {
				BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
				BoundingUI = p1.boundingUI,
				DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
				ref = var1,
				ReferenceUIInstance = p1.referenceUI or p1.boundingUI,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
				[reactModule.Event.DragStart] = var3,
				[reactModule.Event.DragEnd] = var4
			}) else nil
		end, {
			p1.boundingUI,
			p1.draggable,
			p1.referenceUI,
			var3,
			var4
		}),
		StickerImage = reactModule.createElement(image, {
			Image = p1.overlayEdit.stickerURI,
			Size = UDim2.fromOffset(p1.overlayEdit.stickerSize, p1.overlayEdit.stickerSize),
			ZIndex = p1.overlayEdit.zIndex or 1
		})
	})
end