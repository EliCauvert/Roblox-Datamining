local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle

return function(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy)
	local MaxSize = p1.maxSize
	local LayoutOrder = p1.layoutOrder
	local Text = p1.text
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), LayoutOrder (copy), MaxSize (copy), Text (copy)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 0, 32)
		}, {
			SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = MaxSize }),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 22),
				PaddingTop = UDim.new(0, 5),
				PaddingBottom = UDim.new(0, 5)
			}),
			Text = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Font = p2.Font.Header2.Font,
				TextSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = p2.Theme.TextDefault.Color,
				TextTransparency = p2.Theme.TextDefault.Transparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				Text = Text
			})
		})
	end)
end