local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local textService = game:GetService("TextService")
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local useBinding = reactModule.useBinding
local useCallback = reactModule.useCallback
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useEffectOnceModule = require(momentsCreationFlow.Hooks.useEffectOnce)
local useOnScreenKeyboardHeightModule = require(momentsCreationFlow.Hooks.useOnScreenKeyboardHeight)
local useRef = reactModule.useRef
local useState = reactModule.useState
local useTokens = foundationModule.Hooks.useTokens
local knob = foundationModule.Knob
local slider = foundationModule.Slider
local view = foundationModule.View
local textOverlay = momentsCommonModule.TextOverlay

return function(p0)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useRef (ref), useBinding (ref), useState (ref), useOnScreenKeyboardHeightModule (ref), useCallback (ref), dashModule (ref), useEffectOnceModule (ref), reactModule (ref), textService (ref), view (ref), foundationModule (ref), slider (ref), knob (ref), textOverlay (ref)
	local var8 = useDeviceInsets()
	local var9 = useTokens()
	local var10 = useRef(nil)
	local var11, var12 = useBinding(UDim2.fromOffset(0, 0))
	local var13, var14 = useState(Vector2.new(0, 0))
	local var15 = useOnScreenKeyboardHeightModule()
	local var16 = p0.textOverlayEdits and p0.textOverlayEdits[1]
	local var17 = useCallback(function()
		-- upvalues: var10 (ref)
		if var10.current then
			var10.current:CaptureFocus()
		end
	end, {})
	local var18 = useCallback(function(p1)
		-- upvalues: p0 (ref), dashModule (copy), var16 (ref)
		local charCount = utf8.len(p1.Text)
		
		if charCount ~= nil and charCount >= 100 then
			p1.Text = string.sub(p1.Text, 1, utf8.offset(p1.Text, 101) - 1)
		end
		p0.onTextOverlayUpdated({ dashModule.joinDeep(var16, { text = p1.Text }) })
	end, { var16, p0.onTextOverlayUpdated })
	local var19 = useCallback(function(p2)
		-- upvalues: p0 (ref), dashModule (copy), var16 (ref)
		if p0.textOverlayEdits then
			p0.onTextOverlayUpdated({
				dashModule.joinDeep(var16, { textOverlayStyle = { fontSize = p2 } })
			})
			
			return
		end
	end, { p0.onTextOverlayUpdated, var16 })
	local var20 = useCallback(function(p3)
		-- upvalues: var14 (ref)
		var14(p3.AbsoluteSize)
	end, {})
	useEffectOnceModule(function()
		-- upvalues: var17 (ref)
		var17()
	end, var10.current ~= nil and p0.textOverlayEdits ~= nil)
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), var15 (ref), var12 (ref), textService (copy), var13 (ref)
		if not var16 then return end
		if var15 == 0 then
			var12(UDim2.fromOffset(0, 0))
			
			return
		end
		local wTextSize = textService:GetTextSize("W", var16.textOverlayStyle.fontSize, var16.textOverlayStyle.font, Vector2.new(var13.X, var13.Y))
		var12(UDim2.fromOffset(math.min(wTextSize.X * 30, var13.X / 2), math.min(wTextSize.Y * 5, var13.Y / 2)))
	end, { var13, var16, var15 })
	
	return if p0.textOverlayEdits then reactModule.createElement(view, {
		tag = "bg-over-media-0 size-full",
		onAbsoluteSizeChanged = var20,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = p0.zIndex or 1
	}, {
		Controls = if var15 == 0 then reactModule.createElement(view, {
			tag = "auto-y anchor-bottom-center col gap-large position-bottom-center size-full-0"
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var9.Padding.XLarge),
				PaddingBottom = UDim.new(0, var9.Padding.XLarge),
				PaddingLeft = UDim.new(0, math.max(var8.left, var9.Padding.XLarge)),
				PaddingRight = UDim.new(0, math.max(var8.right, var9.Padding.XLarge))
			}),
			FontSizeSlider = reactModule.createElement(slider, {
				LayoutOrder = 2,
				knob = reactModule.createElement(knob, { size = foundationModule.Enums.InputSize.Large }),
				knobVisibility = foundationModule.Enums.Visibility.Always,
				onValueChanged = var19,
				size = foundationModule.Enums.InputSize.XSmall,
				range = NumberRange.new(10, 32),
				value = p0.textOverlayEdits[1].textOverlayStyle.fontSize,
				variant = foundationModule.Enums.SliderVariant.Standard
			})
		}) else nil,
		TextOverlay = reactModule.createElement(textOverlay, {
			editable = true,
			onActivated = var17,
			size = var11,
			textOverlayEdit = dashModule.joinDeep(var16, {
				rotation = 0,
				scale = 1,
				position = UDim2.fromScale(0.5, 0.5)
			}),
			onTextChanged = var18,
			textBoxRef = var10
		})
	}) else nil
end