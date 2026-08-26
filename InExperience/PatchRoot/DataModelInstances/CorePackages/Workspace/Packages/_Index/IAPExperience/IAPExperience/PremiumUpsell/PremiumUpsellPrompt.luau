local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local fitFrameVertical = require(parent_2.RoactFitComponents).FitFrameVertical
local UIBloxModule = require(parent_2.UIBlox)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local getPartialPageModalMiddleContentWidth = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Style.withStyle
local multiTextLocalizerModule = require(parent_1.Locale.MultiTextLocalizer)
local bulletPointModule = require(parent.BulletPoint)
local name = roactModule.Component:extend(script.Name)

function name.init(p1)
	p1.isCondensed = false
	p1.contentSize = Vector2.new(0, 0)
	p1.state = {
		padding = UDim.new(0, 24),
		iconSize = UDim2.new(1, 0, 0, 80)
	}
	
	function p0.updateContentSizes(p2, p3)
		-- upvalues: p1 (ref)
		if p3.X < 200 or p3.Y > 1000 then return end
		local var1
		local contentSize = p1.contentSize
		p1.contentSize = p3
		
		if p3.X == 0 and p3.Y == 0 then return end
		if p2.X == 0 and p2.Y == 0 then return end
		if p3 == contentSize and p2 == p1.props.screenSize then return end
		if p1.isCondensed then
			var1 = p2.Y < p3.Y + 120 + 80 - 48 + 24
			var1 = nil
		else
			var1 = p2.Y < p3.Y + 120
		end
		p1.isCondensed = var1
		p1:setState({
			padding = UDim.new(0, if var1 then 12 else 24),
			iconSize = UDim2.new(1, 0, 0, if var1 then 48 else 80)
		})
	end
end

function name.willUpdate(p1, p2)
	if p1.props.screenSize ~= p2.screenSize then
		p1.updateContentSizes(p2.screenSize, p1.contentSize)
	end
end

function name.render(p1)
	-- upvalues: roactModule (ref), multiTextLocalizerModule (ref)
	local props = p1.props
	
	return roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			titleLocalizedText = {
				key = "IAPExperience.SubscriptionPurchasePrompt.Label.GetSubscription"
			},
			monthlyLocalizedText = { key = "IAPExperience.PremiumUpsell.Action.Subscribe" },
			descLocalizedText = {
				key = "IAPExperience.PremiumUpsell.Label.PremiumBenefitListDesc"
			},
			bulletPoint1Text = {
				key = "IAPExperience.PremiumUpsell.Label.RobuxPerMonth",
				params = { robux = utf8.char(57346) .. tostring(props.robuxAmount) }
			},
			bulletPoint2Text = {
				key = "IAPExperience.PremiumUpsell.Label.PremiumOnlyBenefits"
			},
			bulletPoint3Text = if props.isCatalog then {
				key = "IAPExperience.PremiumUpsell.Label.AvatarShopBenefits"
			} else { key = "IAPExperience.PremiumUpsell.Body.RobuxDiscount" },
			disclosure = {
				key = "IAPExperience.PremiumUpsell.Label.Disclosure",
				params = {
					currencySymbol = props.currencySymbol,
					price = tostring(props.robuxPrice)
				}
			},
			shortDisclosure = {
				key = "IAPExperience.PremiumUpsell.Label.ShortDisclosure"
			},
			priceLocalizedText = {
				key = "IAPExperience.PremiumUpsell.Label.PremiumPrice",
				params = {
					currencySymbol = props.currencySymbol,
					price = tostring(props.robuxPrice)
				}
			},
			headerLocalizedText = { key = "IAPExperience.PremiumUpsell.Label.RobloxPremium" },
			policyLocalizedText = { key = "IAPExperience.PremiumUpsell.Label.PremiumPolicy" }
		},
		render = function(p2)
			-- upvalues: p1 (ref)
			return p1:renderPrompt(p2)
		end
	})
end

function name.renderCondensedPremiumInfo(_, b)
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref), images (ref)
	return withStyle(function(p1)
		-- upvalues: roactModule (copy), imageSetLabel (copy), images (copy), b (ref)
		local theme = p1.Theme
		local font = p1.Font
		
		return roactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12)
			}),
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			IconContainer = roactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 96, 0, 96),
				AutomaticSize = Enum.AutomaticSize.Y,
				AnchorPoint = Vector2.new(0, 0),
				Position = UDim2.new(0, 0, 0, 0)
			}, {
				Padding = roactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 12) }),
				Icon = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					ScaleType = Enum.ScaleType.Fit,
					Image = images["icons/graphic/premium_large"]
				})
			}),
			PremiumInfoContainer = roactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -80, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Padding = roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 6) }),
				ListLayout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 12)
				}),
				PremiumHeader = roactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = true,
					RichText = true,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = font.Header2.Font,
					Text = b.headerLocalizedText,
					TextSize = font.BaseSize * font.Header2.RelativeSize,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextDefault.Transparency
				}),
				CostPerMonth = roactModule.createElement("TextLabel", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					TextWrapped = true,
					RichText = true,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = font.Body.Font,
					Text = b.priceLocalizedText,
					TextSize = font.BaseSize,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextDefault.Transparency
				}),
				RenewAndCancelText = roactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = font.Body.Font,
					Text = b.policyLocalizedText,
					TextSize = font.BaseSize,
					TextColor3 = theme.TextDefault.Color,
					TextTransparency = theme.TextDefault.Transparency
				})
			})
		})
	end)
end

function name.renderBulletInfo(p1, p2)
	-- upvalues: withStyle (ref), getPartialPageModalMiddleContentWidth (ref), roactModule (ref), fitFrameVertical (ref), bulletPointModule (ref)
	return withStyle(function(p3)
		-- upvalues: getPartialPageModalMiddleContentWidth (copy), p1 (ref), roactModule (copy), p2 (ref), fitFrameVertical (copy), bulletPointModule (copy)
		local theme = p3.Theme
		local font = p3.Font
		local var1 = getPartialPageModalMiddleContentWidth(p1.props.screenSize.X)
		
		return roactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Padding = roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) }),
			ListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12)
			}),
			BulletListText = roactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var1, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = font.Body.Font,
				Text = p2.descLocalizedText,
				TextSize = font.BaseSize * font.Body.RelativeSize,
				TextColor3 = theme.TextDefault.Color,
				TextTransparency = theme.TextDefault.Transparency
			}),
			BulletList = roactModule.createElement(fitFrameVertical, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 12)
			}, {
				BulletText1 = roactModule.createElement(bulletPointModule, {
					layoutOrder = 1,
					text = p2.bulletPoint1Text,
					width = var1
				}),
				BulletText2 = roactModule.createElement(bulletPointModule, {
					layoutOrder = 2,
					text = p2.bulletPoint2Text,
					width = var1
				}),
				BulletText3 = roactModule.createElement(bulletPointModule, {
					layoutOrder = 3,
					text = p2.bulletPoint3Text,
					width = var1
				})
			})
		})
	end)
end

function name.renderDisclosure(_, p1)
	-- upvalues: withStyle (ref), roactModule (ref)
	return withStyle(function(p2)
		-- upvalues: roactModule (copy), p1 (ref)
		local theme = p2.Theme
		local font = p2.Font
		
		return roactModule.createElement("Frame", {
			LayoutOrder = 5,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Padding = roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) }),
			Disclosure = roactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				RichText = true,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = font.Body.Font,
				Text = p1.shortDisclosure,
				TextSize = font.BaseSize * font.Body.RelativeSize,
				TextColor3 = theme.TextDefault.Color,
				TextTransparency = theme.TextDefault.Transparency
			})
		})
	end)
end

function name.renderLandscapePrompt(p1, p2)
	-- upvalues: withStyle (ref), roactModule (ref), partialPageModal (ref), buttonType (ref)
	local props = p1.props
	
	return withStyle(function(_)
		-- upvalues: roactModule (copy), partialPageModal (copy), p2 (ref), props (ref), buttonType (copy), p1 (ref)
		return roactModule.createElement(partialPageModal, {
			title = p2.titleLocalizedText,
			screenSize = props.screenSize,
			buttonStackProps = {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = props.purchasePremiumActivated,
							text = p2.monthlyLocalizedText,
							inputIcon = props.acceptControllerIcon
						}
					}
				}
			},
			onCloseClicked = props.cancelPurchaseActivated
		}, {
			roactModule.createElement("ScrollingFrame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				ScrollingEnabled = true,
				ScrollBarThickness = 5,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, props.screenSize.Y / 2),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.new(1, 0, 0, math.min(props.screenSize.Y / 2 + 96 + 12, 450))
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				IconAndPremiumInfoContainer = p1:renderCondensedPremiumInfo(p2),
				BulletList = p1:renderBulletInfo(p2),
				Disclosure = p1:renderDisclosure(p2)
			})
		})
	end)
end

function name.renderPortraitPrompt(p1, p2)
	-- upvalues: withStyle (ref), roactModule (ref), partialPageModal (ref), buttonType (ref)
	local props = p1.props
	
	return withStyle(function(_)
		-- upvalues: roactModule (copy), partialPageModal (copy), p2 (ref), props (ref), buttonType (copy), p1 (ref)
		return roactModule.createElement(partialPageModal, {
			title = p2.titleLocalizedText,
			screenSize = props.screenSize,
			buttonStackProps = {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = props.purchasePremiumActivated,
							text = p2.monthlyLocalizedText,
							inputIcon = props.acceptControllerIcon
						}
					}
				}
			},
			onCloseClicked = props.cancelPurchaseActivated
		}, {
			roactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				IconAndPremiumInfoContainer = p1:renderCondensedPremiumInfo(p2),
				BulletList = p1:renderBulletInfo(p2),
				Disclosure = p1:renderDisclosure(p2)
			})
		})
	end)
end

function name.renderUpdatedPrompt(p1, p2)
	-- upvalues: withStyle (ref), getPartialPageModalMiddleContentWidth (ref), roactModule (ref), partialPageModal (ref), buttonType (ref), fitFrameVertical (ref), imageSetLabel (ref), images (ref), bulletPointModule (ref)
	local props = p1.props
	
	return withStyle(function(p3)
		-- upvalues: getPartialPageModalMiddleContentWidth (copy), p1 (ref), roactModule (copy), partialPageModal (copy), p2 (ref), props (ref), buttonType (copy), fitFrameVertical (copy), imageSetLabel (copy), images (copy), bulletPointModule (copy)
		local theme = p3.Theme
		local font = p3.Font
		local var1 = getPartialPageModalMiddleContentWidth(p1.props.screenSize.X)
		
		return roactModule.createElement(partialPageModal, {
			title = p2.titleLocalizedText,
			screenSize = props.screenSize,
			buttonStackProps = {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = props.purchasePremiumActivated,
							text = p2.monthlyLocalizedText,
							inputIcon = props.acceptControllerIcon
						}
					}
				}
			},
			onCloseClicked = props.cancelPurchaseActivated
		}, {
			roactModule.createElement(fitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 12),
				margin = { top = 12, bottom = 12 },
				[roactModule.Change.AbsoluteSize] = function(p4)
					-- upvalues: p1 (copy)
					if p1.contentSize.X ~= p4.AbsoluteSize.X or p1.contentSize.Y ~= p4.AbsoluteSize.Y then
						p1.updateContentSizes(p1.props.screenSize, p4.AbsoluteSize)
					end
				end
			}, {
				Icon = roactModule.createElement(imageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = p1.state.iconSize,
					ScaleType = Enum.ScaleType.Fit,
					Image = images["icons/graphic/premium_large"]
				}),
				PremiumInfoContainer = roactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) }),
					ListLayout = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 12)
					}),
					PremiumHeader = roactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						RichText = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Center,
						Font = font.Header2.Font,
						Text = p2.headerLocalizedText,
						TextSize = font.BaseSize * font.Header2.RelativeSize,
						TextColor3 = theme.TextEmphasis.Color,
						TextTransparency = theme.TextDefault.Transparency
					}),
					CostPerMonth = roactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						RichText = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Center,
						Font = font.Body.Font,
						Text = p2.priceLocalizedText,
						TextSize = font.BaseSize,
						TextColor3 = theme.TextEmphasis.Color,
						TextTransparency = theme.TextDefault.Transparency
					}),
					CancelText = roactModule.createElement("TextLabel", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Center,
						Font = font.Body.Font,
						Text = p2.policyLocalizedText,
						TextSize = font.BaseSize,
						TextColor3 = theme.TextDefault.Color,
						TextTransparency = theme.TextDefault.Transparency
					})
				}),
				BulletListText = roactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, var1, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = font.Body.Font,
					Text = p2.descLocalizedText,
					TextSize = font.BaseSize * font.Body.RelativeSize,
					TextColor3 = theme.TextDefault.Color,
					TextTransparency = theme.TextDefault.Transparency
				}),
				BulletList = roactModule.createElement(fitFrameVertical, {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					contentPadding = UDim.new(0, 12)
				}, {
					BulletText1 = roactModule.createElement(bulletPointModule, {
						layoutOrder = 1,
						text = p2.bulletPoint1Text,
						width = var1
					}),
					BulletText2 = roactModule.createElement(bulletPointModule, {
						layoutOrder = 2,
						text = p2.bulletPoint2Text,
						width = var1
					}),
					BulletText3 = roactModule.createElement(bulletPointModule, {
						layoutOrder = 3,
						text = p2.bulletPoint3Text,
						width = var1
					})
				}),
				Disclosure = p1:renderDisclosure(p2)
			})
		})
	end)
end

function name.renderPrompt(p1, p2)
	local props = p1.props
	
	return if props.screenSize.Y < 450 then p1:renderLandscapePrompt(p2) elseif props.screenSize.X < 450 then p1:renderPortraitPrompt(p2) else p1:renderUpdatedPrompt(p2)
end

return name