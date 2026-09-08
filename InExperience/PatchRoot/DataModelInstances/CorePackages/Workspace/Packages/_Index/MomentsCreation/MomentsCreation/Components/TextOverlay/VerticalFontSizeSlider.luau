local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local knob = foundationModule.Knob
local slider = foundationModule.Slider
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState
local constantsModule = require(momentsCreation.Constants)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)
local minFontSize = constantsModule.TextOverlay.MinFontSize
local treatmentMaxFontSize = constantsModule.TextOverlay.TreatmentMaxFontSize

return function(p1)
	-- upvalues: useTokens (ref), useDeviceInsets (ref), useMemo (ref), signalsModule (ref), constantsModule (ref), useSignalState (ref), useCallback (ref), dashModule (ref), reactModule (ref), view (ref), slider (ref), knob (ref), foundationModule (ref), minFontSize (ref), treatmentMaxFontSize (ref)
	local controller = p1.controller
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "anchor-center-center auto-xy",
		Rotation = -90,
		ZIndex = 10,
		Position = UDim2.new(1, -(math.max(useDeviceInsets().right, var1.Padding.XLarge) + var1.Padding.Medium), 0.5, 0)
	}, {
		Slider = reactModule.createElement(slider, {
			knob = reactModule.createElement(knob, { size = foundationModule.Enums.InputSize.Large }),
			knobVisibility = foundationModule.Enums.Visibility.Always,
			onValueChanged = useCallback(function(p2)
				-- upvalues: controller (ref), dashModule (copy)
				local activeSession = controller.getActiveSession(false)
				
				if activeSession == nil then return end
				local draft = activeSession.getDraft(false)
				local var2 = draft and draft[1]
				
				if var2 == nil then
					return
				end
				activeSession.update({
					dashModule.joinDeep(var2, { textOverlayStyle = { fontSize = p2 } })
				})
			end, { controller }),
			size = foundationModule.Enums.InputSize.XSmall,
			range = NumberRange.new(minFontSize, treatmentMaxFontSize),
			value = math.clamp(useSignalState(useMemo(function()
				-- upvalues: signalsModule (copy), controller (ref), constantsModule (copy)
				return signalsModule.createComputed(function(p2)
					-- upvalues: controller (copy), constantsModule (copy)
					local activeSession = controller.getActiveSession(p2)
					local var2 = if activeSession ~= nil then nil else activeSession.getDraft(p2)
					local var3 = var2 and var2[1]
					
					return if var3 == nil then constantsModule.TextOverlay.DefaultFontSize else var3.textOverlayStyle.fontSize
				end)
			end, { controller })), minFontSize, treatmentMaxFontSize),
			variant = foundationModule.Enums.SliderVariant.Standard,
			width = UDim.new(0, math.clamp(p1.mediaHeight * 0.45, 140, 320))
		})
	})
end