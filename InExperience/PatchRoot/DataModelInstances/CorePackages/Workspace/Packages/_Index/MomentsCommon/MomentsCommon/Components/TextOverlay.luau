local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local fFlagMomentsTextOverlayPreviewTransformModule = require(momentsCommon.Flags.FFlagMomentsTextOverlayPreviewTransform)
local getFFlagMomentsStickerButtonModule = require(momentsCommon.Flags.GetFFlagMomentsStickerButton)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useState = reactModule.useState
local _ = require(parent.MomentsTypes)
local textOverlaySelectionControlsModule = require(momentsCommon.Components.TextOverlaySelectionControls)
local hexColor = Color3.fromHex("FFFFFF")

local function _(p1, p2)
	return if p2 == nil then p1 elseif typeof(p2) == "number" then p1 * p2 else p2:map(function(p3)
		-- upvalues: p1 (ref)
		return p1 * p3
	end)
end

return function(p1)
	-- upvalues: getFFlagMomentsStickerButtonModule (ref), fFlagMomentsTextOverlayPreviewTransformModule (ref), useState (ref), responsiveModule (ref), reactModule (ref), useCallback (ref), foundationModule (ref), view (ref), hexColor (ref), textOverlaySelectionControlsModule (ref)
	local _ = nil
	local var1 = if getFFlagMomentsStickerButtonModule() then p1.overlayEdit or p1.textOverlayEdit else p1.textOverlayEdit
	local var2 = nil
	local var3 = nil
	local var4 = nil
	
	if fFlagMomentsTextOverlayPreviewTransformModule then
		local var5, var6 = useState(false)
		var2 = var5
		var3 = var6
		var4 = responsiveModule.usePreferredInput()
	end
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = useCallback(function(_, p2)
		-- upvalues: p1 (ref), var8 (ref), var3 (write)
		if p1.containerRef and p1.containerRef.current then
			var8.current = p2
		end
		if var3 and p1.selected == true then
			var3(true)
		end
		if p1.onDragBegin then
			p1.onDragBegin()
		end
	end, { p1.containerRef, p1.onDragBegin, p1.selected })
	local var10 = useCallback(function(_, p2)
		-- upvalues: p1 (ref)
		if p1.onDragContinue then
			p1.onDragContinue(p2)
		end
	end, { p1.onDragContinue })
	local var11 = useCallback(function(_, p2)
		-- upvalues: var8 (ref), p1 (ref), var3 (write)
		if var8.current == p2 and p1.onActivated then
			p1.onActivated()
		end
		if p1.onDragEnd then
			p1.onDragEnd()
		end
		if var3 and p1.selected == true then
			var3(false)
		end
	end, { p1.onActivated, p1.onDragEnd, p1.selected })
	local var12 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), var7 (ref), var9 (ref), var10 (ref), var11 (ref)
		return if p1.draggable then reactModule.createElement("UIDragDetector", {
			BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
			BoundingUI = p1.boundingUI,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
			ref = var7,
			ReferenceUIInstance = p1.referenceUI or p1.boundingUI,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
			[reactModule.Event.DragStart] = var9,
			[reactModule.Event.DragContinue] = var10,
			[reactModule.Event.DragEnd] = var11
		}) else nil
	end, {
		p1.boundingUI, p1.draggable, p1.referenceUI, var9, var10, var11
	})
	local createElement = reactModule.createElement
	createElement = createElement("TextBox", {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		ClipsDescendants = true,
		Font = var1.textOverlayStyle.font,
		Interactable = p1.editable == true,
		Text = var1.text,
		TextColor3 = var1.textOverlayStyle.fontColor,
		TextSize = var1.textOverlayStyle.fontSize,
		TextXAlignment = var1.textOverlayStyle.textXAlignment,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextWrapped = true,
		Selectable = p1.editable == true,
		Size = p1.size,
		ZIndex = var1.zIndex,
		ref = p1.textBoxRef,
		[reactModule.Change.Text] = p1.onTextChanged
	}, {
		WrapWidth = if fFlagMomentsTextOverlayPreviewTransformModule and p1.editable == true then reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(300, 1e999) }) else nil
	})
	local t = {
		ref = p1.containerRef,
		onActivated = p1.onActivated,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		Position = var1.position,
		Rotation = var1.rotation
	}
	local scale = var1.scale
	local additionalScale = p1.additionalScale
	t.scale = if additionalScale == nil then scale elseif typeof(additionalScale) == "number" then scale * additionalScale else additionalScale:map(function(p2)
		-- upvalues: scale (ref)
		return scale * p2
	end)
	t.stateLayer = {
		affordance = foundationModule.Enums.StateLayerAffordance.None
	}
	t.ZIndex = var1.zIndex
	local vector2 = Vector2.new(300, 1e999)
	
	if fFlagMomentsTextOverlayPreviewTransformModule and p1.selected == true then
		local var13 = var4 == responsiveModule.Input.Pointer and not var2
		local var14 = reactModule.createElement(view, {
			tag = "auto-xy radius-medium",
			ZIndex = 1,
			padding = {
				bottom = UDim.new(0, 4),
				left = UDim.new(0, 4),
				right = UDim.new(0, 4),
				top = UDim.new(0, 4)
			},
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			stroke = {
				Thickness = 1.5,
				Color = hexColor,
				Transparency = if var13 then 0.45 else 1
			}
		}, {
			Chip = reactModule.createElement(view, {
				tag = "auto-xy padding-medium radius-medium bg-contrast",
				scale = t.scale,
				sizeConstraint = { MaxSize = vector2 },
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.None
				}
			}, { TextInput = createElement })
		})
		t.scale = nil
		t.tag = "position-center-center anchor-center-center auto-xy"
		
		return reactModule.createElement(view, t, {
			UIDragDetector = var12,
			Selection = var14,
			SelectionControls = reactModule.createElement(textOverlaySelectionControlsModule, {
				borderGap = 4,
				containerRef = p1.containerRef,
				onRotationChanged = p1.onRotationChanged,
				onScaleChanged = p1.onScaleChanged,
				rotation = var1.rotation,
				scale = var1.scale,
				visible = var13
			})
		})
	end
	t.tag = "position-center-center anchor-center-center auto-xy padding-medium radius-medium bg-contrast"
	t.sizeConstraint = { MaxSize = vector2 }
	
	return reactModule.createElement(view, t, { UIDragDetector = var12, TextInput = createElement })
end