local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useSignalState = signalsReactModule.useSignalState
local useTokens = foundationModule.Hooks.useTokens
local getCreationFlowStoreModule = require(momentsCreation.Stores.GetCreationFlowStore)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local generatedTextFeedbackContainerModule = require(momentsCreation.Components.GeneratedTextFeedback.GeneratedTextFeedbackContainer)
local constantsModule = require(momentsCreation.Constants)
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local fFlagMomentTextGenerationFilteredSignal = momentsCommonModule.Flags.FFlagMomentTextGenerationFilteredSignal

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), getCreationFlowStoreModule (ref), reactModule (ref), useSignalState (ref), useCallback (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), eventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), view (ref), constantsModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), generatedTextFeedbackContainerModule (ref), button (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref), text (ref)
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = useCreationFlowStringsModule()
	local var4 = getCreationFlowStoreModule(false)
	local var5 = reactModule.useRef(nil)
	local publishingCtaSecondary = var3.PublishingCtaSecondary
	local var6 = useSignalState(var4.getDescription)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var6 (ref)
		local current = var5.current
		
		if current ~= nil then
			current.Text = var6
		end
	end, { var6 })
	
	return reactModule.createElement(view, {
		tag = "align-x-center size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, var2.Padding.Large),
			bottom = UDim.new(0, math.max(var1.bottom, var2.Padding.Large)),
			left = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
			right = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
		}
	}, {
		SizeConstraint = reactModule.createElement(view, {
			tag = "col align-x-center gap-large size-full-0 auto-y",
			sizeConstraint = { MaxSize = constantsModule.BottomBarSizeConstraint }
		}, {
			TextBoxContainer = reactModule.createElement(view, {
				tag = "size-full-2100 padding-medium radius-medium bg-surface-100"
			}, {
				TextBox = reactModule.createElement("TextBox", {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					ClipsDescendants = true,
					Font = Enum.Font.BuilderSans,
					MaxVisibleGraphemes = 140,
					MultiLine = false,
					PlaceholderColor3 = var2.Color.Content.Muted.Color3,
					PlaceholderText = var3.PublishingDescription,
					ref = var5,
					ShowNativeInput = true,
					TextColor3 = var2.Color.ActionStandard.Foreground.Color3,
					TextSize = var2.FontSize.FontSize_400,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = useCallback(function(p2)
						local var7 = p2.Text:gsub("[\r\n]+", " ")
						local charCount = utf8.len(var7)
						
						if charCount ~= nil and charCount >= 140 then
							var7 = string.sub(var7, 1, utf8.offset(var7, 141) - 1)
						end
						if var7 ~= p2.Text then
							p2.Text = var7
						end
					end, {}),
					[reactModule.Event.FocusLost] = useCallback(function()
						-- upvalues: var5 (ref), var4 (ref), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), eventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
						local current = var5.current
						var4.updateDescription(if current ~= nil then "" else current.Text)
						fireAnalyticsEventModule(eventNames.EditingFlowDescriptionEdited, cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeToolFieldFromKind("description"), makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow))))
					end, { var4.updateDescription })
				})
			}),
			GeneratedTextFeedback = if fFlagMomentTextGenerationFilteredSignal then reactModule.createElement(generatedTextFeedbackContainerModule, { layoutOrder = 1 }) else nil,
			CTAs = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-x-center align-y-bottom gap-small position-bottom-center anchor-bottom-center size-full-0 auto-y"
			}, {
				PostButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					onActivated = p1.onPublish,
					size = inputSize.Medium,
					text = var3.PublishingCtaPrimary,
					variant = buttonVariant.Emphasis,
					width = UDim.new(0.5, 0)
				}),
				ReturnToEditingButton = reactModule.createElement(button, {
					LayoutOrder = 2,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					text = publishingCtaSecondary,
					variant = buttonVariant.Standard,
					width = UDim.new(0.5, 0),
					onActivated = p1.onReturnToEditing,
					size = inputSize.Medium
				})
			}),
			Disclaimer = reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "auto-xy text-body-small text-align-x-center text-align-y-top content-neutral",
				Text = var3.CreationTooltip
			})
		})
	})
end