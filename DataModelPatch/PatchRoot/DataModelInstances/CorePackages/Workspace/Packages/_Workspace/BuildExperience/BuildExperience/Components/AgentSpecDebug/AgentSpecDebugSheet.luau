local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SheetModule = require(BuildExperience.FoundationFork.Sheet)
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local TextInput = FoundationModule.TextInput

return function(p1)
	-- upvalues: ReactModule (copy), CreatorAgentChatModule (copy), SheetModule (copy), Text (copy), TextInput (copy), Button (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(CreatorAgentChatModule.experimentOverride.get() or "")
	
	return ReactModule.createElement(SheetModule.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p1.onClose
	}, {
		Header = ReactModule.createElement(SheetModule.Header, { hasCloseAffordance = true }, {
			Title = ReactModule.createElement(Text, {
				Text = "Agent Spec",
				tag = "auto-xy text-heading-small content-emphasis"
			})
		}),
		Content = ReactModule.createElement(SheetModule.Content, nil, {
			Input = ReactModule.createElement(TextInput, {
				label = "specVersion",
				placeholder = "Leave empty for latest",
				text = UseStateResult,
				width = UDim.new(1, 0),
				onChanged = UseStateResult2
			})
		}),
		Actions = ReactModule.createElement(SheetModule.Actions, nil, {
			Save = ReactModule.createElement(Button, {
				text = "Save",
				size = FoundationModule.Enums.InputSize.Large,
				variant = FoundationModule.Enums.ButtonVariant.Emphasis,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
				onActivated = function()
					-- upvalues: CreatorAgentChatModule (upval), UseStateResult (copy), p1 (copy)
					CreatorAgentChatModule.experimentOverride.set(UseStateResult)
					p1.onClose()
				end
			})
		})
	})
end