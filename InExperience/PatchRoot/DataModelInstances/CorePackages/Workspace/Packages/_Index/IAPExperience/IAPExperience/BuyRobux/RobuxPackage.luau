local parent = script.Parent.Parent
local parent_1 = parent.Parent
local localizationService = game:GetService("LocalizationService")
local roactModule = require(parent_1.Roact)
local _ = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local foundationModule = require(parent_1.Foundation)
local skeleton = foundationModule.Skeleton
local useTokens = foundationModule.Hooks.useTokens
local useStyleMetadata = UIBloxModule.Core.Style.useStyleMetadata
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Core.Style.withStyle
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local roactGamepadModule = require(parent_1.RoactGamepad)
local roactFitComponentsModule = require(parent_1.RoactFitComponents)
local fitFrameHorizontal = roactFitComponentsModule.FitFrameHorizontal
local fitTextLabel = roactFitComponentsModule.FitTextLabel
local multiTextLocalizerModule = require(parent.Locale.MultiTextLocalizer)
local formatNumberModule = require(parent.Utility.formatNumber)
local robux = images["icons/common/robux"]

local function renderWithProviders(p0, p1, p2, p3, _, p4)
	-- upvalues: roactModule (ref), skeleton (ref), roactGamepadModule (ref), imageSetButton (ref), imageSetLabel (ref), fitFrameHorizontal (ref), robux (ref), fitTextLabel (ref), formatNumberModule (ref), localizationService (ref)
	if p0.robuxAmount == nil then
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, p0.scale * 404, 0, p0.scale * 448)
		}, {
			ShimmerPanel = roactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 1, 0) })
		})
	end
	local theme = p2.Theme
	local font = p2.Font
	local var9 = p0.scale * 64
	local color3 = p4.Color.Surface.Surface_100.Color3
	
	if p0.selected then
		color3 = color3:Lerp(p4.Color.Surface.Surface_200.Color3, 0.5)
	end
	return roactModule.createElement(roactGamepadModule.Focusable[imageSetButton], {
		LayoutOrder = p0.layoutOrder,
		BackgroundColor3 = theme.UIEmphasis.Color,
		BackgroundTransparency = theme.UIEmphasis.Transparency,
		Size = UDim2.new(0, p0.scale * 404, 0, p0.scale * 448),
		Image = nil,
		SelectionImageObject = p3,
		[roactModule.Ref] = p0.forwardRef,
		NextSelectionUp = nil,
		NextSelectionDown = nil,
		NextSelectionLeft = p0.nextSelectionLeft,
		NextSelectionRight = p0.nextSelectionRight,
		inputBindings = {
			Activated = if p0.onActivated ~= nil then nil else roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
				-- upvalues: p0 (ref)
				p0.onActivated(p0.packageId)
			end)
		},
		[roactModule.Event.Activated] = function()
			-- upvalues: p0 (ref)
			p0.onActivated(p0.packageId)
		end,
		[roactModule.Event.MouseMoved] = function()
			-- upvalues: p0 (ref)
			p0.onHover(p0.forwardRef, true)
		end,
		[roactModule.Event.MouseEnter] = function()
			-- upvalues: p0 (ref)
			p0.onHover(p0.forwardRef, true)
		end,
		[roactModule.Event.MouseLeave] = function()
			-- upvalues: p0 (ref)
			p0.onHover(p0.forwardRef, false)
		end,
		[roactModule.Event.SelectionGained] = function()
			-- upvalues: p0 (ref)
			p0.onSelect(p0.forwardRef)
		end
	}, {
		Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Outline = roactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundColor3 = color3,
			Size = UDim2.new(1, -3, 1, -3)
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			MiddleContent = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				Padding = roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, p0.scale * 24) }),
				roactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, p0.scale * 17.5)
				}),
				RobuxImageFrame = roactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(p0.scale * 192, p0.scale * 192),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}, {
					RobuxImage = roactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						ImageTransparency = 0,
						Size = if p0.selected then UDim2.fromOffset(p0.scale * 192 * 1.6, p0.scale * 192 * 1.6) else UDim2.fromOffset(p0.scale * 192, p0.scale * 192),
						Position = if p0.selected then UDim2.new(0.5, 0, 0.3, 0) else UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = p0.robuxImage
					})
				}),
				RobuxAmount = roactModule.createElement(fitFrameHorizontal, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					height = UDim.new(0, var9),
					contentPadding = UDim.new(0, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}, {
					Icon = roactModule.createElement(imageSetLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(0, var9, 0, var9),
						Image = robux,
						ImageColor3 = theme.TextEmphasis.Color,
						ImageTransparency = theme.TextEmphasis.Transparency
					}),
					RobuxAmountText = roactModule.createElement(fitTextLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						width = fitTextLabel.Width.FitToText,
						Text = formatNumberModule(localizationService.RobloxLocaleId, p0.robuxAmount),
						Font = font.Title.Font,
						TextColor3 = theme.TextEmphasis.Color,
						TextTransparency = theme.TextEmphasis.Transparency,
						TextSize = var9
					})
				}),
				CurrencyAmmountText = roactModule.createElement(fitTextLabel, {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					width = fitTextLabel.Width.FitToText,
					Text = p0.currencyAmountStr,
					Font = font.Header1.Font,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextEmphasis.Transparency,
					TextSize = p0.scale * 32
				}),
				MoreText = p0.robuxMoreAmount and roactModule.createElement(fitTextLabel, {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					width = fitTextLabel.Width.FitToText,
					Text = p1.moreRobux,
					Font = font.Header2.Font,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextEmphasis.Transparency,
					TextSize = p0.scale * 32
				}, {
					Gradient = roactModule.createElement("UIGradient", {
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

return function(p5)
	-- upvalues: useCursor (ref), useTokens (ref), useStyleMetadata (ref), roactModule (ref), multiTextLocalizerModule (ref), formatNumberModule (ref), localizationService (ref), withStyle (ref), renderWithProviders (ref)
	local var10 = useCursor(UDim.new(0, 8))
	local var11 = useTokens()
	local themeName = useStyleMetadata().ThemeName
	
	return roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			moreRobux = {
				key = "IAPExperience.BuyRobux.Text.MoreRobux2",
				params = {
					robux = formatNumberModule(localizationService.RobloxLocaleId, p5.robuxMoreAmount or 0)
				}
			}
		},
		render = function(p6)
			-- upvalues: withStyle (copy), p5 (ref), renderWithProviders (copy), var10 (ref), themeName (ref), var11 (ref)
			return withStyle(function(p7)
				-- upvalues: p5 (copy), renderWithProviders (copy), p6 (ref), var10 (copy), themeName (copy), var11 (copy)
				if p5.scale == nil then
					p5.scale = 0.65
				end
				return renderWithProviders(p5, p6, p7, var10, themeName, var11)
			end)
		end
	})
end