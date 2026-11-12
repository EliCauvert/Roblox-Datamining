local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local FitFrameVertical = require(Parent2.RoactFitComponents).FitFrameVertical
local UIBloxModule = require(Parent2.UIBlox)
local FoundationModule = require(Parent2.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local GetPartialPageModalMiddleContentWidthFunction = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local MultiTextLocalizerModule = require(Parent1.Locale.MultiTextLocalizer)
local BulletPointModule = require(Parent.BulletPoint)
local ExtendResult = RoactModule.Component:extend(script.Name)

function ExtendResult.init(p1)
	p1.isCondensed = false
	p1.contentSize = Vector2.new(0, 0)
	p1.state = {
		padding = UDim.new(0, 24),
		iconSize = UDim2.new(1, 0, 0, 80)
	}
	
	function p1.updateContentSizes(ScreenSize, ContentSize)
		-- upvalues: p1 (copy)
		if ContentSize.X < 200 or ContentSize.Y > 1000 then return end
		local ContentSize1 = p1.contentSize
		p1.contentSize = ContentSize
		
		if ContentSize.X == 0 and ContentSize.Y == 0 then return end
		if ScreenSize.X == 0 and ScreenSize.Y == 0 then return end
		if ContentSize ~= ContentSize1 or ScreenSize ~= p1.props.screenSize then
			local IsYBelow: boolean = if p1.isCondensed then ScreenSize.Y < ContentSize.Y + 120 + 80 - 48 + 24 else ScreenSize.Y < ContentSize.Y + 120
			p1.isCondensed = IsYBelow
			p1:setState({
				padding = UDim.new(0, if IsYBelow then 12 else 24),
				iconSize = UDim2.new(1, 0, 0, if IsYBelow then 48 else 80)
			})
			
			return
		end
	end
end

function ExtendResult.willUpdate(p1, p2)
	if p1.props.screenSize ~= p2.screenSize then
		p1.updateContentSizes(p2.screenSize, p1.contentSize)
	end
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), MultiTextLocalizerModule (copy)
	local Props = p1.props
	
	return RoactModule.createElement(MultiTextLocalizerModule, {
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
				params = { robux = utf8.char(57346) .. tostring(Props.robuxAmount) }
			},
			bulletPoint2Text = {
				key = "IAPExperience.PremiumUpsell.Label.PremiumOnlyBenefits"
			},
			bulletPoint3Text = if Props.isCatalog then {
				key = "IAPExperience.PremiumUpsell.Label.AvatarShopBenefits"
			} else { key = "IAPExperience.PremiumUpsell.Body.RobuxDiscount" },
			disclosure = {
				key = "IAPExperience.PremiumUpsell.Label.Disclosure",
				params = {
					currencySymbol = Props.currencySymbol,
					price = tostring(Props.robuxPrice)
				}
			},
			shortDisclosure = {
				key = "IAPExperience.PremiumUpsell.Label.ShortDisclosure"
			},
			priceLocalizedText = {
				key = "IAPExperience.PremiumUpsell.Label.PremiumPrice",
				params = {
					currencySymbol = Props.currencySymbol,
					price = tostring(Props.robuxPrice)
				}
			},
			headerLocalizedText = { key = "IAPExperience.PremiumUpsell.Label.RobloxPremium" },
			policyLocalizedText = { key = "IAPExperience.PremiumUpsell.Label.PremiumPolicy" }
		},
		render = function(p2)
			-- upvalues: p1 (copy)
			return p1:renderPrompt(p2)
		end
	})
end

function ExtendResult:renderCondensedPremiumInfo(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), Images (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), ImageSetLabel (upval), Images (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), p1 (copy)
		local Theme = p2.Theme
		local _Font = p2.Font
		
		return RoactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12)
			}),
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			IconContainer = RoactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 96, 0, 96),
				AutomaticSize = Enum.AutomaticSize.Y,
				AnchorPoint = Vector2.new(0, 0),
				Position = UDim2.new(0, 0, 0, 0)
			}, {
				Padding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 12) }),
				Icon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					ScaleType = Enum.ScaleType.Fit,
					Image = Images["icons/graphic/premium_large"]
				})
			}),
			PremiumInfoContainer = RoactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -80, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 6) }),
				ListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 12)
				}),
				PremiumHeader = RoactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = true,
					RichText = true,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = if FoundationFontFaceMigration then nil else _Font.Header2.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.TitleLarge.Font) else nil,
					Text = p1.headerLocalizedText,
					TextSize = _Font.BaseSize * _Font.Header2.RelativeSize,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextDefault.Transparency
				}),
				CostPerMonth = RoactModule.createElement("TextLabel", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					TextWrapped = true,
					RichText = true,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
					Text = p1.priceLocalizedText,
					TextSize = _Font.BaseSize,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextDefault.Transparency
				}),
				RenewAndCancelText = RoactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
					Text = p1.policyLocalizedText,
					TextSize = _Font.BaseSize,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.Transparency
				})
			})
		})
	end)
end

function ExtendResult.renderBulletInfo(p1, p2)
	-- upvalues: WithStyleFunction (copy), GetPartialPageModalMiddleContentWidthFunction (copy), RoactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), FitFrameVertical (copy), BulletPointModule (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: GetPartialPageModalMiddleContentWidthFunction (upval), p1 (copy), RoactModule (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), p2 (copy), FitFrameVertical (upval), BulletPointModule (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local PartialPageModalMiddleContentWidth = GetPartialPageModalMiddleContentWidthFunction(p1.props.screenSize.X)
		
		return RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) }),
			ListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12)
			}),
			BulletListText = RoactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font) else nil,
				Text = p2.descLocalizedText,
				TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency
			}),
			BulletList = RoactModule.createElement(FitFrameVertical, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 12)
			}, {
				BulletText1 = RoactModule.createElement(BulletPointModule, {
					layoutOrder = 1,
					text = p2.bulletPoint1Text,
					width = PartialPageModalMiddleContentWidth
				}),
				BulletText2 = RoactModule.createElement(BulletPointModule, {
					layoutOrder = 2,
					text = p2.bulletPoint2Text,
					width = PartialPageModalMiddleContentWidth
				}),
				BulletText3 = RoactModule.createElement(BulletPointModule, {
					layoutOrder = 3,
					text = p2.bulletPoint3Text,
					width = PartialPageModalMiddleContentWidth
				})
			})
		})
	end)
end

function ExtendResult:renderDisclosure(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), p1 (copy)
		local Theme = p2.Theme
		local _Font = p2.Font
		
		return RoactModule.createElement("Frame", {
			LayoutOrder = 5,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) }),
			Disclosure = RoactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				RichText = true,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
				Text = p1.shortDisclosure,
				TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency
			})
		})
	end)
end

function ExtendResult.renderLandscapePrompt(p1, p2)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), PartialPageModal (copy), ButtonType (copy)
	local Props = p1.props
	
	return WithStyleFunction(function(_)
		-- upvalues: RoactModule (upval), PartialPageModal (upval), p2 (copy), Props (copy), ButtonType (upval), p1 (copy)
		return RoactModule.createElement(PartialPageModal, {
			title = p2.titleLocalizedText,
			screenSize = Props.screenSize,
			buttonStackProps = {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = Props.purchasePremiumActivated,
							text = p2.monthlyLocalizedText,
							inputIcon = Props.acceptControllerIcon
						}
					}
				}
			},
			onCloseClicked = Props.cancelPurchaseActivated
		}, {
			RoactModule.createElement("ScrollingFrame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				ScrollingEnabled = true,
				ScrollBarThickness = 5,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, Props.screenSize.Y / 2),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.new(1, 0, 0, (math.min(Props.screenSize.Y / 2 + 96 + 12, 450)))
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
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

function ExtendResult.renderPortraitPrompt(p1, p2)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), PartialPageModal (copy), ButtonType (copy)
	local Props = p1.props
	
	return WithStyleFunction(function(_)
		-- upvalues: RoactModule (upval), PartialPageModal (upval), p2 (copy), Props (copy), ButtonType (upval), p1 (copy)
		return RoactModule.createElement(PartialPageModal, {
			title = p2.titleLocalizedText,
			screenSize = Props.screenSize,
			buttonStackProps = {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = Props.purchasePremiumActivated,
							text = p2.monthlyLocalizedText,
							inputIcon = Props.acceptControllerIcon
						}
					}
				}
			},
			onCloseClicked = Props.cancelPurchaseActivated
		}, {
			RoactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
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

function ExtendResult.renderUpdatedPrompt(p1, p2)
	-- upvalues: WithStyleFunction (copy), GetPartialPageModalMiddleContentWidthFunction (copy), RoactModule (copy), PartialPageModal (copy), ButtonType (copy), FitFrameVertical (copy), ImageSetLabel (copy), Images (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), BulletPointModule (copy)
	local Props = p1.props
	
	return WithStyleFunction(function(p3)
		-- upvalues: GetPartialPageModalMiddleContentWidthFunction (upval), p1 (copy), RoactModule (upval), PartialPageModal (upval), p2 (copy), Props (copy), ButtonType (upval), FitFrameVertical (upval), ImageSetLabel (upval), Images (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), BulletPointModule (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local PartialPageModalMiddleContentWidth = GetPartialPageModalMiddleContentWidthFunction(p1.props.screenSize.X)
		
		return RoactModule.createElement(PartialPageModal, {
			title = p2.titleLocalizedText,
			screenSize = Props.screenSize,
			buttonStackProps = {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = Props.purchasePremiumActivated,
							text = p2.monthlyLocalizedText,
							inputIcon = Props.acceptControllerIcon
						}
					}
				}
			},
			onCloseClicked = Props.cancelPurchaseActivated
		}, {
			RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 12),
				margin = { top = 12, bottom = 12 },
				[RoactModule.Change.AbsoluteSize] = function(Frame: Frame)
					-- upvalues: p1 (upval)
					if p1.contentSize.X ~= Frame.AbsoluteSize.X or p1.contentSize.Y ~= Frame.AbsoluteSize.Y then
						p1.updateContentSizes(p1.props.screenSize, Frame.AbsoluteSize)
					end
				end
			}, {
				Icon = RoactModule.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = p1.state.iconSize,
					ScaleType = Enum.ScaleType.Fit,
					Image = Images["icons/graphic/premium_large"]
				}),
				PremiumInfoContainer = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) }),
					ListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 12)
					}),
					PremiumHeader = RoactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						RichText = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Center,
						Font = if FoundationFontFaceMigration then nil else _Font.Header2.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.TitleLarge.Font) else nil,
						Text = p2.headerLocalizedText,
						TextSize = _Font.BaseSize * _Font.Header2.RelativeSize,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextDefault.Transparency
					}),
					CostPerMonth = RoactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						RichText = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Center,
						Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font) else nil,
						Text = p2.priceLocalizedText,
						TextSize = _Font.BaseSize,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextDefault.Transparency
					}),
					CancelText = RoactModule.createElement("TextLabel", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Center,
						Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font) else nil,
						Text = p2.policyLocalizedText,
						TextSize = _Font.BaseSize,
						TextColor3 = Theme.TextDefault.Color,
						TextTransparency = Theme.TextDefault.Transparency
					})
				}),
				BulletListText = RoactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font) else nil,
					Text = p2.descLocalizedText,
					TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.Transparency
				}),
				BulletList = RoactModule.createElement(FitFrameVertical, {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					contentPadding = UDim.new(0, 12)
				}, {
					BulletText1 = RoactModule.createElement(BulletPointModule, {
						layoutOrder = 1,
						text = p2.bulletPoint1Text,
						width = PartialPageModalMiddleContentWidth
					}),
					BulletText2 = RoactModule.createElement(BulletPointModule, {
						layoutOrder = 2,
						text = p2.bulletPoint2Text,
						width = PartialPageModalMiddleContentWidth
					}),
					BulletText3 = RoactModule.createElement(BulletPointModule, {
						layoutOrder = 3,
						text = p2.bulletPoint3Text,
						width = PartialPageModalMiddleContentWidth
					})
				}),
				Disclosure = p1:renderDisclosure(p2)
			})
		})
	end)
end

function ExtendResult.renderPrompt(p1, p2)
	local Props = p1.props
	
	return if Props.screenSize.Y < 450 then p1:renderLandscapePrompt(p2) elseif Props.screenSize.X < 450 then p1:renderPortraitPrompt(p2) else p1:renderUpdatedPrompt(p2)
end

return ExtendResult