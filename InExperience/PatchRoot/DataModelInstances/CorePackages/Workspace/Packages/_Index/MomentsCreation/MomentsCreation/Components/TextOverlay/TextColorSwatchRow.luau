local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local View = FoundationModule.View
local UseMemoFunction = ReactModule.useMemo
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local FormFactor = MomentsCommonModule.Enums.FormFactor
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local FFlagMomentsTextOverlayV2Redesign = MomentsCommonModule.Flags.FFlagMomentsTextOverlayV2Redesign
local ConstantsModule = require(MomentsCreation.Constants)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)
local list = {
	Color3.fromHex("000000"), Color3.fromHex("E75750"), Color3.fromHex("F57630"),
	Color3.fromHex("DBA61F"), Color3.fromHex("0C9B5A"), Color3.fromHex("16A9C7"),
	Color3.fromHex("528BFF"), Color3.fromHex("A766F5"), Color3.fromHex("D540F5"),
	Color3.fromHex("E74E90")
}

return function(Frame) --[[ Line: 69 | Named "TextColorSwatchRow" ]]
	-- upvalues: UseTokensFunction (copy), UseFormFactorFunction (copy), FormFactor (copy), UseMemoFunction (copy), SignalsModule (copy), UseSignalStateFunction (copy), DashModule (copy), FFlagMomentsTextOverlayV2Redesign (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), list (copy), ReactModule (copy), View (copy), FoundationModule (copy), ConstantsModule (copy)
	local Controller = Frame.controller
	local UseTokensResult = UseTokensFunction()
	local IsUseFormFactorResultMatch = UseFormFactorFunction() == FormFactor.Wide
	local UseSignalStateResult = UseSignalStateFunction((UseMemoFunction(function() --[[ Line: 75 ]]
		-- upvalues: SignalsModule (upval), Controller (copy)
		return SignalsModule.createComputed(function(p1) --[[ Line: 76 ]]
			-- upvalues: Controller (upval)
			local ActiveSession = Controller.getActiveSession(p1)
			local Draft = if ActiveSession == nil then nil else ActiveSession.getDraft(p1)
			local DraftEntry = Draft and Draft[1]
			
			return if DraftEntry == nil then Color3.new(0, 0, 0) else DraftEntry.textOverlayStyle.fontColor
		end)
	end, { Controller })))
	
	local function onSwatchActivated(FontColor, LayoutOrder) --[[ Line: 85 ]]
		-- upvalues: Controller (copy), DashModule (upval), FFlagMomentsTextOverlayV2Redesign (upval), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession == nil then return end
		local Draft = ActiveSession.getDraft(false)
		local DraftEntry = Draft and Draft[1]
		
		if DraftEntry == nil then return end
		ActiveSession.update({
			DashModule.joinDeep(DraftEntry, { textOverlayStyle = { fontColor = FontColor } })
		})
		
		if FFlagMomentsTextOverlayV2Redesign then
			FireAnalyticsEventModule(EventNames.EditingFlowTextOverlayColorSelected, MakeCreationEventFieldsModule.makeTextOverlayEventFields({
				buttonIndex = tostring(LayoutOrder),
				color = "#" .. FontColor:ToHex()
			}))
		end
	end
	
	local Elements = {}
	
	for LayoutOrder, value in list do
		local IsUseSignalStateResultMatch = UseSignalStateResult == value
		Elements["Swatch" .. LayoutOrder] = ReactModule.createElement(View, {
			tag = "radius-circle",
			LayoutOrder = LayoutOrder,
			Size = UDim2.fromOffset(32, 32),
			backgroundStyle = { Color3 = value },
			onActivated = function() --[[ Line: 119 ]]
				-- upvalues: onSwatchActivated (copy), value (copy), LayoutOrder (copy)
				onSwatchActivated(value, LayoutOrder)
			end,
			stroke = {
				Thickness = 3,
				Color = UseTokensResult.Color.System.Contrast.Color3,
				Transparency = if IsUseSignalStateResultMatch then 0 else 0.8
			}
		})
	end
	return ReactModule.createElement(FoundationModule.ScrollView, {
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, ConstantsModule.TextOverlay.PickerRowHeight),
		scroll = {
			scrollBarVisibility = FoundationModule.Enums.Visibility.None,
			ScrollingDirection = Enum.ScrollingDirection.X,
			AutomaticCanvasSize = Enum.AutomaticSize.X
		}
	}, {
		Row = ReactModule.createElement(View, {
			tag = {
				["row align-y-center gap-medium size-0-full auto-x padding-x-large"] = true,
				["position-top-center anchor-top-center"] = IsUseFormFactorResultMatch
			}
		}, Elements)
	})
end