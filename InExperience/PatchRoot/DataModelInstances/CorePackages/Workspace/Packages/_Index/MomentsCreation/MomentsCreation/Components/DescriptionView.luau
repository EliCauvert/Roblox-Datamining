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

return function(p0) --[[ line: 48 ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), getCreationFlowStoreModule (ref), reactModule (ref), useSignalState (ref), useCallback (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), eventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), view (ref), constantsModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), generatedTextFeedbackContainerModule (ref), button (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref), text (ref)
	local var12 = useDeviceInsets()
	local var13 = useTokens()
	local var14 = useCreationFlowStringsModule()
	local var15 = getCreationFlowStoreModule(false)
	local var16 = reactModule.useRef(nil)
	local publishingCtaSecondary = var14.PublishingCtaSecondary
	local var17 = useSignalState(var15.getDescription)
	reactModule.useEffect(function() --[[ line: 61 ]]
		-- upvalues: var16 (ref), var17 (ref)
		local current = var16.current
		
		if current ~= nil then
			current.Text = var17
		end
	end, { var17 })
	
	return reactModule.createElement(view, {
		tag = "align-x-center size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		padding = {
			top = UDim.new(0, var13.Padding.Large),
			bottom = UDim.new(0, math.max(var12.bottom, var13.Padding.Large)),
			left = UDim.new(0, math.max(var12.left, var13.Padding.XLarge)),
			right = UDim.new(0, math.max(var12.right, var13.Padding.XLarge))
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
					PlaceholderColor3 = var13.Color.Content.Muted.Color3,
					PlaceholderText = var14.PublishingDescription,
					ref = var16,
					ShowNativeInput = true,
					TextColor3 = var13.Color.ActionStandard.Foreground.Color3,
					TextSize = var13.FontSize.FontSize_400,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = useCallback(function(p1) --[[ line: 84 ]]
						local var18 = p1.Text:gsub("[\r\n]+", " ")
						local charCount = utf8.len(var18)
						
						if charCount ~= nil and charCount >= 140 then
							var18 = string.sub(var18, 1, utf8.offset(var18, 141) - 1)
						end
						if var18 ~= p1.Text then
							p1.Text = var18
						end
					end, {}),
					[reactModule.Event.FocusLost] = useCallback(function() --[[ line: 68 ]]
						-- upvalues: var16 (ref), var15 (ref), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), eventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
						local current = var16.current
						var15.updateDescription(if current ~= nil then "" else current.Text)
						fireAnalyticsEventModule(eventNames.EditingFlowDescriptionEdited, cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeToolFieldFromKind("description"), makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow))))
					end, { var15.updateDescription })
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
					onActivated = p0.onPublish,
					size = inputSize.Medium,
					text = var14.PublishingCtaPrimary,
					variant = buttonVariant.Emphasis,
					width = UDim.new(0.5, 0)
				}),
				ReturnToEditingButton = reactModule.createElement(button, {
					LayoutOrder = 2,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					text = publishingCtaSecondary,
					variant = buttonVariant.Standard,
					width = UDim.new(0.5, 0),
					onActivated = p0.onReturnToEditing,
					size = inputSize.Medium
				})
			}),
			Disclaimer = reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "auto-xy text-body-small text-align-x-center text-align-y-top content-neutral",
				Text = var14.CreationTooltip
			})
		})
	})
end