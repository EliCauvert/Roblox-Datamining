local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local chatActionsRowModule = require(buildExperience.Components.Chat.ChatActionsRow)
local textAreaModule = require(buildExperience.FoundationFork.TextArea)
local var8 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then require(script.Parent.useHardwareInsets) else require(buildExperience.FoundationFork.Sheet.useHardwareInsets)
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useOverlay = foundationModule.Hooks.useOverlay
local useTokens = foundationModule.Hooks.useTokens

local function noop() --[[ line: 33 ]] end

return function(p0) --[[ line: 35 | named "ChatSheetLauncher" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), useOverlay (ref), var8 (ref), reactModule (ref), view (ref), textAreaModule (ref), noop (ref), inputSize (ref), chatActionsRowModule (ref), stateLayerAffordance (ref), reactRobloxModule (ref)
	local var10 = if fFlagBuildLocalization then useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	}) else nil
	local var11 = useTokens()
	local var12 = useOverlay()
	local bottom = var8(var12).bottom
	local small = var11.Margin.Small
	local var13 = reactModule.createElement(view, {
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
				placeholder = p0.placeholder or (if fFlagBuildLocalization then var10.composerPlaceholder else localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER),
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
			onActivated = p0.onActivated,
			testId = p0.testId or "chat-sheet-launcher",
			selection = { Selectable = false },
			stateLayer = { affordance = stateLayerAffordance.None }
		})
	})
	
	return if var12 == nil then var13 else reactRobloxModule.createPortal(var13, var12)
end