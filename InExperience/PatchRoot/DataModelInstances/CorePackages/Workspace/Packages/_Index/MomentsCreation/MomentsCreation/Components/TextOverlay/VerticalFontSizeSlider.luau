local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local GuiService = game:GetService("GuiService")
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
local UseRefFunction = ReactModule.useRef
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local FFlagMomentsTextOverlayV2Redesign = MomentsCommonModule.Flags.FFlagMomentsTextOverlayV2Redesign
local FFlagMomentsTextOverlayFontSliderTouchAreaModule = require(MomentsCreation.Flags.FFlagMomentsTextOverlayFontSliderTouchArea)
local FontSizeTouchAreaModule = require(MomentsCreation.Components.TextOverlay.FontSizeTouchArea)
local ComputeRotatedTrackFractionModule = require(MomentsCreation.Utils.computeRotatedTrackFraction)
local ConstantsModule = require(MomentsCreation.Constants)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)
local MinFontSize = ConstantsModule.TextOverlay.MinFontSize
local TreatmentMaxFontSize = ConstantsModule.TextOverlay.TreatmentMaxFontSize

local function toGuiInputPosition(p1, Current)
	-- upvalues: GuiService (copy)
	local ScreenGui = Current:FindFirstAncestorWhichIsA("ScreenGui")
	
	return if ScreenGui == nil or not ScreenGui.IgnoreGuiInset then p1 else p1 + GuiService:GetInsetArea(if ScreenGui.ScreenInsets == Enum.ScreenInsets.DeviceSafeInsets then Enum.ScreenInsets.DeviceSafeInsets else Enum.ScreenInsets.None).Min
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDeviceInsetsFunction (copy), UseMemoFunction (copy), SignalsModule (copy), ConstantsModule (copy), UseSignalStateFunction (copy), UseCallbackFunction (copy), DashModule (copy), FFlagMomentsTextOverlayV2Redesign (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), FFlagMomentsTextOverlayFontSliderTouchAreaModule (copy), UseRefFunction (copy), ComputeRotatedTrackFractionModule (copy), toGuiInputPosition (copy), MinFontSize (copy), TreatmentMaxFontSize (copy), ReactModule (copy), View (copy), Slider (copy), Knob (copy), FoundationModule (copy), FontSizeTouchAreaModule (copy)
	local Controller = p1.controller
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseSignalStateResult: number = UseSignalStateFunction((UseMemoFunction(function()
		-- upvalues: SignalsModule (upval), Controller (copy), ConstantsModule (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: Controller (upval), ConstantsModule (upval)
			local ActiveSession = Controller.getActiveSession(p2)
			local Draft = if ActiveSession == nil then nil else ActiveSession.getDraft(p2)
			local DraftEntry = Draft and Draft[1]
			
			return if DraftEntry == nil then ConstantsModule.TextOverlay.DefaultFontSize else DraftEntry.textOverlayStyle.fontSize
		end)
	end, { Controller })))
	local UseCallbackResult = UseCallbackFunction(function(FontSize)
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
	end, { Controller })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: FFlagMomentsTextOverlayV2Redesign (upval), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
		if FFlagMomentsTextOverlayV2Redesign then
			FireAnalyticsEventModule(EventNames.EditingFlowTextOverlayFontSizeSliderUsed, MakeCreationEventFieldsModule.makeTextOverlayEventFields())
		end
	end, {})
	local TouchAreaRef = nil
	local OnDragStarted = nil
	local OnDrag = nil
	
	if FFlagMomentsTextOverlayFontSliderTouchAreaModule then
		local UseRefResult = UseRefFunction(nil)
		TouchAreaRef = UseRefResult
		local UseCallbackResult2 = UseCallbackFunction(function(p2)
			-- upvalues: UseRefResult (copy), ComputeRotatedTrackFractionModule (upval), toGuiInputPosition (upval), UseCallbackResult (copy), MinFontSize (upval), TreatmentMaxFontSize (upval)
			local Current = UseRefResult.current
			
			if Current ~= nil then
				UseCallbackResult(MinFontSize + ComputeRotatedTrackFractionModule(toGuiInputPosition(p2, Current), Current.AbsolutePosition + Current.AbsoluteSize / 2, Current.AbsoluteSize.X, Current.AbsoluteRotation) * (TreatmentMaxFontSize - MinFontSize))
				
				return
			end
		end, { UseCallbackResult })
		OnDragStarted = UseCallbackFunction(function(_, p2)
			-- upvalues: UseCallbackResult1 (copy), UseCallbackResult2 (copy)
			UseCallbackResult1()
			UseCallbackResult2(p2)
		end, { UseCallbackResult1, UseCallbackResult2 })
		OnDrag = UseCallbackFunction(function(_, p2)
			-- upvalues: UseCallbackResult2 (copy)
			UseCallbackResult2(p2)
		end, { UseCallbackResult2 })
	end
	local ClampedValue = math.clamp(p1.mediaHeight * 0.45, 140, 320)
	
	return ReactModule.createElement(View, {
		Rotation = -90,
		ZIndex = 10,
		tag = {
			["anchor-center-center"] = true,
			["auto-xy"] = not FFlagMomentsTextOverlayFontSliderTouchAreaModule
		},
		Size = if FFlagMomentsTextOverlayFontSliderTouchAreaModule then UDim2.fromOffset(ClampedValue, 48) else nil,
		Position = UDim2.new(1, -(math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge) + UseTokensResult.Padding.Medium), 0.5, 0)
	}, {
		Slider = ReactModule.createElement(Slider, {
			testId = "--social-moments-creation-slider-font-size",
			knob = ReactModule.createElement(Knob, { size = FoundationModule.Enums.InputSize.Large }),
			knobVisibility = FoundationModule.Enums.Visibility.Always,
			onDragStarted = UseCallbackResult1,
			onValueChanged = UseCallbackResult,
			size = FoundationModule.Enums.InputSize.XSmall,
			range = NumberRange.new(MinFontSize, TreatmentMaxFontSize),
			value = math.clamp(UseSignalStateResult, MinFontSize, TreatmentMaxFontSize),
			variant = FoundationModule.Enums.SliderVariant.Standard,
			width = UDim.new(0, ClampedValue),
			AnchorPoint = if FFlagMomentsTextOverlayFontSliderTouchAreaModule then Vector2.new(0.5, 0.5) else nil,
			Position = if FFlagMomentsTextOverlayFontSliderTouchAreaModule then UDim2.fromScale(0.5, 0.5) else nil
		}),
		TouchArea = if FFlagMomentsTextOverlayFontSliderTouchAreaModule then ReactModule.createElement(FontSizeTouchAreaModule, {
			ZIndex = 2,
			touchAreaRef = TouchAreaRef,
			onDragStarted = OnDragStarted,
			onDrag = OnDrag
		}) else nil
	})
end