local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local reactModule = require(parent_2.React)
local cryoModule = require(parent_2.Cryo)
local _ = require(parent.Style.StyleTypes)
local _ = require(parent.Style.Fonts)
local useStyleModule = require(parent_1.Core.Style.useStyle)
local genericTextLabelModule = require(parent_1.Core.Text.GenericTextLabel.GenericTextLabel)
local getTextSizeModule = require(parent_1.Core.Text.GetTextSize)
local threeSectionBarModule = require(parent_1.Core.Bar.ThreeSectionBar)
local t = {
	barHeight = 48,
	title = "",
	isTitleCentered = true,
	isSecondary = false,
	isOnMedia = false,
	hasDivider = false
}

local function useHeaderBarStyle(p0, p1)
	-- upvalues: reactModule (ref), UIBloxConfigModule (ref)
	local tokens = p1.Tokens
	local theme = p1.Theme
	local backgroundStyle = p0.backgroundStyle
	local backgroundTransparency = p0.backgroundTransparency
	local isOnMedia = p0.isOnMedia
	local var10 = reactModule.useMemo(function()
		-- upvalues: isOnMedia (ref), backgroundStyle (ref), theme (ref), backgroundTransparency (ref)
		if isOnMedia then
			return {}
		end
		local backgroundStyle_1 = backgroundStyle or {
			Color3 = theme.BackgroundDefault.Color,
			Transparency = theme.BackgroundDefault.Transparency
		}
		
		if backgroundTransparency then
			backgroundStyle_1.Transparency = backgroundTransparency
		end
		return backgroundStyle_1
	end, {
		isOnMedia,
		backgroundStyle,
		backgroundTransparency,
		theme
	})
	local paddingTop = p0.paddingTop
	local paddingRight = p0.paddingRight
	local paddingBottom = p0.paddingBottom
	local paddingLeft = p0.paddingLeft
	local margin = p0.margin
	
	return {
		BackgroundStyle = var10,
		Padding = reactModule.useMemo(function()
			-- upvalues: paddingTop (ref), UIBloxConfigModule (copy), tokens (ref), paddingRight (ref), paddingBottom (ref), paddingLeft (ref), margin (ref)
			local t = {
				Top = paddingTop or UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100),
				Right = paddingRight or UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_500 else tokens.Global.Space_250),
				Bottom = paddingBottom or UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100),
				Left = paddingLeft or UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_500 else tokens.Global.Space_250)
			}
			
			if margin then
				t.Left = UDim.new(0, margin)
				t.Right = UDim.new(0, margin)
			end
			return t
		end, {
			paddingTop, paddingRight, paddingBottom, paddingLeft, margin, tokens
		})
	}
end

local function useRenderLeft(p2, p3)
	-- upvalues: reactModule (ref), cryoModule (ref), UIBloxConfigModule (ref), genericTextLabelModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p2 (ref), reactModule (copy), p3 (ref), cryoModule (copy), UIBloxConfigModule (copy), genericTextLabelModule (copy)
		local title = p2.title
		local renderLeft = p2.renderLeft
		local isTitleCentered = p2.isTitleCentered
		local isSecondary = p2.isSecondary
		local shouldHideSecondaryLeftItem = p2.shouldHideSecondaryLeftItem
		local var13 = if renderLeft ~= nil then renderLeft == reactModule.None else true
		local tokens = p3.Tokens
		local renderLeft_1 = p2.renderLeft
		
		if var13 and string.len(title) > 0 then
			renderLeft_1 = function(p4)
				-- upvalues: cryoModule (copy), reactModule (copy), UIBloxConfigModule (copy), tokens (ref), genericTextLabelModule (copy), title (ref)
				return reactModule.createElement(reactModule.Fragment, nil, {
					Text = reactModule.createElement(genericTextLabelModule, {
						fluidSizing = true,
						Text = title,
						TextXAlignment = Enum.TextXAlignment.Left,
						fontStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.HeadingLarge else tokens.Semantic.Typography.Title,
						colorStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis else tokens.Semantic.Color.Text.Emphasis
					}, cryoModule.Dictionary.join(p4.children, {
						TextPadding = reactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25),
							PaddingBottom = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25)
						})
					}))
				})
			end
			
			return renderLeft_1
		elseif isSecondary and not shouldHideSecondaryLeftItem and string.len(title) > 0 then
			local theme = p3.Theme
			local font = p3.Font
			local header2 = font.Header2
			local var14 = header2.RelativeSize * font.BaseSize
			
			renderLeft_1 = function()
				-- upvalues: reactModule (copy), var14 (ref), renderLeft (ref), theme (ref), genericTextLabelModule (copy), title (ref), header2 (ref)
				return reactModule.createElement(reactModule.Fragment, nil, {
					Text = reactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, var14)
					}, {
						Layout = reactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Horizontal,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, 12)
						}),
						Left = reactModule.createElement("Frame", {
							LayoutOrder = 1,
							Selectable = false,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							Size = UDim2.fromOffset(0, 0),
							AutomaticSize = Enum.AutomaticSize.XY
						}, { LeftContent = if renderLeft then renderLeft() else nil }),
						Divider = reactModule.createElement("Frame", {
							LayoutOrder = 2,
							Selectable = false,
							BorderSizePixel = 0,
							BackgroundColor3 = theme.Divider.Color,
							BackgroundTransparency = theme.Divider.Transparency,
							Size = UDim2.new(0, 1, 1, 0)
						}),
						TextLabel = reactModule.createElement(genericTextLabelModule, {
							LayoutOrder = 3,
							Selectable = false,
							ClipsDescendants = true,
							TextWrapped = false,
							Text = title,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextXAlignment = Enum.TextXAlignment.Left,
							fontStyle = header2,
							colorStyle = theme.TextEmphasis
						})
					})
				})
			end
			
			return renderLeft_1
		elseif not isSecondary and not isTitleCentered then
			local var15 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.HeadingSmall else tokens.Semantic.Typography.Header
			local fontSize = var15.FontSize
			
			renderLeft_1 = function()
				-- upvalues: reactModule (copy), fontSize (ref), UIBloxConfigModule (copy), tokens (ref), renderLeft (ref), genericTextLabelModule (copy), title (ref), var15 (ref)
				return reactModule.createElement(reactModule.Fragment, nil, {
					LeftFrame = reactModule.createElement("Frame", {
						Selectable = false,
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, fontSize)
					}, {
						Layout = reactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Horizontal,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Space_150)
						}),
						Left = reactModule.createElement("Frame", {
							LayoutOrder = 1,
							Selectable = false,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							Size = UDim2.fromOffset(0, 0),
							AutomaticSize = Enum.AutomaticSize.XY
						}, { LeftContent = if renderLeft then renderLeft() else nil }),
						TextLabel = reactModule.createElement(genericTextLabelModule, {
							LayoutOrder = 2,
							Selectable = false,
							ClipsDescendants = true,
							TextWrapped = false,
							Text = title,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextXAlignment = Enum.TextXAlignment.Left,
							fontStyle = var15,
							colorStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis else tokens.Semantic.Color.Text.Emphasis
						}, {
							TextPadding = reactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25),
								PaddingBottom = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25)
							})
						})
					})
				})
			end
		end
		return renderLeft_1
	end, {
		p2.title, p2.isTitleCentered, p2.renderLeft, p2.isSecondary,
		p2.shouldHideSecondaryLeftItem, p3
	})
end

return function(p5)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), reactModule (ref), useRenderLeft (ref), UIBloxConfigModule (ref), genericTextLabelModule (ref), getTextSizeModule (ref), useHeaderBarStyle (ref), threeSectionBarModule (ref)
	local var16 = cryoModule.Dictionary.join(t, p5)
	local var17 = useStyleModule()
	local tokens = var17.Tokens
	local title = var16.title
	local renderCenter = var16.renderCenter
	local renderRight = var16.renderRight
	local isTitleCentered = var16.isTitleCentered
	local isSecondary = var16.isSecondary
	local onHeaderActivated = var16.onHeaderActivated
	local contentPaddingRight = var16.contentPaddingRight
	local automaticHeight = var16.automaticHeight
	local isOnMedia = var16.isOnMedia
	local zIndex = var16.zIndex
	local hasDivider = var16.hasDivider
	local var18 = if var16.renderLeft ~= nil then var16.renderLeft == reactModule.None else true
	local var19 = useRenderLeft(var16, var17)
	local var20 = reactModule.useMemo(function()
		-- upvalues: renderCenter (ref), var18 (ref), isSecondary (ref), isTitleCentered (ref), UIBloxConfigModule (copy), tokens (ref), reactModule (copy), genericTextLabelModule (copy), title (ref)
		local var24 = renderCenter
		
		if not var24 and not var18 and (not isSecondary and isTitleCentered) then
			local var25 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.HeadingSmall else tokens.Semantic.Typography.Header
			local fontSize = var25.FontSize
			
			var24 = function()
				-- upvalues: reactModule (copy), genericTextLabelModule (copy), fontSize (ref), title (copy), var25 (ref), UIBloxConfigModule (copy), tokens (copy)
				return reactModule.createElement(genericTextLabelModule, {
					Selectable = false,
					ClipsDescendants = true,
					TextWrapped = false,
					Size = UDim2.new(1, 0, 0, fontSize),
					Text = title,
					TextTruncate = Enum.TextTruncate.AtEnd,
					fontStyle = var25,
					colorStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis else tokens.Semantic.Color.Text.Emphasis
				}, {
					TextPadding = reactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25),
						PaddingBottom = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25)
					})
				})
			end
		end
		return var24
	end, {
		renderCenter, var18, isSecondary, isTitleCentered, tokens, title
	})
	local var21 = reactModule.useMemo(function()
		-- upvalues: var19 (ref), renderCenter (ref), renderRight (ref), var18 (ref), isSecondary (ref), isTitleCentered (ref), UIBloxConfigModule (copy), tokens (ref), getTextSizeModule (copy), title (ref)
		if var19 and renderCenter and renderRight then
			return 0
		elseif renderCenter or var18 or (isSecondary or not isTitleCentered) then
			return 1e999
		end
		local var26 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.HeadingSmall else tokens.Semantic.Typography.Header
		
		return getTextSizeModule(title, var26.FontSize, var26.Font, Vector2.new(1e999, 1e999)).X
	end, {
		title, isTitleCentered, var18, var19, renderCenter, renderRight, isSecondary,
		tokens
	})
	local var22 = reactModule.useMemo(function()
		-- upvalues: contentPaddingRight (ref), var18 (ref), UIBloxConfigModule (copy), tokens (ref)
		return contentPaddingRight or (if var18 then UDim.new(0, 0) else UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_600 else tokens.Global.Space_300))
	end, { contentPaddingRight, var18, tokens })
	local var23 = useHeaderBarStyle(var16, var17)
	local backgroundStyle = var23.BackgroundStyle
	local padding = var23.Padding
	
	return reactModule.createElement("Frame", {
		Selectable = false,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, if isOnMedia then var16.barHeight + (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1000 else tokens.Global.Size_500) else var16.barHeight),
		BackgroundColor3 = backgroundStyle.Color3,
		BackgroundTransparency = backgroundStyle.Transparency,
		AutomaticSize = if automaticHeight then Enum.AutomaticSize.Y else nil,
		ZIndex = zIndex
	}, {
		Gradient = if isOnMedia then reactModule.createElement("UIGradient", {
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
		OnMediaExtendedHeight = if isOnMedia then reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1000 else tokens.Global.Size_500)
		}) else nil,
		Bar = reactModule.createElement("Frame", {
			Selectable = false,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = padding.Top,
				PaddingRight = padding.Right,
				PaddingBottom = padding.Bottom,
				PaddingLeft = padding.Left
			}),
			ThreeSectionBar = reactModule.createElement(threeSectionBarModule, {
				BackgroundTransparency = 1,
				barHeight = if automaticHeight then 0 else math.max(0, var16.barHeight - padding.Top.Offset - padding.Bottom.Offset),
				automaticHeight = automaticHeight,
				renderLeft = var19,
				renderCenter = var20,
				renderRight = renderRight,
				estimatedCenterWidth = var21,
				sectionSpacing = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Space_150,
				contentPaddingRight = var22
			})
		}),
		HeaderClickArea = if onHeaderActivated then reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			Size = UDim2.fromScale(1, 1),
			Selectable = false,
			[reactModule.Event.Activated] = onHeaderActivated,
			ZIndex = 0
		}) else nil,
		BottomDivider = if hasDivider then reactModule.createElement("Frame", {
			Selectable = false,
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.new(1, 0, 0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Stroke.Standard else tokens.Global.Stroke_100),
			Position = UDim2.new(0, 0, 1, -(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Stroke.Standard else tokens.Global.Stroke_100)),
			BackgroundColor3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Stroke.Emphasis.Color3 else tokens.Semantic.Color.Common.Divider.Color3,
			BackgroundTransparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Stroke.Emphasis.Transparency else tokens.Semantic.Color.Common.Divider.Transparency
		}) else nil
	})
end