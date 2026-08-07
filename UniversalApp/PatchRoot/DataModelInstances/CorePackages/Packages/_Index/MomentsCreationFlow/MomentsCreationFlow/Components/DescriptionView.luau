local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View
local descriptionUpdatedModule = require(momentsCreationFlow.Actions.DescriptionUpdated)
local useCallback = reactModule.useCallback
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useDispatch = momentsCommonModule.Hooks.useDispatch
local useSelector = momentsCommonModule.Hooks.useSelector
local useState = reactModule.useState
local useTokens = foundationModule.Hooks.useTokens
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local constantsModule = require(momentsCreationFlow.Constants)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)
local eventNamesModule = require(momentsCreationFlow.Analytics.EventNames)

return function(p0) --[[ line: 37 ]]
	-- upvalues: useDispatch (ref), useDeviceInsets (ref), useTokens (ref), reactModule (ref), creationFlowContextModule (ref), useSelector (ref), constantsModule (ref), useState (ref), useCallback (ref), descriptionUpdatedModule (ref), eventNamesModule (ref), view (ref), creationFlowLocalizationModule (ref), button (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref), text (ref)
	local var9 = useDispatch()
	local var10 = useDeviceInsets()
	local var11 = useTokens()
	local var12 = reactModule.useContext(creationFlowContextModule)
	local var13, var14 = useState(useSelector(function(p1) --[[ line: 43 ]]
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].CreationFlow.description
	end))
	
	return reactModule.createElement(view, {
		tag = "align-x-center auto-y size-full-0",
		LayoutOrder = p0.layoutOrder
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var11.Padding.Large),
			PaddingBottom = UDim.new(0, math.max(var10.bottom, var11.Padding.Large)),
			PaddingLeft = UDim.new(0, math.max(var10.left, var11.Padding.XLarge)),
			PaddingRight = UDim.new(0, math.max(var10.right, var11.Padding.XLarge))
		}),
		SizeConstraint = reactModule.createElement(view, {
			tag = "align-x-center auto-y col gap-large size-full-0",
			sizeConstraint = { MaxSize = constantsModule.BottomBarSizeConstraint }
		}, {
			TextBoxContainer = reactModule.createElement(view, {
				tag = "size-full-2100 bg-surface-100 padding-medium radius-medium"
			}, {
				TextBox = reactModule.createElement("TextBox", {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					ClipsDescendants = true,
					Font = Enum.Font.BuilderSans,
					MaxVisibleGraphemes = 140,
					MultiLine = false,
					PlaceholderColor3 = var11.Color.Content.Muted.Color3,
					PlaceholderText = var12.getLocalization(creationFlowLocalizationModule.PublishingDescription),
					ShowNativeInput = true,
					Text = var13,
					TextColor3 = var11.Color.ActionStandard.Foreground.Color3,
					TextSize = var11.FontSize.FontSize_400,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = useCallback(function(p2) --[[ line: 54 ]]
						-- upvalues: var14 (ref)
						local var15 = p2.Text:gsub("[\r\n]+", " ")
						local charCount = utf8.len(var15)
						
						if charCount == nil or charCount < 140 then
							var14(var15)
							p2.Text = var15
							
							return
						end
						local substring = string.sub(var15, 1, utf8.offset(var15, 141) - 1)
						var14(substring)
						p2.Text = substring
					end, {}),
					[reactModule.Event.FocusLost] = useCallback(function() --[[ line: 49 ]]
						-- upvalues: var9 (ref), descriptionUpdatedModule (copy), var13 (ref), var12 (ref), eventNamesModule (copy)
						var9(descriptionUpdatedModule(var13))
						var12.fireEvent(eventNamesModule.EditingFlowDescriptionEdited)
					end, { var13 })
				})
			}),
			CTAs = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "align-x-center auto-y align-y-bottom anchor-bottom-center gap-small position-bottom-center row size-full-0"
			}, {
				PostButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					onActivated = p0.onPublish,
					size = inputSize.Medium,
					text = var12.getLocalization(creationFlowLocalizationModule.PublishingCtaPrimary),
					variant = buttonVariant.Emphasis,
					width = UDim.new(0.5, 0)
				}),
				ReturnToEditingButton = reactModule.createElement(button, {
					LayoutOrder = 2,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					text = var12.getLocalization(creationFlowLocalizationModule.PublishingCtaSecondary),
					variant = buttonVariant.Standard,
					width = UDim.new(0.5, 0),
					onActivated = p0.onReturnToEditing,
					size = inputSize.Medium
				})
			}),
			Disclaimer = reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "auto-xy text-body-small content-neutral text-align-x-center text-align-y-top",
				Text = var12.getLocalization(creationFlowLocalizationModule.CreationTooltip)
			})
		})
	})
end