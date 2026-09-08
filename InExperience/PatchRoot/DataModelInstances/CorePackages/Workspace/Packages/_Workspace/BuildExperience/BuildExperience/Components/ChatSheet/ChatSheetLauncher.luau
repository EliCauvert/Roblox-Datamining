local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local chatActionsRowModule = require(buildExperience.Components.Chat.ChatActionsRow)
local textAreaModule = require(buildExperience.FoundationFork.TextArea)
local var1 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then require(script.Parent.useHardwareInsets) else require(buildExperience.FoundationFork.Sheet.useHardwareInsets)
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useOverlay = foundationModule.Hooks.useOverlay
local useTokens = foundationModule.Hooks.useTokens

local function noop() end

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useTokens (ref), useOverlay (ref), var1 (ref), reactModule (ref), view (ref), textAreaModule (ref), noop (ref), inputSize (ref), chatActionsRowModule (ref), stateLayerAffordance (ref), reactRobloxModule (ref)
	local var2 = useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	})
	local var3 = useTokens()
	local var4 = useOverlay()
	local bottom = var1(var4).bottom
	local small = var3.Margin.Small
	local var5 = reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Background = reactModule.createElement(view, {
			tag = "bg-surface-100",
			ZIndex = 0,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, bottom),
			Size = UDim2.new(1, 0, 1, bottom),
			selection = { Selectable = false }
		}),
		Content = reactModule.createElement(view, {
			ZIndex = 1,
			tag = "col size-full-0 auto-y",
			padding = {
				top = UDim.new(0, small),
				left = UDim.new(0, small),
				right = UDim.new(0, small),
				bottom = UDim.new(0, small + bottom)
			},
			selection = { Selectable = false }
		}, {
			Composer = reactModule.createElement(textAreaModule, {
				text = "",
				label = "",
				maxLines = 5,
				isDisabled = true,
				testId = "--chat-sheet-launcher-composer",
				onChanged = noop,
				placeholder = p1.placeholder or var2.composerPlaceholder,
				width = UDim.new(1, 0),
				size = inputSize.Large,
				trailingElement = reactModule.createElement(view, { tag = "auto-xy padding-x-xsmall padding-y-small" }, {
					Actions = reactModule.createElement(chatActionsRowModule, {
						isAssistantResponding = false,
						isComposerEmpty = true,
						onSend = noop,
						onStop = noop
					})
				})
			})
		}),
		TapTarget = reactModule.createElement(view, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.fromScale(1, 1),
			onActivated = p1.onActivated,
			testId = p1.testId or "chat-sheet-launcher",
			selection = { Selectable = false },
			stateLayer = { affordance = stateLayerAffordance.None }
		})
	})
	
	return if var4 == nil then var5 else reactRobloxModule.createPortal(var5, var4)
end