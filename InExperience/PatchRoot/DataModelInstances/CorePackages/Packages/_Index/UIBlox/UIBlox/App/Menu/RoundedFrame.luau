local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local reactModule = require(parent_1.React)
local object = require(parent_1.LuauPolyfill).Object
local _ = require(parent.Style.StyleTypes)
local t = { zIndex = 1 }

return function(p1)
	-- upvalues: object (ref), t (ref), reactModule (ref)
	local var1 = object.assign({}, t, p1)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = var1.zIndex,
		Size = UDim2.fromScale(1, 1)
	}, {
		TopContainer = reactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.fromScale(1, 0.5)
		}, {
			Content = reactModule.createElement("Frame", {
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 2),
				BackgroundColor3 = var1.background.Color,
				BackgroundTransparency = var1.background.Transparency
			}, {
				UICorner = if var1.topCornerRadius then reactModule.createElement("UICorner", { CornerRadius = var1.topCornerRadius }) else nil
			})
		}),
		BottomContainer = reactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.fromScale(1, 0.5)
		}, {
			Content = reactModule.createElement("Frame", {
				Position = UDim2.fromScale(0, -1),
				Size = UDim2.fromScale(1, 2),
				BackgroundColor3 = var1.background.Color,
				BackgroundTransparency = var1.background.Transparency
			}, {
				UICorner = if var1.bottomCornerRadius then reactModule.createElement("UICorner", { CornerRadius = var1.bottomCornerRadius }) else nil
			})
		})
	})
end