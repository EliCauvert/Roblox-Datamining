local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local LocalizationService = game:GetService("LocalizationService")
local GuiService = game:GetService("GuiService")
local RoactModule = require(Parent2.Roact)
local RoactGamepadModule = require(Parent2.RoactGamepad)
local CryoModule = require(Parent2.Cryo)
local UIBloxModule = require(Parent2.UIBlox)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local UseStyleMetadataFunction = UIBloxModule.Core.Style.useStyleMetadata
local FoundationModule = require(Parent2.Foundation)
local ColorMode = FoundationModule.Enums.ColorMode
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local RoactFitComponentsModule = require(Parent2.RoactFitComponents)
local FitFrameHorizontal = RoactFitComponentsModule.FitFrameHorizontal
local FitTextLabel = RoactFitComponentsModule.FitTextLabel
local FullscreenFrame = require(Parent2.AppBlox).FullscreenFrame
local MultiTextLocalizerModule = require(Parent1.Locale.MultiTextLocalizer)
local FormatNumberModule = require(Parent1.Utility.formatNumber)
local AnimatorModule = require(Parent1.Generic.Animator)
local GetEnableCompensatingScrollingFrameModule = require(Parent1.Flags.getEnableCompensatingScrollingFrame)
local GetUserInputEventDataModule = require(Parent1.Utility.getUserInputEventData)
local RobuxPackageModule = require(Parent.RobuxPackage)
local ExtendResult = RoactModule.Component:extend(script.Name)
local IconsCommonGoldrobux = Images["icons/common/goldrobux"]
local IconsLogoBlock = Images["icons/logo/block"]
local list = {
	Images["icons/graphic/robuxcoin1_xxlarge"],
	Images["icons/graphic/robuxcoin2_xxlarge"],
	Images["icons/graphic/robuxcoin3_xxlarge"],
	Images["icons/graphic/robuxcoin4_xxlarge"],
	Images["icons/graphic/robuxcoin5_xxlarge"],
	Images["icons/graphic/robuxcoin6_xxlarge"]
}
local IconsNavigationClose = Images["icons/navigation/close"]

function ExtendResult.init(p1)
	-- upvalues: RoactGamepadModule (copy), RoactModule (copy), GuiService (copy)
	p1.state = { selectedPackage = nil, showMessageBanner = false }
	p1.buttonRefs = RoactGamepadModule.createRefCache()
	p1.scrollingFrameRef = RoactModule.createRef()
	
	function p1.getGamepadNextSelectionLeft(LayoutOrder: number)
		-- upvalues: p1 (copy)
		return LayoutOrder > 1 and p1.buttonRefs[LayoutOrder - 1] or nil
	end
	
	function p1.getGamepadNextSelectionRight(LayoutOrder: number)
		-- upvalues: p1 (copy)
		return LayoutOrder < #p1.buttonRefs and p1.buttonRefs[LayoutOrder + 1] or nil
	end
	
	function p1.initSelectionChangedListener()
		-- upvalues: p1 (copy), GuiService (upval)
		if p1.selectionListener ~= nil then
			p1.selectionListener:Disconnect()
			p1.selectionListener = nil
		end
		if p1.selectionListener ~= nil then
			p1.selectionListener:Disconnect()
			p1.selectionListener = nil
		end
		p1.selectionListener = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: p1 (upval), GuiService (upval)
			if p1.state.selectedPackage == nil or GuiService.SelectedCoreObject == nil or p1.state.selectedPackage ~= GuiService.SelectedCoreObject then
				p1:setState({ selectedPackage = GuiService.SelectedCoreObject })
			end
		end)
	end
end

function ExtendResult.didMount(p1)
	p1.initSelectionChangedListener()
end

function ExtendResult.didUpdate(p1, p2, _)
	local Props = p1.props
	
	if p2.hasNativePurchaseSucceeded ~= Props.hasNativePurchaseSucceeded and Props.hasNativePurchaseSucceeded then
		p1:setState({ showMessageBanner = true })
		task.delay(3, function()
			-- upvalues: p1 (copy)
			p1:setState({ showMessageBanner = false })
		end)
	end
end

function ExtendResult.willUnmount(p1)
	if p1.selectionListener ~= nil then
		p1.selectionListener:Disconnect()
		p1.selectionListener = nil
	end
end

function ExtendResult.getScale(p1): number
	return if p1.props.isConsoleSize then 1 else 0.65
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), MultiTextLocalizerModule (copy), WithSelectionCursorProviderFunction (copy)
	return RoactModule.createElement(MultiTextLocalizerModule, {
		keys = {
			BannerText = { key = "IAPExperience.BuyRobux.Banner.Text" },
			BannerTitle = { key = "IAPExperience.BuyRobux.Banner.Title" },
			SuccessfulMessage = { key = "IAPExperience.BuyRobux.Alert.SuccessfulMessage" }
		},
		render = function(p2)
			-- upvalues: WithSelectionCursorProviderFunction (upval), p1 (copy)
			return WithSelectionCursorProviderFunction(function(p3)
				-- upvalues: p1 (upval), p2 (copy)
				return p1:renderWithLocale(p2, p3)
			end)
		end
	})
end

function ExtendResult.movePackageToAttentionArea(p1, Frame: Frame)
	-- upvalues: GetEnableCompensatingScrollingFrameModule (copy)
	if not GetEnableCompensatingScrollingFrameModule() then return end
	local Current = p1.scrollingFrameRef.current
	
	if Current == nil or Frame == nil then return end
	local X = Current.AbsoluteSize.X
	local ScaledScale = 48 * p1:getScale()
	local XDelta = Frame.AbsolutePosition.X - ScaledScale
	
	if XDelta < 0 then
		Current.CanvasPosition = Vector2.new(XDelta, 0)
		p1:reportScrollingFrameCompensationHappened()
		
		return
	end
	if X < Frame.AbsolutePosition.X + Frame.AbsoluteSize.X + ScaledScale then
		Current.CanvasPosition = Vector2.new(XDelta, 0)
		p1:reportScrollingFrameCompensationHappened()
		
		return
	end
end

function ExtendResult.reportScrollingFrameCompensationHappened(p1)
	-- upvalues: GetUserInputEventDataModule (copy)
	local Props = p1.props
	
	if Props.onAnalyticEvent then
		Props.onAnalyticEvent("UserPurchaseFlow", (GetUserInputEventDataModule(Props.analyticId, "", "BuyRobux", "ScrollingFrame", "Compensated")))
		
		return
	end
end

function ExtendResult.renderWithLocale(p1, p2, Callback)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), RobuxPackageModule (copy), list (copy), FullscreenFrame (copy), ColorMode (copy), ImageSetButton (copy), IconsNavigationClose (copy), CursorKind (copy), AnimatorModule (copy), ImageSetLabel (copy), IconsLogoBlock (copy), FitTextLabel (copy), FitFrameHorizontal (copy), IconsCommonGoldrobux (copy), FormatNumberModule (copy), LocalizationService (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local Props = p1.props
	
	return WithStyleFunction(function(p3)
		-- upvalues: Props (copy), p1 (copy), RoactModule (upval), RobuxPackageModule (upval), list (upval), FullscreenFrame (upval), ColorMode (upval), ImageSetButton (upval), IconsNavigationClose (upval), Callback (copy), CursorKind (upval), AnimatorModule (upval), ImageSetLabel (upval), IconsLogoBlock (upval), FitTextLabel (upval), p2 (copy), FitFrameHorizontal (upval), IconsCommonGoldrobux (upval), FormatNumberModule (upval), LocalizationService (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local HasRobuxPackages = Props.robuxPackages ~= nil
		local CountRobuxPackages: number = if Props.robuxPackages == nil then 6 else #Props.robuxPackages
		local ScaledScale = 32 * p1:getScale()
		local config = {
			LeadingPadding = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(0, 80 * p1:getScale(), 0, 1)
			}),
			RobuxPackageChildren = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 16 * p1:getScale())
			}),
			TrailingPadding = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = CountRobuxPackages + 1,
				Size = UDim2.new(0, 80 * p1:getScale(), 0, 1)
			})
		}
		
		for i = 1, CountRobuxPackages do
			local NewI = i + 1
			local CreateElementFunction = RoactModule.createElement
			local config1 = {
				layoutOrder = i,
				scale = p1:getScale(),
				selected = p1.state.selectedPackage ~= nil and p1.state.selectedPackage == p1.buttonRefs[i]:getValue(),
				packageId = if HasRobuxPackages then Props.robuxPackages[i].packageId else tostring(i),
				robuxAmount = if HasRobuxPackages then Props.robuxPackages[i].robuxAmount else nil,
				currencyAmountStr = if HasRobuxPackages then Props.robuxPackages[i].currencyAmountStr else nil,
				robuxMoreAmount = if HasRobuxPackages then Props.robuxPackages[i].robuxMoreAmount else nil
			}
			config1.robuxImage = list[i]
			config1.forwardRef = p1.buttonRefs[i]
			config1.nextSelectionLeft = p1.getGamepadNextSelectionLeft(i)
			config1.nextSelectionRight = p1.getGamepadNextSelectionRight(i)
			
			function config1.onActivated(p4)
				-- upvalues: Props (upval)
				Props.robuxPackageActivated(p4)
			end
			
			function config1.onSelect(p4)
				-- upvalues: p1 (upval)
				p1:movePackageToAttentionArea(p4:getValue())
			end
			
			function config1.onHover(p4, p5)
				-- upvalues: p1 (upval)
				if not p5 then
					p1:setState({ selectedPackage = "" })
				elseif p1.state.selectedPackage ~= p4:getValue() then
					p1:setState({ selectedPackage = p4:getValue() })
					
					return
				end
			end
			
			config[NewI] = CreateElementFunction(RobuxPackageModule, config1)
		end
		return RoactModule.createElement(FullscreenFrame, {
			BackgroundTransparency = 0,
			BackgroundColor3 = Theme.BackgroundDefault.Color
		}, {
			BuyRobuxPageBackground = RoactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				ZIndex = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Visible = p1.props.showBackground
			}, {
				BackgroundImage = RoactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Image = if Props.themeName == ColorMode.Dark then "rbxasset://textures/AvatarEditorImages/AvatarEditor.png" else "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png",
					Size = UDim2.new(1, 0, 1, 0)
				}),
				Backdrop = RoactModule.createElement("Frame", {
					BackgroundTransparency = if Props.themeName == ColorMode.Dark then 0.5 else 0.7,
					BackgroundColor3 = Color3.new(0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0)
				})
			}),
			CloseButton = RoactModule.createElement(ImageSetButton, {
				Position = UDim2.new(0, 48 * p1:getScale(), 0, 48 * p1:getScale()),
				AnchorPoint = Vector2.new(0, 0),
				Size = UDim2.new(0, 36, 0, 36),
				Image = IconsNavigationClose,
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 0.7,
				BorderSizePixel = 0,
				SelectionImageObject = Callback(CursorKind.RoundedRect),
				Visible = p1.props.showCloseButton,
				[RoactModule.Event.Activated] = Props.onPageClose
			}, {
				UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 16 * p1:getScale()) })
			}),
			MessageBannerAnimator = RoactModule.createElement(AnimatorModule, {
				animateDown = true,
				ZIndex = 10,
				shouldAnimate = Props.shouldAnimate,
				shouldShow = p1.state.showMessageBanner,
				renderChildren = function()
					-- upvalues: RoactModule (upval), Props (upval), ColorMode (upval), p1 (upval), ScaledScale (copy), ImageSetLabel (upval), IconsLogoBlock (upval), Theme (copy), FitTextLabel (upval), p2 (upval), _Font (copy)
					return RoactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						AnchorPoint = Vector2.new(0, 0),
						BackgroundColor3 = if Props.themeName == ColorMode.Dark then Color3.fromRGB(17, 18, 20) else Color3.fromRGB(198, 203, 206),
						Position = UDim2.fromOffset(48 * p1:getScale(), 40 * p1:getScale()),
						Size = UDim2.new(1, -96 * p1:getScale(), 0, ScaledScale * 2)
					}, {
						UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 16 * p1:getScale()) }),
						Icon = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							ImageTransparency = 0,
							AnchorPoint = Vector2.new(0, 0.5),
							Image = IconsLogoBlock,
							ImageColor3 = Theme.TextEmphasis.Color,
							Position = UDim2.fromOffset(24 * p1:getScale(), ScaledScale),
							Size = UDim2.fromOffset(36 * p1:getScale(), 36 * p1:getScale())
						}),
						AlertMessage = RoactModule.createElement(FitTextLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.fromOffset(80 * p1:getScale(), ScaledScale),
							width = FitTextLabel.Width.FitToText,
							Text = p2.SuccessfulMessage,
							Font = _Font.Header1.Font,
							TextColor3 = Theme.TextEmphasis.Color,
							TextTransparency = Theme.TextEmphasis.Transparency,
							TextSize = ScaledScale,
							TextXAlignment = Enum.TextXAlignment.Left
						})
					})
				end
			}),
			RobuxBalanceFrame = RoactModule.createElement(FitFrameHorizontal, {
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -96 * p1:getScale(), 0, 48 * p1:getScale()),
				AnchorPoint = Vector2.new(1, 0),
				height = UDim.new(0, ScaledScale),
				contentPadding = UDim.new(0, 4),
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}, {
				Icon = RoactModule.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Size = UDim2.fromOffset(ScaledScale + 15 * p1:getScale(), ScaledScale + 15 * p1:getScale()),
					Image = IconsCommonGoldrobux
				}),
				BalanceText = RoactModule.createElement(FitTextLabel, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					width = FitTextLabel.Width.FitToText,
					Text = if Props.robuxBalance then FormatNumberModule(LocalizationService.RobloxLocaleId, Props.robuxBalance) else "",
					Font = _Font.Header1.Font,
					TextColor3 = if Props.showBackground then Color3.new(255, 255, 255) else Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					TextSize = ScaledScale
				})
			}),
			BannerFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 96 * p1:getScale(), 0, 146 * p1:getScale()),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				RoactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 36 * p1:getScale())
				}),
				BannerTitle = RoactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = if FoundationFontFaceMigration then nil else _Font.Title.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.HeadingLarge.Font) else nil,
					Text = p2.BannerTitle,
					TextSize = 46 * p1:getScale(),
					TextColor3 = if Props.showBackground then Color3.new(255, 255, 255) else Theme.TextEmphasis.Color
				}),
				BannerText = RoactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = if FoundationFontFaceMigration then nil else _Font.Header1.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.HeadingSmall.Font) else nil,
					Text = p2.BannerText,
					TextSize = 38 * p1:getScale(),
					TextColor3 = if Props.showBackground then Color3.new(255, 255, 255) else Theme.TextEmphasis.Color
				})
			}),
			RobuxPackageTilesFrame = RoactModule.createElement("ScrollingFrame", {
				Position = UDim2.new(0, 0, 0, 310 * p1:getScale()),
				Size = UDim2.new(1, 0, 0, 615 * p1:getScale()),
				AutomaticSize = Enum.AutomaticSize.None,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingEnabled = HasRobuxPackages,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ScrollBarImageTransparency = 1,
				ScrollBarThickness = 0,
				Selectable = false,
				BackgroundTransparency = 1,
				[RoactModule.Ref] = p1.scrollingFrameRef
			}, config)
		})
	end)
end

return function(p3)
	-- upvalues: UseStyleMetadataFunction (copy), RoactModule (copy), ExtendResult (copy), CryoModule (copy)
	return RoactModule.createElement(ExtendResult, CryoModule.Dictionary.join(p3, { themeName = UseStyleMetadataFunction().ThemeName }))
end