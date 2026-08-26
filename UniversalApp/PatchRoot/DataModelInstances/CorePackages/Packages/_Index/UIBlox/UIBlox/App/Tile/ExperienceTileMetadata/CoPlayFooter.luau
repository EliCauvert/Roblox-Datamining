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

local function _(p1)
	return string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", tostring(p1))
end

local function renderCornerStroke(p1)
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

local function renderEmphasisBorder(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), renderCornerStroke (ref)
	local theme = p3.Theme
	local var1 = p1 - 1
	local var2 = (1 - p1) / 2
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, var2, 0, var2),
		Size = UDim2.new(1, var1, 1, var1),
		ZIndex = p4
	}, {
		renderCornerStroke({
			borderWidth = 1,
			borderColor = theme.ContextualPrimaryDefault,
			borderRadius = p2.badgeBorderRadius
		})
	})
end

local function renderBadge(p1, p2, p3)
	-- upvalues: reactModule (ref), renderCornerStroke (ref), renderEmphasisBorder (ref)
	local var1 = if p1.maxDisplayNumber < p1.usersCount then tostring(p1.maxDisplayNumber) .. "+" else tostring(p1.usersCount)
	local theme = p3.Theme
	local font = p3.Font
	local badgeBackgroundColor = p2.badgeBackgroundColor or theme.BackgroundUIDefault
	local badgeBorderWidth = p2.badgeBorderWidth
	local badgeBorderColor = p2.badgeBorderColor or p3.Theme.BackgroundDefault
	local badgeBorderRadius = p2.badgeBorderRadius
	local badgeSpacingLeading = p2.badgeSpacingLeading
	local badgeSpacingTrailing = p2.badgeSpacingTrailing
	local badgeHeight = p2.badgeHeight
	local badgeContentColor = p2.badgeContentColor or theme.TextMuted
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.ZIndex,
		Size = UDim2.fromOffset(0, badgeHeight),
		BackgroundColor3 = badgeBackgroundColor.Color,
		AutomaticSize = Enum.AutomaticSize.X
	}, {
		BadgeContainer = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = p1.layoutOrder,
			ZIndex = p1.ZIndex,
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
				Text = var1,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = font.CaptionHeader.Font,
				TextSize = font.BaseSize * font.CaptionHeader.RelativeSize,
				TextColor3 = badgeContentColor.Color,
				TextTransparency = badgeContentColor.Transparency,
				AutomaticSize = Enum.AutomaticSize.X,
				ZIndex = p1.ZIndex + 1
			}, {
				Padding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, badgeSpacingLeading),
					PaddingRight = UDim.new(0, badgeSpacingTrailing)
				})
			})
		}),
		emphasisBorder = if p1.showEmphasisBorder then renderEmphasisBorder(badgeBorderWidth, p2, p3, p1.ZIndex + 1) else nil
	})
end

local function renderFaceImage(p1, p2, p3)
	-- upvalues: reactModule (ref), label (ref), renderCornerStroke (ref), renderEmphasisBorder (ref)
	local faceBackgroundColor = p2.faceBackgroundColor or p3.Theme.TextDefault
	local faceBorderWidth = p2.faceBorderWidth
	
	return reactModule.createElement(label, {
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.ZIndex,
		Size = UDim2.fromOffset(p2.faceWidth, p2.faceHeight),
		Image = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", tostring(p1.user)),
		BackgroundColor3 = faceBackgroundColor.Color,
		BackgroundTransparency = faceBackgroundColor.Transparency
	}, {
		renderCornerStroke({
			borderWidth = faceBorderWidth,
			borderColor = p2.faceBorderColor or p3.Theme.BackgroundDefault,
			borderRadius = p2.faceBorderRadius
		}),
		emphasisBorder = if p1.showEmphasisBorder then renderEmphasisBorder(faceBorderWidth, p2, p3, p1.ZIndex + 1) else nil
	})
end

local function renderFaces(p1, p2, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), renderBadge (ref), renderFaceImage (ref)
	local users = p1.users
	local faceGroupGap = p2.faceGroupGap
	local badgeBorderWidth = p2.badgeBorderWidth
	local faceBorderWidth = p2.faceBorderWidth
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
		Badge = if p5 then renderBadge({
			layoutOrder = 0,
			usersCount = #users,
			ZIndex = p4 + 1,
			maxDisplayNumber = p1.maxBadgeDisplayNumber,
			showEmphasisBorder = p1.showEmphasisBorder
		}, p2, p3) else nil
	}
	
	for i = 1, math.min(p6, #users) do
		t["Face_" .. i] = renderFaceImage({
			user = users[i],
			layoutOrder = i,
			ZIndex = p4 - i,
			showEmphasisBorder = p1.showEmphasisBorder
		}, p2, p3)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY
	}, t)
end

return function(p7)
	-- upvalues: cryoModule (ref), t (ref), UIBloxConfigModule (ref), useStyleModule (ref), reactModule (ref), t_1 (ref), renderFaces (ref), genericTextLabelModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p7)
	
	if not UIBloxConfigModule.fixCoplayFooterConditionalHooks and (not var1.users or #var1.users == 0) then
		return nil
	end
	local var2 = useStyleModule()
	local var3, var4 = reactModule.useBinding(Vector2.new(0, 0))
	local var5 = cryoModule.Dictionary.join(t_1, var1.styleProps)
	local var6 = nil
	
	if UIBloxConfigModule.fixCoplayFooterConditionalHooks then
		var6 = reactModule.useCallback(function(p8)
			-- upvalues: var4 (ref)
			var4(p8.AbsoluteSize)
		end, { var4 })
		
		if not var1.users or #var1.users == 0 then
			return nil
		end
	end
	local containerGap = var5.containerGap
	local labelContentColor = var5.labelContentColor or var2.Theme.TextMuted
	local faceGroupCount = var1.faceGroupCount
	local var7 = faceGroupCount + 1 < #var1.users
	
	if not var7 then
		faceGroupCount += 1
	end
	local var8 = faceGroupCount + 1
	
	if not UIBloxConfigModule.fixCoplayFooterConditionalHooks then
		var6 = reactModule.useCallback(function(p8)
			-- upvalues: var4 (ref)
			var4(p8.AbsoluteSize)
		end, { var4 })
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = var1.size,
		Position = var1.position,
		AnchorPoint = var1.anchorPoint,
		LayoutOrder = var1.layoutOrder
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
			[reactModule.Change.AbsoluteSize] = var6
		}, {
			Faces = renderFaces(var1, var5, var2, var8, var7, faceGroupCount)
		}),
		LabelFrame = if var1.labelText then reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var3:map(function(p8)
				-- upvalues: containerGap (ref)
				return UDim2.new(1, (-p8.X) - containerGap, 1, 0)
			end)
		}, {
			Label = reactModule.createElement(genericTextLabelModule, {
				TextWrapped = false,
				Size = UDim2.fromScale(1, 1),
				Text = var1.labelText,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				fontStyle = var5.fontStyle or var2.Font.CaptionBody,
				colorStyle = labelContentColor
			})
		}) else nil
	})
end