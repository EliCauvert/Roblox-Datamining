local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local getFFlagMomentsStickerButtonModule = require(momentsCommon.Flags.GetFFlagMomentsStickerButton)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useCallback = reactModule.useCallback
local _ = require(parent.MomentsTypes)

local function _(p0, p1)
	return if p1 == nil then p0 elseif typeof(p1) == "number" then p0 * p1 else p1:map(function(p2)
		-- upvalues: p0 (ref)
		return p0 * p2
	end)
end

return function(p3)
	-- upvalues: getFFlagMomentsStickerButtonModule (ref), reactModule (ref), useCallback (ref), view (ref), foundationModule (ref)
	local _ = nil
	local var4 = if getFFlagMomentsStickerButtonModule() then p3.overlayEdit or p3.textOverlayEdit else p3.textOverlayEdit
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = useCallback(function(_, p4)
		-- upvalues: p3 (ref), var6 (ref)
		if p3.containerRef and p3.containerRef.current then
			var6.current = p4
		end
		if p3.onDragBegin then
			p3.onDragBegin()
		end
	end, { p3.containerRef, p3.onDragBegin })
	local var8 = useCallback(function(_, p5)
		-- upvalues: p3 (ref)
		if p3.onDragContinue then
			p3.onDragContinue(p5)
		end
	end, { p3.onDragContinue })
	local var9 = useCallback(function(_, p6)
		-- upvalues: var6 (ref), p3 (ref)
		if var6.current == p6 and p3.onActivated then
			p3.onActivated()
		end
		if p3.onDragEnd then
			p3.onDragEnd()
		end
	end, { p3.onActivated, p3.onDragEnd })
	local var10 = reactModule.useMemo(function()
		-- upvalues: p3 (ref), reactModule (copy), var5 (ref), var7 (ref), var8 (ref), var9 (ref)
		return if p3.draggable then reactModule.createElement("UIDragDetector", {
			BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
			BoundingUI = p3.boundingUI,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
			ref = var5,
			ReferenceUIInstance = p3.referenceUI or p3.boundingUI,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
			[reactModule.Event.DragStart] = var7,
			[reactModule.Event.DragContinue] = var8,
			[reactModule.Event.DragEnd] = var9
		}) else nil
	end, {
		p3.boundingUI, p3.draggable, p3.referenceUI, var7, var8, var9
	})
	local createElement = reactModule.createElement
	local t = {
		tag = "position-center-center anchor-center-center auto-xy padding-medium radius-medium bg-contrast",
		ref = p3.containerRef,
		onActivated = p3.onActivated,
		onAbsoluteSizeChanged = p3.onAbsoluteSizeChanged,
		Position = var4.position,
		Rotation = var4.rotation
	}
	local scale = var4.scale
	local additionalScale = p3.additionalScale
	t.scale = if additionalScale == nil then scale elseif typeof(additionalScale) == "number" then scale * additionalScale else additionalScale:map(function(p7)
		-- upvalues: scale (ref)
		return scale * p7
	end)
	t.sizeConstraint = { MaxSize = Vector2.new(300, 1e999) }
	t.stateLayer = {
		affordance = foundationModule.Enums.StateLayerAffordance.None
	}
	t.ZIndex = var4.zIndex
	
	return createElement(view, t, {
		UIDragDetector = var10,
		TextInput = reactModule.createElement("TextBox", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			ClipsDescendants = true,
			Font = var4.textOverlayStyle.font,
			Interactable = p3.editable == true,
			Text = var4.text,
			TextColor3 = var4.textOverlayStyle.fontColor,
			TextSize = var4.textOverlayStyle.fontSize,
			TextXAlignment = var4.textOverlayStyle.textXAlignment,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextWrapped = true,
			Selectable = p3.editable == true,
			Size = p3.size,
			ZIndex = var4.zIndex,
			ref = p3.textBoxRef,
			[reactModule.Change.Text] = p3.onTextChanged
		})
	})
end