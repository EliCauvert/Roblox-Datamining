local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ReactionMapModule = require(script.Parent.ReactionMap)
local ReactionListModule = require(script.Parent.ReactionList)
local White = require(Parent.Style).Colors.White
local ArialBold = Enum.Font.ArialBold

return function(Frame)
	-- upvalues: ReactionListModule (copy), ReactModule (copy), CryoModule (copy), RoactModule (copy), White (copy), ArialBold (copy), ReactionMapModule (copy)
	local t = {}
	
	if Frame.emoji == "All" then
		local Count = 1
		
		for i in ReactionListModule do
			if Frame.reactionData[ReactionListModule[i]] ~= nil then
				for i1 in Frame.reactionData[ReactionListModule[i]] do
					t[Count] = {
						Frame.reactionData[ReactionListModule[i]][i1],
						ReactionListModule[i]
					}
					Count += 1
				end
			end
		end
	else
		local Count1 = 1
		
		for i2 in Frame.reactionData[Frame.emoji] do
			t[Count1] = { Frame.reactionData[Frame.emoji][i2], Frame.emoji }
			Count1 += 1
		end
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), t (copy), RoactModule (upval), White (upval), ArialBold (upval), ReactionMapModule (upval)
		return CryoModule.List.map(t, function(Entry, _)
			-- upvalues: RoactModule (upval), White (upval), ArialBold (upval), ReactionMapModule (upval)
			return RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 36)
			}, {
				padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 25),
					PaddingRight = UDim.new(0, 25)
				}),
				profilePic = RoactModule.createElement("ImageLabel", {
					BorderSizePixel = 0,
					Image = "rbxthumb://type=AvatarHeadShot&id=505306092&w=150&h=150&filters=circular",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 36, 0, 36),
					ScaleType = Enum.ScaleType.Fit
				}),
				userInfo = RoactModule.createElement("TextLabel", {
					BorderSizePixel = 0,
					TextSize = 15,
					BackgroundTransparency = 1,
					Size = UDim2.new(0.5, 0, 0, 36),
					TextColor3 = White,
					Text = Entry[1],
					Font = ArialBold,
					TextXAlignment = Enum.TextXAlignment.Left,
					Position = UDim2.new(0, 56, 0, 0)
				}),
				emoji = RoactModule.createElement("ImageLabel", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 25, 0, 25),
					Image = ReactionMapModule[Entry[2]],
					ScaleType = Enum.ScaleType.Fit,
					Position = UDim2.new(1, -25, 0.5, -12.5)
				})
			})
		end)
	end, { Frame.reactionData, Frame.emoji })
	
	return RoactModule.createElement("ScrollingFrame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ScrollBarThickness = 0,
		Size = UDim2.new(1, 0, 0, 285),
		CanvasSize = UDim2.new(0, 0, 0, #UseMemoResult * 53 - 17 + 5),
		LayoutOrder = Frame.LayoutOrder
	}, {
		layout = RoactModule.createElement("UIListLayout", { Padding = UDim.new(0, 17) })
	}, UseMemoResult)
end