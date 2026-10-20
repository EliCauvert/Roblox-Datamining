local Parent = script:FindFirstAncestor("LandingPage").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FIntScaleBrazilContentRatingBadge: number = require(Parent.SharedFlags).FIntScaleBrazilContentRatingBadge
local BrazilBadgeDisableTextScaling = game:DefineFastFlag("BrazilBadgeDisableTextScaling", false)
local BrazilBadgeDoNotCapitalizeHeader = game:DefineFastFlag("BrazilBadgeDoNotCapitalizeHeader", false)
local BrazilBadgeUseRobotoCondensedFont = game:DefineFastFlag("BrazilBadgeUseRobotoCondensedFont", false)
local BrazilBadgeHideInappropriateAndUse16Image = game:DefineFastFlag("BrazilBadgeHideInappropriateAndUse16Image", false)
local XOffset = 2.82 * FIntScaleBrazilContentRatingBadge
local _UDim = UDim.new(0, 0.08 * FIntScaleBrazilContentRatingBadge)
local XOffset1 = 0.6 * FIntScaleBrazilContentRatingBadge
local ScaledFIntScaleBrazilContentRatingBadge = (if BrazilBadgeUseRobotoCondensedFont then 0.13 else 0.08) * FIntScaleBrazilContentRatingBadge
local _Color3 = Color3.fromRGB(0, 0, 0)
local _Color3_1 = Color3.fromRGB(255, 255, 255)
local _Font = if BrazilBadgeUseRobotoCondensedFont then Font.new("rbxasset://fonts/families/RobotoCondensed.json") else nil

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), BrazilBadgeHideInappropriateAndUse16Image (copy), BrazilBadgeDoNotCapitalizeHeader (copy), ReactModule (copy), XOffset (copy), _Color3 (copy), _UDim (copy), FIntScaleBrazilContentRatingBadge (copy), _Color3_1 (copy), ScaledFIntScaleBrazilContentRatingBadge (copy), _Font (copy), BrazilBadgeDisableTextScaling (copy), XOffset1 (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		ratingTitle = "Feature.Landing.Label.BrazilContentRatingLogoTitle",
		ratingTitleSixteen = "Feature.Landing.Label.BrazilContentRatingLogoTitleSixteen",
		violenceText = "Feature.Landing.Label.BrazilContentDescriptorViolence",
		inappropriateLanguageText = "Feature.Landing.Label.BrazilContentDescriptorInappropriateLanguage",
		usersInteractText = "Feature.Landing.Label.BrazilInteractiveElementDescriptorUsersInteract",
		inGamePurchasesText = "Feature.Landing.Label.BrazilInteractiveElementDescriptorInGamePurchases"
	})
	local RatingTitleSixteen = if BrazilBadgeHideInappropriateAndUse16Image then UseLocalizationResult.ratingTitleSixteen else UseLocalizationResult.ratingTitle
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, XOffset, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = _Color3,
		LayoutOrder = Frame.LayoutOrder
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0.02 * FIntScaleBrazilContentRatingBadge),
			PaddingRight = UDim.new(0, 0.02 * FIntScaleBrazilContentRatingBadge),
			PaddingBottom = UDim.new(0, 0.02 * FIntScaleBrazilContentRatingBadge)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		Header = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0.28 * FIntScaleBrazilContentRatingBadge),
			Text = if BrazilBadgeDoNotCapitalizeHeader then RatingTitleSixteen else string.upper(RatingTitleSixteen),
			TextColor3 = _Color3_1,
			TextSize = ScaledFIntScaleBrazilContentRatingBadge,
			FontFace = _Font,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}, {
			UITextSizeConstraint = if BrazilBadgeDisableTextScaling then ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = ScaledFIntScaleBrazilContentRatingBadge }) else nil
		}),
		Content = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, XOffset1 + 0.04 * FIntScaleBrazilContentRatingBadge),
			BackgroundColor3 = _Color3_1
		}, {
			UICorner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, 0.06 * FIntScaleBrazilContentRatingBadge)
			}),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 0.02 * FIntScaleBrazilContentRatingBadge),
				PaddingRight = UDim.new(0, 0.02 * FIntScaleBrazilContentRatingBadge),
				PaddingTop = UDim.new(0, 0.02 * FIntScaleBrazilContentRatingBadge),
				PaddingBottom = UDim.new(0, 0.02 * FIntScaleBrazilContentRatingBadge)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 0.04 * FIntScaleBrazilContentRatingBadge)
			}),
			Icon = ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, XOffset1, 0, XOffset1),
				Image = if BrazilBadgeHideInappropriateAndUse16Image then "rbxasset://textures/ui/LuaApp/graphic/Auth/classind_16.png" else "rbxasset://textures/ui/LuaApp/graphic/Auth/classind_12.png",
				ScaleType = Enum.ScaleType.Fit
			}),
			TextContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, -(XOffset1 + 0.04 * FIntScaleBrazilContentRatingBadge), 1, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				ViolenceText = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 0.16 * FIntScaleBrazilContentRatingBadge),
					Text = UseLocalizationResult.violenceText,
					TextColor3 = _Color3,
					TextSize = ScaledFIntScaleBrazilContentRatingBadge,
					FontFace = _Font,
					TextXAlignment = Enum.TextXAlignment.Center
				}, {
					UITextSizeConstraint = if BrazilBadgeDisableTextScaling then ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = ScaledFIntScaleBrazilContentRatingBadge }) else nil
				}),
				InappropriateLanguageText = if BrazilBadgeHideInappropriateAndUse16Image then nil else ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 0.16 * FIntScaleBrazilContentRatingBadge),
					Text = UseLocalizationResult.inappropriateLanguageText,
					TextColor3 = _Color3,
					TextSize = ScaledFIntScaleBrazilContentRatingBadge,
					FontFace = _Font,
					TextXAlignment = Enum.TextXAlignment.Center
				}, {
					UITextSizeConstraint = if BrazilBadgeDisableTextScaling then ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = ScaledFIntScaleBrazilContentRatingBadge }) else nil
				})
			})
		}),
		Footer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, 0.36 * FIntScaleBrazilContentRatingBadge)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			UsersInteractText = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0.14 * FIntScaleBrazilContentRatingBadge),
				Text = UseLocalizationResult.usersInteractText,
				TextColor3 = _Color3_1,
				TextSize = ScaledFIntScaleBrazilContentRatingBadge,
				FontFace = _Font,
				TextXAlignment = Enum.TextXAlignment.Center
			}, {
				UITextSizeConstraint = if BrazilBadgeDisableTextScaling then ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = ScaledFIntScaleBrazilContentRatingBadge }) else nil
			}),
			InGamePurchasesText = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 0.14 * FIntScaleBrazilContentRatingBadge),
				Text = UseLocalizationResult.inGamePurchasesText,
				TextColor3 = _Color3_1,
				TextSize = ScaledFIntScaleBrazilContentRatingBadge,
				FontFace = _Font,
				TextXAlignment = Enum.TextXAlignment.Center
			}, {
				UITextSizeConstraint = if BrazilBadgeDisableTextScaling then ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = ScaledFIntScaleBrazilContentRatingBadge }) else nil
			})
		})
	})
end