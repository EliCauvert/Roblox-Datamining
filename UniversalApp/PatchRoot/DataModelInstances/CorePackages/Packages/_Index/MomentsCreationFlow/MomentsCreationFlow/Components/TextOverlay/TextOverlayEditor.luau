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

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useRef (ref), useBinding (ref), useState (ref), useOnScreenKeyboardHeightModule (ref), useCallback (ref), dashModule (ref), useEffectOnceModule (ref), reactModule (ref), textService (ref), view (ref), foundationModule (ref), slider (ref), knob (ref), textOverlay (ref)
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = useRef(nil)
	local var4, var5 = useBinding(UDim2.fromOffset(0, 0))
	local var6, var7 = useState(Vector2.new(0, 0))
	local var8 = useOnScreenKeyboardHeightModule()
	local var9 = p1.textOverlayEdits and p1.textOverlayEdits[1]
	local var10 = useCallback(function()
		-- upvalues: var3 (ref)
		if var3.current then
			var3.current:CaptureFocus()
		end
	end, {})
	local var11 = useCallback(function(p2)
		-- upvalues: p1 (ref), dashModule (copy), var9 (ref)
		local charCount = utf8.len(p2.Text)
		
		if charCount ~= nil and charCount >= 100 then
			p2.Text = string.sub(p2.Text, 1, utf8.offset(p2.Text, 101) - 1)
		end
		p1.onTextOverlayUpdated({ dashModule.joinDeep(var9, { text = p2.Text }) })
	end, { var9, p1.onTextOverlayUpdated })
	local var12 = useCallback(function(p2)
		-- upvalues: p1 (ref), dashModule (copy), var9 (ref)
		if p1.textOverlayEdits then
			p1.onTextOverlayUpdated({
				dashModule.joinDeep(var9, { textOverlayStyle = { fontSize = p2 } })
			})
			
			return
		end
	end, { p1.onTextOverlayUpdated, var9 })
	local var13 = useCallback(function(p2)
		-- upvalues: var7 (ref)
		var7(p2.AbsoluteSize)
	end, {})
	useEffectOnceModule(function()
		-- upvalues: var10 (ref)
		var10()
	end, var3.current ~= nil and p1.textOverlayEdits ~= nil)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var8 (ref), var5 (ref), textService (copy), var6 (ref)
		if not var9 then return end
		if var8 == 0 then
			var5(UDim2.fromOffset(0, 0))
			
			return
		end
		local wTextSize = textService:GetTextSize("W", var9.textOverlayStyle.fontSize, var9.textOverlayStyle.font, Vector2.new(var6.X, var6.Y))
		var5(UDim2.fromOffset(math.min(wTextSize.X * 30, var6.X / 2), math.min(wTextSize.Y * 5, var6.Y / 2)))
	end, { var6, var9, var8 })
	
	return if p1.textOverlayEdits then reactModule.createElement(view, {
		tag = "bg-over-media-0 size-full",
		onAbsoluteSizeChanged = var13,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = p1.zIndex or 1
	}, {
		Controls = if var8 == 0 then reactModule.createElement(view, {
			tag = "auto-y anchor-bottom-center col gap-large position-bottom-center size-full-0"
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var2.Padding.XLarge),
				PaddingBottom = UDim.new(0, var2.Padding.XLarge),
				PaddingLeft = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
				PaddingRight = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
			}),
			FontSizeSlider = reactModule.createElement(slider, {
				LayoutOrder = 2,
				knob = reactModule.createElement(knob, { size = foundationModule.Enums.InputSize.Large }),
				knobVisibility = foundationModule.Enums.Visibility.Always,
				onValueChanged = var12,
				size = foundationModule.Enums.InputSize.XSmall,
				range = NumberRange.new(10, 32),
				value = p1.textOverlayEdits[1].textOverlayStyle.fontSize,
				variant = foundationModule.Enums.SliderVariant.Standard
			})
		}) else nil,
		TextOverlay = reactModule.createElement(textOverlay, {
			editable = true,
			onActivated = var10,
			size = var4,
			textOverlayEdit = dashModule.joinDeep(var9, {
				rotation = 0,
				scale = 1,
				position = UDim2.fromScale(0.5, 0.5)
			}),
			onTextChanged = var11,
			textBoxRef = var3
		})
	}) else nil
end