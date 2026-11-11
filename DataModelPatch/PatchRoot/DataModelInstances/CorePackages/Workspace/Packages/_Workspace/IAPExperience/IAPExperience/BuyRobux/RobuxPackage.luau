local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LocalizationService = game:GetService("LocalizationService")
local RoactModule = require(Parent1.Roact)
local _ = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local FoundationModule = require(Parent1.Foundation)
local Skeleton = FoundationModule.Skeleton
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseStyleMetadataFunction = UIBloxModule.Core.Style.useStyleMetadata
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local Constants = UIBloxModule.App.Style.Constants
local RoactGamepadModule = require(Parent1.RoactGamepad)
local RoactFitComponentsModule = require(Parent1.RoactFitComponents)
local FitFrameHorizontal = RoactFitComponentsModule.FitFrameHorizontal
local FitTextLabel = RoactFitComponentsModule.FitTextLabel
local MultiTextLocalizerModule = require(Parent.Locale.MultiTextLocalizer)
local FormatNumberModule = require(Parent.Utility.formatNumber)
local FFlagEnableCoreContentTheme = require(Parent1.SharedFlags).FFlagEnableCoreContentTheme
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]

local function renderWithProviders(p1, p2, p3, SelectionImageObject, Dark, p4)
	-- upvalues: RoactModule (copy), Skeleton (copy), FFlagEnableCoreContentTheme (copy), Constants (copy), RoactGamepadModule (copy), ImageSetButton (copy), ImageSetLabel (copy), FitFrameHorizontal (copy), IconsCommonRobux (copy), FitTextLabel (copy), FormatNumberModule (copy), LocalizationService (copy)
	if p1.robuxAmount == nil then
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, p1.scale * 404, 0, p1.scale * 448)
		}, {
			ShimmerPanel = RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 1, 0) })
		})
	end
	local Theme = p3.Theme
	local _Font = p3.Font
	local ScaledScale = p1.scale * 64
	local SurfaceColor3 = if FFlagEnableCoreContentTheme then p4.Color.Surface.Surface_100.Color3 elseif Dark == Constants.ThemeName.Dark then Color3.fromRGB(25, 27, 29) else Color3.fromRGB(242, 244, 245)
	
	if p1.selected then
		if FFlagEnableCoreContentTheme then
			SurfaceColor3 = SurfaceColor3:Lerp(p4.Color.Surface.Surface_200.Color3, 0.5)
		else
			SurfaceColor3 = if Dark == Constants.ThemeName.Dark then Color3.fromRGB(57, 59, 61) else Color3.fromRGB(255, 255, 255)
		end
	end
	return RoactModule.createElement(RoactGamepadModule.Focusable[ImageSetButton], {
		LayoutOrder = p1.layoutOrder,
		BackgroundColor3 = Theme.UIEmphasis.Color,
		BackgroundTransparency = Theme.UIEmphasis.Transparency,
		Size = UDim2.new(0, p1.scale * 404, 0, p1.scale * 448),
		Image = nil,
		SelectionImageObject = SelectionImageObject,
		[RoactModule.Ref] = p1.forwardRef,
		NextSelectionUp = nil,
		NextSelectionDown = nil,
		NextSelectionLeft = p1.nextSelectionLeft,
		NextSelectionRight = p1.nextSelectionRight,
		inputBindings = {
			Activated = if p1.onActivated == nil then nil else RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
				-- upvalues: p1 (copy)
				p1.onActivated(p1.packageId)
			end)
		},
		[RoactModule.Event.Activated] = function()
			-- upvalues: p1 (copy)
			p1.onActivated(p1.packageId)
		end,
		[RoactModule.Event.MouseMoved] = function()
			-- upvalues: p1 (copy)
			p1.onHover(p1.forwardRef, true)
		end,
		[RoactModule.Event.MouseEnter] = function()
			-- upvalues: p1 (copy)
			p1.onHover(p1.forwardRef, true)
		end,
		[RoactModule.Event.MouseLeave] = function()
			-- upvalues: p1 (copy)
			p1.onHover(p1.forwardRef, false)
		end,
		[RoactModule.Event.SelectionGained] = function()
			-- upvalues: p1 (copy)
			p1.onSelect(p1.forwardRef)
		end
	}, {
		Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Outline = RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundColor3 = SurfaceColor3,
			Size = UDim2.new(1, -3, 1, -3)
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			MiddleContent = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, p1.scale * 24) }),
				RoactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, p1.scale * 17.5)
				}),
				RobuxImageFrame = RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(p1.scale * 192, p1.scale * 192),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}, {
					RobuxImage = RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						ImageTransparency = 0,
						Size = if p1.selected then UDim2.fromOffset(p1.scale * 192 * 1.6, p1.scale * 192 * 1.6) else UDim2.fromOffset(p1.scale * 192, p1.scale * 192),
						Position = if p1.selected then UDim2.new(0.5, 0, 0.3, 0) else UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = p1.robuxImage
					})
				}),
				RobuxAmount = RoactModule.createElement(FitFrameHorizontal, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					height = UDim.new(0, ScaledScale),
					contentPadding = UDim.new(0, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}, {
					Icon = RoactModule.createElement(ImageSetLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(0, ScaledScale, 0, ScaledScale),
						Image = IconsCommonRobux,
						ImageColor3 = Theme.TextEmphasis.Color,
						ImageTransparency = Theme.TextEmphasis.Transparency
					}),
					RobuxAmountText = RoactModule.createElement(FitTextLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						width = FitTextLabel.Width.FitToText,
						Text = FormatNumberModule(LocalizationService.RobloxLocaleId, p1.robuxAmount),
						Font = _Font.Title.Font,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextEmphasis.Transparency,
						TextSize = ScaledScale
					})
				}),
				CurrencyAmmountText = RoactModule.createElement(FitTextLabel, {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					width = FitTextLabel.Width.FitToText,
					Text = p1.currencyAmountStr,
					Font = _Font.Header1.Font,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					TextSize = p1.scale * 32
				}),
				MoreText = p1.robuxMoreAmount and RoactModule.createElement(FitTextLabel, {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					width = FitTextLabel.Width.FitToText,
					Text = p2.moreRobux,
					Font = _Font.Header2.Font,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					TextSize = p1.scale * 32
				}, {
					Gradient = RoactModule.createElement("UIGradient", {
						Rotation = 0,
						Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 251, 103)),
							ColorSequenceKeypoint.new(1, Color3.fromRGB(243, 185, 34))
						})
					})
				}) or nil
			})
		})
	})
end

return function(p1)
	-- upvalues: UseCursorFunction (copy), UseTokensFunction (copy), UseStyleMetadataFunction (copy), RoactModule (copy), MultiTextLocalizerModule (copy), FormatNumberModule (copy), LocalizationService (copy), WithStyleFunction (copy), renderWithProviders (copy)
	local UseCursorResult = UseCursorFunction(UDim.new(0, 8))
	local UseTokensResult = UseTokensFunction()
	local ThemeName = UseStyleMetadataFunction().ThemeName
	
	return RoactModule.createElement(MultiTextLocalizerModule, {
		keys = {
			moreRobux = {
				key = "IAPExperience.BuyRobux.Text.MoreRobux2",
				params = {
					robux = FormatNumberModule(LocalizationService.RobloxLocaleId, p1.robuxMoreAmount or 0)
				}
			}
		},
		render = function(p2)
			-- upvalues: WithStyleFunction (upval), p1 (copy), renderWithProviders (upval), UseCursorResult (copy), ThemeName (copy), UseTokensResult (copy)
			return WithStyleFunction(function(p3)
				-- upvalues: p1 (upval), renderWithProviders (upval), p2 (copy), UseCursorResult (upval), ThemeName (upval), UseTokensResult (upval)
				if p1.scale == nil then
					p1.scale = 0.65
				end
				return renderWithProviders(p1, p2, p3, UseCursorResult, ThemeName, UseTokensResult)
			end)
		end
	})
end