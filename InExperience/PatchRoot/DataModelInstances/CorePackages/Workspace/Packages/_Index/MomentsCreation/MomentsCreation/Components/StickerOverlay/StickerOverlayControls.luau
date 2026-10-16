local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local Button = FoundationModule.Button
local Knob = FoundationModule.Knob
local ScrollView = FoundationModule.ScrollView
local Slider = FoundationModule.Slider
local View = FoundationModule.View
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FormFactor = MomentsCommonModule.Enums.FormFactor
local ReactionType = MomentsCommonModule.Enums.ReactionType
local ReactionAssets = MomentsCommonModule.Components.ReactionAssets
local EventNames = MomentsCommonModule.Analytics.EventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames
local ConstantsModule = require(MomentsCreation.Constants)
local StickerPickerItemModule = require(MomentsCreation.Components.StickerOverlay.StickerPickerItem)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local MakeDefaultStickerOverlayEditModule = require(MomentsCreation.Utils.makeDefaultStickerOverlayEdit)
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)

return function(p1) --[[ Line: 57 | Named "StickerOverlayControls" ]]
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseCreationFlowStringsModule (copy), UseMemoFunction (copy), SignalsModule (copy), ConstantsModule (copy), UseSignalStateFunction (copy), UseCallbackFunction (copy), DashModule (copy), MakeDefaultStickerOverlayEditModule (copy), MakeCreationEventFieldsModule (copy), SessionManager (copy), FunnelEventNames (copy), FireAnalyticsEventModule (copy), EventNames (copy), UseFormFactorFunction (copy), FormFactor (copy), ReactionType (copy), ReactionAssets (copy), ReactModule (copy), StickerPickerItemModule (copy), View (copy), Slider (copy), Knob (copy), FoundationModule (copy), Button (copy), ScrollView (copy)
	local Controller = p1.controller
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local UseSignalStateResult = UseSignalStateFunction((UseMemoFunction(function() --[[ Line: 64 ]]
		-- upvalues: SignalsModule (upval), Controller (copy), ConstantsModule (upval)
		return SignalsModule.createComputed(function(p2) --[[ Line: 65 ]]
			-- upvalues: Controller (upval), ConstantsModule (upval)
			local ActiveSession = Controller.getActiveSession(p2)
			local Draft = if ActiveSession == nil then nil else ActiveSession.getDraft(p2)
			local DraftEntry = Draft and Draft[1]
			
			return if DraftEntry == nil then ConstantsModule.StickerOverlay.DefaultStickerSize else DraftEntry.stickerSize
		end)
	end, { Controller })))
	local UseCallbackResult = UseCallbackFunction(function(StickerSize) --[[ Line: 74 ]]
		-- upvalues: Controller (copy), DashModule (upval)
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession == nil then return end
		local Draft = ActiveSession.getDraft(false)
		local DraftEntry = Draft and Draft[1]
		
		if DraftEntry ~= nil then
			ActiveSession.update({
				DashModule.joinDeep(DraftEntry, { stickerSize = StickerSize })
			})
			
			return
		end
	end, { Controller })
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 87 ]]
		-- upvalues: Controller (copy)
		Controller.discardActiveTool()
	end, { Controller })
	local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 91 ]]
		-- upvalues: Controller (copy)
		Controller.commitActiveTool()
	end, { Controller })
	local UseCallbackResult3 = UseCallbackFunction(function(StickerURI) --[[ Line: 95 ]]
		-- upvalues: Controller (copy), DashModule (upval), MakeDefaultStickerOverlayEditModule (upval), MakeCreationEventFieldsModule (upval), SessionManager (upval), FunnelEventNames (upval), FireAnalyticsEventModule (upval), EventNames (upval)
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession == nil then return end
		local Draft = ActiveSession.getDraft(false)
		local DraftEntry = Draft and Draft[1]
		
		if DraftEntry ~= nil and DraftEntry.stickerURI == StickerURI then
			ActiveSession.update({
				DashModule.join(DraftEntry, { stickerURI = DashModule.None })
			})
			
			return
		end
		ActiveSession.update({
			DashModule.join(DraftEntry or MakeDefaultStickerOverlayEditModule(), { stickerURI = StickerURI })
		})
		local config = { stickerURI = StickerURI }
		
		for i, value in MakeCreationEventFieldsModule.makeToolFieldFromKind("sticker") do
			config[i] = value
		end
		for i1, value1 in MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))) do
			config[i1] = value1
		end
		FireAnalyticsEventModule(EventNames.EditingFlowStickerSelected, config)
	end, { Controller })
	local IsUseFormFactorResultMatch = UseFormFactorFunction() == FormFactor.Wide
	
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
		StickerSizeSlider = ReactModule.createElement(Slider, {
			LayoutOrder = 1,
			knob = ReactModule.createElement(Knob, { size = FoundationModule.Enums.InputSize.Large }),
			knobVisibility = FoundationModule.Enums.Visibility.Always,
			onValueChanged = UseCallbackResult,
			size = FoundationModule.Enums.InputSize.XSmall,
			range = NumberRange.new(ConstantsModule.StickerOverlay.MinStickerSize, ConstantsModule.StickerOverlay.MaxStickerSize),
			value = math.clamp(UseSignalStateResult or ConstantsModule.StickerOverlay.DefaultStickerSize, ConstantsModule.StickerOverlay.MinStickerSize, ConstantsModule.StickerOverlay.MaxStickerSize),
			variant = FoundationModule.Enums.SliderVariant.Standard
		}),
		Nav = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row flex-x-between align-x-center align-y-center gap-medium size-full-0 auto-y"
		}, {
			BackButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseCreationFlowStringsModuleResult.GeneralCtaBack,
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = UseCallbackResult1,
				size = FoundationModule.Enums.InputSize.Medium
			}),
			StickerRow = ReactModule.createElement(ScrollView, {
				LayoutOrder = 2,
				flexItem = { FlexMode = Enum.UIFlexMode.Fill },
				Size = UDim2.fromOffset(0, UseTokensResult.Size.Size_1000),
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = if IsUseFormFactorResultMatch then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, UseTokensResult.Padding.Small),
					SortOrder = Enum.SortOrder.LayoutOrder
				},
				scroll = {
					ScrollingDirection = Enum.ScrollingDirection.X,
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					CanvasSize = UDim2.fromOffset(0, 0),
					scrollBarVisibility = if IsUseFormFactorResultMatch then FoundationModule.Enums.Visibility.None else FoundationModule.Enums.Visibility.Auto
				}
			}, (UseMemoFunction(function() --[[ Line: 137 ]]
				-- upvalues: ReactionType (upval), ReactionAssets (upval), ReactModule (upval), StickerPickerItemModule (upval), UseCallbackResult3 (copy)
				local Elements = {}
				local LayoutOrder = 0
				
				for _, Key in ReactionType do
					local StickerImageUri = ReactionAssets.getStickerImageUri(Key)
					
					if StickerImageUri ~= nil then
						LayoutOrder += 1
						table.insert(Elements, ReactModule.createElement(StickerPickerItemModule, {
							key = Key,
							layoutOrder = LayoutOrder,
							stickerURI = StickerImageUri,
							onStickerSelected = UseCallbackResult3
						}))
					end
				end
				return Elements
			end, { UseCallbackResult3 }))),
			DoneButton = ReactModule.createElement(Button, {
				LayoutOrder = 3,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				text = UseCreationFlowStringsModuleResult.GeneralCtaDone,
				variant = FoundationModule.Enums.ButtonVariant.Text,
				onActivated = UseCallbackResult2,
				size = FoundationModule.Enums.InputSize.Medium
			})
		})
	})
end