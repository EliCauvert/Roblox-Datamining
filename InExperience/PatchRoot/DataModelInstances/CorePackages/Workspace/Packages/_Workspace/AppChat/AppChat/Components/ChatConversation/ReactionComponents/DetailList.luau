local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local colors = require(parent.Style).Colors
local reactionMapModule = require(script.Parent.ReactionMap)
local reactionListModule = require(script.Parent.ReactionList)
local white = colors.White
local arialBold = Enum.Font.ArialBold

return function(p1)
	-- upvalues: reactionListModule (ref), reactModule (ref), cryoModule (ref), roactModule (ref), white (ref), arialBold (ref), reactionMapModule (ref)
	local _ = {}
	local t = {}
	
	if p1.emoji == "All" then
		local var1 = 1
		
		for i in reactionListModule do
			if p1.reactionData[reactionListModule[i]] ~= nil then
				for i_1 in p1.reactionData[reactionListModule[i]] do
					t[var1] = {
						p1.reactionData[reactionListModule[i]][i_1],
						reactionListModule[i]
					}
					var1 += 1
				end
			end
		end
	else
		local var2 = 1
		
		for i in p1.reactionData[p1.emoji] do
			t[var2] = { p1.reactionData[p1.emoji][i], p1.emoji }
			var2 += 1
		end
	end
	local var3 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), t (ref), roactModule (copy), white (copy), arialBold (copy), reactionMapModule (copy)
		return cryoModule.List.map(t, function(p2, _)
			-- upvalues: roactModule (copy), white (copy), arialBold (copy), reactionMapModule (copy)
			return roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 36)
			}, {
				padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 25),
					PaddingRight = UDim.new(0, 25)
				}),
				profilePic = roactModule.createElement("ImageLabel", {
					BorderSizePixel = 0,
					Image = "rbxthumb://type=AvatarHeadShot&id=505306092&w=150&h=150&filters=circular",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 36, 0, 36),
					ScaleType = Enum.ScaleType.Fit
				}),
				userInfo = roactModule.createElement("TextLabel", {
					BorderSizePixel = 0,
					TextSize = 15,
					BackgroundTransparency = 1,
					Size = UDim2.new(0.5, 0, 0, 36),
					TextColor3 = white,
					Text = p2[1],
					Font = arialBold,
					TextXAlignment = Enum.TextXAlignment.Left,
					Position = UDim2.new(0, 56, 0, 0)
				}),
				emoji = roactModule.createElement("ImageLabel", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 25, 0, 25),
					Image = reactionMapModule[p2[2]],
					ScaleType = Enum.ScaleType.Fit,
					Position = UDim2.new(1, -25, 0.5, -12.5)
				})
			})
		end)
	end, { p1.reactionData, p1.emoji })
	
	return roactModule.createElement("ScrollingFrame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ScrollBarThickness = 0,
		Size = UDim2.new(1, 0, 0, 285),
		CanvasSize = UDim2.new(0, 0, 0, #var3 * 53 - 17 + 5),
		LayoutOrder = p1.LayoutOrder
	}, {
		layout = roactModule.createElement("UIListLayout", { Padding = UDim.new(0, 17) })
	}, var3)
end