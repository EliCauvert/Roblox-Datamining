local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local var4 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local button = foundationModule.Button
local text = foundationModule.Text
local textInput = foundationModule.TextInput

return function(p0) --[[ line: 18 | named "AgentSpecDebugSheet" ]]
	-- upvalues: reactModule (ref), creatorAgentChatModule (ref), var4 (ref), text (ref), textInput (ref), button (ref), foundationModule (ref)
	local var5, var6 = reactModule.useState(creatorAgentChatModule.experimentOverride.get() or "")
	
	return reactModule.createElement(var4.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p0.onClose
	}, {
		Header = reactModule.createElement(var4.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				Text = "Agent Spec",
				tag = "auto-xy text-heading-small content-emphasis"
			})
		}),
		Content = reactModule.createElement(var4.Content, nil, {
			Input = reactModule.createElement(textInput, {
				label = "specVersion",
				placeholder = "Leave empty for latest",
				text = var5,
				width = UDim.new(1, 0),
				onChanged = var6
			})
		}),
		Actions = reactModule.createElement(var4.Actions, nil, {
			Save = reactModule.createElement(button, {
				text = "Save",
				size = foundationModule.Enums.InputSize.Large,
				variant = foundationModule.Enums.ButtonVariant.Emphasis,
				fillBehavior = foundationModule.Enums.FillBehavior.Fill,
				onActivated = function() --[[ line: 47 ]]
					-- upvalues: creatorAgentChatModule (copy), var5 (ref), p0 (ref)
					creatorAgentChatModule.experimentOverride.set(var5)
					p0.onClose()
				end
			})
		})
	})
end