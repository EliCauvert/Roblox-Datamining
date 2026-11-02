local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LocalizationService = game:GetService("LocalizationService")
local TextService = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
local RoactModule = require(Parent1.Roact)
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local FoundationModule = require(Parent1.Foundation)
local Skeleton = FoundationModule.Skeleton
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseStyleMetadataFunction = UIBloxModule.Core.Style.useStyleMetadata
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local RoactGamepadModule = require(Parent1.RoactGamepad)
local RoactFitComponentsModule = require(Parent1.RoactFitComponents)
local FitFrameHorizontal = RoactFitComponentsModule.FitFrameHorizontal
local FitTextLabel = RoactFitComponentsModule.FitTextLabel
local MultiTextLocalizerModule = require(Parent.Locale.MultiTextLocalizer)
local FFlagBuyRobuxPageFitToViewportModule = require(Parent.Flags.FFlagBuyRobuxPageFitToViewport)
local FormatNumberModule = require(Parent.Utility.formatNumber)
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]
local _Vector2 = Vector2.new(397, 440)
local t = {}
local _TweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function renderWithProviders(p1, p2, p3, SelectionImageObject, _, p4, UseRefResult)
	-- upvalues: FFlagBuyRobuxPageFitToViewportModule (copy), RoactModule (copy), _Vector2 (copy), Skeleton (copy), FormatNumberModule (copy), LocalizationService (copy), t (copy), TextService (copy), RoactGamepadModule (copy), ImageSetButton (copy), ImageSetLabel (copy), FitFrameHorizontal (copy), IconsCommonRobux (copy), FitTextLabel (copy)
	local FitToViewport = FFlagBuyRobuxPageFitToViewportModule and p1.fitToViewport
	
	if p1.robuxAmount == nil then
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = if FitToViewport then UDim2.fromScale(0, 0.9) else UDim2.new(0, p1.scale * 404, 0, p1.scale * 448),
			LayoutOrder = if FitToViewport then p1.layoutOrder else nil
		}, {
			AspectRatio = if FitToViewport then RoactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = 0.9017857142857143,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Height
			}) else nil,
			SizeConstraint = FitToViewport and RoactModule.createElement("UISizeConstraint", { MaxSize = _Vector2 }),
			ShimmerPanel = RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 1, 0) })
		})
	end
	local Theme = p3.Theme
	local _Font = p3.Font
	local ScaledScale = p1.scale * 64
	local FormatNumberModuleResult: string = FormatNumberModule(LocalizationService.RobloxLocaleId, p1.robuxAmount)
	local X = 0
	
	if FitToViewport then
		local Text: string = `{FormatNumberModuleResult}|{ScaledScale}`
		X = t[Text]
		
		if X == nil then
			X = TextService:GetTextSize(FormatNumberModuleResult, ScaledScale, _Font.Title.Font, Vector2.new(10000, 10000)).X
			t[Text] = X
		end
	end
	local SurfaceColor3 = p4.Color.Surface.Surface_100.Color3
	
	if p1.selected then
		SurfaceColor3 = SurfaceColor3:Lerp(p4.Color.Surface.Surface_200.Color3, 0.5)
	end
	return RoactModule.createElement(RoactGamepadModule.Focusable[ImageSetButton], {
		LayoutOrder = p1.layoutOrder,
		BackgroundColor3 = Theme.UIEmphasis.Color,
		BackgroundTransparency = Theme.UIEmphasis.Transparency,
		Size = if FitToViewport then UDim2.fromScale(0, 0.9) else UDim2.new(0, p1.scale * 404, 0, p1.scale * 448),
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
		AspectRatio = if FitToViewport then RoactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 0.9017857142857143,
			AspectType = Enum.AspectType.ScaleWithParentSize,
			DominantAxis = Enum.DominantAxis.Height
		}) else nil,
		SizeConstraint = FitToViewport and RoactModule.createElement("UISizeConstraint", { MaxSize = _Vector2 }),
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
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = if FitToViewport then UDim.new(0.05, 0) else UDim.new(0, p1.scale * 24),
					PaddingBottom = if FitToViewport then UDim.new(0.05, 0) else nil
				}),
				RoactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, if FitToViewport then 10 else p1.scale * 17.5)
				}),
				RobuxImageFrame = RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = if FitToViewport then UDim2.fromScale(1, 0.5) else UDim2.fromOffset(p1.scale * 192, p1.scale * 192),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}, {
					AspectRatio = FitToViewport and RoactModule.createElement("UIAspectRatioConstraint", {
						AspectRatio = 1,
						AspectType = Enum.AspectType.FitWithinMaxSize,
						DominantAxis = Enum.DominantAxis.Width
					}),
					FlexItem = FitToViewport and RoactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
					RobuxImage = RoactModule.createElement(ImageSetLabel, {
						Size = if FitToViewport then UDim2.fromScale(1, 1) elseif p1.selected then UDim2.fromOffset(p1.scale * 192 * 1.6, p1.scale * 192 * 1.6) else UDim2.fromOffset(p1.scale * 192, p1.scale * 192),
						[RoactModule.Ref] = if FitToViewport then UseRefResult else nil,
						Position = if p1.selected and not FitToViewport then UDim2.new(0.5, 0, 0.3, 0) else UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundTransparency = 1,
						Image = p1.robuxImage,
						ImageTransparency = 0
					})
				}),
				RobuxAmount = RoactModule.createElement(if FitToViewport then "Frame" else FitFrameHorizontal, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					height = if FitToViewport then nil else UDim.new(0, ScaledScale),
					Size = if FitToViewport then UDim2.fromScale(1, 0.18) else nil,
					contentPadding = if FitToViewport then nil else UDim.new(0, 0),
					FillDirection = if FitToViewport then nil else Enum.FillDirection.Horizontal,
					VerticalAlignment = if FitToViewport then nil else Enum.VerticalAlignment.Center
				}, {
					SizeConstraint = FitToViewport and RoactModule.createElement("UISizeConstraint", {
						MinSize = Vector2.new(0, 40),
						MaxSize = Vector2.new(1e999, 64)
					}),
					Layout = FitToViewport and RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Icon = RoactModule.createElement(ImageSetLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = if FitToViewport then UDim2.fromScale(0, 1) else UDim2.new(0, ScaledScale, 0, ScaledScale),
						Image = IconsCommonRobux,
						ImageColor3 = Theme.TextEmphasis.Color,
						ImageTransparency = Theme.TextEmphasis.Transparency
					}, if FitToViewport then {
						AspectRatio = RoactModule.createElement("UIAspectRatioConstraint", {
							AspectRatio = 1,
							AspectType = Enum.AspectType.ScaleWithParentSize,
							DominantAxis = Enum.DominantAxis.Height
						})
					} else nil),
					RobuxAmountText = RoactModule.createElement(if FitToViewport then "TextLabel" else FitTextLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						width = if FitToViewport then nil else FitTextLabel.Width.FitToText,
						Size = if FitToViewport then UDim2.fromScale(0, 1) else nil,
						TextScaled = if FitToViewport then true else nil,
						Text = if FitToViewport then string.gsub(FormatNumberModuleResult, " ", " ") else FormatNumberModuleResult,
						Font = _Font.Title.Font,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextEmphasis.Transparency,
						TextSize = ScaledScale
					}, {
						AspectRatio = FitToViewport and RoactModule.createElement("UIAspectRatioConstraint", {
							AspectRatio = X * 1.04 / ScaledScale,
							AspectType = Enum.AspectType.ScaleWithParentSize,
							DominantAxis = Enum.DominantAxis.Height
						})
					})
				}),
				CurrencyAmmountText = RoactModule.createElement(if FitToViewport then "TextLabel" else FitTextLabel, {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					width = if FitToViewport then nil else FitTextLabel.Width.FitToText,
					Size = if FitToViewport then UDim2.fromScale(1, 0.18) else nil,
					TextScaled = if FitToViewport then true else nil,
					TextWrapped = if FitToViewport then true else nil,
					Text = p1.currencyAmountStr,
					Font = _Font.Header1.Font,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					TextSize = p1.scale * 32
				}, {
					SizeConstraint = FitToViewport and RoactModule.createElement("UISizeConstraint", {
						MinSize = Vector2.new(0, 40),
						MaxSize = Vector2.new(1e999, 64)
					}),
					Padding = FitToViewport and RoactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0.25, 0),
						PaddingBottom = UDim.new(0.25, 0)
					})
				}),
				MoreText = (FitToViewport or p1.robuxMoreAmount) and RoactModule.createElement(if FitToViewport then "TextLabel" else FitTextLabel, {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					width = if FitToViewport then nil else FitTextLabel.Width.FitToText,
					Size = if FitToViewport then UDim2.fromScale(1, 0.09) else nil,
					TextScaled = if FitToViewport then true else nil,
					TextWrapped = if FitToViewport then true else nil,
					Text = if FitToViewport and p1.robuxMoreAmount == nil then "" else p2.moreRobux,
					Font = _Font.Header2.Font,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					TextSize = p1.scale * 32
				}, {
					SizeConstraint = FitToViewport and RoactModule.createElement("UISizeConstraint", {
						MinSize = Vector2.new(0, 22),
						MaxSize = Vector2.new(1e999, 40)
					}),
					Padding = FitToViewport and RoactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0.1, 0),
						PaddingBottom = UDim.new(0.1, 0)
					}),
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
	-- upvalues: UseCursorFunction (copy), UseTokensFunction (copy), UseStyleMetadataFunction (copy), ReactModule (copy), FFlagBuyRobuxPageFitToViewportModule (copy), TweenService (copy), _TweenInfo (copy), RoactModule (copy), MultiTextLocalizerModule (copy), FormatNumberModule (copy), LocalizationService (copy), WithStyleFunction (copy), renderWithProviders (copy)
	local UseCursorResult = UseCursorFunction(UDim.new(0, 8))
	local UseTokensResult = UseTokensFunction()
	local ThemeName = UseStyleMetadataFunction().ThemeName
	local UseRefResult = ReactModule.useRef(nil)
	local FitToViewport = FFlagBuyRobuxPageFitToViewportModule and p1.fitToViewport
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), FitToViewport (copy), p1 (copy), TweenService (upval), _TweenInfo (upval)
		local Current = UseRefResult.current
		
		if not FitToViewport or Current == nil then
			return nil
		end
		local XScale: number = if p1.selected then 1.2 else 1
		local _UDim2 = UDim2.fromScale(XScale, XScale)
		
		if Current.Size == _UDim2 then
			return nil
		else
			local Tween = TweenService:Create(Current, _TweenInfo, { Size = _UDim2 })
			Tween:Play()
			
			return function()
				-- upvalues: Tween (copy)
				Tween:Cancel()
			end
		end
	end, { p1.selected, FitToViewport, p1.robuxAmount ~= nil })
	
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
			-- upvalues: WithStyleFunction (upval), p1 (copy), renderWithProviders (upval), UseCursorResult (copy), ThemeName (copy), UseTokensResult (copy), UseRefResult (copy)
			return WithStyleFunction(function(p3)
				-- upvalues: p1 (upval), renderWithProviders (upval), p2 (copy), UseCursorResult (upval), ThemeName (upval), UseTokensResult (upval), UseRefResult (upval)
				if p1.scale == nil then
					p1.scale = 0.65
				end
				return renderWithProviders(p1, p2, p3, UseCursorResult, ThemeName, UseTokensResult, UseRefResult)
			end)
		end
	})
end