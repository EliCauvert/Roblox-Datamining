local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local ReactModule = require(Parent1.React)
local Object = require(Parent1.LuauPolyfill).Object
local _ = require(Parent.Style.StyleTypes)
local config = { zIndex = 1 }

return function(p1)
	-- upvalues: Object (copy), config (copy), ReactModule (copy)
	local AssignResult = Object.assign({}, config, p1)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = AssignResult.zIndex,
		Size = UDim2.fromScale(1, 1)
	}, {
		TopContainer = ReactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.fromScale(1, 0.5)
		}, {
			Content = ReactModule.createElement("Frame", {
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 2),
				BackgroundColor3 = AssignResult.background.Color,
				BackgroundTransparency = AssignResult.background.Transparency
			}, {
				UICorner = if AssignResult.topCornerRadius then ReactModule.createElement("UICorner", { CornerRadius = AssignResult.topCornerRadius }) else nil
			})
		}),
		BottomContainer = ReactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.fromScale(1, 0.5)
		}, {
			Content = ReactModule.createElement("Frame", {
				Position = UDim2.fromScale(0, -1),
				Size = UDim2.fromScale(1, 2),
				BackgroundColor3 = AssignResult.background.Color,
				BackgroundTransparency = AssignResult.background.Transparency
			}, {
				UICorner = if AssignResult.bottomCornerRadius then ReactModule.createElement("UICorner", { CornerRadius = AssignResult.bottomCornerRadius }) else nil
			})
		})
	})
end