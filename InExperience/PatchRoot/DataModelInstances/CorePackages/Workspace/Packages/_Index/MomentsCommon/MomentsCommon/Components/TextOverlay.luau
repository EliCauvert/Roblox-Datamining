local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local getFFlagMomentsStickerButtonModule = require(momentsCommon.Flags.GetFFlagMomentsStickerButton)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useCallback = reactModule.useCallback
local _ = require(parent.MomentsTypes)

return function(p0) --[[ line: 34 | named "TextOverlay" ]]
	-- upvalues: getFFlagMomentsStickerButtonModule (ref), reactModule (ref), useCallback (ref), view (ref), foundationModule (ref)
	local _ = nil
	local var4 = if getFFlagMomentsStickerButtonModule() then p0.overlayEdit or p0.textOverlayEdit else p0.textOverlayEdit
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = useCallback(function(_, p1) --[[ line: 45 ]]
		-- upvalues: p0 (ref), var6 (ref)
		if p0.containerRef and p0.containerRef.current then
			var6.current = p1
		end
	end, { p0.containerRef })
	local var8 = useCallback(function(_, p2) --[[ line: 51 ]]
		-- upvalues: var6 (ref), p0 (ref)
		if var6.current == p2 and p0.onActivated then
			p0.onActivated()
		end
		if p0.onDragEnd then
			p0.onDragEnd()
		end
	end, { p0.onActivated, p0.onDragEnd })
	
	return reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center auto-xy padding-medium radius-medium bg-contrast",
		ref = p0.containerRef,
		onActivated = p0.onActivated,
		onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
		Position = var4.position,
		Rotation = var4.rotation,
		scale = var4.scale * (p0.additionalScale or 1),
		sizeConstraint = { MaxSize = Vector2.new(300, 1e999) },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = var4.zIndex
	}, {
		UIDragDetector = reactModule.useMemo(function() --[[ line: 61 ]]
			-- upvalues: p0 (ref), reactModule (copy), var5 (ref), var7 (ref), var8 (ref)
			return if p0.draggable then reactModule.createElement("UIDragDetector", {
				BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
				BoundingUI = p0.boundingUI,
				DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
				ref = var5,
				ReferenceUIInstance = p0.referenceUI or p0.boundingUI,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
				[reactModule.Event.DragStart] = var7,
				[reactModule.Event.DragEnd] = var8
			}) else nil
		end, {
			p0.boundingUI,
			p0.draggable,
			p0.referenceUI,
			var7,
			var8
		}),
		TextInput = reactModule.createElement("TextBox", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			ClipsDescendants = true,
			Font = var4.textOverlayStyle.font,
			Interactable = p0.editable == true,
			Text = var4.text,
			TextColor3 = var4.textOverlayStyle.fontColor,
			TextSize = var4.textOverlayStyle.fontSize,
			TextXAlignment = var4.textOverlayStyle.textXAlignment,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextWrapped = true,
			Selectable = p0.editable == true,
			Size = p0.size,
			ZIndex = var4.zIndex,
			ref = p0.textBoxRef,
			[reactModule.Change.Text] = p0.onTextChanged
		})
	})
end