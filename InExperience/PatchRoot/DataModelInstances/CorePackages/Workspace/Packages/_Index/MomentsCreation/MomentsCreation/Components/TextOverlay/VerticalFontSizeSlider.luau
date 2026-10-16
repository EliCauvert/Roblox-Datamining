local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local Knob = FoundationModule.Knob
local Slider = FoundationModule.Slider
local View = FoundationModule.View
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local FFlagMomentsTextOverlayV2Redesign = MomentsCommonModule.Flags.FFlagMomentsTextOverlayV2Redesign
local ConstantsModule = require(MomentsCreation.Constants)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)
local MinFontSize = ConstantsModule.TextOverlay.MinFontSize
local TreatmentMaxFontSize = ConstantsModule.TextOverlay.TreatmentMaxFontSize

return function(p1) --[[ Line: 68 | Named "VerticalFontSizeSlider" ]]
	-- upvalues: UseTokensFunction (copy), UseDeviceInsetsFunction (copy), UseMemoFunction (copy), SignalsModule (copy), ConstantsModule (copy), UseSignalStateFunction (copy), UseCallbackFunction (copy), DashModule (copy), FFlagMomentsTextOverlayV2Redesign (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), ReactModule (copy), View (copy), Slider (copy), Knob (copy), FoundationModule (copy), MinFontSize (copy), TreatmentMaxFontSize (copy)
	local Controller = p1.controller
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "anchor-center-center auto-xy",
		Rotation = -90,
		ZIndex = 10,
		Position = UDim2.new(1, -(math.max(UseDeviceInsetsFunction().right, UseTokensResult.Padding.XLarge) + UseTokensResult.Padding.Medium), 0.5, 0)
	}, {
		Slider = ReactModule.createElement(Slider, {
			knob = ReactModule.createElement(Knob, { size = FoundationModule.Enums.InputSize.Large }),
			knobVisibility = FoundationModule.Enums.Visibility.Always,
			onDragStarted = UseCallbackFunction(function() --[[ Line: 99 ]]
				-- upvalues: FFlagMomentsTextOverlayV2Redesign (upval), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
				if FFlagMomentsTextOverlayV2Redesign then
					FireAnalyticsEventModule(EventNames.EditingFlowTextOverlayFontSizeSliderUsed, MakeCreationEventFieldsModule.makeTextOverlayEventFields())
				end
			end, {}),
			onValueChanged = UseCallbackFunction(function(FontSize) --[[ Line: 84 ]]
				-- upvalues: Controller (copy), DashModule (upval)
				local ActiveSession = Controller.getActiveSession(false)
				
				if ActiveSession == nil then return end
				local Draft = ActiveSession.getDraft(false)
				local DraftEntry = Draft and Draft[1]
				
				if DraftEntry ~= nil then
					ActiveSession.update({
						DashModule.joinDeep(DraftEntry, { textOverlayStyle = { fontSize = FontSize } })
					})
					
					return
				end
			end, { Controller }),
			size = FoundationModule.Enums.InputSize.XSmall,
			range = NumberRange.new(MinFontSize, TreatmentMaxFontSize),
			value = math.clamp(UseSignalStateFunction((UseMemoFunction(function() --[[ Line: 74 ]]
				-- upvalues: SignalsModule (upval), Controller (copy), ConstantsModule (upval)
				return SignalsModule.createComputed(function(p2) --[[ Line: 75 ]]
					-- upvalues: Controller (upval), ConstantsModule (upval)
					local ActiveSession = Controller.getActiveSession(p2)
					local Draft = if ActiveSession == nil then nil else ActiveSession.getDraft(p2)
					local DraftEntry = Draft and Draft[1]
					
					return if DraftEntry == nil then ConstantsModule.TextOverlay.DefaultFontSize else DraftEntry.textOverlayStyle.fontSize
				end)
			end, { Controller }))), MinFontSize, TreatmentMaxFontSize),
			variant = FoundationModule.Enums.SliderVariant.Standard,
			width = UDim.new(0, (math.clamp(p1.mediaHeight * 0.45, 140, 320)))
		})
	})
end