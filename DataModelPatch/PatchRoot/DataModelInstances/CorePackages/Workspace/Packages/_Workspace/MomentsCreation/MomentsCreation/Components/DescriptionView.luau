local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetCreationFlowStoreModule = require(MomentsCreation.Stores.GetCreationFlowStore)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local ConstantsModule = require(MomentsCreation.Constants)
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local EventNames = MomentsCommonModule.Analytics.EventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseCreationFlowStringsModule (copy), GetCreationFlowStoreModule (copy), ReactModule (copy), UseSignalStateFunction (copy), UseCallbackFunction (copy), SessionManager (copy), FunnelEventNames (copy), FireAnalyticsEventModule (copy), EventNames (copy), CryoModule (copy), MakeCreationEventFieldsModule (copy), View (copy), ConstantsModule (copy), Button (copy), FoundationModule (copy), InputSize (copy), ButtonVariant (copy), Text (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local CreationFlowStoreModule = GetCreationFlowStoreModule(false)
	local UseRefResult = ReactModule.useRef(nil)
	local PublishingCtaSecondary = UseCreationFlowStringsModuleResult.PublishingCtaSecondary
	local UseSignalStateResult = UseSignalStateFunction(CreationFlowStoreModule.getDescription)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseSignalStateResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.Text = UseSignalStateResult
		end
	end, { UseSignalStateResult })
	
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
					[ReactModule.Change.Text] = UseCallbackFunction(function(p2)
						local Text = p2.Text:gsub("[\r\n]+", " ")
						local Length = utf8.len(Text)
						
						if Length ~= nil and Length >= 140 then
							Text = string.sub(Text, 1, utf8.offset(Text, 141) - 1)
						end
						if Text ~= p2.Text then
							p2.Text = Text
						end
					end, {}),
					[ReactModule.Event.FocusLost] = UseCallbackFunction(function()
						-- upvalues: UseRefResult (copy), CreationFlowStoreModule (copy), SessionManager (upval), FunnelEventNames (upval), FireAnalyticsEventModule (upval), EventNames (upval), CryoModule (upval), MakeCreationEventFieldsModule (upval)
						local Current = UseRefResult.current
						CreationFlowStoreModule.updateDescription(if Current == nil then "" else Current.Text)
						FireAnalyticsEventModule(EventNames.EditingFlowDescriptionEdited, CryoModule.Dictionary.join(MakeCreationEventFieldsModule.makeToolFieldFromKind("description"), MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow)))))
					end, { CreationFlowStoreModule.updateDescription })
				})
			}),
			CTAs = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-x-center align-y-bottom gap-small position-bottom-center anchor-bottom-center size-full-0 auto-y"
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
				LayoutOrder = 3,
				tag = "auto-xy text-body-small text-align-x-center text-align-y-top content-neutral",
				Text = UseCreationFlowStringsModuleResult.CreationTooltip
			})
		})
	})
end