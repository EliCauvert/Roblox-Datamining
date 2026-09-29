local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local textService = game:GetService("TextService")
local fFlagMomentsTextOverlayV2RedesignModule = require(momentsCommon.Flags.FFlagMomentsTextOverlayV2Redesign)
local getFFlagMomentsStickerButtonModule = require(momentsCommon.Flags.GetFFlagMomentsStickerButton)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useState = reactModule.useState
local _ = require(parent.MomentsTypes)
local textOverlaySelectionControlsModule = require(momentsCommon.Components.TextOverlaySelectionControls)
local t = { [Enum.Font.LuckiestGuy] = 0.12 }
local t_1 = { [Enum.Font.Bangers] = 0.08 }
local hexColor = Color3.fromHex("FFFFFF")

local function _(p1, p2)
	return if p2 == nil then p1 elseif typeof(p2) == "number" then p1 * p2 else p2:map(function(p3)
		-- upvalues: p1 (ref)
		return p1 * p3
	end)
end

return function(p1)
	-- upvalues: getFFlagMomentsStickerButtonModule (ref), fFlagMomentsTextOverlayV2RedesignModule (ref), useState (ref), responsiveModule (ref), reactModule (ref), useCallback (ref), t (ref), t_1 (ref), textService (ref), foundationModule (ref), view (ref), hexColor (ref), textOverlaySelectionControlsModule (ref)
	local _ = nil
	local var1 = if getFFlagMomentsStickerButtonModule() then p1.overlayEdit or p1.textOverlayEdit else p1.textOverlayEdit
	local var2 = nil
	local var3 = nil
	local var4 = nil
	local var5 = nil
	
	if fFlagMomentsTextOverlayV2RedesignModule then
		local var6, var7 = useState(false)
		var2 = var6
		var3 = var7
		var4 = responsiveModule.usePreferredInput()
		var5 = reactModule.useBinding(0)
	end
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = useCallback(function(_, p2)
		-- upvalues: p1 (ref), var9 (ref), var3 (write)
		if p1.containerRef and p1.containerRef.current then
			var9.current = p2
		end
		if var3 and p1.selected == true then
			var3(true)
		end
		if p1.onDragBegin then
			p1.onDragBegin()
		end
	end, { p1.containerRef, p1.onDragBegin, p1.selected })
	local var11 = useCallback(function(_, p2)
		-- upvalues: p1 (ref)
		if p1.onDragContinue then
			p1.onDragContinue(p2)
		end
	end, { p1.onDragContinue })
	local var12 = useCallback(function(_, p2)
		-- upvalues: var9 (ref), p1 (ref), var3 (write)
		if var9.current == p2 and p1.onActivated then
			p1.onActivated()
		end
		if p1.onDragEnd then
			p1.onDragEnd()
		end
		if var3 and p1.selected == true then
			var3(false)
		end
	end, { p1.onActivated, p1.onDragEnd, p1.selected })
	local var13 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), var8 (ref), var10 (ref), var11 (ref), var12 (ref)
		return if p1.draggable then reactModule.createElement("UIDragDetector", {
			BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
			BoundingUI = p1.boundingUI,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
			ref = var8,
			ReferenceUIInstance = p1.referenceUI or p1.boundingUI,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
			[reactModule.Event.DragStart] = var10,
			[reactModule.Event.DragContinue] = var11,
			[reactModule.Event.DragEnd] = var12
		}) else nil
	end, {
		p1.boundingUI, p1.draggable, p1.referenceUI, var10, var11, var12
	})
	local size = p1.size
	local var14 = if fFlagMomentsTextOverlayV2RedesignModule and p1.editable == true then reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(300, 1e999) }) else nil
	local var15 = if fFlagMomentsTextOverlayV2RedesignModule then t[var1.textOverlayStyle.font] else nil
	local var16 = if var15 then math.ceil(var1.textOverlayStyle.fontSize * var15) else 0
	local var17 = 0
	
	if fFlagMomentsTextOverlayV2RedesignModule and (if p1.fitToContent ~= nil then p1.size == nil else p1.fitToContent) then
		var17 = math.ceil(var1.textOverlayStyle.fontSize * (t_1[var1.textOverlayStyle.font] or 0.03))
		local textTextSize = textService:GetTextSize(var1.text, var1.textOverlayStyle.fontSize, var1.textOverlayStyle.font, Vector2.new(276 - var17, 1000000))
		size = UDim2.fromOffset(math.ceil(textTextSize.X) + var17, math.ceil(textTextSize.Y) + var16)
		var14 = nil
	end
	local textBox = reactModule.createElement("TextBox", {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		ClipsDescendants = true,
		Font = var1.textOverlayStyle.font,
		Interactable = p1.editable == true,
		MultiLine = fFlagMomentsTextOverlayV2RedesignModule and p1.editable == true,
		Text = var1.text,
		TextColor3 = var1.textOverlayStyle.fontColor,
		TextSize = var1.textOverlayStyle.fontSize,
		TextXAlignment = var1.textOverlayStyle.textXAlignment,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextWrapped = true,
		Selectable = p1.editable == true,
		Size = size,
		ZIndex = var1.zIndex,
		ref = p1.textBoxRef,
		[reactModule.Change.Text] = p1.onTextChanged
	}, {
		WrapWidth = var14,
		FontQuirkPadding = if var15 or var17 > 0 then reactModule.createElement("UIPadding", {
			PaddingTop = if var15 then UDim.new(0, var16) else nil,
			PaddingRight = if var17 > 0 then UDim.new(0, var17) else nil
		}) else nil
	})
	local t_2 = {
		ref = p1.containerRef,
		onActivated = p1.onActivated,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		Position = var1.position,
		Rotation = var1.rotation
	}
	local scale = var1.scale
	local additionalScale = p1.additionalScale
	t_2.scale = if additionalScale == nil then scale elseif typeof(additionalScale) == "number" then scale * additionalScale else additionalScale:map(function(p2)
		-- upvalues: scale (ref)
		return scale * p2
	end)
	t_2.stateLayer = {
		affordance = foundationModule.Enums.StateLayerAffordance.None
	}
	t_2.ZIndex = var1.zIndex
	local vector2 = Vector2.new(300, 1e999)
	
	if fFlagMomentsTextOverlayV2RedesignModule and p1.selected == true then
		local var18 = var4 == responsiveModule.Input.Pointer and not var2
		local var19 = reactModule.createElement(view, {
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
				Transparency = if var18 then 0.45 else 1
			}
		}, {
			Chip = reactModule.createElement(view, {
				tag = "auto-xy padding-medium radius-medium bg-contrast",
				GroupTransparency = var5,
				scale = t_2.scale,
				sizeConstraint = { MaxSize = vector2 },
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.None
				}
			}, { TextInput = textBox })
		})
		t_2.scale = nil
		t_2.tag = "position-center-center anchor-center-center auto-xy"
		
		return reactModule.createElement(view, t_2, {
			UIDragDetector = var13,
			Selection = var19,
			SelectionControls = reactModule.createElement(textOverlaySelectionControlsModule, {
				borderGap = 4,
				containerRef = p1.containerRef,
				onRotationChanged = p1.onRotationChanged,
				onScaleChanged = p1.onScaleChanged,
				rotation = var1.rotation,
				scale = var1.scale,
				visible = var18
			})
		})
	elseif fFlagMomentsTextOverlayV2RedesignModule then
		local var20 = reactModule.createElement(view, {
			tag = "auto-xy padding-medium radius-medium bg-contrast",
			GroupTransparency = var5,
			scale = t_2.scale,
			sizeConstraint = { MaxSize = vector2 },
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, { TextInput = textBox })
		t_2.scale = nil
		t_2.tag = "position-center-center anchor-center-center auto-xy"
		
		return reactModule.createElement(view, t_2, { UIDragDetector = var13, Chip = var20 })
	end
	t_2.tag = "position-center-center anchor-center-center auto-xy padding-medium radius-medium bg-contrast"
	t_2.sizeConstraint = { MaxSize = vector2 }
	
	return reactModule.createElement(view, t_2, { UIDragDetector = var13, TextInput = textBox })
end