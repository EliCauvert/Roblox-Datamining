local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local DescriptionUpdatedModule = require(MomentsCreationFlow.Actions.DescriptionUpdated)
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseDispatchFunction = MomentsCommonModule.Hooks.useDispatch
local UseSelectorFunction = MomentsCommonModule.Hooks.useSelector
local UseStateFunction = ReactModule.useState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CreationFlowContextModule = require(MomentsCreationFlow.Context.CreationFlowContext)
local ConstantsModule = require(MomentsCreationFlow.Constants)
local CreationFlowLocalizationModule = require(MomentsCreationFlow.Enums.CreationFlowLocalization)
local EventNamesModule = require(MomentsCreationFlow.Analytics.EventNames)

return function(p1) --[[ Line: 37 ]]
	-- upvalues: UseDispatchFunction (copy), UseDeviceInsetsFunction (copy), UseTokensFunction (copy), ReactModule (copy), CreationFlowContextModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseStateFunction (copy), UseCallbackFunction (copy), DescriptionUpdatedModule (copy), EventNamesModule (copy), View (copy), CreationFlowLocalizationModule (copy), Button (copy), FoundationModule (copy), InputSize (copy), ButtonVariant (copy), Text (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = ReactModule.useContext(CreationFlowContextModule)
	local UseStateResult, UseStateResult2 = UseStateFunction((UseSelectorFunction(function(p2) --[[ Line: 43 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].CreationFlow.description
	end)))
	
	return ReactModule.createElement(View, {
		tag = "align-x-center auto-y size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Large),
			PaddingBottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.Large))),
			PaddingLeft = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
			PaddingRight = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
		}),
		SizeConstraint = ReactModule.createElement(View, {
			tag = "align-x-center auto-y col gap-large size-full-0",
			sizeConstraint = { MaxSize = ConstantsModule.BottomBarSizeConstraint }
		}, {
			TextBoxContainer = ReactModule.createElement(View, {
				tag = "size-full-2100 bg-surface-100 padding-medium radius-medium"
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
					PlaceholderText = UseContextResult.getLocalization(CreationFlowLocalizationModule.PublishingDescription),
					ShowNativeInput = true,
					Text = UseStateResult,
					TextColor3 = UseTokensResult.Color.ActionStandard.Foreground.Color3,
					TextSize = UseTokensResult.FontSize.FontSize_400,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[ReactModule.Change.Text] = UseCallbackFunction(function(p2) --[[ Line: 54 ]]
						-- upvalues: UseStateResult2 (copy)
						local Text: string = p2.Text:gsub("[\r\n]+", " ")
						local Length = utf8.len(Text)
						
						if Length == nil or Length < 140 then
							UseStateResult2(Text)
							p2.Text = Text
							
							return
						else
							local Segment = string.sub(Text, 1, utf8.offset(Text, 141) - 1)
							UseStateResult2(Segment)
							p2.Text = Segment
						end
					end, {}),
					[ReactModule.Event.FocusLost] = UseCallbackFunction(function() --[[ Line: 49 ]]
						-- upvalues: UseDispatchResult (copy), DescriptionUpdatedModule (upval), UseStateResult (copy), UseContextResult (copy), EventNamesModule (upval)
						UseDispatchResult(DescriptionUpdatedModule(UseStateResult))
						UseContextResult.fireEvent(EventNamesModule.EditingFlowDescriptionEdited)
					end, { UseStateResult })
				})
			}),
			CTAs = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "align-x-center auto-y align-y-bottom anchor-bottom-center gap-small position-bottom-center row size-full-0"
			}, {
				PostButton = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
					onActivated = p1.onPublish,
					size = InputSize.Medium,
					text = UseContextResult.getLocalization(CreationFlowLocalizationModule.PublishingCtaPrimary),
					variant = ButtonVariant.Emphasis,
					width = UDim.new(0.5, 0)
				}),
				ReturnToEditingButton = ReactModule.createElement(Button, {
					LayoutOrder = 2,
					fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
					text = UseContextResult.getLocalization(CreationFlowLocalizationModule.PublishingCtaSecondary),
					variant = ButtonVariant.Standard,
					width = UDim.new(0.5, 0),
					onActivated = p1.onReturnToEditing,
					size = InputSize.Medium
				})
			}),
			Disclaimer = ReactModule.createElement(Text, {
				LayoutOrder = 3,
				tag = "auto-xy text-body-small content-neutral text-align-x-center text-align-y-top",
				Text = UseContextResult.getLocalization(CreationFlowLocalizationModule.CreationTooltip)
			})
		})
	})
end