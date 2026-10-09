local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local textService = game:GetService("TextService")
local fFlagMomentsTextOverlayFixedContrastModule = require(momentsCommon.Flags.FFlagMomentsTextOverlayFixedContrast)
local fFlagMomentsTextOverlayChipGrowAboveKeyboardModule = require(momentsCommon.Flags.FFlagMomentsTextOverlayChipGrowAboveKeyboard)
local fFlagMomentsTextOverlayEdgeClipFixModule = require(momentsCommon.Flags.FFlagMomentsTextOverlayEdgeClipFix)
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
local insertNewlineAtCursorModule = require(momentsCommon.Utils.insertNewlineAtCursor)
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
	-- upvalues: getFFlagMomentsStickerButtonModule (ref), fFlagMomentsTextOverlayFixedContrastModule (ref), foundationModule (ref), fFlagMomentsTextOverlayV2RedesignModule (ref), useState (ref), responsiveModule (ref), reactModule (ref), useCallback (ref), t (ref), t_1 (ref), fFlagMomentsTextOverlayEdgeClipFixModule (ref), textService (ref), fFlagMomentsTextOverlayChipGrowAboveKeyboardModule (ref), insertNewlineAtCursorModule (ref), view (ref), hexColor (ref), textOverlaySelectionControlsModule (ref)
	local _ = nil
	local var1 = if getFFlagMomentsStickerButtonModule() then p1.overlayEdit or p1.textOverlayEdit else p1.textOverlayEdit
	local var2 = if fFlagMomentsTextOverlayFixedContrastModule then foundationModule.Hooks.useTokens().DarkMode.System.Contrast else nil
	local var3 = nil
	local var4 = nil
	local var5 = nil
	local var6 = nil
	
	if fFlagMomentsTextOverlayV2RedesignModule then
		local var7, var8 = useState(false)
		var3 = var7
		var4 = var8
		var5 = responsiveModule.usePreferredInput()
		var6 = reactModule.useBinding(0)
	end
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11 = useCallback(function(_, p2)
		-- upvalues: p1 (ref), var10 (ref), var4 (write)
		if p1.containerRef and p1.containerRef.current then
			var10.current = p2
		end
		if var4 and p1.selected == true then
			var4(true)
		end
		if p1.onDragBegin then
			p1.onDragBegin()
		end
	end, { p1.containerRef, p1.onDragBegin, p1.selected })
	local var12 = useCallback(function(_, p2)
		-- upvalues: p1 (ref)
		if p1.onDragContinue then
			p1.onDragContinue(p2)
		end
	end, { p1.onDragContinue })
	local var13 = useCallback(function(_, p2)
		-- upvalues: var10 (ref), p1 (ref), var4 (write)
		if var10.current == p2 and p1.onActivated then
			p1.onActivated()
		end
		if p1.onDragEnd then
			p1.onDragEnd()
		end
		if var4 and p1.selected == true then
			var4(false)
		end
	end, { p1.onActivated, p1.onDragEnd, p1.selected })
	local var14 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), var9 (ref), var11 (ref), var12 (ref), var13 (ref)
		return if p1.draggable then reactModule.createElement("UIDragDetector", {
			BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
			BoundingUI = p1.boundingUI,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
			ref = var9,
			ReferenceUIInstance = p1.referenceUI or p1.boundingUI,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
			[reactModule.Event.DragStart] = var11,
			[reactModule.Event.DragContinue] = var12,
			[reactModule.Event.DragEnd] = var13
		}) else nil
	end, {
		p1.boundingUI, p1.draggable, p1.referenceUI, var11, var12, var13
	})
	local size = p1.size
	local var15 = if fFlagMomentsTextOverlayV2RedesignModule and p1.editable == true then reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(300, 1e999) }) else nil
	local var16 = if fFlagMomentsTextOverlayV2RedesignModule then t[var1.textOverlayStyle.font] else nil
	local var17 = if var16 then math.ceil(var1.textOverlayStyle.fontSize * var16) else 0
	local var18 = if p1.fitToContent ~= nil then p1.size == nil else p1.fitToContent
	local var19 = 0
	local var20 = 0
	
	if fFlagMomentsTextOverlayV2RedesignModule and var18 then
		var19 = math.ceil(var1.textOverlayStyle.fontSize * (t_1[var1.textOverlayStyle.font] or 0.03))
		
		if fFlagMomentsTextOverlayEdgeClipFixModule then
			var20 = math.ceil(textService:GetTextSize(" ", var1.textOverlayStyle.fontSize, var1.textOverlayStyle.font, Vector2.new(1000000, 1000000)).X)
		end
		local textTextSize = textService:GetTextSize(var1.text, var1.textOverlayStyle.fontSize, var1.textOverlayStyle.font, Vector2.new(276 - var19 - var20 * 2, 1000000))
		size = UDim2.fromOffset(math.ceil(textTextSize.X) + var19 + var20 * 2, math.ceil(textTextSize.Y) + var17)
		var15 = nil
	end
	local var21 = var19 + var20
	local var22 = fFlagMomentsTextOverlayV2RedesignModule and (fFlagMomentsTextOverlayChipGrowAboveKeyboardModule and (p1.editable == true and var5 == responsiveModule.Input.Touch))
	local textBox = reactModule.createElement("TextBox", {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		ClipsDescendants = true,
		Font = var1.textOverlayStyle.font,
		Interactable = p1.editable == true,
		MultiLine = fFlagMomentsTextOverlayV2RedesignModule and p1.editable == true,
		ManualFocusRelease = if var22 then true else nil,
		ShouldEmitReturnEvents = if var22 then true else nil,
		[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = if var22 then useCallback(function(p2)
			-- upvalues: insertNewlineAtCursorModule (copy)
			local text = p2.Text
			task.defer(function()
				-- upvalues: p2 (ref), text (ref), insertNewlineAtCursorModule (copy)
				if p2.Parent == nil or p2.Text ~= text then
					return
				end
				local var23, var24 = insertNewlineAtCursorModule(p2.Text, p2.CursorPosition)
				p2.Text = var23
				p2.CursorPosition = var24
			end)
		end, {}) else nil,
		Text = var1.text,
		TextColor3 = var1.textOverlayStyle.fontColor,
		TextSize = var1.textOverlayStyle.fontSize,
		TextXAlignment = var1.textOverlayStyle.textXAlignment,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextWrapped = true,
		Selectable = p1.editable == true,
		Size = size,
		Visible = if p1.textVisible == false then false else nil,
		ZIndex = var1.zIndex,
		ref = p1.textBoxRef,
		[reactModule.Change.Text] = p1.onTextChanged
	}, {
		WrapWidth = var15,
		FontQuirkPadding = if var16 or var21 > 0 then reactModule.createElement("UIPadding", {
			PaddingLeft = if var20 > 0 then UDim.new(0, var20) else nil,
			PaddingTop = if var16 then UDim.new(0, var17) else nil,
			PaddingRight = if var21 > 0 then UDim.new(0, var21) else nil
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
		local var23 = var5 == responsiveModule.Input.Pointer and not var3
		local t_3 = {
			tag = "auto-xy padding-medium radius-medium bg-contrast",
			GroupTransparency = var6,
			scale = t_2.scale,
			sizeConstraint = { MaxSize = vector2 },
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}
		
		if fFlagMomentsTextOverlayFixedContrastModule then
			t_3.backgroundStyle = var2
			t_3.tag = "auto-xy padding-medium radius-medium"
		end
		local var24 = reactModule.createElement(view, {
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
				Transparency = if var23 then 0.45 else 1
			}
		}, {
			Chip = reactModule.createElement(view, t_3, { TextInput = textBox })
		})
		t_2.scale = nil
		t_2.tag = "position-center-center anchor-center-center auto-xy"
		
		return reactModule.createElement(view, t_2, {
			UIDragDetector = var14,
			Selection = var24,
			SelectionControls = reactModule.createElement(textOverlaySelectionControlsModule, {
				borderGap = 4,
				containerRef = p1.containerRef,
				onRotationChanged = p1.onRotationChanged,
				onScaleChanged = p1.onScaleChanged,
				rotation = var1.rotation,
				scale = var1.scale,
				visible = var23
			})
		})
	elseif fFlagMomentsTextOverlayV2RedesignModule then
		local t_3 = {
			tag = "auto-xy padding-medium radius-medium bg-contrast",
			GroupTransparency = var6,
			scale = t_2.scale,
			sizeConstraint = { MaxSize = vector2 },
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}
		
		if fFlagMomentsTextOverlayFixedContrastModule then
			t_3.backgroundStyle = var2
			t_3.tag = "auto-xy padding-medium radius-medium"
		end
		local var25 = reactModule.createElement(view, t_3, { TextInput = textBox })
		t_2.scale = nil
		t_2.tag = "position-center-center anchor-center-center auto-xy"
		
		return reactModule.createElement(view, t_2, { UIDragDetector = var14, Chip = var25 })
	else
		t_2.tag = "position-center-center anchor-center-center auto-xy padding-medium radius-medium bg-contrast"
		t_2.sizeConstraint = { MaxSize = vector2 }
		
		if fFlagMomentsTextOverlayFixedContrastModule then
			t_2.backgroundStyle = var2
			t_2.tag = "position-center-center anchor-center-center auto-xy padding-medium radius-medium"
		end
		return reactModule.createElement(view, t_2, { UIDragDetector = var14, TextInput = textBox })
	end
end