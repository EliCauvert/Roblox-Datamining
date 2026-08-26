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

local function _(p1, p2)
	-- upvalues: withStyle (ref), reactModule (ref)
	return withStyle(function(p3)
		-- upvalues: reactModule (copy), p1 (ref), p2 (ref)
		local theme = p3.Theme
		local font = p3.Font.Body.Font
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.layoutOrder
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = if p2 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 8)
			})
		}, {
			AppName = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p1.subscriptionProviderName,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if p2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder
			})
		}, {
			Title = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 20,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p1.name,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if p2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder + 1
			})
		}, {
			PriceFrame = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p1.layoutOrder + 2
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = if p2 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal
				}),
				Price = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p1.displayPrice,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if p2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p1.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				}),
				Period = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p1.period,
					TextColor3 = theme.TextDefault.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if p2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p1.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				})
			})
		}, {
			DisclaimerText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 16),
				Text = p1.disclaimerText,
				TextColor3 = theme.TextDefault.Color,
				Font = font,
				TextXAlignment = if p2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder + 3
			})
		})
	end)
end

local function createCompactSubscriptionTitle(p1)
	-- upvalues: reactModule (ref), imageSetLabel (ref), withStyle (ref)
	local createElement = reactModule.createElement
	local var1 = "Frame"
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
			Image = p1.itemIcon
		})
	}
	local var2 = true
	t_1.SubscriptionInfo = withStyle(function(p2)
		-- upvalues: reactModule (copy), p1 (ref), var2 (ref)
		local theme = p2.Theme
		local font = p2.Font.Body.Font
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.layoutOrder
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = if var2 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 8)
			})
		}, {
			AppName = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p1.subscriptionProviderName,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if var2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder
			})
		}, {
			Title = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 20,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p1.name,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if var2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder + 1
			})
		}, {
			PriceFrame = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p1.layoutOrder + 2
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = if var2 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal
				}),
				Price = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p1.displayPrice,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if var2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p1.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				}),
				Period = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p1.period,
					TextColor3 = theme.TextDefault.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if var2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p1.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				})
			})
		}, {
			DisclaimerText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 16),
				Text = p1.disclaimerText,
				TextColor3 = theme.TextDefault.Color,
				Font = font,
				TextXAlignment = if var2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder + 3
			})
		})
	end)
	
	return createElement(var1, t, t_1)
end

local function createNormalSubscriptionTitle(p1)
	-- upvalues: reactModule (ref), imageSetLabel (ref), withStyle (ref)
	local createElement = reactModule.createElement
	local var1 = "Frame"
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
			Image = p1.itemIcon
		})
	}
	local var2 = false
	t_1.SubscriptionInfo = withStyle(function(p2)
		-- upvalues: reactModule (copy), p1 (ref), var2 (ref)
		local theme = p2.Theme
		local font = p2.Font.Body.Font
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.layoutOrder
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = if var2 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 8)
			})
		}, {
			AppName = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p1.subscriptionProviderName,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if var2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder
			})
		}, {
			Title = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 20,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p1.name,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font,
				TextXAlignment = if var2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder + 1
			})
		}, {
			PriceFrame = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p1.layoutOrder + 2
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = if var2 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal
				}),
				Price = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p1.displayPrice,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if var2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p1.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				}),
				Period = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p1.period,
					TextColor3 = theme.TextDefault.Color,
					TextTransparency = theme.TextDefault.Transparency,
					Font = font,
					TextXAlignment = if var2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
					LayoutOrder = p1.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				})
			})
		}, {
			DisclaimerText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 16),
				Text = p1.disclaimerText,
				TextColor3 = theme.TextDefault.Color,
				Font = font,
				TextXAlignment = if var2 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder + 3
			})
		})
	end)
	
	return createElement(var1, t, t_1)
end

function subscriptionTitle.getTitleHeight(_, p1)
	return if p1 > 216 then 216 else 96
end

function subscriptionTitle.render(p1)
	-- upvalues: createNormalSubscriptionTitle (ref), createCompactSubscriptionTitle (ref)
	return if p1.props.contentHeight > 216 then createNormalSubscriptionTitle(p1.props) else createCompactSubscriptionTitle(p1.props)
end

return subscriptionTitle