local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local Button = FoundationModule.Button
local Knob = FoundationModule.Knob
local Slider = FoundationModule.Slider
local View = FoundationModule.View
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local ConstantsModule = require(MomentsCreation.Constants)
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)
local FFlagMomentsTextOverlayV2Redesign = MomentsCommonModule.Flags.FFlagMomentsTextOverlayV2Redesign

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseCreationFlowStringsModule (copy), FFlagMomentsTextOverlayV2Redesign (copy), UseMemoFunction (copy), SignalsModule (copy), ConstantsModule (copy), UseSignalStateFunction (copy), UseCallbackFunction (copy), DashModule (copy), ReactModule (copy), View (copy), Slider (copy), Knob (copy), FoundationModule (copy), Button (copy)
	local Controller = p1.controller
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local UseSignalStateResult: number = UseSignalStateFunction((UseMemoFunction(function()
		-- upvalues: SignalsModule (upval), FFlagMomentsTextOverlayV2Redesign (copy), ConstantsModule (upval), Controller (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: FFlagMomentsTextOverlayV2Redesign (upval), ConstantsModule (upval), Controller (upval)
			if FFlagMomentsTextOverlayV2Redesign then
				return ConstantsModule.TextOverlay.DefaultFontSize
			else
				local ActiveSession = Controller.getActiveSession(p2)
				local Draft = if ActiveSession == nil then nil else ActiveSession.getDraft(p2)
				local DraftEntry = Draft and Draft[1]
				
				return if DraftEntry == nil then ConstantsModule.TextOverlay.DefaultFontSize else DraftEntry.textOverlayStyle.fontSize
			end
		end)
	end, { Controller, FFlagMomentsTextOverlayV2Redesign })))
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
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, UseTokensResult.Padding.Small),
			bottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Small))),
			left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
			right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
		}
	}, {
		FontSizeSlider = if FFlagMomentsTextOverlayV2Redesign then nil else ReactModule.createElement(Slider, {
			LayoutOrder = 1,
			knob = ReactModule.createElement(Knob, { size = FoundationModule.Enums.InputSize.Large }),
			knobVisibility = FoundationModule.Enums.Visibility.Always,
			onValueChanged = UseCallbackResult,
			size = FoundationModule.Enums.InputSize.XSmall,
			range = NumberRange.new(ConstantsModule.TextOverlay.MinFontSize, ConstantsModule.TextOverlay.MaxFontSize),
			value = math.clamp(UseSignalStateResult, ConstantsModule.TextOverlay.MinFontSize, ConstantsModule.TextOverlay.MaxFontSize),
			variant = FoundationModule.Enums.SliderVariant.Standard
		}),
		Nav = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row flex-x-between align-x-center align-y-center gap-small size-full-0 auto-y"
		}, {
			BackButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseCreationFlowStringsModuleResult.GeneralCtaBack,
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = UseCallbackFunction(function()
					-- upvalues: Controller (copy)
					Controller.discardActiveTool()
				end, { Controller }),
				size = FoundationModule.Enums.InputSize.Medium
			}),
			DoneButton = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseCreationFlowStringsModuleResult.GeneralCtaDone,
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = UseCallbackFunction(function()
					-- upvalues: Controller (copy)
					Controller.commitActiveTool()
				end, { Controller }),
				size = FoundationModule.Enums.InputSize.Medium
			})
		})
	})
end