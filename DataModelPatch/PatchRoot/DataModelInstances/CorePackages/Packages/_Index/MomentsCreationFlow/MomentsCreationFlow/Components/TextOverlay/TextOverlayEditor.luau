local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local TextService = game:GetService("TextService")
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local UseBindingFunction = ReactModule.useBinding
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseEffectOnceModule = require(MomentsCreationFlow.Hooks.useEffectOnce)
local UseOnScreenKeyboardHeightModule = require(MomentsCreationFlow.Hooks.useOnScreenKeyboardHeight)
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Knob = FoundationModule.Knob
local Slider = FoundationModule.Slider
local View = FoundationModule.View
local TextOverlay = MomentsCommonModule.TextOverlay

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseRefFunction (copy), UseBindingFunction (copy), UseStateFunction (copy), UseOnScreenKeyboardHeightModule (copy), UseCallbackFunction (copy), DashModule (copy), UseEffectOnceModule (copy), ReactModule (copy), TextService (copy), View (copy), FoundationModule (copy), Slider (copy), Knob (copy), TextOverlay (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = UseRefFunction(nil)
	local UseBindingResult, UseBindingResult2 = UseBindingFunction(UDim2.fromOffset(0, 0))
	local UseStateResult, UseStateResult2 = UseStateFunction(Vector2.new(0, 0))
	local UseOnScreenKeyboardHeightModuleResult = UseOnScreenKeyboardHeightModule()
	local TextOverlayEdit = p1.textOverlayEdits and p1.textOverlayEdits[1]
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current:CaptureFocus()
		end
	end, {})
	local UseCallbackResult1 = UseCallbackFunction(function(p2)
		-- upvalues: p1 (copy), DashModule (upval), TextOverlayEdit (copy)
		local Length = utf8.len(p2.Text)
		
		if Length ~= nil and Length >= 100 then
			p2.Text = string.sub(p2.Text, 1, utf8.offset(p2.Text, 101) - 1)
		end
		p1.onTextOverlayUpdated({ DashModule.joinDeep(TextOverlayEdit, { text = p2.Text }) })
	end, { TextOverlayEdit, p1.onTextOverlayUpdated })
	local UseCallbackResult2 = UseCallbackFunction(function(FontSize)
		-- upvalues: p1 (copy), DashModule (upval), TextOverlayEdit (copy)
		if p1.textOverlayEdits then
			p1.onTextOverlayUpdated({
				(DashModule.joinDeep(TextOverlayEdit, { textOverlayStyle = { fontSize = FontSize } }))
			})
			
			return
		end
	end, { p1.onTextOverlayUpdated, TextOverlayEdit })
	local UseCallbackResult3 = UseCallbackFunction(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	UseEffectOnceModule(function()
		-- upvalues: UseCallbackResult (copy)
		UseCallbackResult()
	end, UseRefResult.current ~= nil and p1.textOverlayEdits ~= nil)
	ReactModule.useEffect(function()
		-- upvalues: TextOverlayEdit (copy), UseOnScreenKeyboardHeightModuleResult (copy), UseBindingResult2 (copy), TextService (upval), UseStateResult (copy)
		if not TextOverlayEdit then return end
		if UseOnScreenKeyboardHeightModuleResult == 0 then
			UseBindingResult2(UDim2.fromOffset(0, 0))
			
			return
		else
			local WTextSize = TextService:GetTextSize("W", TextOverlayEdit.textOverlayStyle.fontSize, TextOverlayEdit.textOverlayStyle.font, Vector2.new(UseStateResult.X, UseStateResult.Y))
			UseBindingResult2(UDim2.fromOffset(math.min(WTextSize.X * 30, UseStateResult.X / 2), (math.min(WTextSize.Y * 5, UseStateResult.Y / 2))))
		end
	end, {
		UseStateResult,
		TextOverlayEdit,
		UseOnScreenKeyboardHeightModuleResult
	})
	
	return if p1.textOverlayEdits then ReactModule.createElement(View, {
		tag = "bg-over-media-0 size-full",
		onAbsoluteSizeChanged = UseCallbackResult3,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = p1.zIndex or 1
	}, {
		Controls = if UseOnScreenKeyboardHeightModuleResult == 0 then ReactModule.createElement(View, {
			tag = "auto-y anchor-bottom-center col gap-large position-bottom-center size-full-0"
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseTokensResult.Padding.XLarge),
				PaddingBottom = UDim.new(0, UseTokensResult.Padding.XLarge),
				PaddingLeft = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
				PaddingRight = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
			}),
			FontSizeSlider = ReactModule.createElement(Slider, {
				LayoutOrder = 2,
				knob = ReactModule.createElement(Knob, { size = FoundationModule.Enums.InputSize.Large }),
				knobVisibility = FoundationModule.Enums.Visibility.Always,
				onValueChanged = UseCallbackResult2,
				size = FoundationModule.Enums.InputSize.XSmall,
				range = NumberRange.new(10, 32),
				value = p1.textOverlayEdits[1].textOverlayStyle.fontSize,
				variant = FoundationModule.Enums.SliderVariant.Standard
			})
		}) else nil,
		TextOverlay = ReactModule.createElement(TextOverlay, {
			editable = true,
			onActivated = UseCallbackResult,
			size = UseBindingResult,
			textOverlayEdit = DashModule.joinDeep(TextOverlayEdit, {
				rotation = 0,
				scale = 1,
				position = UDim2.fromScale(0.5, 0.5)
			}),
			onTextChanged = UseCallbackResult1,
			textBoxRef = UseRefResult
		})
	}) else nil
end