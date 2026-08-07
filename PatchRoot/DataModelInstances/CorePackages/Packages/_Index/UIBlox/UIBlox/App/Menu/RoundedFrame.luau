-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:56 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local reactModule = require(parent_1.React)
local object = require(parent_1.LuauPolyfill).Object
local _ = require(parent.Style.StyleTypes)
local t = { zIndex = 1 }

return function(p0) --[[ line: 27 ]]
	-- upvalues: object (ref), t (ref), reactModule (ref)
	local var2 = object.assign({}, t, p0)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = var2.zIndex,
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
				BackgroundColor3 = var2.background.Color,
				BackgroundTransparency = var2.background.Transparency
			}, {
				UICorner = if var2.topCornerRadius then reactModule.createElement("UICorner", { CornerRadius = var2.topCornerRadius }) else nil
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
				BackgroundColor3 = var2.background.Color,
				BackgroundTransparency = var2.background.Transparency
			}, {
				UICorner = if var2.bottomCornerRadius then reactModule.createElement("UICorner", { CornerRadius = var2.bottomCornerRadius }) else nil
			})
		})
	})
end