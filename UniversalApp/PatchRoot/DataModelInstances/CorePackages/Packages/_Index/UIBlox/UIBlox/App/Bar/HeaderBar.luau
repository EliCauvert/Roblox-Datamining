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

local function useHeaderBarStyle(p1, p2)
	-- upvalues: reactModule (ref), UIBloxConfigModule (ref)
	local tokens = p2.Tokens
	local theme = p2.Theme
	local backgroundStyle = p1.backgroundStyle
	local backgroundTransparency = p1.backgroundTransparency
	local isOnMedia = p1.isOnMedia
	local var1 = reactModule.useMemo(function()
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
	local paddingTop = p1.paddingTop
	local paddingRight = p1.paddingRight
	local paddingBottom = p1.paddingBottom
	local paddingLeft = p1.paddingLeft
	local margin = p1.margin
	
	return {
		BackgroundStyle = var1,
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

local function useRenderLeft(p1, p2)
	-- upvalues: reactModule (ref), cryoModule (ref), UIBloxConfigModule (ref), genericTextLabelModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), p2 (ref), cryoModule (copy), UIBloxConfigModule (copy), genericTextLabelModule (copy)
		local title = p1.title
		local renderLeft = p1.renderLeft
		local isTitleCentered = p1.isTitleCentered
		local isSecondary = p1.isSecondary
		local shouldHideSecondaryLeftItem = p1.shouldHideSecondaryLeftItem
		local var1 = if renderLeft ~= nil then renderLeft == reactModule.None else true
		local tokens = p2.Tokens
		local renderLeft_1 = p1.renderLeft
		
		if var1 and string.len(title) > 0 then
			renderLeft_1 = function(p3)
				-- upvalues: cryoModule (copy), reactModule (copy), UIBloxConfigModule (copy), tokens (ref), genericTextLabelModule (copy), title (ref)
				return reactModule.createElement(reactModule.Fragment, nil, {
					Text = reactModule.createElement(genericTextLabelModule, {
						fluidSizing = true,
						Text = title,
						TextXAlignment = Enum.TextXAlignment.Left,
						fontStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.HeadingLarge else tokens.Semantic.Typography.Title,
						colorStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis else tokens.Semantic.Color.Text.Emphasis
					}, cryoModule.Dictionary.join(p3.children, {
						TextPadding = reactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25),
							PaddingBottom = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25)
						})
					}))
				})
			end
			
			return renderLeft_1
		elseif isSecondary and not shouldHideSecondaryLeftItem and string.len(title) > 0 then
			local theme = p2.Theme
			local font = p2.Font
			local header2 = font.Header2
			local var2 = header2.RelativeSize * font.BaseSize
			
			renderLeft_1 = function()
				-- upvalues: reactModule (copy), var2 (ref), renderLeft (ref), theme (ref), genericTextLabelModule (copy), title (ref), header2 (ref)
				return reactModule.createElement(reactModule.Fragment, nil, {
					Text = reactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, var2)
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
			local var3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.HeadingSmall else tokens.Semantic.Typography.Header
			local fontSize = var3.FontSize
			
			renderLeft_1 = function()
				-- upvalues: reactModule (copy), fontSize (ref), UIBloxConfigModule (copy), tokens (ref), renderLeft (ref), genericTextLabelModule (copy), title (ref), var3 (ref)
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
							fontStyle = var3,
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
		p1.title, p1.isTitleCentered, p1.renderLeft, p1.isSecondary,
		p1.shouldHideSecondaryLeftItem, p2
	})
end

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), reactModule (ref), useRenderLeft (ref), UIBloxConfigModule (ref), genericTextLabelModule (ref), getTextSizeModule (ref), useHeaderBarStyle (ref), threeSectionBarModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useStyleModule()
	local tokens = var2.Tokens
	local title = var1.title
	local renderCenter = var1.renderCenter
	local renderRight = var1.renderRight
	local isTitleCentered = var1.isTitleCentered
	local isSecondary = var1.isSecondary
	local onHeaderActivated = var1.onHeaderActivated
	local contentPaddingRight = var1.contentPaddingRight
	local automaticHeight = var1.automaticHeight
	local isOnMedia = var1.isOnMedia
	local zIndex = var1.zIndex
	local hasDivider = var1.hasDivider
	local var3 = if var1.renderLeft ~= nil then var1.renderLeft == reactModule.None else true
	local var4 = useRenderLeft(var1, var2)
	local var5 = reactModule.useMemo(function()
		-- upvalues: renderCenter (ref), var3 (ref), isSecondary (ref), isTitleCentered (ref), UIBloxConfigModule (copy), tokens (ref), reactModule (copy), genericTextLabelModule (copy), title (ref)
		local var6 = renderCenter
		
		if not var6 and not var3 and (not isSecondary and isTitleCentered) then
			local var7 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.HeadingSmall else tokens.Semantic.Typography.Header
			local fontSize = var7.FontSize
			
			var6 = function()
				-- upvalues: reactModule (copy), genericTextLabelModule (copy), fontSize (ref), title (copy), var7 (ref), UIBloxConfigModule (copy), tokens (copy)
				return reactModule.createElement(genericTextLabelModule, {
					Selectable = false,
					ClipsDescendants = true,
					TextWrapped = false,
					Size = UDim2.new(1, 0, 0, fontSize),
					Text = title,
					TextTruncate = Enum.TextTruncate.AtEnd,
					fontStyle = var7,
					colorStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis else tokens.Semantic.Color.Text.Emphasis
				}, {
					TextPadding = reactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25),
						PaddingBottom = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25)
					})
				})
			end
		end
		return var6
	end, {
		renderCenter, var3, isSecondary, isTitleCentered, tokens, title
	})
	local var6 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), renderCenter (ref), renderRight (ref), var3 (ref), isSecondary (ref), isTitleCentered (ref), UIBloxConfigModule (copy), tokens (ref), getTextSizeModule (copy), title (ref)
		if var4 and renderCenter and renderRight then
			return 0
		elseif renderCenter or var3 or (isSecondary or not isTitleCentered) then
			return 1e999
		end
		local var7 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.HeadingSmall else tokens.Semantic.Typography.Header
		
		return getTextSizeModule(title, var7.FontSize, var7.Font, Vector2.new(1e999, 1e999)).X
	end, {
		title, isTitleCentered, var3, var4, renderCenter, renderRight, isSecondary,
		tokens
	})
	local var7 = reactModule.useMemo(function()
		-- upvalues: contentPaddingRight (ref), var3 (ref), UIBloxConfigModule (copy), tokens (ref)
		return contentPaddingRight or (if var3 then UDim.new(0, 0) else UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_600 else tokens.Global.Space_300))
	end, { contentPaddingRight, var3, tokens })
	local var8 = useHeaderBarStyle(var1, var2)
	local backgroundStyle = var8.BackgroundStyle
	local padding = var8.Padding
	
	return reactModule.createElement("Frame", {
		Selectable = false,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, if isOnMedia then var1.barHeight + (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1000 else tokens.Global.Size_500) else var1.barHeight),
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
				barHeight = if automaticHeight then 0 else math.max(0, var1.barHeight - padding.Top.Offset - padding.Bottom.Offset),
				automaticHeight = automaticHeight,
				renderLeft = var4,
				renderCenter = var5,
				renderRight = renderRight,
				estimatedCenterWidth = var6,
				sectionSpacing = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Space_150,
				contentPaddingRight = var7
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