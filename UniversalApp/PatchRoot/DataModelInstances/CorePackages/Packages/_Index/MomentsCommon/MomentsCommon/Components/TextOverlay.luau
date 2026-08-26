local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useCallback = reactModule.useCallback
local _ = require(momentsCommon.Types)

return function(p1)
	-- upvalues: reactModule (ref), useCallback (ref), view (ref), foundationModule (ref)
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
		tag = "auto-xy anchor-center-center bg-contrast padding-medium position-center-center radius-medium",
		ref = p1.containerRef,
		onActivated = p1.onActivated,
		Position = p1.textOverlayEdit.position,
		Rotation = p1.textOverlayEdit.rotation,
		scale = p1.textOverlayEdit.scale * (p1.additionalScale or 1),
		sizeConstraint = { MaxSize = Vector2.new(300, 1e999) },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = p1.textOverlayEdit.zIndex
	}, {
		UIDragDetector = reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), var1 (ref), var3 (ref), var4 (ref)
			return if p1.draggable then reactModule.createElement("UIDragDetector", {
				BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
				BoundingUI = p1.boundingUI,
				DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
				ref = var1,
				ReferenceUIInstance = p1.boundingUI,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
				[reactModule.Event.DragStart] = var3,
				[reactModule.Event.DragEnd] = var4
			}) else nil
		end, { p1.boundingUI, p1.draggable, var3, var4 }),
		TextInput = reactModule.createElement("TextBox", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			ClipsDescendants = true,
			Font = p1.textOverlayEdit.textOverlayStyle.font,
			Interactable = p1.editable == true,
			Text = p1.textOverlayEdit.text,
			TextColor3 = p1.textOverlayEdit.textOverlayStyle.fontColor,
			TextSize = p1.textOverlayEdit.textOverlayStyle.fontSize,
			TextXAlignment = p1.textOverlayEdit.textOverlayStyle.textXAlignment,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextWrapped = true,
			Size = p1.size,
			ZIndex = p1.textOverlayEdit.zIndex,
			ref = p1.textBoxRef,
			[reactModule.Change.Text] = p1.onTextChanged
		})
	})
end