local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local ChatActionsRowModule = require(BuildExperience.Components.Chat.ChatActionsRow)
local TextAreaModule = require(BuildExperience.FoundationFork.TextArea)
local UseHardwareInsetsModule = require(script.Parent.useHardwareInsets)
local View = FoundationModule.View
local InputSize = FoundationModule.Enums.InputSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseOverlayFunction = FoundationModule.Hooks.useOverlay
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function noop() end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseTokensFunction (copy), UseOverlayFunction (copy), UseHardwareInsetsModule (copy), ReactModule (copy), View (copy), TextAreaModule (copy), noop (copy), InputSize (copy), ChatActionsRowModule (copy), StateLayerAffordance (copy), ReactRobloxModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		composerPlaceholder = LocalizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	})
	local UseTokensResult = UseTokensFunction()
	local UseOverlayResult = UseOverlayFunction()
	local Bottom = UseHardwareInsetsModule(UseOverlayResult).bottom
	local Small = UseTokensResult.Margin.Small
	local Element = ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Background = ReactModule.createElement(View, {
			tag = "bg-surface-100",
			ZIndex = 0,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, Bottom),
			Size = UDim2.new(1, 0, 1, Bottom),
			selection = { Selectable = false }
		}),
		Content = ReactModule.createElement(View, {
			ZIndex = 1,
			tag = "col size-full-0 auto-y",
			padding = {
				top = UDim.new(0, Small),
				left = UDim.new(0, Small),
				right = UDim.new(0, Small),
				bottom = UDim.new(0, Small + Bottom)
			},
			selection = { Selectable = false }
		}, {
			Composer = ReactModule.createElement(TextAreaModule, {
				text = "",
				label = "",
				maxLines = 5,
				isDisabled = true,
				testId = "--chat-sheet-launcher-composer",
				onChanged = noop,
				placeholder = p1.placeholder or UseLocalizationResult.composerPlaceholder,
				width = UDim.new(1, 0),
				size = InputSize.Large,
				trailingElement = ReactModule.createElement(View, { tag = "auto-xy padding-x-xsmall padding-y-small" }, {
					Actions = ReactModule.createElement(ChatActionsRowModule, {
						isAssistantResponding = false,
						isComposerEmpty = true,
						onSend = noop,
						onStop = noop
					})
				})
			})
		}),
		TapTarget = ReactModule.createElement(View, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.fromScale(1, 1),
			onActivated = p1.onActivated,
			testId = p1.testId or "chat-sheet-launcher",
			selection = { Selectable = false },
			stateLayer = { affordance = StateLayerAffordance.None }
		})
	})
	
	return if UseOverlayResult == nil then Element else ReactRobloxModule.createPortal(Element, UseOverlayResult)
end