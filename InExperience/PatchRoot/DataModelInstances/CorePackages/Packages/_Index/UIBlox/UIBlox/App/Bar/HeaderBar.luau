local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local CryoModule = require(Parent2.Cryo)
local _ = require(Parent.Style.StyleTypes)
local _ = require(Parent.Style.Fonts)
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local GenericTextLabelModule = require(Parent1.Core.Text.GenericTextLabel.GenericTextLabel)
local GetTextSizeModule = require(Parent1.Core.Text.GetTextSize)
local ThreeSectionBarModule = require(Parent1.Core.Bar.ThreeSectionBar)
local config = {
	barHeight = 48,
	title = "",
	isTitleCentered = true,
	isSecondary = false,
	isOnMedia = false,
	hasDivider = false
}

local function useHeaderBarStyle(JoinResult, p1)
	-- upvalues: ReactModule (copy)
	local Tokens = p1.Tokens
	local Theme = p1.Theme
	local BackgroundStyle = JoinResult.backgroundStyle
	local BackgroundTransparency = JoinResult.backgroundTransparency
	local IsOnMedia = JoinResult.isOnMedia
	local PaddingTop = JoinResult.paddingTop
	local PaddingRight = JoinResult.paddingRight
	local PaddingBottom = JoinResult.paddingBottom
	local PaddingLeft = JoinResult.paddingLeft
	local Margin = JoinResult.margin
	
	return {
		BackgroundStyle = ReactModule.useMemo(function()
			-- upvalues: IsOnMedia (copy), BackgroundStyle (copy), Theme (copy), BackgroundTransparency (copy)
			if IsOnMedia then
				return {}
			end
			local BackgroundStyle1 = BackgroundStyle or {
				Color3 = Theme.BackgroundDefault.Color,
				Transparency = Theme.BackgroundDefault.Transparency
			}
			
			if BackgroundTransparency then
				BackgroundStyle1.Transparency = BackgroundTransparency
			end
			return BackgroundStyle1
		end, {
			IsOnMedia,
			BackgroundStyle,
			BackgroundTransparency,
			Theme
		}),
		Padding = ReactModule.useMemo(function()
			-- upvalues: PaddingTop (copy), Tokens (copy), PaddingRight (copy), PaddingBottom (copy), PaddingLeft (copy), Margin (copy)
			local config = {
				Top = PaddingTop or UDim.new(0, Tokens.Size.Size_200),
				Right = PaddingRight or UDim.new(0, Tokens.Size.Size_500),
				Bottom = PaddingBottom or UDim.new(0, Tokens.Size.Size_200),
				Left = PaddingLeft or UDim.new(0, Tokens.Size.Size_500)
			}
			
			if Margin then
				config.Left = UDim.new(0, Margin)
				config.Right = UDim.new(0, Margin)
			end
			return config
		end, {
			PaddingTop, PaddingRight, PaddingBottom, PaddingLeft, Margin, Tokens
		})
	}
end

local function useRenderLeft(JoinResult, p1)
	-- upvalues: ReactModule (copy), CryoModule (copy), GenericTextLabelModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: JoinResult (copy), ReactModule (upval), p1 (copy), CryoModule (upval), GenericTextLabelModule (upval)
		local Title: string = JoinResult.title
		local RenderLeftFunction = JoinResult.renderLeft
		local IsTitleCentered = JoinResult.isTitleCentered
		local IsSecondary = JoinResult.isSecondary
		local ShouldHideSecondaryLeftItem = JoinResult.shouldHideSecondaryLeftItem
		local Tokens = p1.Tokens
		local RenderLeft = JoinResult.renderLeft
		
		if (RenderLeftFunction == nil or RenderLeftFunction == ReactModule.None) and string.len(Title) > 0 then
			RenderLeft = function(p2)
				-- upvalues: CryoModule (upval), ReactModule (upval), Tokens (copy), GenericTextLabelModule (upval), Title (copy)
				return ReactModule.createElement(ReactModule.Fragment, nil, {
					Text = ReactModule.createElement(GenericTextLabelModule, {
						fluidSizing = true,
						Text = Title,
						TextXAlignment = Enum.TextXAlignment.Left,
						fontStyle = Tokens.Typography.HeadingLarge,
						colorStyle = Tokens.Color.Content.Emphasis
					}, (CryoModule.Dictionary.join(p2.children, {
						TextPadding = ReactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, Tokens.Size.Size_50),
							PaddingBottom = UDim.new(0, Tokens.Size.Size_50)
						})
					})))
				})
			end
			
			return RenderLeft
		end
		if IsSecondary and not ShouldHideSecondaryLeftItem and string.len(Title) > 0 then
			local Theme = p1.Theme
			local _Font = p1.Font
			local Header2 = _Font.Header2
			local ScaledRelativeSize = Header2.RelativeSize * _Font.BaseSize
			
			RenderLeft = function()
				-- upvalues: ReactModule (upval), ScaledRelativeSize (copy), RenderLeftFunction (copy), Theme (copy), GenericTextLabelModule (upval), Title (copy), Header2 (copy)
				return ReactModule.createElement(ReactModule.Fragment, nil, {
					Text = ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, ScaledRelativeSize)
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Horizontal,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, 12)
						}),
						Left = ReactModule.createElement("Frame", {
							LayoutOrder = 1,
							Selectable = false,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							Size = UDim2.fromOffset(0, 0),
							AutomaticSize = Enum.AutomaticSize.XY
						}, {
							LeftContent = if RenderLeftFunction then RenderLeftFunction() else nil
						}),
						Divider = ReactModule.createElement("Frame", {
							LayoutOrder = 2,
							Selectable = false,
							BorderSizePixel = 0,
							BackgroundColor3 = Theme.Divider.Color,
							BackgroundTransparency = Theme.Divider.Transparency,
							Size = UDim2.new(0, 1, 1, 0)
						}),
						TextLabel = ReactModule.createElement(GenericTextLabelModule, {
							LayoutOrder = 3,
							Selectable = false,
							ClipsDescendants = true,
							TextWrapped = false,
							Text = Title,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextXAlignment = Enum.TextXAlignment.Left,
							fontStyle = Header2,
							colorStyle = Theme.TextEmphasis
						})
					})
				})
			end
			
			return RenderLeft
		else
			if not IsSecondary and not IsTitleCentered then
				local HeadingSmall = Tokens.Typography.HeadingSmall
				local FontSize = HeadingSmall.FontSize
				
				RenderLeft = function()
					-- upvalues: ReactModule (upval), FontSize (copy), Tokens (copy), RenderLeftFunction (copy), GenericTextLabelModule (upval), Title (copy), HeadingSmall (copy)
					return ReactModule.createElement(ReactModule.Fragment, nil, {
						LeftFrame = ReactModule.createElement("Frame", {
							Selectable = false,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, FontSize)
						}, {
							Layout = ReactModule.createElement("UIListLayout", {
								SortOrder = Enum.SortOrder.LayoutOrder,
								FillDirection = Enum.FillDirection.Horizontal,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								Padding = UDim.new(0, Tokens.Size.Size_300)
							}),
							Left = ReactModule.createElement("Frame", {
								LayoutOrder = 1,
								Selectable = false,
								BorderSizePixel = 0,
								BackgroundTransparency = 1,
								Size = UDim2.fromOffset(0, 0),
								AutomaticSize = Enum.AutomaticSize.XY
							}, {
								LeftContent = if RenderLeftFunction then RenderLeftFunction() else nil
							}),
							TextLabel = ReactModule.createElement(GenericTextLabelModule, {
								LayoutOrder = 2,
								Selectable = false,
								ClipsDescendants = true,
								TextWrapped = false,
								Text = Title,
								TextTruncate = Enum.TextTruncate.AtEnd,
								TextXAlignment = Enum.TextXAlignment.Left,
								fontStyle = HeadingSmall,
								colorStyle = Tokens.Color.Content.Emphasis
							}, {
								TextPadding = ReactModule.createElement("UIPadding", {
									PaddingTop = UDim.new(0, Tokens.Size.Size_50),
									PaddingBottom = UDim.new(0, Tokens.Size.Size_50)
								})
							})
						})
					})
				end
			end
			return RenderLeft
		end
	end, {
		JoinResult.title, JoinResult.isTitleCentered, JoinResult.renderLeft,
		JoinResult.isSecondary, JoinResult.shouldHideSecondaryLeftItem, p1
	})
end

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleModule (copy), ReactModule (copy), useRenderLeft (copy), GenericTextLabelModule (copy), GetTextSizeModule (copy), useHeaderBarStyle (copy), ThreeSectionBarModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleModuleResult = UseStyleModule()
	local Tokens = UseStyleModuleResult.Tokens
	local Title = JoinResult.title
	local RenderCenter = JoinResult.renderCenter
	local RenderRight = JoinResult.renderRight
	local IsTitleCentered = JoinResult.isTitleCentered
	local IsSecondary = JoinResult.isSecondary
	local OnHeaderActivated = JoinResult.onHeaderActivated
	local ContentPaddingRight = JoinResult.contentPaddingRight
	local AutomaticHeight = JoinResult.automaticHeight
	local IsOnMedia = JoinResult.isOnMedia
	local ZIndex = JoinResult.zIndex
	local HasDivider = JoinResult.hasDivider
	local NoRenderLeft: boolean = JoinResult.renderLeft == nil or JoinResult.renderLeft == ReactModule.None
	local UseRenderLeftResult = useRenderLeft(JoinResult, UseStyleModuleResult)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: RenderCenter (copy), NoRenderLeft (copy), IsSecondary (copy), IsTitleCentered (copy), Tokens (copy), ReactModule (upval), GenericTextLabelModule (upval), Title (copy)
		local RenderCenter1: () -> any = RenderCenter
		
		if not RenderCenter1 and not NoRenderLeft and not IsSecondary and IsTitleCentered then
			local HeadingSmall = Tokens.Typography.HeadingSmall
			local FontSize = HeadingSmall.FontSize
			
			RenderCenter1 = function()
				-- upvalues: ReactModule (upval), GenericTextLabelModule (upval), FontSize (copy), Title (upval), HeadingSmall (copy), Tokens (upval)
				return ReactModule.createElement(GenericTextLabelModule, {
					Selectable = false,
					ClipsDescendants = true,
					TextWrapped = false,
					Size = UDim2.new(1, 0, 0, FontSize),
					Text = Title,
					TextTruncate = Enum.TextTruncate.AtEnd,
					fontStyle = HeadingSmall,
					colorStyle = Tokens.Color.Content.Emphasis
				}, {
					TextPadding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, Tokens.Size.Size_50),
						PaddingBottom = UDim.new(0, Tokens.Size.Size_50)
					})
				})
			end
		end
		return RenderCenter1
	end, {
		RenderCenter, NoRenderLeft, IsSecondary, IsTitleCentered, Tokens, Title
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseRenderLeftResult (copy), RenderCenter (copy), RenderRight (copy), NoRenderLeft (copy), IsSecondary (copy), IsTitleCentered (copy), Tokens (copy), GetTextSizeModule (upval), Title (copy)
		if UseRenderLeftResult and RenderCenter and RenderRight then
			return 0
		elseif RenderCenter or NoRenderLeft or IsSecondary or not IsTitleCentered then
			return 1e999
		else
			local HeadingSmall = Tokens.Typography.HeadingSmall
			
			return GetTextSizeModule(Title, HeadingSmall.FontSize, HeadingSmall.Font, Vector2.new(1e999, 1e999)).X
		end
	end, {
		Title, IsTitleCentered, NoRenderLeft, UseRenderLeftResult, RenderCenter,
		RenderRight, IsSecondary, Tokens
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ContentPaddingRight (copy), NoRenderLeft (copy), Tokens (copy)
		return if ContentPaddingRight then ContentPaddingRight elseif NoRenderLeft then UDim.new(0, 0) else UDim.new(0, Tokens.Size.Size_600)
	end, { ContentPaddingRight, NoRenderLeft, Tokens })
	local UseHeaderBarStyleResult = useHeaderBarStyle(JoinResult, UseStyleModuleResult)
	local BackgroundStyle = UseHeaderBarStyleResult.BackgroundStyle
	local Padding = UseHeaderBarStyleResult.Padding
	
	return ReactModule.createElement("Frame", {
		Selectable = false,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, if IsOnMedia then JoinResult.barHeight + Tokens.Size.Size_1000 else JoinResult.barHeight),
		BackgroundColor3 = BackgroundStyle.Color3,
		BackgroundTransparency = BackgroundStyle.Transparency,
		AutomaticSize = if AutomaticHeight then Enum.AutomaticSize.Y else nil,
		ZIndex = ZIndex
	}, {
		Gradient = if IsOnMedia then ReactModule.createElement("UIGradient", {
			Rotation = 90,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
				ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
			}),
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.7),
				NumberSequenceKeypoint.new(1, 1)
			})
		}) else nil,
		OnMediaExtendedHeight = if IsOnMedia then ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, Tokens.Size.Size_1000) }) else nil,
		Bar = ReactModule.createElement("Frame", {
			Selectable = false,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = Padding.Top,
				PaddingRight = Padding.Right,
				PaddingBottom = Padding.Bottom,
				PaddingLeft = Padding.Left
			}),
			ThreeSectionBar = ReactModule.createElement(ThreeSectionBarModule, {
				BackgroundTransparency = 1,
				barHeight = if AutomaticHeight then 0 else math.max(0, JoinResult.barHeight - Padding.Top.Offset - Padding.Bottom.Offset),
				automaticHeight = AutomaticHeight,
				renderLeft = UseRenderLeftResult,
				renderCenter = UseMemoResult,
				renderRight = RenderRight,
				estimatedCenterWidth = UseMemoResult1,
				sectionSpacing = Tokens.Size.Size_300,
				contentPaddingRight = UseMemoResult2
			})
		}),
		HeaderClickArea = if OnHeaderActivated then ReactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			Size = UDim2.fromScale(1, 1),
			Selectable = false,
			[ReactModule.Event.Activated] = OnHeaderActivated,
			ZIndex = 0
		}) else nil,
		BottomDivider = if HasDivider then ReactModule.createElement("Frame", {
			Selectable = false,
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.new(1, 0, 0, Tokens.Stroke.Standard),
			Position = UDim2.new(0, 0, 1, -Tokens.Stroke.Standard),
			BackgroundColor3 = Tokens.Color.Stroke.Emphasis.Color3,
			BackgroundTransparency = Tokens.Color.Stroke.Emphasis.Transparency
		}) else nil
	})
end