local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local Default = require(Parent1.VoiceChatCore).CoreVoiceManager.default
local FoundationModule = require(Parent1.Foundation)
local ControlState = FoundationModule.Enums.ControlState
local Icon = FoundationModule.Icon
local Popover = FoundationModule.Popover
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseSelectorFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useSelector
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CaptureTriggerTypeModule = require(Parent.Enums.CaptureTriggerType)
local ConstantsModule = require(Parent.Constants)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseScaledValueFunction (copy), UseTokensFunction (copy), ReactModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), ControlState (copy), Default (copy), CaptureTriggerTypeModule (copy), View (copy), Popover (copy), Icon (copy), FoundationModule (copy), PopoverAlign (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		voiceChatMutedLabel = "Feature.Captures.Label.VideoCaptureVoiceChatMutedTooltip",
		voiceChatMutedTitle = "Feature.Captures.Title.VideoCaptureVoiceChatMutedTooltip"
	})
	local UseScaledValueResult = UseScaledValueFunction(320)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].IsVideoCaptureActive.triggerType
	end)
	local UseResult = ReactModule.useCallback(function(Pressed)
		-- upvalues: ControlState (upval), UseStateResult2 (copy), UseStateResult (copy)
		if Pressed == ControlState.Pressed then
			UseStateResult2(not UseStateResult)
		end
	end, { UseStateResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	
	return if Default:UserVoiceEnabled() and Default:IsInitialized() and (UseSelectorResult == CaptureTriggerTypeModule.UserCapture or UseSelectorResult == CaptureTriggerTypeModule.DeveloperCapture) then if game:GetEngineFeature("ReenableMomentsVoice") then nil else ReactModule.createElement(View, {
		tag = "anchor-center-center clip position-center-center radius-circle size-700-700",
		LayoutOrder = p1.layoutOrder,
		onStateChanged = UseResult
	}, {
		Popover = ReactModule.createElement(Popover.Root, { isOpen = UseStateResult }, {
			Anchor = ReactModule.createElement(Popover.Anchor, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			}, {
				DeafenIcon = ReactModule.createElement(Icon, {
					name = "icons/controls/headphoneDeafen_small",
					size = FoundationModule.Enums.IconSize.Small,
					style = UseTokensResult.Color.Content.Emphasis
				})
			}),
			Content = ReactModule.createElement(Popover.Content, {
				hasArrow = false,
				align = PopoverAlign.Center,
				onPressedOutside = UseResult1,
				side = {
					offset = UseTokensResult.Size.Size_500,
					position = p1.popoverSide
				}
			}, {
				Tooltip = ReactModule.createElement(View, {
					tag = "auto-xy col gap-xsmall padding-y-small padding-x-medium",
					sizeConstraint = { MaxSize = Vector2.new(UseScaledValueResult, 1e999) }
				}, {
					Title = ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y text-truncate-end text-align-x-left text-title-small",
						Text = UseLocalizationResult.voiceChatMutedTitle
					}),
					Subtitle = ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y text-wrap text-align-x-left text-body-small",
						Text = UseLocalizationResult.voiceChatMutedLabel
					})
				})
			})
		})
	}) else nil
end