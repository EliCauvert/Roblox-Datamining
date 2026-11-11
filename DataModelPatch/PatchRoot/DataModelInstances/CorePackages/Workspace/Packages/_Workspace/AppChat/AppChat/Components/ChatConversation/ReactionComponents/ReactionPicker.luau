local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ReactionMapModule = require(script.Parent.ReactionMap)
local ReactionListModule = require(script.Parent.ReactionList)
local _Color3 = Color3.fromRGB(57, 59, 61)
local _Color3_1 = Color3.fromRGB(100, 102, 104)

return function(p1)
	-- upvalues: ReactModule (copy), ReactionListModule (copy), CryoModule (copy), RoactModule (copy), ReactionMapModule (copy), _Color3 (copy), _Color3_1 (copy)
	if p1.numReactionsToShow == nil then
		p1.numReactionsToShow = 6
	end
	if p1.numReactionsToShow > 6 or p1.numReactionsToShow < 0 then
		error("Invalid number of reactions")
	end
	return {
		ReactionPicker = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = _Color3_1
		}, {
			corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			padding = RoactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 19.5),
				PaddingLeft = UDim.new(0, 19.5)
			}),
			layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 11)
			})
		}, (ReactModule.useMemo(function()
			-- upvalues: ReactionListModule (upval), p1 (copy), CryoModule (upval), RoactModule (upval), ReactionMapModule (upval), ReactModule (upval), _Color3 (upval)
			local t = {}
			
			for i in ReactionListModule do
				if p1.numReactionsToShow < i then break end
				t[i] = ReactionListModule[i]
			end
			return CryoModule.List.map(t, function(Text, _)
				-- upvalues: p1 (upval), RoactModule (upval), ReactionMapModule (upval), ReactModule (upval), _Color3 (upval)
				return RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 40, 0, 40)
				}, {
					imageButton = RoactModule.createElement("ImageButton", {
						Image = ReactionMapModule[Text],
						Name = Text .. "_Button",
						Size = UDim2.new(0, 40, 0, 40),
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						ScaleType = Enum.ScaleType.Fit,
						[ReactModule.Event.Activated] = function()
							-- upvalues: p1 (upval), Text (copy)
							p1.onReactionSelected(Text)
						end
					}),
					indicator = RoactModule.createElement("Frame", {
						Size = UDim2.new(0, 6, 0, 6),
						Position = UDim2.new(0.5, -3, 1, 2),
						BackgroundColor3 = _Color3,
						BackgroundTransparency = if Text == p1.selectedReactionType then 0 else 1,
						Name = Text .. "_Indicator"
					}, {
						corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
					})
				})
			end)
		end, { ReactionMapModule, p1.selectedReactionType })))
	}
end