local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local UseCallbackFunction = ReactModule.useCallback
local UseStateFunction = ReactModule.useState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local FFlagMomentsTextOverlayV2Redesign = MomentsCommonModule.Flags.FFlagMomentsTextOverlayV2Redesign
local TextAlignmentButtonModule = require(MomentsCreation.Components.TextOverlay.TextAlignmentButton)
local TextColorButtonModule = require(MomentsCreation.Components.TextOverlay.TextColorButton)
local TextColorSwatchRowModule = require(MomentsCreation.Components.TextOverlay.TextColorSwatchRow)
local TextFontButtonModule = require(MomentsCreation.Components.TextOverlay.TextFontButton)
local TextFontRowModule = require(MomentsCreation.Components.TextOverlay.TextFontRow)
local _ = require(MomentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseStateFunction (copy), UseCallbackFunction (copy), FFlagMomentsTextOverlayV2Redesign (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), ReactModule (copy), View (copy), TextFontButtonModule (copy), TextColorButtonModule (copy), TextAlignmentButtonModule (copy), TextColorSwatchRowModule (copy), TextFontRowModule (copy)
	local Controller = p1.controller
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction(nil)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseStateResult (copy), FFlagMomentsTextOverlayV2Redesign (upval), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), UseStateResult2 (copy)
		local Color = if UseStateResult == "Color" then nil else "Color"
		
		if FFlagMomentsTextOverlayV2Redesign then
			FireAnalyticsEventModule(EventNames.EditingFlowTextOverlayColorPickerToggled, MakeCreationEventFieldsModule.makeTextOverlayEventFields({ buttonToggled = if Color == nil then "close" else "open" }))
		end
		UseStateResult2(Color)
	end, { UseStateResult })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseStateResult (copy), FFlagMomentsTextOverlayV2Redesign (upval), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), UseStateResult2 (copy)
		local v1 = if UseStateResult == "Font" then nil else "Font"
		
		if FFlagMomentsTextOverlayV2Redesign then
			FireAnalyticsEventModule(EventNames.EditingFlowTextOverlayFontToolbarToggled, MakeCreationEventFieldsModule.makeTextOverlayEventFields({ buttonToggled = if v1 == nil then "close" else "open" }))
		end
		UseStateResult2(v1)
	end, { UseStateResult })
	
	return if p1.isKeyboardVisible or not FFlagMomentsTextOverlayV2Redesign then nil else ReactModule.createElement(View, {
		tag = "col align-x-center gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y",
		ZIndex = 10,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		padding = { bottom = UDim.new(0, UseTokensResult.Padding.Large) }
	}, {
		IconRow = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row gap-xsmall auto-xy",
			padding = {
				left = UDim.new(0, UseTokensResult.Padding.Large),
				right = UDim.new(0, UseTokensResult.Padding.Large)
			}
		}, {
			FontButton = if FFlagMomentsTextOverlayV2Redesign then ReactModule.createElement(TextFontButtonModule, {
				LayoutOrder = 1,
				expanded = UseStateResult == "Font",
				onToggle = UseCallbackResult1
			}) else nil,
			ColorButton = if FFlagMomentsTextOverlayV2Redesign then ReactModule.createElement(TextColorButtonModule, {
				LayoutOrder = 2,
				expanded = UseStateResult == "Color",
				onToggle = UseCallbackResult
			}) else nil,
			AlignmentButton = if FFlagMomentsTextOverlayV2Redesign then ReactModule.createElement(TextAlignmentButtonModule, { LayoutOrder = 3, controller = Controller }) else nil
		}),
		SwatchRow = if FFlagMomentsTextOverlayV2Redesign and UseStateResult == "Color" then ReactModule.createElement(TextColorSwatchRowModule, { LayoutOrder = 2, controller = Controller }) else nil,
		FontRow = if FFlagMomentsTextOverlayV2Redesign and UseStateResult == "Font" then ReactModule.createElement(TextFontRowModule, { LayoutOrder = 3, controller = Controller }) else nil
	})
end