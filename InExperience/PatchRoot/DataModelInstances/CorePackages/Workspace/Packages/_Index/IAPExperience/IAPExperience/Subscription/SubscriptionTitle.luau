local parent = script.Parent.Parent.Parent
local UIBloxModule = require(parent.UIBlox)
local reactModule = require(parent.React)
local withStyle = UIBloxModule.Style.withStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local tModule = require(parent.t)
local subscriptionTitle = require(parent.Roact).PureComponent:extend("SubscriptionTitle")
subscriptionTitle.validateProps = tModule.strictInterface({
	name = tModule.string,
	displayPrice = tModule.string,
	subscriptionProviderName = tModule.string,
	period = tModule.string,
	disclaimerText = tModule.string,
	layoutOrder = tModule.number,
	contentHeight = tModule.number,
	itemIcon = tModule.any
})

local function _(p0, p1) --[[ line: 53 | named "createSubscriptionInfo" ]]
	-- upvalues: withStyle (ref), reactModule (ref)
	return withStyle(function(p2) --[[ line: 54 ]]
		-- upvalues: reactModule (copy), p0 (ref), p1 (ref)
		local theme = p2.Theme
		local font = p2.Font.Body.Font
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p0.layoutOrder
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = if p1 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 8)
			})
		}, {
			AppName = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p0.subscriptionProviderName,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if p1 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p0.layoutOrder
			})
		}, {
			Title = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 20,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p0.name,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if p1 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p0.layoutOrder + 1
			})
		}, {
			PriceFrame = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p0.layoutOrder + 2
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = if p1 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal
				}),
				Price = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p0.displayPrice,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if p1 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p0.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				}),
				Period = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p0.period,
					TextColor3 = theme.TextDefault.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if p1 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p0.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				})
			})
		}, {
			DisclaimerText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 16),
				Text = p0.disclaimerText,
				TextColor3 = theme.TextDefault.Color,
				Font = font,
				TextXAlignment = if p1 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p0.layoutOrder + 3
			})
		})
	end)
end

local function createCompactSubscriptionTitle(p3) --[[ line: 157 ]]
	-- upvalues: reactModule (ref), imageSetLabel (ref), withStyle (ref)
	local createElement = reactModule.createElement
	local var6 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}
	local t_1 = {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 24)
		}),
		Icon = reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 96, 0, 96),
			ScaleType = Enum.ScaleType.Fit,
			AutomaticSize = Enum.AutomaticSize.X,
			Image = p3.itemIcon
		})
	}
	local var9 = true
	t_1.SubscriptionInfo = withStyle(function(p4) --[[ line: 54 ]]
		-- upvalues: reactModule (copy), p3 (ref), var9 (ref)
		local theme = p4.Theme
		local font = p4.Font.Body.Font
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p3.layoutOrder
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = if var9 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 8)
			})
		}, {
			AppName = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p3.subscriptionProviderName,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if var9 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p3.layoutOrder
			})
		}, {
			Title = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 20,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p3.name,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if var9 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p3.layoutOrder + 1
			})
		}, {
			PriceFrame = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p3.layoutOrder + 2
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = if var9 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal
				}),
				Price = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p3.displayPrice,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if var9 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p3.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				}),
				Period = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p3.period,
					TextColor3 = theme.TextDefault.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if var9 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p3.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				})
			})
		}, {
			DisclaimerText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 16),
				Text = p3.disclaimerText,
				TextColor3 = theme.TextDefault.Color,
				Font = font,
				TextXAlignment = if var9 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p3.layoutOrder + 3
			})
		})
	end)
	
	return createElement(var6, t, t_1)
end

local function createNormalSubscriptionTitle(p5) --[[ line: 182 ]]
	-- upvalues: reactModule (ref), imageSetLabel (ref), withStyle (ref)
	local createElement = reactModule.createElement
	local var10 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}
	local t_1 = {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 24)
		}),
		Icon = reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 96, 0, 96),
			ScaleType = Enum.ScaleType.Fit,
			AutomaticSize = Enum.AutomaticSize.X,
			Image = p5.itemIcon
		})
	}
	local var13 = false
	t_1.SubscriptionInfo = withStyle(function(p6) --[[ line: 54 ]]
		-- upvalues: reactModule (copy), p5 (ref), var13 (ref)
		local theme = p6.Theme
		local font = p6.Font.Body.Font
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p5.layoutOrder
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = if var13 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 8)
			})
		}, {
			AppName = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p5.subscriptionProviderName,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if var13 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p5.layoutOrder
			})
		}, {
			Title = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 20,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p5.name,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if var13 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p5.layoutOrder + 1
			})
		}, {
			PriceFrame = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p5.layoutOrder + 2
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = if var13 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal
				}),
				Price = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p5.displayPrice,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if var13 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p5.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				}),
				Period = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p5.period,
					TextColor3 = theme.TextDefault.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if var13 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p5.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				})
			})
		}, {
			DisclaimerText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 16),
				Text = p5.disclaimerText,
				TextColor3 = theme.TextDefault.Color,
				Font = font,
				TextXAlignment = if var13 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p5.layoutOrder + 3
			})
		})
	end)
	
	return createElement(var10, t, t_1)
end

function subscriptionTitle.getTitleHeight(_, p7) --[[ line: 207 ]]
	return if p7 > 216 then 216 else 96
end

function subscriptionTitle.render(p8) --[[ line: 215 ]]
	-- upvalues: createNormalSubscriptionTitle (ref), createCompactSubscriptionTitle (ref)
	return if p8.props.contentHeight > 216 then createNormalSubscriptionTitle(p8.props) else createCompactSubscriptionTitle(p8.props)
end

return subscriptionTitle