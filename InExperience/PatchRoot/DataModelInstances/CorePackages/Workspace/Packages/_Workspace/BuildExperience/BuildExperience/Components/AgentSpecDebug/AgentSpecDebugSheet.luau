local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local var1 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local button = foundationModule.Button
local text = foundationModule.Text
local textInput = foundationModule.TextInput

return function(p1)
	-- upvalues: reactModule (ref), var1 (ref), text (ref), textInput (ref), button (ref), foundationModule (ref)
	local var2, var3 = reactModule.useState(p1.specVersion or "")
	
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
					-- upvalues: p1 (ref), var2 (ref)
					p1.onSave(var2)
					p1.onClose()
				end
			})
		})
	})
end