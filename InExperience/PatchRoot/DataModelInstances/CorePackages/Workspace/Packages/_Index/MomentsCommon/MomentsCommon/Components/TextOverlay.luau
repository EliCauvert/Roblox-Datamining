local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local getFFlagMomentsStickerButtonModule = require(momentsCommon.Flags.GetFFlagMomentsStickerButton)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useCallback = reactModule.useCallback
local _ = require(parent.MomentsTypes)

local function _(p1, p2)
	return if p2 == nil then p1 elseif typeof(p2) == "number" then p1 * p2 else p2:map(function(p3)
		-- upvalues: p1 (ref)
		return p1 * p3
	end)
end

return function(p1)
	-- upvalues: getFFlagMomentsStickerButtonModule (ref), reactModule (ref), useCallback (ref), view (ref), foundationModule (ref)
	local _ = nil
	local var1 = if getFFlagMomentsStickerButtonModule() then p1.overlayEdit or p1.textOverlayEdit else p1.textOverlayEdit
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = useCallback(function(_, p2)
		-- upvalues: p1 (ref), var3 (ref)
		if p1.containerRef and p1.containerRef.current then
			var3.current = p2
		end
		if p1.onDragBegin then
			p1.onDragBegin()
		end
	end, { p1.containerRef, p1.onDragBegin })
	local var5 = useCallback(function(_, p2)
		-- upvalues: p1 (ref)
		if p1.onDragContinue then
			p1.onDragContinue(p2)
		end
	end, { p1.onDragContinue })
	local var6 = useCallback(function(_, p2)
		-- upvalues: var3 (ref), p1 (ref)
		if var3.current == p2 and p1.onActivated then
			p1.onActivated()
		end
		if p1.onDragEnd then
			p1.onDragEnd()
		end
	end, { p1.onActivated, p1.onDragEnd })
	local var7 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), var2 (ref), var4 (ref), var5 (ref), var6 (ref)
		return if p1.draggable then reactModule.createElement("UIDragDetector", {
			BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
			BoundingUI = p1.boundingUI,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
			ref = var2,
			ReferenceUIInstance = p1.referenceUI or p1.boundingUI,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
			[reactModule.Event.DragStart] = var4,
			[reactModule.Event.DragContinue] = var5,
			[reactModule.Event.DragEnd] = var6
		}) else nil
	end, {
		p1.boundingUI, p1.draggable, p1.referenceUI, var4, var5, var6
	})
	local createElement = reactModule.createElement
	local t = {
		tag = "position-center-center anchor-center-center auto-xy padding-medium radius-medium bg-contrast",
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
	t.sizeConstraint = { MaxSize = Vector2.new(300, 1e999) }
	t.stateLayer = {
		affordance = foundationModule.Enums.StateLayerAffordance.None
	}
	t.ZIndex = var1.zIndex
	
	return createElement(view, t, {
		UIDragDetector = var7,
		TextInput = reactModule.createElement("TextBox", {
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
		})
	})
end