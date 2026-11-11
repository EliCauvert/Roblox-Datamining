local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ReactionMapModule = require(script.Parent.ReactionMap)
local ReactionListModule = require(script.Parent.ReactionList)
local ArialBold = Enum.Font.ArialBold
local _Color3 = Color3.new(1, 1, 1)
local _Color3_1 = Color3.fromRGB(100, 102, 104)

return function(p1)
	-- upvalues: ReactModule (copy), ReactionListModule (copy), CryoModule (copy), RoactModule (copy), ReactionMapModule (copy), _Color3_1 (copy), _Color3 (copy), ArialBold (copy)
	local Text = 0
	local Flag = false
	local Count = 0
	
	for _, value in p1.reactionData do
		if #value >= 2 then
			Flag = true
		end
		Text += #value
		Count += 1
	end
	if Count > 3 then
		Flag = true
	end
	return {
		reactionCounter = RoactModule.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BorderSizePixel = 0,
			Text = "",
			[RoactModule.Event.Activated] = p1.onPressed,
			BackgroundColor3 = _Color3_1
		}, {
			corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			padding = RoactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 5),
				PaddingTop = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 7),
				PaddingLeft = UDim.new(0, 7)
			}),
			layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			})
		}, ReactModule.useMemo(function()
			-- upvalues: ReactionListModule (upval), p1 (copy), CryoModule (upval), RoactModule (upval), ReactionMapModule (upval)
			local Count = 1
			local t = {}
			
			for i in ReactionListModule do
				if Count >= 4 then break end
				if p1.reactionData[ReactionListModule[i]] ~= nil then
					t[Count] = ReactionListModule[i]
					Count += 1
				end
			end
			return CryoModule.List.map(t, function(p2, Text)
				-- upvalues: RoactModule (upval), ReactionMapModule (upval)
				return RoactModule.createElement("ImageLabel", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Image = ReactionMapModule[p2],
					Size = UDim2.new(0, 20, 0, 20),
					ScaleType = Enum.ScaleType.Fit,
					Name = "ShowReaction" .. Text
				})
			end)
		end, {}), {
			reactionCount = Flag and RoactModule.createElement("TextLabel", {
				TextSize = 17,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, if Text >= 10 then 15 else 10, 0, 20),
				Text = Text,
				TextColor3 = _Color3,
				Font = ArialBold
			})
		})
	}
end