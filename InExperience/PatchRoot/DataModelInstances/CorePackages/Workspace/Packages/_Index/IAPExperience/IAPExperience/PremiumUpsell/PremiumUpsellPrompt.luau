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

function name.init(p0) --[[ line: 47 ]]
	p0.isCondensed = false
	p0.contentSize = Vector2.new(0, 0)
	p0.state = {
		padding = UDim.new(0, 24),
		iconSize = UDim2.new(1, 0, 0, 80)
	}
	
	function p0.updateContentSizes(p1, p2) --[[ line: 56 ]]
		-- upvalues: p0 (ref)
		if p2.X < 200 or p2.Y > 1000 then return end
		local var5
		local contentSize = p0.contentSize
		p0.contentSize = p2
		
		if p2.X == 0 and p2.Y == 0 then return end
		if p1.X == 0 and p1.Y == 0 then return end
		if p2 == contentSize and p1 == p0.props.screenSize then return end
		if p0.isCondensed then
			var5 = p1.Y < p2.Y + 120 + 80 - 48 + 24
			var5 = nil
		else
			var5 = p1.Y < p2.Y + 120
		end
		p0.isCondensed = var5
		p0:setState({
			padding = UDim.new(0, if var5 then 12 else 24),
			iconSize = UDim2.new(1, 0, 0, if var5 then 48 else 80)
		})
	end
end

function name.willUpdate(p3, p4) --[[ line: 98 ]]
	if p3.props.screenSize ~= p4.screenSize then
		p3.updateContentSizes(p4.screenSize, p3.contentSize)
	end
end

function name.render(p5) --[[ line: 104 ]]
	-- upvalues: roactModule (ref), multiTextLocalizerModule (ref)
	local props = p5.props
	
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
		render = function(p6) --[[ line: 158 ]]
			-- upvalues: p5 (ref)
			return p5:renderPrompt(p6)
		end
	})
end

function name.renderCondensedPremiumInfo(_, b) --[[ line: 164 ]]
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref), images (ref)
	return withStyle(function(p7) --[[ line: 165 ]]
		-- upvalues: roactModule (copy), imageSetLabel (copy), images (copy), b (ref)
		local theme = p7.Theme
		local font = p7.Font
		
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

function name.renderBulletInfo(p8, p9) --[[ line: 261 ]]
	-- upvalues: withStyle (ref), getPartialPageModalMiddleContentWidth (ref), roactModule (ref), fitFrameVertical (ref), bulletPointModule (ref)
	return withStyle(function(p10) --[[ line: 262 ]]
		-- upvalues: getPartialPageModalMiddleContentWidth (copy), p8 (ref), roactModule (copy), p9 (ref), fitFrameVertical (copy), bulletPointModule (copy)
		local theme = p10.Theme
		local font = p10.Font
		local var6 = getPartialPageModalMiddleContentWidth(p8.props.screenSize.X)
		
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
				Size = UDim2.new(0, var6, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = font.Body.Font,
				Text = p9.descLocalizedText,
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
					text = p9.bulletPoint1Text,
					width = var6
				}),
				BulletText2 = roactModule.createElement(bulletPointModule, {
					layoutOrder = 2,
					text = p9.bulletPoint2Text,
					width = var6
				}),
				BulletText3 = roactModule.createElement(bulletPointModule, {
					layoutOrder = 3,
					text = p9.bulletPoint3Text,
					width = var6
				})
			})
		})
	end)
end

function name.renderDisclosure(_, p11) --[[ line: 321 ]]
	-- upvalues: withStyle (ref), roactModule (ref)
	return withStyle(function(p12) --[[ line: 322 ]]
		-- upvalues: roactModule (copy), p11 (ref)
		local theme = p12.Theme
		local font = p12.Font
		
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
				Text = p11.shortDisclosure,
				TextSize = font.BaseSize * font.Body.RelativeSize,
				TextColor3 = theme.TextDefault.Color,
				TextTransparency = theme.TextDefault.Transparency
			})
		})
	end)
end

function name.renderLandscapePrompt(p13, p14) --[[ line: 352 ]]
	-- upvalues: withStyle (ref), roactModule (ref), partialPageModal (ref), buttonType (ref)
	local props = p13.props
	
	return withStyle(function(_) --[[ line: 355 ]]
		-- upvalues: roactModule (copy), partialPageModal (copy), p14 (ref), props (ref), buttonType (copy), p13 (ref)
		return roactModule.createElement(partialPageModal, {
			title = p14.titleLocalizedText,
			screenSize = props.screenSize,
			buttonStackProps = {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = props.purchasePremiumActivated,
							text = p14.monthlyLocalizedText,
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
				IconAndPremiumInfoContainer = p13:renderCondensedPremiumInfo(p14),
				BulletList = p13:renderBulletInfo(p14),
				Disclosure = p13:renderDisclosure(p14)
			})
		})
	end)
end

function name.renderPortraitPrompt(p15, p16) --[[ line: 403 ]]
	-- upvalues: withStyle (ref), roactModule (ref), partialPageModal (ref), buttonType (ref)
	local props = p15.props
	
	return withStyle(function(_) --[[ line: 406 ]]
		-- upvalues: roactModule (copy), partialPageModal (copy), p16 (ref), props (ref), buttonType (copy), p15 (ref)
		return roactModule.createElement(partialPageModal, {
			title = p16.titleLocalizedText,
			screenSize = props.screenSize,
			buttonStackProps = {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = props.purchasePremiumActivated,
							text = p16.monthlyLocalizedText,
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
				IconAndPremiumInfoContainer = p15:renderCondensedPremiumInfo(p16),
				BulletList = p15:renderBulletInfo(p16),
				Disclosure = p15:renderDisclosure(p16)
			})
		})
	end)
end

function name.renderUpdatedPrompt(p17, p18) --[[ line: 443 ]]
	-- upvalues: withStyle (ref), getPartialPageModalMiddleContentWidth (ref), roactModule (ref), partialPageModal (ref), buttonType (ref), fitFrameVertical (ref), imageSetLabel (ref), images (ref), bulletPointModule (ref)
	local props = p17.props
	
	return withStyle(function(p19) --[[ line: 446 ]]
		-- upvalues: getPartialPageModalMiddleContentWidth (copy), p17 (ref), roactModule (copy), partialPageModal (copy), p18 (ref), props (ref), buttonType (copy), fitFrameVertical (copy), imageSetLabel (copy), images (copy), bulletPointModule (copy)
		local theme = p19.Theme
		local font = p19.Font
		local var7 = getPartialPageModalMiddleContentWidth(p17.props.screenSize.X)
		
		return roactModule.createElement(partialPageModal, {
			title = p18.titleLocalizedText,
			screenSize = props.screenSize,
			buttonStackProps = {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = props.purchasePremiumActivated,
							text = p18.monthlyLocalizedText,
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
				[roactModule.Change.AbsoluteSize] = function(p20) --[[ line: 479 ]]
					-- upvalues: p17 (copy)
					if p17.contentSize.X ~= p20.AbsoluteSize.X or p17.contentSize.Y ~= p20.AbsoluteSize.Y then
						p17.updateContentSizes(p17.props.screenSize, p20.AbsoluteSize)
					end
				end
			}, {
				Icon = roactModule.createElement(imageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = p17.state.iconSize,
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
						Text = p18.headerLocalizedText,
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
						Text = p18.priceLocalizedText,
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
						Text = p18.policyLocalizedText,
						TextSize = font.BaseSize,
						TextColor3 = theme.TextDefault.Color,
						TextTransparency = theme.TextDefault.Transparency
					})
				}),
				BulletListText = roactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, var7, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = font.Body.Font,
					Text = p18.descLocalizedText,
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
						text = p18.bulletPoint1Text,
						width = var7
					}),
					BulletText2 = roactModule.createElement(bulletPointModule, {
						layoutOrder = 2,
						text = p18.bulletPoint2Text,
						width = var7
					}),
					BulletText3 = roactModule.createElement(bulletPointModule, {
						layoutOrder = 3,
						text = p18.bulletPoint3Text,
						width = var7
					})
				}),
				Disclosure = p17:renderDisclosure(p18)
			})
		})
	end)
end

function name.renderPrompt(p21, p22) --[[ line: 585 ]]
	local props = p21.props
	
	return if props.screenSize.Y < 450 then p21:renderLandscapePrompt(p22) elseif props.screenSize.X < 450 then p21:renderPortraitPrompt(p22) else p21:renderUpdatedPrompt(p22)
end

return name