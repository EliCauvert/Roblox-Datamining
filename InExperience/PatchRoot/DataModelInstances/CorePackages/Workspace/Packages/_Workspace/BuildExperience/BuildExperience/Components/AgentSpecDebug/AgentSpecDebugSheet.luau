local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local buildAppStorageModule = require(buildExperience.Storage.BuildAppStorage)
local var1 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local button = foundationModule.Button
local text = foundationModule.Text
local textInput = foundationModule.TextInput

if creatorAgentChatModule.experimentOverride.isEnabled() then
	creatorAgentChatModule.experimentOverride.set(buildAppStorageModule.getAgentSpecVersion())
end
return function(p1)
	-- upvalues: reactModule (ref), creatorAgentChatModule (ref), var1 (ref), text (ref), textInput (ref), button (ref), foundationModule (ref), buildAppStorageModule (ref)
	local var2, var3 = reactModule.useState(creatorAgentChatModule.experimentOverride.get() or "")
	
	return reactModule.createElement(var1.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p1.onClose
	}, {
		Header = reactModule.createElement(var1.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				Text = "Agent Spec",
				tag = "auto-xy text-heading-small content-emphasis"
			})
		}),
		Content = reactModule.createElement(var1.Content, nil, {
			Input = reactModule.createElement(textInput, {
				label = "specVersion",
				placeholder = "Leave empty for latest",
				text = var2,
				width = UDim.new(1, 0),
				onChanged = var3
			})
		}),
		Actions = reactModule.createElement(var1.Actions, nil, {
			Save = reactModule.createElement(button, {
				text = "Save",
				size = foundationModule.Enums.InputSize.Large,
				variant = foundationModule.Enums.ButtonVariant.Emphasis,
				fillBehavior = foundationModule.Enums.FillBehavior.Fill,
				onActivated = function()
					-- upvalues: creatorAgentChatModule (copy), var2 (ref), buildAppStorageModule (copy), p1 (ref)
					creatorAgentChatModule.experimentOverride.set(var2)
					buildAppStorageModule.setAgentSpecVersion(creatorAgentChatModule.experimentOverride.get())
					p1.onClose()
				end
			})
		})
	})
end