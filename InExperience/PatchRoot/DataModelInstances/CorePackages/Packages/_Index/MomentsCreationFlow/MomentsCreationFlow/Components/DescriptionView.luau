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

return function(p1)
	-- upvalues: useDispatch (ref), useDeviceInsets (ref), useTokens (ref), reactModule (ref), creationFlowContextModule (ref), useSelector (ref), constantsModule (ref), useState (ref), useCallback (ref), descriptionUpdatedModule (ref), eventNamesModule (ref), view (ref), creationFlowLocalizationModule (ref), button (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref), text (ref)
	local var1 = useDispatch()
	local var2 = useDeviceInsets()
	local var3 = useTokens()
	local var4 = reactModule.useContext(creationFlowContextModule)
	local var5, var6 = useState(useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CreationFlow.description
	end))
	
	return reactModule.createElement(view, {
		tag = "align-x-center auto-y size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var3.Padding.Large),
			PaddingBottom = UDim.new(0, math.max(var2.bottom, var3.Padding.Large)),
			PaddingLeft = UDim.new(0, math.max(var2.left, var3.Padding.XLarge)),
			PaddingRight = UDim.new(0, math.max(var2.right, var3.Padding.XLarge))
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
					PlaceholderColor3 = var3.Color.Content.Muted.Color3,
					PlaceholderText = var4.getLocalization(creationFlowLocalizationModule.PublishingDescription),
					ShowNativeInput = true,
					Text = var5,
					TextColor3 = var3.Color.ActionStandard.Foreground.Color3,
					TextSize = var3.FontSize.FontSize_400,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = useCallback(function(p2)
						-- upvalues: var6 (ref)
						local var7 = p2.Text:gsub("[\r\n]+", " ")
						local charCount = utf8.len(var7)
						
						if charCount == nil or charCount < 140 then
							var6(var7)
							p2.Text = var7
							
							return
						end
						local substring = string.sub(var7, 1, utf8.offset(var7, 141) - 1)
						var6(substring)
						p2.Text = substring
					end, {}),
					[reactModule.Event.FocusLost] = useCallback(function()
						-- upvalues: var1 (ref), descriptionUpdatedModule (copy), var5 (ref), var4 (ref), eventNamesModule (copy)
						var1(descriptionUpdatedModule(var5))
						var4.fireEvent(eventNamesModule.EditingFlowDescriptionEdited)
					end, { var5 })
				})
			}),
			CTAs = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "align-x-center auto-y align-y-bottom anchor-bottom-center gap-small position-bottom-center row size-full-0"
			}, {
				PostButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					onActivated = p1.onPublish,
					size = inputSize.Medium,
					text = var4.getLocalization(creationFlowLocalizationModule.PublishingCtaPrimary),
					variant = buttonVariant.Emphasis,
					width = UDim.new(0.5, 0)
				}),
				ReturnToEditingButton = reactModule.createElement(button, {
					LayoutOrder = 2,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					text = var4.getLocalization(creationFlowLocalizationModule.PublishingCtaSecondary),
					variant = buttonVariant.Standard,
					width = UDim.new(0.5, 0),
					onActivated = p1.onReturnToEditing,
					size = inputSize.Medium
				})
			}),
			Disclaimer = reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "auto-xy text-body-small content-neutral text-align-x-center text-align-y-top",
				Text = var4.getLocalization(creationFlowLocalizationModule.CreationTooltip)
			})
		})
	})
end