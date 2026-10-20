local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local TextService = game:GetService("TextService")
local FFlagMomentsTextOverlayFixedContrastModule = require(MomentsCommon.Flags.FFlagMomentsTextOverlayFixedContrast)
local FFlagMomentsTextOverlayChipGrowAboveKeyboardModule = require(MomentsCommon.Flags.FFlagMomentsTextOverlayChipGrowAboveKeyboard)
local FFlagMomentsTextOverlayEdgeClipFixModule = require(MomentsCommon.Flags.FFlagMomentsTextOverlayEdgeClipFix)
local FFlagMomentsTextOverlayV2RedesignModule = require(MomentsCommon.Flags.FFlagMomentsTextOverlayV2Redesign)
local GetFFlagMomentsStickerButtonModule = require(MomentsCommon.Flags.GetFFlagMomentsStickerButton)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local View = FoundationModule.View
local UseCallbackFunction = ReactModule.useCallback
local UseStateFunction = ReactModule.useState
local _ = require(Parent.MomentsTypes)
local TextOverlaySelectionControlsModule = require(MomentsCommon.Components.TextOverlaySelectionControls)
local InsertNewlineAtCursorModule = require(MomentsCommon.Utils.insertNewlineAtCursor)
local config = { [Enum.Font.LuckiestGuy] = 0.12 }
local config1 = { [Enum.Font.Bangers] = 0.08 }
local _Color3 = Color3.fromHex("FFFFFF")

local function _(p1, p2)
	return if p2 == nil then p1 elseif typeof(p2) == "number" then p1 * p2 else p2:map(function(p3)
		-- upvalues: p1 (copy)
		return p1 * p3
	end)
end

return function(p1)
	-- upvalues: GetFFlagMomentsStickerButtonModule (copy), FFlagMomentsTextOverlayFixedContrastModule (copy), FoundationModule (copy), FFlagMomentsTextOverlayV2RedesignModule (copy), UseStateFunction (copy), ResponsiveModule (copy), ReactModule (copy), UseCallbackFunction (copy), config (copy), config1 (copy), FFlagMomentsTextOverlayEdgeClipFixModule (copy), TextService (copy), FFlagMomentsTextOverlayChipGrowAboveKeyboardModule (copy), InsertNewlineAtCursorModule (copy), View (copy), _Color3 (copy), TextOverlaySelectionControlsModule (copy)
	local OverlayEdit = GetFFlagMomentsStickerButtonModule() and p1.overlayEdit or p1.textOverlayEdit
	local Contrast = if FFlagMomentsTextOverlayFixedContrastModule then FoundationModule.Hooks.useTokens().DarkMode.System.Contrast else nil
	local v1 = nil
	local Callback = nil
	local UsePreferredInputResult = nil
	local GroupTransparency = nil
	
	if FFlagMomentsTextOverlayV2RedesignModule then
		v1, Callback = UseStateFunction(false)
		UsePreferredInputResult = ResponsiveModule.usePreferredInput()
		GroupTransparency = ReactModule.useBinding(0)
	end
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseCallbackResult = UseCallbackFunction(function(_, Current)
		-- upvalues: p1 (copy), UseRefResult1 (copy), Callback (ref)
		if p1.containerRef and p1.containerRef.current then
			UseRefResult1.current = Current
		end
		if Callback and p1.selected == true then
			Callback(true)
		end
		if p1.onDragBegin then
			p1.onDragBegin()
		end
	end, { p1.containerRef, p1.onDragBegin, p1.selected })
	local UseCallbackResult1 = UseCallbackFunction(function(_, p2)
		-- upvalues: p1 (copy)
		if p1.onDragContinue then
			p1.onDragContinue(p2)
		end
	end, { p1.onDragContinue })
	local UseCallbackResult2 = UseCallbackFunction(function(_, Current)
		-- upvalues: UseRefResult1 (copy), p1 (copy), Callback (ref)
		if UseRefResult1.current == Current and p1.onActivated then
			p1.onActivated()
		end
		if p1.onDragEnd then
			p1.onDragEnd()
		end
		if Callback and p1.selected == true then
			Callback(false)
		end
	end, { p1.onActivated, p1.onDragEnd, p1.selected })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactModule (upval), UseRefResult (copy), UseCallbackResult (copy), UseCallbackResult1 (copy), UseCallbackResult2 (copy)
		return if p1.draggable then ReactModule.createElement("UIDragDetector", {
			BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
			BoundingUI = p1.boundingUI,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
			ref = UseRefResult,
			ReferenceUIInstance = p1.referenceUI or p1.boundingUI,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
			[ReactModule.Event.DragStart] = UseCallbackResult,
			[ReactModule.Event.DragContinue] = UseCallbackResult1,
			[ReactModule.Event.DragEnd] = UseCallbackResult2
		}) else nil
	end, {
		p1.boundingUI, p1.draggable, p1.referenceUI, UseCallbackResult,
		UseCallbackResult1, UseCallbackResult2
	})
	local Size = p1.size
	local UISizeConstraint = if FFlagMomentsTextOverlayV2RedesignModule and p1.editable == true then ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(300, 1e999) }) else nil
	local Entry = if FFlagMomentsTextOverlayV2RedesignModule then config[OverlayEdit.textOverlayStyle.font] else nil
	local Ceiled: number = if Entry then math.ceil(OverlayEdit.textOverlayStyle.fontSize * Entry) else 0
	local NoSize = if p1.fitToContent == nil then p1.size == nil else p1.fitToContent
	local Ceiled1 = 0
	local Offset = 0
	
	if FFlagMomentsTextOverlayV2RedesignModule and NoSize then
		Ceiled1 = math.ceil(OverlayEdit.textOverlayStyle.fontSize * (config1[OverlayEdit.textOverlayStyle.font] or 0.03))
		
		if FFlagMomentsTextOverlayEdgeClipFixModule then
			Offset = math.ceil(TextService:GetTextSize(" ", OverlayEdit.textOverlayStyle.fontSize, OverlayEdit.textOverlayStyle.font, Vector2.new(1000000, 1000000)).X)
		end
		local TextSize = TextService:GetTextSize(OverlayEdit.text, OverlayEdit.textOverlayStyle.fontSize, OverlayEdit.textOverlayStyle.font, Vector2.new(276 - Ceiled1 - Offset * 2, 1000000))
		Size = UDim2.fromOffset(math.ceil(TextSize.X) + Ceiled1 + Offset * 2, math.ceil(TextSize.Y) + Ceiled)
		UISizeConstraint = nil
	end
	local NewCeiled = Ceiled1 + Offset
	local IsUsePreferredInputResultMatch: boolean = FFlagMomentsTextOverlayV2RedesignModule and (FFlagMomentsTextOverlayChipGrowAboveKeyboardModule and (p1.editable == true and UsePreferredInputResult == ResponsiveModule.Input.Touch))
	local UseCallbackResult3 = UseCallbackFunction(function(TextBox)
		-- upvalues: InsertNewlineAtCursorModule (upval)
		local Text = TextBox.Text
		task.defer(function()
			-- upvalues: TextBox (copy), Text (copy), InsertNewlineAtCursorModule (upval)
			if TextBox.Parent ~= nil and TextBox.Text == Text then
				TextBox.Text, TextBox.CursorPosition = InsertNewlineAtCursorModule(TextBox.Text, TextBox.CursorPosition)
				
				return
			end
		end)
	end, {})
	local TextBox = ReactModule.createElement("TextBox", {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		ClipsDescendants = true,
		Font = OverlayEdit.textOverlayStyle.font,
		Interactable = p1.editable == true,
		MultiLine = FFlagMomentsTextOverlayV2RedesignModule and p1.editable == true,
		ManualFocusRelease = if IsUsePreferredInputResultMatch then true else nil,
		ShouldEmitReturnEvents = if IsUsePreferredInputResultMatch then true else nil,
		[ReactModule.Event.ReturnPressedFromOnScreenKeyboard] = if IsUsePreferredInputResultMatch then UseCallbackResult3 else nil,
		Text = OverlayEdit.text,
		TextColor3 = OverlayEdit.textOverlayStyle.fontColor,
		TextSize = OverlayEdit.textOverlayStyle.fontSize,
		TextXAlignment = OverlayEdit.textOverlayStyle.textXAlignment,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextWrapped = true,
		Selectable = p1.editable == true,
		Size = Size,
		Visible = p1.textVisible ~= false and nil,
		ZIndex = OverlayEdit.zIndex,
		ref = p1.textBoxRef,
		[ReactModule.Change.Text] = p1.onTextChanged
	}, {
		WrapWidth = UISizeConstraint,
		FontQuirkPadding = if Entry or NewCeiled > 0 then ReactModule.createElement("UIPadding", {
			PaddingLeft = if Offset > 0 then UDim.new(0, Offset) else nil,
			PaddingTop = if Entry then UDim.new(0, Ceiled) else nil,
			PaddingRight = if NewCeiled > 0 then UDim.new(0, NewCeiled) else nil
		}) else nil
	})
	local Scale = OverlayEdit.scale
	local AdditionalScale = p1.additionalScale
	local config2 = {
		ref = p1.containerRef,
		onActivated = p1.onActivated,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		Position = OverlayEdit.position,
		Rotation = OverlayEdit.rotation,
		scale = if AdditionalScale == nil then Scale elseif typeof(AdditionalScale) == "number" then Scale * AdditionalScale else AdditionalScale:map(function(p2)
			-- upvalues: Scale (copy)
			return Scale * p2
		end),
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = OverlayEdit.zIndex
	}
	local _Vector2 = Vector2.new(300, 1e999)
	
	if FFlagMomentsTextOverlayV2RedesignModule and p1.selected == true then
		local NoV21: boolean = UsePreferredInputResult == ResponsiveModule.Input.Pointer and not v1
		local config3 = {
			tag = "auto-xy padding-medium radius-medium bg-contrast",
			GroupTransparency = GroupTransparency,
			scale = config2.scale,
			sizeConstraint = { MaxSize = _Vector2 },
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			}
		}
		
		if FFlagMomentsTextOverlayFixedContrastModule then
			config3.backgroundStyle = Contrast
			config3.tag = "auto-xy padding-medium radius-medium"
		end
		config2.scale = nil
		config2.tag = "position-center-center anchor-center-center auto-xy"
		
		return ReactModule.createElement(View, config2, {
			UIDragDetector = UseMemoResult,
			Selection = ReactModule.createElement(View, {
				tag = "auto-xy radius-medium",
				ZIndex = 1,
				padding = {
					bottom = UDim.new(0, 4),
					left = UDim.new(0, 4),
					right = UDim.new(0, 4),
					top = UDim.new(0, 4)
				},
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				},
				stroke = {
					Thickness = 1.5,
					Color = _Color3,
					Transparency = if NoV21 then 0.45 else 1
				}
			}, {
				Chip = ReactModule.createElement(View, config3, { TextInput = TextBox })
			}),
			SelectionControls = ReactModule.createElement(TextOverlaySelectionControlsModule, {
				borderGap = 4,
				containerRef = p1.containerRef,
				onRotationChanged = p1.onRotationChanged,
				onScaleChanged = p1.onScaleChanged,
				rotation = OverlayEdit.rotation,
				scale = OverlayEdit.scale,
				visible = NoV21
			})
		})
	elseif FFlagMomentsTextOverlayV2RedesignModule then
		local config4 = {
			tag = "auto-xy padding-medium radius-medium bg-contrast",
			GroupTransparency = GroupTransparency,
			scale = config2.scale,
			sizeConstraint = { MaxSize = _Vector2 },
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			}
		}
		
		if FFlagMomentsTextOverlayFixedContrastModule then
			config4.backgroundStyle = Contrast
			config4.tag = "auto-xy padding-medium radius-medium"
		end
		config2.scale = nil
		config2.tag = "position-center-center anchor-center-center auto-xy"
		
		return ReactModule.createElement(View, config2, {
			UIDragDetector = UseMemoResult,
			Chip = ReactModule.createElement(View, config4, { TextInput = TextBox })
		})
	else
		config2.tag = "position-center-center anchor-center-center auto-xy padding-medium radius-medium bg-contrast"
		config2.sizeConstraint = { MaxSize = _Vector2 }
		
		if FFlagMomentsTextOverlayFixedContrastModule then
			config2.backgroundStyle = Contrast
			config2.tag = "position-center-center anchor-center-center auto-xy padding-medium radius-medium"
		end
		return ReactModule.createElement(View, config2, { UIDragDetector = UseMemoResult, TextInput = TextBox })
	end
end