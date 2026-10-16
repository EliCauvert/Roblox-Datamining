local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local UIBloxConfigModule = require(Parent.UIBloxConfig)
local CryoModule = require(Parent1.Cryo)
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local Label = require(Parent.Core.ImageSet.ImageSetComponent).Label
local GenericTextLabelModule = require(Parent.Core.Text.GenericTextLabel.GenericTextLabel)
local UseStyleModule = require(Parent.Core.Style.useStyle)
local _ = require(Parent.App.Style.StyleTypes)
local _ = require(Parent.App.Style.Fonts)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local config = {
	faceGroupCount = 3,
	maxBadgeDisplayNumber = 99,
	showEmphasisBorder = false,
	size = UDim2.fromScale(1, 1),
	styleProps = {}
}
local config1 = {
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

local function _(p1): string --[[ Line: 140 | Named "getAvatarImage" ]]
	return string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", (tostring(p1)))
end

local function renderCornerStroke(p1) --[[ Line: 144 ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.borderRadius) }),
		Stroke = ReactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = p1.borderColor.Color,
			Transparency = p1.borderColor.Transparency,
			Thickness = p1.borderWidth
		})
	})
end

local function renderEmphasisBorder(BadgeBorderWidth: number, p1, p2, NewZIndex) --[[ Line: 158 ]]
	-- upvalues: ReactModule (copy), renderCornerStroke (copy)
	local XOffset1 = BadgeBorderWidth - 1
	local XOffset = (1 - BadgeBorderWidth) / 2
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, XOffset, 0, XOffset),
		Size = UDim2.new(1, XOffset1, 1, XOffset1),
		ZIndex = NewZIndex
	}, {
		renderCornerStroke({
			borderWidth = 1,
			borderColor = p2.Theme.ContextualPrimaryDefault,
			borderRadius = p1.badgeBorderRadius
		})
	})
end

local function renderBadge(p1, p2, p3) --[[ Line: 181 ]]
	-- upvalues: ReactModule (copy), renderCornerStroke (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), renderEmphasisBorder (copy)
	local Theme = p3.Theme
	local _Font = p3.Font
	local BadgeBackgroundColor = p2.badgeBackgroundColor or Theme.BackgroundUIDefault
	local BadgeBorderWidth = p2.badgeBorderWidth
	local BadgeHeight = p2.badgeHeight
	local BadgeContentColor = p2.badgeContentColor or Theme.TextMuted
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.ZIndex,
		Size = UDim2.fromOffset(0, BadgeHeight),
		BackgroundColor3 = BadgeBackgroundColor.Color,
		AutomaticSize = Enum.AutomaticSize.X
	}, {
		BadgeContainer = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = p1.layoutOrder,
			ZIndex = p1.ZIndex,
			Size = UDim2.fromOffset(0, BadgeHeight),
			BackgroundColor3 = BadgeBackgroundColor.Color,
			BackgroundTransparency = BadgeBackgroundColor.Transparency,
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			renderCornerStroke({
				borderWidth = BadgeBorderWidth,
				borderColor = p2.badgeBorderColor or p3.Theme.BackgroundDefault,
				borderRadius = p2.badgeBorderRadius
			}),
			SizeConstraint = ReactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(BadgeHeight, 0) }),
			Content = ReactModule.createElement("TextLabel", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Text = if p1.maxDisplayNumber < p1.usersCount then tostring(p1.maxDisplayNumber) .. "+" else tostring(p1.usersCount),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = if FoundationFontFaceMigration then nil else _Font.CaptionHeader.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(_Font.CaptionHeader.Font) else nil,
				TextSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize,
				TextColor3 = BadgeContentColor.Color,
				TextTransparency = BadgeContentColor.Transparency,
				AutomaticSize = Enum.AutomaticSize.X,
				ZIndex = p1.ZIndex + 1
			}, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, p2.badgeSpacingLeading),
					PaddingRight = UDim.new(0, p2.badgeSpacingTrailing)
				})
			})
		}),
		emphasisBorder = if p1.showEmphasisBorder then renderEmphasisBorder(BadgeBorderWidth, p2, p3, p1.ZIndex + 1) else nil
	})
end

local function renderFaceImage(p1, p2, p3) --[[ Line: 256 ]]
	-- upvalues: ReactModule (copy), Label (copy), renderCornerStroke (copy), renderEmphasisBorder (copy)
	local FaceBackgroundColor = p2.faceBackgroundColor or p3.Theme.TextDefault
	local FaceBorderWidth = p2.faceBorderWidth
	
	return ReactModule.createElement(Label, {
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.ZIndex,
		Size = UDim2.fromOffset(p2.faceWidth, p2.faceHeight),
		Image = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", (tostring(p1.user))),
		BackgroundColor3 = FaceBackgroundColor.Color,
		BackgroundTransparency = FaceBackgroundColor.Transparency
	}, {
		renderCornerStroke({
			borderWidth = FaceBorderWidth,
			borderColor = p2.faceBorderColor or p3.Theme.BackgroundDefault,
			borderRadius = p2.faceBorderRadius
		}),
		emphasisBorder = if p1.showEmphasisBorder then renderEmphasisBorder(FaceBorderWidth, p2, p3, p1.ZIndex + 1) else nil
	})
end

local function renderFaces(JoinResult, JoinResult1, p1, p2: number, p3, FaceGroupCount: number) --[[ Line: 283 ]]
	-- upvalues: ReactModule (copy), renderBadge (copy), renderFaceImage (copy)
	local Users = JoinResult.users
	local BadgeBorderWidth: number = JoinResult1.badgeBorderWidth
	local FaceBorderWidth: number = JoinResult1.faceBorderWidth
	local Largest = math.max(BadgeBorderWidth, FaceBorderWidth)
	local config = {
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, JoinResult1.faceGroupGap)
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, BadgeBorderWidth),
			PaddingTop = UDim.new(0, Largest),
			PaddingRight = UDim.new(0, FaceBorderWidth),
			PaddingBottom = UDim.new(0, Largest)
		}),
		Badge = if p3 then renderBadge({
			layoutOrder = 0,
			usersCount = #Users,
			ZIndex = p2 + 1,
			maxDisplayNumber = JoinResult.maxBadgeDisplayNumber,
			showEmphasisBorder = JoinResult.showEmphasisBorder
		}, JoinResult1, p1) else nil
	}
	
	for i = 1, math.min(FaceGroupCount, #Users) do
		config["Face_" .. i] = renderFaceImage({
			user = Users[i],
			layoutOrder = i,
			ZIndex = p2 - i,
			showEmphasisBorder = JoinResult.showEmphasisBorder
		}, JoinResult1, p1)
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY
	}, config)
end

return function(p4) --[[ Line: 337 | Named "CoPlayFooter" ]]
	-- upvalues: CryoModule (copy), config (copy), UIBloxConfigModule (copy), UseStyleModule (copy), ReactModule (copy), config1 (copy), renderFaces (copy), GenericTextLabelModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p4)
	
	if not UIBloxConfigModule.fixCoplayFooterConditionalHooks and (not JoinResult.users or #JoinResult.users == 0) then
		return nil
	end
	local UseStyleModuleResult = UseStyleModule()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local JoinResult1 = CryoModule.Dictionary.join(config1, JoinResult.styleProps)
	local UseResult = nil
	
	if UIBloxConfigModule.fixCoplayFooterConditionalHooks then
		UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 351 ]]
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(Frame.AbsoluteSize)
		end, { UseBindingResult2 })
		
		if not JoinResult.users or #JoinResult.users == 0 then
			return nil
		end
	end
	local ContainerGap = JoinResult1.containerGap
	local LabelContentColor = JoinResult1.labelContentColor or UseStyleModuleResult.Theme.TextMuted
	local FaceGroupCount = JoinResult.faceGroupCount
	local IsFaceGroupCountBelow = #JoinResult.users > FaceGroupCount + 1
	
	if not IsFaceGroupCountBelow then
		FaceGroupCount += 1
	end
	local NewFaceGroupCount = FaceGroupCount + 1
	
	if not UIBloxConfigModule.fixCoplayFooterConditionalHooks then
		UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 372 ]]
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(Frame.AbsoluteSize)
		end, { UseBindingResult2 })
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = JoinResult.size,
		Position = JoinResult.position,
		AnchorPoint = JoinResult.anchorPoint,
		LayoutOrder = JoinResult.layoutOrder
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, ContainerGap)
		}),
		FacesFrame = ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			[ReactModule.Change.AbsoluteSize] = UseResult
		}, {
			Faces = renderFaces(JoinResult, JoinResult1, UseStyleModuleResult, NewFaceGroupCount, IsFaceGroupCountBelow, FaceGroupCount)
		}),
		LabelFrame = if JoinResult.labelText then ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UseBindingResult:map(function(p5): UDim2 --[[ Line: 402 ]]
				-- upvalues: ContainerGap (copy)
				return UDim2.new(1, -p5.X - ContainerGap, 1, 0)
			end)
		}, {
			Label = ReactModule.createElement(GenericTextLabelModule, {
				TextWrapped = false,
				Size = UDim2.fromScale(1, 1),
				Text = JoinResult.labelText,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				fontStyle = JoinResult1.fontStyle or UseStyleModuleResult.Font.CaptionBody,
				colorStyle = LabelContentColor
			})
		}) else nil
	})
end