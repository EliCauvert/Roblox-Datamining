local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local FFlagMomentsComments = require(Parent.SharedFlags).FFlagMomentsComments
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputPlacement = FoundationModule.Enums.InputPlacement
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local Toggle = FoundationModule.Toggle
local View = FoundationModule.View
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetCreationFlowStoreModule = require(MomentsCreation.Stores.GetCreationFlowStore)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local GeneratedTextFeedbackContainerModule = require(MomentsCreation.Components.GeneratedTextFeedback.GeneratedTextFeedbackContainer)
local ConstantsModule = require(MomentsCreation.Constants)
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local EventNames = MomentsCommonModule.Analytics.EventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames
local FFlagMomentTextGenerationFilteredSignal = MomentsCommonModule.Flags.FFlagMomentTextGenerationFilteredSignal
local GetFFlagMomentsUseUploadPostAsyncFunction = MomentsCommonModule.Flags.GetFFlagMomentsUseUploadPostAsync
local FFlagMomentsCommentsCreatorControlModule = require(MomentsCreation.Flags.FFlagMomentsCommentsCreatorControl)

local function AllowCommentsToggle(p1) --[[ Line: 53 ]]
	-- upvalues: UseCreationFlowStringsModule (copy), GetCreationFlowStoreModule (copy), UseSignalStateFunction (copy), UseCallbackFunction (copy), FFlagMomentsComments (copy), SessionManager (copy), FunnelEventNames (copy), FireAnalyticsEventModule (copy), EventNames (copy), CryoModule (copy), MakeCreationEventFieldsModule (copy), ReactModule (copy), Toggle (copy), InputPlacement (copy), InputSize (copy)
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local CreationFlowStoreModule = GetCreationFlowStoreModule(false)
	
	return ReactModule.createElement(Toggle, {
		testId = "moments-allow-comments-toggle",
		isChecked = UseSignalStateFunction(CreationFlowStoreModule.getCommentsEnabled),
		label = UseCreationFlowStringsModuleResult.PublishingAllowComments,
		LayoutOrder = p1.layoutOrder,
		onActivated = UseCallbackFunction(function(p2) --[[ Line: 58 ]]
			-- upvalues: CreationFlowStoreModule (copy), FFlagMomentsComments (upval), SessionManager (upval), FunnelEventNames (upval), FireAnalyticsEventModule (upval), EventNames (upval), CryoModule (upval), MakeCreationEventFieldsModule (upval)
			CreationFlowStoreModule.updateCommentsEnabled(p2)
			
			if FFlagMomentsComments then
				FireAnalyticsEventModule(EventNames.MomentCommentsSettingToggled, CryoModule.Dictionary.join(MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))), { commentsEnabled = tostring(p2) }))
			end
		end, { CreationFlowStoreModule.updateCommentsEnabled }),
		placement = InputPlacement.End,
		size = InputSize.Medium
	})
end

return function(p1) --[[ Line: 82 ]]
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseCreationFlowStringsModule (copy), GetCreationFlowStoreModule (copy), ReactModule (copy), UseSignalStateFunction (copy), FFlagMomentsCommentsCreatorControlModule (copy), GetFFlagMomentsUseUploadPostAsyncFunction (copy), UseCallbackFunction (copy), SessionManager (copy), FunnelEventNames (copy), FireAnalyticsEventModule (copy), EventNames (copy), CryoModule (copy), MakeCreationEventFieldsModule (copy), View (copy), ConstantsModule (copy), AllowCommentsToggle (copy), FFlagMomentTextGenerationFilteredSignal (copy), GeneratedTextFeedbackContainerModule (copy), Button (copy), FoundationModule (copy), InputSize (copy), ButtonVariant (copy), Text (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local CreationFlowStoreModule = GetCreationFlowStoreModule(false)
	local UseRefResult = ReactModule.useRef(nil)
	local PublishingCtaSecondary = UseCreationFlowStringsModuleResult.PublishingCtaSecondary
	local UseSignalStateResult = UseSignalStateFunction(CreationFlowStoreModule.getDescription)
	ReactModule.useEffect(function() --[[ Line: 95 ]]
		-- upvalues: UseRefResult (copy), UseSignalStateResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.Text = UseSignalStateResult
		end
	end, { UseSignalStateResult })
	local FFlagMomentsUseUploadPostAsync = FFlagMomentsCommentsCreatorControlModule and GetFFlagMomentsUseUploadPostAsyncFunction()
	
	return ReactModule.createElement(View, {
		tag = "align-x-center size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, UseTokensResult.Padding.Large),
			bottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Large))),
			left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
			right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
		}
	}, {
		SizeConstraint = ReactModule.createElement(View, {
			tag = "col align-x-center gap-large size-full-0 auto-y",
			sizeConstraint = { MaxSize = ConstantsModule.BottomBarSizeConstraint }
		}, {
			TextBoxContainer = ReactModule.createElement(View, {
				tag = "size-full-2100 padding-medium radius-medium bg-surface-100"
			}, {
				TextBox = ReactModule.createElement("TextBox", {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					ClipsDescendants = true,
					Font = Enum.Font.BuilderSans,
					MaxVisibleGraphemes = 140,
					MultiLine = false,
					PlaceholderColor3 = UseTokensResult.Color.Content.Muted.Color3,
					PlaceholderText = UseCreationFlowStringsModuleResult.PublishingDescription,
					ref = UseRefResult,
					ShowNativeInput = true,
					TextColor3 = UseTokensResult.Color.ActionStandard.Foreground.Color3,
					TextSize = UseTokensResult.FontSize.FontSize_400,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[ReactModule.Change.Text] = UseCallbackFunction(function(p2) --[[ Line: 121 ]]
						local Text = p2.Text:gsub("[\r\n]+", " ")
						local Length = utf8.len(Text)
						
						if Length ~= nil and Length >= 140 then
							Text = string.sub(Text, 1, utf8.offset(Text, 141) - 1)
						end
						if Text ~= p2.Text then
							p2.Text = Text
						end
					end, {}),
					[ReactModule.Event.FocusLost] = UseCallbackFunction(function() --[[ Line: 105 ]]
						-- upvalues: UseRefResult (copy), CreationFlowStoreModule (copy), SessionManager (upval), FunnelEventNames (upval), FireAnalyticsEventModule (upval), EventNames (upval), CryoModule (upval), MakeCreationEventFieldsModule (upval)
						local Current = UseRefResult.current
						CreationFlowStoreModule.updateDescription(if Current == nil then "" else Current.Text)
						FireAnalyticsEventModule(EventNames.EditingFlowDescriptionEdited, CryoModule.Dictionary.join(MakeCreationEventFieldsModule.makeToolFieldFromKind("description"), MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow)))))
					end, { CreationFlowStoreModule.updateDescription })
				})
			}),
			AllowComments = if FFlagMomentsUseUploadPostAsync then ReactModule.createElement(AllowCommentsToggle, { layoutOrder = 1 }) else nil,
			GeneratedTextFeedback = if FFlagMomentTextGenerationFilteredSignal then ReactModule.createElement(GeneratedTextFeedbackContainerModule, {
				layoutOrder = if FFlagMomentsUseUploadPostAsync then 2 else 1
			}) else nil,
			CTAs = ReactModule.createElement(View, {
				tag = "row align-x-center align-y-bottom gap-small position-bottom-center anchor-bottom-center size-full-0 auto-y",
				LayoutOrder = if FFlagMomentsUseUploadPostAsync then 3 else 2
			}, {
				PostButton = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
					onActivated = p1.onPublish,
					size = InputSize.Medium,
					text = UseCreationFlowStringsModuleResult.PublishingCtaPrimary,
					variant = ButtonVariant.Emphasis,
					width = UDim.new(0.5, 0)
				}),
				ReturnToEditingButton = ReactModule.createElement(Button, {
					LayoutOrder = 2,
					fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
					text = PublishingCtaSecondary,
					variant = ButtonVariant.Standard,
					width = UDim.new(0.5, 0),
					onActivated = p1.onReturnToEditing,
					size = InputSize.Medium
				})
			}),
			Disclaimer = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-small text-align-x-center text-align-y-top content-neutral",
				LayoutOrder = if FFlagMomentsUseUploadPostAsync then 4 else 3,
				Text = UseCreationFlowStringsModuleResult.CreationTooltip
			})
		})
	})
end