local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local UIBloxConfigModule = require(parent.UIBloxConfig)
local cryoModule = require(parent_1.Cryo)
local reactModule = require(parent_1.React)
local label = require(parent.Core.ImageSet.ImageSetComponent).Label
local genericTextLabelModule = require(parent.Core.Text.GenericTextLabel.GenericTextLabel)
local useStyleModule = require(parent.Core.Style.useStyle)
local _ = require(parent.App.Style.StyleTypes)
local _ = require(parent.App.Style.Fonts)
local t = {
	faceGroupCount = 3,
	maxBadgeDisplayNumber = 99,
	showEmphasisBorder = false,
	size = UDim2.fromScale(1, 1),
	styleProps = {}
}
local t_1 = {
	containerGap = 6,
	faceGroupGap = -9,
	faceBorderWidth = 3,
	faceBorderRadius = 50,
	faceWidth = 24,
	faceHeight = 24,
	badgeBorderWidth = 3,
	badgeBorderRadius = 50,
	badgeSpacingLeading = 9,
	badgeSpacingTrailing = 9,
	badgeHeight = 24
}

local function _(p0) --[[ line: 136 | named "getAvatarImage" ]]
	return string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", tostring(p0))
end

local function renderCornerStroke(p1) --[[ line: 140 ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.borderRadius) }),
		Stroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = p1.borderColor.Color,
			Transparency = p1.borderColor.Transparency,
			Thickness = p1.borderWidth
		})
	})
end

local function renderEmphasisBorder(p2, p3, p4, p5) --[[ line: 154 ]]
	-- upvalues: reactModule (ref), renderCornerStroke (ref)
	local theme = p4.Theme
	local var12 = p2 - 1
	local var13 = (1 - p2) / 2
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, var13, 0, var13),
		Size = UDim2.new(1, var12, 1, var12),
		ZIndex = p5
	}, {
		renderCornerStroke({
			borderWidth = 1,
			borderColor = theme.ContextualPrimaryDefault,
			borderRadius = p3.badgeBorderRadius
		})
	})
end

local function renderBadge(p6, p7, p8) --[[ line: 177 ]]
	-- upvalues: reactModule (ref), renderCornerStroke (ref), renderEmphasisBorder (ref)
	local var14 = if p6.maxDisplayNumber < p6.usersCount then tostring(p6.maxDisplayNumber) .. "+" else tostring(p6.usersCount)
	local theme = p8.Theme
	local font = p8.Font
	local badgeBackgroundColor = p7.badgeBackgroundColor or theme.BackgroundUIDefault
	local badgeBorderWidth = p7.badgeBorderWidth
	local badgeBorderColor = p7.badgeBorderColor or p8.Theme.BackgroundDefault
	local badgeBorderRadius = p7.badgeBorderRadius
	local badgeSpacingLeading = p7.badgeSpacingLeading
	local badgeSpacingTrailing = p7.badgeSpacingTrailing
	local badgeHeight = p7.badgeHeight
	local badgeContentColor = p7.badgeContentColor or theme.TextMuted
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = p6.layoutOrder,
		ZIndex = p6.ZIndex,
		Size = UDim2.fromOffset(0, badgeHeight),
		BackgroundColor3 = badgeBackgroundColor.Color,
		AutomaticSize = Enum.AutomaticSize.X
	}, {
		BadgeContainer = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = p6.layoutOrder,
			ZIndex = p6.ZIndex,
			Size = UDim2.fromOffset(0, badgeHeight),
			BackgroundColor3 = badgeBackgroundColor.Color,
			BackgroundTransparency = badgeBackgroundColor.Transparency,
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			renderCornerStroke({
				borderWidth = badgeBorderWidth,
				borderColor = badgeBorderColor,
				borderRadius = badgeBorderRadius
			}),
			SizeConstraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(badgeHeight, 0) }),
			Content = reactModule.createElement("TextLabel", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Text = var14,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = font.CaptionHeader.Font,
				TextSize = font.BaseSize * font.CaptionHeader.RelativeSize,
				TextColor3 = badgeContentColor.Color,
				TextTransparency = badgeContentColor.Transparency,
				AutomaticSize = Enum.AutomaticSize.X,
				ZIndex = p6.ZIndex + 1
			}, {
				Padding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, badgeSpacingLeading),
					PaddingRight = UDim.new(0, badgeSpacingTrailing)
				})
			})
		}),
		emphasisBorder = if p6.showEmphasisBorder then renderEmphasisBorder(badgeBorderWidth, p7, p8, p6.ZIndex + 1) else nil
	})
end

local function renderFaceImage(p9, p10, p11) --[[ line: 251 ]]
	-- upvalues: reactModule (ref), label (ref), renderCornerStroke (ref), renderEmphasisBorder (ref)
	local faceBackgroundColor = p10.faceBackgroundColor or p11.Theme.TextDefault
	local faceBorderWidth = p10.faceBorderWidth
	
	return reactModule.createElement(label, {
		BorderSizePixel = 0,
		LayoutOrder = p9.layoutOrder,
		ZIndex = p9.ZIndex,
		Size = UDim2.fromOffset(p10.faceWidth, p10.faceHeight),
		Image = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", tostring(p9.user)),
		BackgroundColor3 = faceBackgroundColor.Color,
		BackgroundTransparency = faceBackgroundColor.Transparency
	}, {
		renderCornerStroke({
			borderWidth = faceBorderWidth,
			borderColor = p10.faceBorderColor or p11.Theme.BackgroundDefault,
			borderRadius = p10.faceBorderRadius
		}),
		emphasisBorder = if p9.showEmphasisBorder then renderEmphasisBorder(faceBorderWidth, p10, p11, p9.ZIndex + 1) else nil
	})
end

local function renderFaces(p12, p13, p14, p15, p16, p17) --[[ line: 278 ]]
	-- upvalues: reactModule (ref), renderBadge (ref), renderFaceImage (ref)
	local users = p12.users
	local faceGroupGap = p13.faceGroupGap
	local badgeBorderWidth = p13.badgeBorderWidth
	local faceBorderWidth = p13.faceBorderWidth
	local maxValue = math.max(badgeBorderWidth, faceBorderWidth)
	local t = {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, faceGroupGap)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, badgeBorderWidth),
			PaddingTop = UDim.new(0, maxValue),
			PaddingRight = UDim.new(0, faceBorderWidth),
			PaddingBottom = UDim.new(0, maxValue)
		}),
		Badge = if p16 then renderBadge({
			layoutOrder = 0,
			usersCount = #users,
			ZIndex = p15 + 1,
			maxDisplayNumber = p12.maxBadgeDisplayNumber,
			showEmphasisBorder = p12.showEmphasisBorder
		}, p13, p14) else nil
	}
	
	for i = 1, math.min(p17, #users) do
		t["Face_" .. i] = renderFaceImage({
			user = users[i],
			layoutOrder = i,
			ZIndex = p15 - i,
			showEmphasisBorder = p12.showEmphasisBorder
		}, p13, p14)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY
	}, t)
end

return function(p18) --[[ line: 332 | named "CoPlayFooter" ]]
	-- upvalues: cryoModule (ref), t (ref), UIBloxConfigModule (ref), useStyleModule (ref), reactModule (ref), t_1 (ref), renderFaces (ref), genericTextLabelModule (ref)
	local var21 = cryoModule.Dictionary.join(t, p18)
	
	if not UIBloxConfigModule.fixCoplayFooterConditionalHooks and (not var21.users or #var21.users == 0) then
		return nil
	end
	local var22 = useStyleModule()
	local var23, var24 = reactModule.useBinding(Vector2.new(0, 0))
	local var25 = cryoModule.Dictionary.join(t_1, var21.styleProps)
	local var26 = nil
	
	if UIBloxConfigModule.fixCoplayFooterConditionalHooks then
		var26 = reactModule.useCallback(function(p19) --[[ line: 346 ]]
			-- upvalues: var24 (ref)
			var24(p19.AbsoluteSize)
		end, { var24 })
		
		if not var21.users or #var21.users == 0 then
			return nil
		end
	end
	local containerGap = var25.containerGap
	local labelContentColor = var25.labelContentColor or var22.Theme.TextMuted
	local faceGroupCount = var21.faceGroupCount
	local var28 = faceGroupCount + 1 < #var21.users
	
	if not var28 then
		faceGroupCount += 1
	end
	local var29 = faceGroupCount + 1
	
	if not UIBloxConfigModule.fixCoplayFooterConditionalHooks then
		var26 = reactModule.useCallback(function(p20) --[[ line: 367 ]]
			-- upvalues: var24 (ref)
			var24(p20.AbsoluteSize)
		end, { var24 })
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = var21.size,
		Position = var21.position,
		AnchorPoint = var21.anchorPoint,
		LayoutOrder = var21.layoutOrder
	}, {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, containerGap)
		}),
		FacesFrame = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			[reactModule.Change.AbsoluteSize] = var26
		}, {
			Faces = renderFaces(var21, var25, var22, var29, var28, faceGroupCount)
		}),
		LabelFrame = if var21.labelText then reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var23:map(function(p21) --[[ line: 397 ]]
				-- upvalues: containerGap (ref)
				return UDim2.new(1, (-p21.X) - containerGap, 1, 0)
			end)
		}, {
			Label = reactModule.createElement(genericTextLabelModule, {
				TextWrapped = false,
				Size = UDim2.fromScale(1, 1),
				Text = var21.labelText,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				fontStyle = var25.fontStyle or var22.Font.CaptionBody,
				colorStyle = labelContentColor
			})
		}) else nil
	})
end