local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local default = require(parent_1.VoiceChatCore).CoreVoiceManager.default
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local controlState = foundationModule.Enums.ControlState
local icon = foundationModule.Icon
local popover = foundationModule.Popover
local popoverAlign = foundationModule.Enums.PopoverAlign
local text = foundationModule.Text
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization
local useScaledValue = foundationModule.Hooks.useScaledValue
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useTokens = foundationModule.Hooks.useTokens
local captureTriggerTypeModule = require(parent.Enums.CaptureTriggerType)
local constantsModule = require(parent.Constants)

return function(p1)
	-- upvalues: useLocalization (ref), useScaledValue (ref), useTokens (ref), reactModule (ref), useSelector (ref), constantsModule (ref), controlState (ref), default (ref), captureTriggerTypeModule (ref), view (ref), popover (ref), icon (ref), foundationModule (ref), popoverAlign (ref), text (ref)
	local var1 = useLocalization({
		voiceChatMutedLabel = "Feature.Captures.Label.VideoCaptureVoiceChatMutedTooltip",
		voiceChatMutedTitle = "Feature.Captures.Title.VideoCaptureVoiceChatMutedTooltip"
	})
	local var2 = useScaledValue(320)
	local var3 = useTokens()
	local var4, var5 = reactModule.useState(false)
	local var6 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsVideoCaptureActive.triggerType
	end)
	
	return if not (not default:UserVoiceEnabled() or not default:IsInitialized()) then if not (var6 ~= captureTriggerTypeModule.UserCapture and var6 ~= captureTriggerTypeModule.DeveloperCapture) then if game:GetEngineFeature("ReenableMomentsVoice") then nil else reactModule.createElement(view, {
		tag = "anchor-center-center clip position-center-center radius-circle size-700-700",
		LayoutOrder = p1.layoutOrder,
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: controlState (copy), var5 (ref), var4 (ref)
			if p2 == controlState.Pressed then
				var5(not var4)
			end
		end, { var4 })
	}, {
		Popover = reactModule.createElement(popover.Root, { isOpen = var4 }, {
			Anchor = reactModule.createElement(popover.Anchor, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			}, {
				DeafenIcon = reactModule.createElement(icon, {
					name = "icons/controls/headphoneDeafen_small",
					size = foundationModule.Enums.IconSize.Small,
					style = var3.Color.Content.Emphasis
				})
			}),
			Content = reactModule.createElement(popover.Content, {
				hasArrow = false,
				align = popoverAlign.Center,
				onPressedOutside = reactModule.useCallback(function()
					-- upvalues: var5 (ref)
					var5(false)
				end, {}),
				side = { offset = var3.Size.Size_500, position = p1.popoverSide }
			}, {
				Tooltip = reactModule.createElement(view, {
					tag = "auto-xy col gap-xsmall padding-y-small padding-x-medium",
					sizeConstraint = { MaxSize = Vector2.new(var2, 1e999) }
				}, {
					Title = reactModule.createElement(text, {
						tag = "size-full-0 auto-y text-truncate-end text-align-x-left text-title-small",
						Text = var1.voiceChatMutedTitle
					}),
					Subtitle = reactModule.createElement(text, {
						tag = "size-full-0 auto-y text-wrap text-align-x-left text-body-small",
						Text = var1.voiceChatMutedLabel
					})
				})
			})
		})
	}) else nil else nil
end