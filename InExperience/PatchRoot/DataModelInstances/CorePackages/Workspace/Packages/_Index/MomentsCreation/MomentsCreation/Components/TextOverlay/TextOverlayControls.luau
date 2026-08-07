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

return function(p0) --[[ line: 45 | named "TextOverlayControls" ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), useMemo (ref), signalsModule (ref), constantsModule (ref), useSignalState (ref), useCallback (ref), dashModule (ref), reactModule (ref), view (ref), slider (ref), knob (ref), foundationModule (ref), button (ref)
	local controller = p0.controller
	local var9 = useDeviceInsets()
	local var10 = useTokens()
	local var11 = useCreationFlowStringsModule()
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		padding = {
			top = UDim.new(0, var10.Padding.Small),
			bottom = UDim.new(0, math.max(var9.bottom, var10.Padding.Small)),
			left = UDim.new(0, math.max(var9.left, var10.Padding.XLarge)),
			right = UDim.new(0, math.max(var9.right, var10.Padding.XLarge))
		}
	}, {
		FontSizeSlider = reactModule.createElement(slider, {
			LayoutOrder = 1,
			knob = reactModule.createElement(knob, { size = foundationModule.Enums.InputSize.Large }),
			knobVisibility = foundationModule.Enums.Visibility.Always,
			onValueChanged = useCallback(function(p1) --[[ line: 63 ]]
				-- upvalues: controller (ref), dashModule (copy)
				local activeSession = controller.getActiveSession(false)
				
				if activeSession == nil then return end
				local draft = activeSession.getDraft(false)
				local var14 = draft and draft[1]
				
				if var14 == nil then
					return
				end
				activeSession.update({
					dashModule.joinDeep(var14, { textOverlayStyle = { fontSize = p1 } })
				})
			end, { controller }),
			size = foundationModule.Enums.InputSize.XSmall,
			range = NumberRange.new(constantsModule.TextOverlay.MinFontSize, constantsModule.TextOverlay.MaxFontSize),
			value = math.clamp(useSignalState(useMemo(function() --[[ line: 53 ]]
				-- upvalues: signalsModule (copy), controller (ref), constantsModule (copy)
				return signalsModule.createComputed(function(p2) --[[ line: 54 ]]
					-- upvalues: controller (copy), constantsModule (copy)
					local activeSession = controller.getActiveSession(p2)
					local var16 = if activeSession ~= nil then nil else activeSession.getDraft(p2)
					local var17 = var16 and var16[1]
					
					return if var17 == nil then constantsModule.TextOverlay.DefaultFontSize else var17.textOverlayStyle.fontSize
				end)
			end, { controller })), constantsModule.TextOverlay.MinFontSize, constantsModule.TextOverlay.MaxFontSize),
			variant = foundationModule.Enums.SliderVariant.Standard
		}),
		Nav = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			BackButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var11.GeneralCtaBack,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function() --[[ line: 76 ]]
					-- upvalues: controller (ref)
					controller.discardActiveTool()
				end, { controller }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			DoneButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				text = var11.GeneralCtaDone,
				variant = foundationModule.Enums.ButtonVariant.Text,
				onActivated = useCallback(function() --[[ line: 80 ]]
					-- upvalues: controller (ref)
					controller.commitActiveTool()
				end, { controller }),
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end