local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
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
local constantsModule = require(momentsCreation.Constants)
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local eventNames = momentsCommonModule.Analytics.EventNames

return function(p0) --[[ line: 42 ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), getCreationFlowStoreModule (ref), reactModule (ref), useSignalState (ref), useCallback (ref), fireAnalyticsEventModule (ref), eventNames (ref), view (ref), constantsModule (ref), button (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref), text (ref)
	local var9 = useDeviceInsets()
	local var10 = useTokens()
	local var11 = useCreationFlowStringsModule()
	local var12 = getCreationFlowStoreModule(false)
	local var13 = reactModule.useRef(nil)
	local publishingCtaSecondary = var11.PublishingCtaSecondary
	local var14 = useSignalState(var12.getDescription)
	reactModule.useEffect(function() --[[ line: 55 ]]
		-- upvalues: var13 (ref), var14 (ref)
		local current = var13.current
		
		if current ~= nil then
			current.Text = var14
		end
	end, { var14 })
	
	return reactModule.createElement(view, {
		tag = "align-x-center size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		padding = {
			top = UDim.new(0, var10.Padding.Large),
			bottom = UDim.new(0, math.max(var9.bottom, var10.Padding.Large)),
			left = UDim.new(0, math.max(var9.left, var10.Padding.XLarge)),
			right = UDim.new(0, math.max(var9.right, var10.Padding.XLarge))
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
					PlaceholderColor3 = var10.Color.Content.Muted.Color3,
					PlaceholderText = var11.PublishingDescription,
					ref = var13,
					ShowNativeInput = true,
					TextColor3 = var10.Color.ActionStandard.Foreground.Color3,
					TextSize = var10.FontSize.FontSize_400,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = useCallback(function(p1) --[[ line: 69 ]]
						local var15 = p1.Text:gsub("[\r\n]+", " ")
						local charCount = utf8.len(var15)
						
						if charCount ~= nil and charCount >= 140 then
							var15 = string.sub(var15, 1, utf8.offset(var15, 141) - 1)
						end
						if var15 ~= p1.Text then
							p1.Text = var15
						end
					end, {}),
					[reactModule.Event.FocusLost] = useCallback(function() --[[ line: 62 ]]
						-- upvalues: var13 (ref), var12 (ref), fireAnalyticsEventModule (copy), eventNames (copy)
						local current = var13.current
						var12.updateDescription(if current ~= nil then "" else current.Text)
						fireAnalyticsEventModule(eventNames.EditingFlowDescriptionEdited)
					end, { var12.updateDescription })
				})
			}),
			CTAs = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-x-center align-y-bottom gap-small position-bottom-center anchor-bottom-center size-full-0 auto-y"
			}, {
				PostButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					fillBehavior = foundationModule.Enums.FillBehavior.Fill,
					onActivated = p0.onPublish,
					size = inputSize.Medium,
					text = var11.PublishingCtaPrimary,
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
				Text = var11.CreationTooltip
			})
		})
	})
end