local Roact = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact
local Parent = script.Parent.Parent.Parent.Parent
local ControlsModule = require(Parent.Resources.Controls)
local ControlLayoutContainerModule = require(script.Parent.Parent.ControlLayoutContainer)
local PaddedScrollFrameModule = require(Parent.Components.PaddedScrollFrame)
local ControlEntryModule = require(script.Parent.Parent.ControlEntry)
local ControlEntryHeaderModule = require(script.Parent.Parent.ControlEntryHeader)

return function(_)
	-- upvalues: Roact (copy), ControlsModule (copy), ControlEntryHeaderModule (copy), ControlEntryModule (copy), ControlLayoutContainerModule (copy), PaddedScrollFrameModule (copy)
	local Elements = {
		ListLayout = Roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Padding = Roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 95),
			PaddingRight = UDim.new(0, 95)
		}),
		SizeConstraint = Roact.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(1090, 1e999),
			MinSize = Vector2.new(150, 0)
		})
	}
	local Count = 0
	local Count1 = 0
	local LayoutOrder = 1
	
	for _, keybind in ipairs(ControlsModule.keybinds) do
		local Title = keybind.title
		Count += 1
		Elements[Title .. "_header"] = Roact.createElement(ControlEntryHeaderModule, { title = Title, LayoutOrder = LayoutOrder })
		LayoutOrder += 1
		
		for i, control in ipairs(keybind.controls) do
			Count1 += 1
			Elements[Title .. "_" .. i] = Roact.createElement(ControlEntryModule, {
				LayoutOrder = LayoutOrder,
				actionDescription = control.desc,
				inputs = control.inputs,
				isList = control.list,
				hasDivider = i ~= #keybind.controls
			})
			LayoutOrder += 1
		end
	end
	return Roact.createElement(ControlLayoutContainerModule, {
		titleText = "CoreScripts.InGameMenu.Controls.KeyboardAndMouseTitle"
	}, {
		ScrollContent = Roact.createElement(PaddedScrollFrameModule, {
			CanvasSize = UDim2.new(0, 0, 0, Count * 45 + Count1 * 50),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Size = UDim2.new(1, 0, 1, -130)
		}, {
			ListContainer = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 0)
			}, Elements)
		})
	})
end