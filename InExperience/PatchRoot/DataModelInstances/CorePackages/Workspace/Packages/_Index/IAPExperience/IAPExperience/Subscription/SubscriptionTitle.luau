local Parent = script.Parent.Parent.Parent
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ReactModule = require(Parent.React)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local TModule = require(Parent.t)
local SubscriptionTitle = require(Parent.Roact).PureComponent:extend("SubscriptionTitle")
SubscriptionTitle.validateProps = TModule.strictInterface({
	name = TModule.string,
	displayPrice = TModule.string,
	subscriptionProviderName = TModule.string,
	period = TModule.string,
	disclaimerText = TModule.string,
	layoutOrder = TModule.number,
	contentHeight = TModule.number,
	itemIcon = TModule.any
})

local function _(p1, p2)
	-- upvalues: WithStyleFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: ReactModule (upval), p1 (copy), p2 (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		local Theme = p3.Theme
		local BodyFont = p3.Font.Body.Font
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.layoutOrder
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = p2 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 8)
			})
		}, {
			AppName = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p1.subscriptionProviderName,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				Font = if FoundationFontFaceMigration then nil else BodyFont,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font) else nil,
				TextXAlignment = p2 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder
			})
		}, {
			Title = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 20,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 20),
				Text = p1.name,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				Font = if FoundationFontFaceMigration then nil else BodyFont,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font) else nil,
				TextXAlignment = p2 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder + 1
			})
		}, {
			PriceFrame = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p1.layoutOrder + 2
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = p2 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal
				}),
				Price = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p1.displayPrice,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextDefault.Transparency,
					Font = if FoundationFontFaceMigration then nil else BodyFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font) else nil,
					TextXAlignment = p2 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
					LayoutOrder = p1.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				}),
				Period = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					RichText = true,
					TextWrapped = true,
					Size = UDim2.new(0, 0, 0, 16),
					Text = p1.period,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.Transparency,
					Font = if FoundationFontFaceMigration then nil else BodyFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font) else nil,
					TextXAlignment = p2 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
					LayoutOrder = p1.layoutOrder + 1,
					AutomaticSize = Enum.AutomaticSize.X
				})
			})
		}, {
			DisclaimerText = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 16),
				Text = p1.disclaimerText,
				TextColor3 = Theme.TextDefault.Color,
				Font = if FoundationFontFaceMigration then nil else BodyFont,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font) else nil,
				TextXAlignment = p2 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
				LayoutOrder = p1.layoutOrder + 3
			})
		})
	end)
end

local function createCompactSubscriptionTitle(Props)
	-- upvalues: ReactModule (copy), ImageSetLabel (copy), WithStyleFunction (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local v1 = true
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 24)
		}),
		Icon = ReactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 96, 0, 96),
			ScaleType = Enum.ScaleType.Fit,
			AutomaticSize = Enum.AutomaticSize.X,
			Image = Props.itemIcon
		}),
		SubscriptionInfo = WithStyleFunction(function(p1)
			-- upvalues: ReactModule (upval), Props (copy), v1 (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
			local Theme = p1.Theme
			local BodyFont = p1.Font.Body.Font
			
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = Props.layoutOrder
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = v1 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 8)
				})
			}, {
				AppName = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 20),
					Text = Props.subscriptionProviderName,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					Font = if FoundationFontFaceMigration then nil else BodyFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.BodyLarge.Font) else nil,
					TextXAlignment = v1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
					LayoutOrder = Props.layoutOrder
				})
			}, {
				Title = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 20,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 20),
					Text = Props.name,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					Font = if FoundationFontFaceMigration then nil else BodyFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.BodyLarge.Font) else nil,
					TextXAlignment = v1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
					LayoutOrder = Props.layoutOrder + 1
				})
			}, {
				PriceFrame = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(255, 0, 0),
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = Props.layoutOrder + 2
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = v1 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal
					}),
					Price = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextSize = 16,
						RichText = true,
						TextWrapped = true,
						Size = UDim2.new(0, 0, 0, 16),
						Text = Props.displayPrice,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextDefault.Transparency,
						Font = if FoundationFontFaceMigration then nil else BodyFont,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.BodyLarge.Font) else nil,
						TextXAlignment = v1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
						LayoutOrder = Props.layoutOrder + 1,
						AutomaticSize = Enum.AutomaticSize.X
					}),
					Period = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextSize = 16,
						RichText = true,
						TextWrapped = true,
						Size = UDim2.new(0, 0, 0, 16),
						Text = Props.period,
						TextColor3 = Theme.TextDefault.Color,
						TextTransparency = Theme.TextDefault.Transparency,
						Font = if FoundationFontFaceMigration then nil else BodyFont,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.BodyLarge.Font) else nil,
						TextXAlignment = v1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
						LayoutOrder = Props.layoutOrder + 1,
						AutomaticSize = Enum.AutomaticSize.X
					})
				})
			}, {
				DisclaimerText = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 16),
					Text = Props.disclaimerText,
					TextColor3 = Theme.TextDefault.Color,
					Font = if FoundationFontFaceMigration then nil else BodyFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.BodyLarge.Font) else nil,
					TextXAlignment = v1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
					LayoutOrder = Props.layoutOrder + 3
				})
			})
		end)
	})
end

local function createNormalSubscriptionTitle(Props)
	-- upvalues: ReactModule (copy), ImageSetLabel (copy), WithStyleFunction (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local v1 = false
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 24)
		}),
		Icon = ReactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 96, 0, 96),
			ScaleType = Enum.ScaleType.Fit,
			AutomaticSize = Enum.AutomaticSize.X,
			Image = Props.itemIcon
		}),
		SubscriptionInfo = WithStyleFunction(function(p1)
			-- upvalues: ReactModule (upval), Props (copy), v1 (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
			local Theme = p1.Theme
			local BodyFont = p1.Font.Body.Font
			
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = Props.layoutOrder
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = v1 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 8)
				})
			}, {
				AppName = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 20),
					Text = Props.subscriptionProviderName,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					Font = if FoundationFontFaceMigration then nil else BodyFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.BodyLarge.Font) else nil,
					TextXAlignment = v1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
					LayoutOrder = Props.layoutOrder
				})
			}, {
				Title = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 20,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 20),
					Text = Props.name,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					Font = if FoundationFontFaceMigration then nil else BodyFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.BodyLarge.Font) else nil,
					TextXAlignment = v1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
					LayoutOrder = Props.layoutOrder + 1
				})
			}, {
				PriceFrame = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(255, 0, 0),
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = Props.layoutOrder + 2
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = v1 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal
					}),
					Price = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextSize = 16,
						RichText = true,
						TextWrapped = true,
						Size = UDim2.new(0, 0, 0, 16),
						Text = Props.displayPrice,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextDefault.Transparency,
						Font = if FoundationFontFaceMigration then nil else BodyFont,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.BodyLarge.Font) else nil,
						TextXAlignment = v1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
						LayoutOrder = Props.layoutOrder + 1,
						AutomaticSize = Enum.AutomaticSize.X
					}),
					Period = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextSize = 16,
						RichText = true,
						TextWrapped = true,
						Size = UDim2.new(0, 0, 0, 16),
						Text = Props.period,
						TextColor3 = Theme.TextDefault.Color,
						TextTransparency = Theme.TextDefault.Transparency,
						Font = if FoundationFontFaceMigration then nil else BodyFont,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.BodyLarge.Font) else nil,
						TextXAlignment = v1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
						LayoutOrder = Props.layoutOrder + 1,
						AutomaticSize = Enum.AutomaticSize.X
					})
				})
			}, {
				DisclaimerText = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 16,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 16),
					Text = Props.disclaimerText,
					TextColor3 = Theme.TextDefault.Color,
					Font = if FoundationFontFaceMigration then nil else BodyFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.BodyLarge.Font) else nil,
					TextXAlignment = v1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
					LayoutOrder = Props.layoutOrder + 3
				})
			})
		end)
	})
end

function SubscriptionTitle:getTitleHeight(p1: number): number
	return if p1 > 216 then 216 else 96
end

function SubscriptionTitle.render(p1)
	-- upvalues: createNormalSubscriptionTitle (copy), createCompactSubscriptionTitle (copy)
	return if p1.props.contentHeight > 216 then createNormalSubscriptionTitle(p1.props) else createCompactSubscriptionTitle(p1.props)
end

return SubscriptionTitle