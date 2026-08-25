local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local reactionMapModule = require(script.Parent.ReactionMap)
local reactionListModule = require(script.Parent.ReactionList)
local arialBold = Enum.Font.ArialBold
local color3 = Color3.new(1, 1, 1)
local color = Color3.fromRGB(100, 102, 104)

return function(p0)
	-- upvalues: reactModule (ref), reactionListModule (ref), cryoModule (ref), roactModule (ref), reactionMapModule (ref), color (ref), color3 (ref), arialBold (ref)
	local var7 = 0
	local var8 = false
	local var9 = 0
	
	for i, v in p0.reactionData do
		if #v >= 2 then
			var8 = true
		end
		var7 += #v
		var9 += 1
	end
	if var9 > 3 then
		var8 = true
	end
	return {
		reactionCounter = roactModule.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BorderSizePixel = 0,
			Text = "",
			[roactModule.Event.Activated] = p0.onPressed,
			BackgroundColor3 = color
		}, {
			corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			padding = roactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 5),
				PaddingTop = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 7),
				PaddingLeft = UDim.new(0, 7)
			}),
			layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			})
		}, reactModule.useMemo(function()
			-- upvalues: reactionListModule (copy), p0 (ref), cryoModule (copy), roactModule (copy), reactionMapModule (copy)
			local var10 = 1
			local t = {}
			
			for i in reactionListModule do
				if var10 >= 4 then break end
				if p0.reactionData[reactionListModule[i]] ~= nil then
					t[var10] = reactionListModule[i]
					var10 += 1
				end
			end
			return cryoModule.List.map(t, function(p1, p2)
				-- upvalues: roactModule (copy), reactionMapModule (copy)
				return roactModule.createElement("ImageLabel", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Image = reactionMapModule[p1],
					Size = UDim2.new(0, 20, 0, 20),
					ScaleType = Enum.ScaleType.Fit,
					Name = "ShowReaction" .. p2
				})
			end)
		end, {}), {
			reactionCount = var8 and roactModule.createElement("TextLabel", {
				TextSize = 17,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, if var7 >= 10 then 15 else 10, 0, 20),
				Text = var7,
				TextColor3 = color3,
				Font = arialBold
			})
		})
	}
end