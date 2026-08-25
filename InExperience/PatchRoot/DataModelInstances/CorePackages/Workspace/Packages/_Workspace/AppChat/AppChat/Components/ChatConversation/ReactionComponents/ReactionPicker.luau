local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local reactionMapModule = require(script.Parent.ReactionMap)
local reactionListModule = require(script.Parent.ReactionList)
local color = Color3.fromRGB(57, 59, 61)
local color_1 = Color3.fromRGB(100, 102, 104)

return function(p0)
	-- upvalues: reactModule (ref), reactionListModule (ref), cryoModule (ref), roactModule (ref), reactionMapModule (ref), color (ref), color_1 (ref)
	if p0.numReactionsToShow == nil then
		p0.numReactionsToShow = 6
	end
	if p0.numReactionsToShow > 6 or p0.numReactionsToShow < 0 then
		error("Invalid number of reactions")
	end
	return {
		ReactionPicker = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = color_1
		}, {
			corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			padding = roactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 19.5),
				PaddingLeft = UDim.new(0, 19.5)
			}),
			layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 11)
			})
		}, reactModule.useMemo(function()
			-- upvalues: reactionListModule (copy), p0 (ref), cryoModule (copy), roactModule (copy), reactionMapModule (copy), reactModule (copy), color (copy)
			local t = {}
			
			for i in reactionListModule do
				if p0.numReactionsToShow < i then break end
				t[i] = reactionListModule[i]
			end
			return cryoModule.List.map(t, function(p1, _)
				-- upvalues: p0 (copy), roactModule (copy), reactionMapModule (copy), reactModule (copy), color (copy)
				return roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 40, 0, 40)
				}, {
					imageButton = roactModule.createElement("ImageButton", {
						Image = reactionMapModule[p1],
						Name = p1 .. "_Button",
						Size = UDim2.new(0, 40, 0, 40),
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						ScaleType = Enum.ScaleType.Fit,
						[reactModule.Event.Activated] = function()
							-- upvalues: p0 (copy), p1 (ref)
							p0.onReactionSelected(p1)
						end
					}),
					indicator = roactModule.createElement("Frame", {
						Size = UDim2.new(0, 6, 0, 6),
						Position = UDim2.new(0.5, -3, 1, 2),
						BackgroundColor3 = color,
						BackgroundTransparency = if p1 == p0.selectedReactionType then 0 else 1,
						Name = p1 .. "_Indicator"
					}, {
						corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
					})
				})
			end)
		end, { reactionMapModule, p0.selectedReactionType }))
	}
end