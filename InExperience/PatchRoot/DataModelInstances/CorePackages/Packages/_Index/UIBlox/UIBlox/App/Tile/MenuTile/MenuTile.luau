local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local core = parent_1.Core
local parent_2 = parent_1.Parent
local otterModule = require(parent_2.Otter)
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local cryoModule = require(parent_2.Cryo)
local foundationModule = require(parent_2.Foundation)
local badgeStatesModule = require(parent.Indicator.Enum.BadgeStates)
local iconSizeModule = require(parent.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.ImageSet.getIconSize)
local badgeVariantModule = require(parent.Indicator.Enum.BadgeVariant)
local statusIndicator = foundationModule.StatusIndicator
local controlStateModule = require(core.Control.Enum.ControlState)
local interactableModule = require(core.Control.Interactable)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local validateImageModule = require(core.ImageSet.Validator.validateImage)
local validateColorInfoModule = require(parent_1.Core.Style.Validator.validateColorInfo)
local validateFontInfoModule = require(parent_1.Core.Style.Validator.validateFontInfo)
local validateTypographyInfoModule = require(parent_1.Core.Style.Validator.validateTypographyInfo)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local divideTransparencyModule = require(parent_1.Utility.divideTransparency)
local cursorTypeModule = require(parent.SelectionCursor.CursorType)
local useCursorByTypeModule = require(parent.SelectionCursor.useCursorByType)
local getTextSizeModule = require(parent_1.Core.Text.GetTextSize)
local migrateBadgeVariantModule = require(parent_1.Utility.migrateBadgeVariant)
local uDim = UDim.new(0, 12)
local uDim_1 = UDim.new(0, 8)
local t = { frequency = 6, dampingRatio = 1 }
local _ = {
	BACKGROUND = 1,
	HOVER_MASK = 2,
	ICON_AND_TITLE_CONTAINER = 3,
	BADGE_CONTAINER = 4,
	ROUNDED_CORNERS_MASK = 5
}
local _ = { ICON = 1, TITLE = 2 }
local menuTile = roactModule.Component:extend("MenuTile")
menuTile.defaultProps = { size = UDim2.fromScale(1, 1), styleProps = {} }
menuTile.validateProps = tModule.strictInterface({
	size = tModule.optional(tModule.UDim2),
	position = tModule.optional(tModule.UDim2),
	layoutOrder = tModule.optional(tModule.number),
	cursor = tModule.table,
	badgeValue = tModule.optional(tModule.union(tModule.string, tModule.number, badgeStatesModule.isEnumValue)),
	badgeVariant = tModule.optional(badgeVariantModule.isEnumValue),
	icon = tModule.optional(validateImageModule),
	title = tModule.string,
	onActivated = tModule.callback,
	styleProps = tModule.optional(tModule.strictInterface({
		iconStyle = tModule.optional(validateColorInfoModule),
		iconSize = tModule.optional(iconSizeModule.isEnumValue),
		titleStyle = tModule.optional(validateColorInfoModule),
		titleFont = tModule.optional(tModule.union(validateFontInfoModule, validateTypographyInfoModule))
	}))
})

local function withProviders(p1, p2)
	-- upvalues: withStyleModule (ref)
	return withStyleModule(function(p3)
		-- upvalues: p1 (ref), p2 (ref)
		return p1(p3, nil, p2)
	end)
end

local function getStyleProps(p1, p2)
	-- upvalues: getIconSizeModule (ref), iconSizeModule (ref)
	local theme = p2.Theme
	
	return {
		iconStyle = p1.iconStyle or theme.IconDefault,
		iconSize = if p1.iconSize then getIconSizeModule(p1.iconSize, p2) else getIconSizeModule(iconSizeModule.Large),
		titleStyle = p1.titleStyle or theme.TextDefault,
		titleFont = p1.titleFont or p2.Font.SubHeader1
	}
end

function menuTile.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref)
	local var1, var2 = roactModule.createBinding(1)
	p1.hoverTransparency = var1
	p1.updateHoverTransparency = var2
	p1.hoverTransparencyMotor = otterModule.createSingleMotor(1)
	p1.hoverTransparencyMotor:onStep(p1.updateHoverTransparency)
	p1.hoverTransparencyMotor:onComplete(function(p2)
		-- upvalues: p1 (ref)
		if p2 == 1 then
			p1:setState({ showHoverMask = false })
		end
	end)
	p1:setState({
		backgroundTransparency = 0,
		iconTransparency = 0,
		titleTransparency = 0,
		showHoverMask = false
	})
end

function menuTile.render(p1)
	-- upvalues: withProviders (ref), getStyleProps (ref), getTextSizeModule (ref), controlStateModule (ref), otterModule (ref), t (ref), divideTransparencyModule (ref), roactModule (ref), interactableModule (ref), uDim (ref), uDim_1 (ref), imageSetComponentModule (ref), statusIndicator (ref), migrateBadgeVariantModule (ref)
	local backgroundTransparency = p1.state.backgroundTransparency
	local iconTransparency = p1.state.iconTransparency
	local titleTransparency = p1.state.titleTransparency
	local badgeValue = p1.props.badgeValue
	local icon = p1.props.icon
	local layoutOrder = p1.props.layoutOrder
	local onActivated = p1.props.onActivated
	local position = p1.props.position
	local size = p1.props.size
	local title = p1.props.title
	
	return withProviders(function(p2, _, p3)
		-- upvalues: getStyleProps (copy), p1 (ref), getTextSizeModule (copy), title (ref), controlStateModule (copy), otterModule (copy), t (copy), divideTransparencyModule (copy), roactModule (copy), interactableModule (copy), size (ref), position (ref), layoutOrder (ref), onActivated (ref), backgroundTransparency (ref), uDim (copy), uDim_1 (copy), icon (ref), imageSetComponentModule (copy), iconTransparency (ref), titleTransparency (ref), badgeValue (ref), statusIndicator (copy), migrateBadgeVariantModule (copy)
		local theme = p2.Theme
		local var1 = getStyleProps(p1.props.styleProps, p2)
		local backgroundUIDefault = theme.BackgroundUIDefault
		local backgroundOnHover = theme.BackgroundOnHover
		local iconStyle = var1.iconStyle
		local iconSize = var1.iconSize
		local titleStyle = var1.titleStyle
		local titleFont = var1.titleFont
		local var2 = if titleFont.RelativeSize then titleFont.RelativeSize * p2.Font.BaseSize else titleFont.FontSize
		local y = getTextSizeModule(title, var2, titleFont.Font, Vector2.new(100, var2)).Y
		
		return roactModule.createElement(interactableModule, {
			Size = size,
			Position = position,
			BackgroundTransparency = 1,
			SelectionImageObject = p3,
			LayoutOrder = layoutOrder,
			onStateChanged = function(_, p4)
				-- upvalues: controlStateModule (copy), p1 (copy), backgroundUIDefault (ref), iconStyle (ref), titleStyle (ref), otterModule (copy), backgroundOnHover (ref), t (copy), divideTransparencyModule (copy)
				if p4 == controlStateModule.Hover then
					p1:setState({
						showHoverMask = true,
						backgroundTransparency = backgroundUIDefault.Transparency,
						iconTransparency = iconStyle.Transparency,
						titleTransparency = titleStyle.Transparency
					})
					p1.hoverTransparencyMotor:setGoal(otterModule.spring(backgroundOnHover.Transparency, t))
					
					return
				elseif p4 == controlStateModule.Default then
					p1:setState({
						backgroundTransparency = backgroundUIDefault.Transparency,
						iconTransparency = iconStyle.Transparency,
						titleTransparency = titleStyle.Transparency
					})
					p1.hoverTransparencyMotor:setGoal(otterModule.spring(1, t))
					
					return
				elseif p4 == controlStateModule.Pressed then
					p1:setState({
						showHoverMask = false,
						backgroundTransparency = divideTransparencyModule(backgroundUIDefault.Transparency, 2),
						iconTransparency = divideTransparencyModule(iconStyle.Transparency, 2),
						titleTransparency = divideTransparencyModule(titleStyle.Transparency, 2)
					})
					p1.hoverTransparencyMotor:setGoal(otterModule.instant(1))
				end
			end,
			[roactModule.Event.Activated] = onActivated
		}, {
			MenuTileFrame = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = size }, {
				Background = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 1,
					BackgroundColor3 = backgroundUIDefault.Color,
					BackgroundTransparency = backgroundTransparency,
					Size = UDim2.fromScale(1, 1)
				}, {
					RoundedCornerUI = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				}),
				HoverMask = p1.state.showHoverMask and roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 2,
					BackgroundColor3 = backgroundOnHover.Color,
					BackgroundTransparency = p1.hoverTransparency,
					Size = UDim2.fromScale(1, 1)
				}, {
					RoundedCornerUI = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				}),
				IconAndTitleContainer = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Size = UDim2.fromScale(1, 1)
				}, {
					IconAndTitleUIListLayout = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = uDim,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					IconAndTitleUIPadding = roactModule.createElement("UIPadding", {
						PaddingBottom = uDim_1,
						PaddingLeft = uDim_1,
						PaddingRight = uDim_1,
						PaddingTop = uDim_1 + UDim.new(0, y)
					}),
					Icon = icon and roactModule.createElement(imageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Image = icon,
						ImageColor3 = iconStyle.Color,
						ImageTransparency = iconTransparency,
						Size = UDim2.fromOffset(iconSize, iconSize)
					}),
					Title = title and roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						TextWrapped = true,
						Font = titleFont.Font,
						Size = UDim2.new(1, 0, 0, y * 2),
						Text = title,
						TextColor3 = titleStyle.Color,
						TextSize = var2,
						TextTransparency = titleTransparency,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextYAlignment = Enum.TextYAlignment.Top
					})
				}),
				BadgeContainer = badgeValue and roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 4,
					Size = UDim2.fromScale(1, 1)
				}, {
					BadgeUIListLayout = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = uDim,
						VerticalAlignment = Enum.VerticalAlignment.Top
					}),
					BadgeUIPadding = roactModule.createElement("UIPadding", {
						PaddingBottom = uDim_1,
						PaddingLeft = uDim_1,
						PaddingRight = uDim_1,
						PaddingTop = uDim_1
					}),
					Badge = roactModule.createElement(statusIndicator, {
						value = tonumber(badgeValue),
						max = if tonumber(badgeValue) then 99 else nil,
						variant = migrateBadgeVariantModule(p1.props.badgeVariant)
					})
				})
			})
		})
	end, p1.props.cursor)
end

function menuTile.willUnmount(p1)
	if p1.hoverTransparencyMotor then
		p1.hoverTransparencyMotor:destroy()
	end
end

function MenuTileFunctionalWrapper(p1)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), roactModule (ref), menuTile (ref), cryoModule (ref)
	return roactModule.createElement(menuTile, cryoModule.Dictionary.join(p1, {
		cursor = useCursorByTypeModule(cursorTypeModule.RoundedRect)
	}))
end

return MenuTileFunctionalWrapper