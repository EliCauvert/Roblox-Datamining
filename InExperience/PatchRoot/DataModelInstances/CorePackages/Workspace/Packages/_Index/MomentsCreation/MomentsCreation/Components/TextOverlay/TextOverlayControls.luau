local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local button = foundationModule.Button
local knob = foundationModule.Knob
local slider = foundationModule.Slider
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState
local constantsModule = require(momentsCreation.Constants)
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)
local getFFlagMomentsTextVerticalSizeSliderModule = require(momentsCreation.Flags.GetFFlagMomentsTextVerticalSizeSlider)

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), getFFlagMomentsTextVerticalSizeSliderModule (ref), useMemo (ref), signalsModule (ref), constantsModule (ref), useSignalState (ref), useCallback (ref), dashModule (ref), reactModule (ref), view (ref), slider (ref), knob (ref), foundationModule (ref), button (ref)
	local controller = p1.controller
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = useCreationFlowStringsModule()
	local var4 = getFFlagMomentsTextVerticalSizeSliderModule()
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, var2.Padding.Small),
			bottom = UDim.new(0, math.max(var1.bottom, var2.Padding.Small)),
			left = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
			right = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
		}
	}, {
		FontSizeSlider = if var4 then nil else reactModule.createElement(slider, {
			LayoutOrder = 1,
			knob = reactModule.createElement(knob, { size = foundationModule.Enums.InputSize.Large }),
			knobVisibility = foundationModule.Enums.Visibility.Always,
			onValueChanged = useCallback(function(p2)
				-- upvalues: controller (ref), dashModule (copy)
				local activeSession = controller.getActiveSession(false)
				
				if activeSession == nil then return end
				local draft = activeSession.getDraft(false)
				local var5 = draft and draft[1]
				
				if var5 == nil then
					return
				end
				activeSession.update({
					dashModule.joinDeep(var5, { textOverlayStyle = { fontSize = p2 } })
				})
			end, { controller }),
			size = foundationModule.Enums.InputSize.XSmall,
			range = NumberRange.new(constantsModule.TextOverlay.MinFontSize, constantsModule.TextOverlay.MaxFontSize),
			value = math.clamp(useSignalState(useMemo(function()
				-- upvalues: signalsModule (copy), var4 (ref), constantsModule (copy), controller (ref)
				return signalsModule.createComputed(function(p2)
					-- upvalues: var4 (copy), constantsModule (copy), controller (copy)
					if var4 then
						return constantsModule.TextOverlay.DefaultFontSize
					end
					local activeSession = controller.getActiveSession(p2)
					local var5 = if activeSession ~= nil then nil else activeSession.getDraft(p2)
					local var6 = var5 and var5[1]
					
					return if var6 == nil then constantsModule.TextOverlay.DefaultFontSize else var6.textOverlayStyle.fontSize
				end)
			end, { controller, var4 })), constantsModule.TextOverlay.MinFontSize, constantsModule.TextOverlay.MaxFontSize),
			variant = foundationModule.Enums.SliderVariant.Standard
		}),
		Nav = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			BackButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.GeneralCtaBack,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function()
					-- upvalues: controller (ref)
					controller.discardActiveTool()
				end, { controller }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			DoneButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var3.GeneralCtaDone,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function()
					-- upvalues: controller (ref)
					controller.commitActiveTool()
				end, { controller }),
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end