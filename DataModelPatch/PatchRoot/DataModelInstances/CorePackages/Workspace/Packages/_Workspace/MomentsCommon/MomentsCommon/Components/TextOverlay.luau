local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local GetFFlagMomentsStickerButtonModule = require(MomentsCommon.Flags.GetFFlagMomentsStickerButton)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local UseCallbackFunction = ReactModule.useCallback
local _ = require(Parent.MomentsTypes)

return function(p1)
	-- upvalues: GetFFlagMomentsStickerButtonModule (copy), ReactModule (copy), UseCallbackFunction (copy), View (copy), FoundationModule (copy)
	local OverlayEdit = GetFFlagMomentsStickerButtonModule() and p1.overlayEdit or p1.textOverlayEdit
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseCallbackResult = UseCallbackFunction(function(_, Current)
		-- upvalues: p1 (copy), UseRefResult1 (copy)
		if p1.containerRef and p1.containerRef.current then
			UseRefResult1.current = Current
		end
	end, { p1.containerRef })
	local UseCallbackResult1 = UseCallbackFunction(function(_, Current)
		-- upvalues: UseRefResult1 (copy), p1 (copy)
		if UseRefResult1.current == Current and p1.onActivated then
			p1.onActivated()
		end
		if p1.onDragEnd then
			p1.onDragEnd()
		end
	end, { p1.onActivated, p1.onDragEnd })
	
	return ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center auto-xy padding-medium radius-medium bg-contrast",
		ref = p1.containerRef,
		onActivated = p1.onActivated,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		Position = OverlayEdit.position,
		Rotation = OverlayEdit.rotation,
		scale = OverlayEdit.scale * (p1.additionalScale or 1),
		sizeConstraint = { MaxSize = Vector2.new(300, 1e999) },
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = OverlayEdit.zIndex
	}, {
		UIDragDetector = ReactModule.useMemo(function()
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
		TextInput = ReactModule.createElement("TextBox", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			ClipsDescendants = true,
			Font = OverlayEdit.textOverlayStyle.font,
			Interactable = p1.editable == true,
			Text = OverlayEdit.text,
			TextColor3 = OverlayEdit.textOverlayStyle.fontColor,
			TextSize = OverlayEdit.textOverlayStyle.fontSize,
			TextXAlignment = OverlayEdit.textOverlayStyle.textXAlignment,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextWrapped = true,
			Selectable = p1.editable == true,
			Size = p1.size,
			ZIndex = OverlayEdit.zIndex,
			ref = p1.textBoxRef,
			[ReactModule.Change.Text] = p1.onTextChanged
		})
	})
end