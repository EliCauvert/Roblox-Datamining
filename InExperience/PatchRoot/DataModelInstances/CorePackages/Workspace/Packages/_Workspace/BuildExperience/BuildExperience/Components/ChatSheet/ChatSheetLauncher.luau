local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local chatActionsRowModule = require(buildExperience.Components.Chat.ChatActionsRow)
local textAreaModule = require(buildExperience.FoundationFork.TextArea)
local useHardwareInsetsModule = require(buildExperience.FoundationFork.Sheet.useHardwareInsets)
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useOverlay = foundationModule.Hooks.useOverlay
local useTokens = foundationModule.Hooks.useTokens

local function noop() --[[ line: 29 ]] end

return function(p0) --[[ line: 31 | named "ChatSheetLauncher" ]]
	-- upvalues: useTokens (ref), useOverlay (ref), useHardwareInsetsModule (ref), reactModule (ref), view (ref), textAreaModule (ref), noop (ref), inputSize (ref), chatActionsRowModule (ref), stateLayerAffordance (ref), reactRobloxModule (ref)
	local var8 = useTokens()
	local var9 = useOverlay()
	local bottom = useHardwareInsetsModule(var9).bottom
	local small = var8.Margin.Small
	local var10 = reactModule.createElement(view, {
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
				placeholder = p0.placeholder or "Describe an idea",
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
	
	return if var9 == nil then var10 else reactRobloxModule.createPortal(var10, var9)
end