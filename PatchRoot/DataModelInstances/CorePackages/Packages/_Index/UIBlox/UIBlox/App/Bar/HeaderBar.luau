-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:51 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
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

local function useHeaderBarStyle(p0, p1) --[[ line: 92 ]]
	-- upvalues: reactModule (ref)
	local tokens = p1.Tokens
	local theme = p1.Theme
	local backgroundStyle = p0.backgroundStyle
	local backgroundTransparency = p0.backgroundTransparency
	local isOnMedia = p0.isOnMedia
	local var9 = reactModule.useMemo(function() --[[ line: 99 ]]
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
		BackgroundStyle = var9,
		Padding = reactModule.useMemo(function() --[[ line: 123 ]]
			-- upvalues: paddingTop (ref), tokens (ref), paddingRight (ref), paddingBottom (ref), paddingLeft (ref), margin (ref)
			local t = {
				Top = paddingTop or UDim.new(0, tokens.Global.Space_100),
				Right = paddingRight or UDim.new(0, tokens.Global.Space_250),
				Bottom = paddingBottom or UDim.new(0, tokens.Global.Space_100),
				Left = paddingLeft or UDim.new(0, tokens.Global.Space_250)
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

local function useRenderLeft(p2, p3) --[[ line: 144 ]]
	-- upvalues: reactModule (ref), cryoModule (ref), genericTextLabelModule (ref)
	return reactModule.useMemo(function() --[[ line: 145 ]]
		-- upvalues: p2 (ref), reactModule (copy), p3 (ref), cryoModule (copy), genericTextLabelModule (copy)
		local title = p2.title
		local renderLeft = p2.renderLeft
		local isTitleCentered = p2.isTitleCentered
		local isSecondary = p2.isSecondary
		local shouldHideSecondaryLeftItem = p2.shouldHideSecondaryLeftItem
		local var12 = if renderLeft ~= nil then renderLeft == reactModule.None else true
		local tokens = p3.Tokens
		local renderLeft_1 = p2.renderLeft
		
		if var12 and string.len(title) > 0 then
			renderLeft_1 = function(p4) --[[ line: 156 ]]
				-- upvalues: cryoModule (copy), reactModule (copy), tokens (ref), genericTextLabelModule (copy), title (ref)
				return reactModule.createElement(reactModule.Fragment, nil, {
					Text = reactModule.createElement(genericTextLabelModule, {
						fluidSizing = true,
						Text = title,
						TextXAlignment = Enum.TextXAlignment.Left,
						fontStyle = tokens.Semantic.Typography.Title,
						colorStyle = tokens.Semantic.Color.Text.Emphasis
					}, cryoModule.Dictionary.join(p4.children, {
						TextPadding = reactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, tokens.Global.Space_25),
							PaddingBottom = UDim.new(0, tokens.Global.Space_25)
						})
					}))
				})
			end
			
			return renderLeft_1
		elseif isSecondary and not shouldHideSecondaryLeftItem and string.len(title) > 0 then
			local theme = p3.Theme
			local font = p3.Font
			local header2 = font.Header2
			local var13 = header2.RelativeSize * font.BaseSize
			
			renderLeft_1 = function() --[[ line: 181 ]]
				-- upvalues: reactModule (copy), var13 (ref), renderLeft (ref), theme (ref), genericTextLabelModule (copy), title (ref), header2 (ref)
				return reactModule.createElement(reactModule.Fragment, nil, {
					Text = reactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, var13)
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
			local header = tokens.Semantic.Typography.Header
			local fontSize = header.FontSize
			
			renderLeft_1 = function() --[[ line: 230 ]]
				-- upvalues: reactModule (copy), fontSize (ref), tokens (ref), renderLeft (ref), genericTextLabelModule (copy), title (ref), header (ref)
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
							Padding = UDim.new(0, tokens.Global.Space_150)
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
							fontStyle = header,
							colorStyle = tokens.Semantic.Color.Text.Emphasis
						}, {
							TextPadding = reactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, tokens.Global.Space_25),
								PaddingBottom = UDim.new(0, tokens.Global.Space_25)
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

return function(p5) --[[ line: 286 | named "HeaderBar" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), reactModule (ref), useRenderLeft (ref), genericTextLabelModule (ref), getTextSizeModule (ref), useHeaderBarStyle (ref), threeSectionBarModule (ref)
	local var14 = cryoModule.Dictionary.join(t, p5)
	local var15 = useStyleModule()
	local tokens = var15.Tokens
	local title = var14.title
	local renderCenter = var14.renderCenter
	local renderRight = var14.renderRight
	local isTitleCentered = var14.isTitleCentered
	local isSecondary = var14.isSecondary
	local onHeaderActivated = var14.onHeaderActivated
	local contentPaddingRight = var14.contentPaddingRight
	local automaticHeight = var14.automaticHeight
	local isOnMedia = var14.isOnMedia
	local zIndex = var14.zIndex
	local hasDivider = var14.hasDivider
	local var16 = if var14.renderLeft ~= nil then var14.renderLeft == reactModule.None else true
	local var17 = useRenderLeft(var14, var15)
	local var18 = reactModule.useMemo(function() --[[ line: 306 ]]
		-- upvalues: renderCenter (ref), var16 (ref), isSecondary (ref), isTitleCentered (ref), tokens (ref), reactModule (copy), genericTextLabelModule (copy), title (ref)
		local var22 = renderCenter
		
		if not var22 and not var16 and (not isSecondary and isTitleCentered) then
			local header = tokens.Semantic.Typography.Header
			local fontSize = header.FontSize
			
			var22 = function() --[[ line: 313 ]]
				-- upvalues: reactModule (copy), genericTextLabelModule (copy), fontSize (ref), title (copy), header (ref), tokens (copy)
				return reactModule.createElement(genericTextLabelModule, {
					Selectable = false,
					ClipsDescendants = true,
					TextWrapped = false,
					Size = UDim2.new(1, 0, 0, fontSize),
					Text = title,
					TextTruncate = Enum.TextTruncate.AtEnd,
					fontStyle = header,
					colorStyle = tokens.Semantic.Color.Text.Emphasis
				}, {
					TextPadding = reactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, tokens.Global.Space_25),
						PaddingBottom = UDim.new(0, tokens.Global.Space_25)
					})
				})
			end
		end
		return var22
	end, {
		renderCenter, var16, isSecondary, isTitleCentered, tokens, title
	})
	local var19 = reactModule.useMemo(function() --[[ line: 334 ]]
		-- upvalues: var17 (ref), renderCenter (ref), renderRight (ref), var16 (ref), isSecondary (ref), isTitleCentered (ref), tokens (ref), getTextSizeModule (copy), title (ref)
		if var17 and renderCenter and renderRight then
			return 0
		elseif renderCenter or var16 or (isSecondary or not isTitleCentered) then
			return 1e999
		end
		local header = tokens.Semantic.Typography.Header
		
		return getTextSizeModule(title, header.FontSize, header.Font, Vector2.new(1e999, 1e999)).X
	end, {
		title, isTitleCentered, var16, var17, renderCenter, renderRight, isSecondary,
		tokens
	})
	local var20 = reactModule.useMemo(function() --[[ line: 351 ]]
		-- upvalues: contentPaddingRight (ref), var16 (ref), tokens (ref)
		return contentPaddingRight or (if var16 then UDim.new(0, 0) else UDim.new(0, tokens.Global.Space_300))
	end, { contentPaddingRight, var16, tokens })
	local var21 = useHeaderBarStyle(var14, var15)
	local backgroundStyle = var21.BackgroundStyle
	local padding = var21.Padding
	
	return reactModule.createElement("Frame", {
		Selectable = false,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, if isOnMedia then var14.barHeight + tokens.Global.Size_500 else var14.barHeight),
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
		OnMediaExtendedHeight = if isOnMedia then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, tokens.Global.Size_500) }) else nil,
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
				barHeight = if automaticHeight then 0 else math.max(0, var14.barHeight - padding.Top.Offset - padding.Bottom.Offset),
				automaticHeight = automaticHeight,
				renderLeft = var17,
				renderCenter = var18,
				renderRight = renderRight,
				estimatedCenterWidth = var19,
				sectionSpacing = tokens.Global.Space_150,
				contentPaddingRight = var20
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
			Size = UDim2.new(1, 0, 0, tokens.Global.Stroke_100),
			Position = UDim2.new(0, 0, 1, -tokens.Global.Stroke_100),
			BackgroundColor3 = tokens.Semantic.Color.Common.Divider.Color3,
			BackgroundTransparency = tokens.Semantic.Color.Common.Divider.Transparency
		}) else nil
	})
end