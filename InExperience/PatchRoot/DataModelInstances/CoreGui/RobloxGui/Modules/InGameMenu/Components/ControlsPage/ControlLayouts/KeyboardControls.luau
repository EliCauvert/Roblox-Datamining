local roact = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact
local parent = script.Parent.Parent.Parent.Parent
local controlsModule = require(parent.Resources.Controls)
local controlLayoutContainerModule = require(script.Parent.Parent.ControlLayoutContainer)
local paddedScrollFrameModule = require(parent.Components.PaddedScrollFrame)
local controlEntryModule = require(script.Parent.Parent.ControlEntry)
local controlEntryHeaderModule = require(script.Parent.Parent.ControlEntryHeader)

return function(_)
	-- upvalues: roact (ref), controlsModule (ref), controlEntryHeaderModule (ref), controlEntryModule (ref), controlLayoutContainerModule (ref), paddedScrollFrameModule (ref)
	local t = {
		ListLayout = roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Padding = roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 95),
			PaddingRight = UDim.new(0, 95)
		}),
		SizeConstraint = roact.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(1090, 1e999),
			MinSize = Vector2.new(150, 0)
		})
	}
	local var1 = 0
	local var2 = 0
	local var3 = 1
	
	for i, v in ipairs(controlsModule.keybinds) do
		local title = v.title
		var1 += 1
		t[title .. "_header"] = roact.createElement(controlEntryHeaderModule, { title = title, LayoutOrder = var3 })
		var3 += 1
		
		for i_1, v_1 in ipairs(v.controls) do
			var2 += 1
			t[title .. "_" .. i_1] = roact.createElement(controlEntryModule, {
				LayoutOrder = var3,
				actionDescription = v_1.desc,
				inputs = v_1.inputs,
				isList = v_1.list,
				hasDivider = i_1 ~= #v.controls
			})
			var3 += 1
		end
	end
	return roact.createElement(controlLayoutContainerModule, {
		titleText = "CoreScripts.InGameMenu.Controls.KeyboardAndMouseTitle"
	}, {
		ScrollContent = roact.createElement(paddedScrollFrameModule, {
			CanvasSize = UDim2.new(0, 0, 0, var1 * 45 + var2 * 50),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Size = UDim2.new(1, 0, 1, -130)
		}, {
			ListContainer = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 0)
			}, t)
		})
	})
end