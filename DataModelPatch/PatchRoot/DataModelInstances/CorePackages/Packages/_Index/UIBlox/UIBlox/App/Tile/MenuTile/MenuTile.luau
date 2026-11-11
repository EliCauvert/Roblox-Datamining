local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Core = Parent1.Core
local Parent2 = Parent1.Parent
local OtterModule = require(Parent2.Otter)
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local CryoModule = require(Parent2.Cryo)
local BadgeStatesModule = require(Parent.Indicator.Enum.BadgeStates)
local IconSizeModule = require(Parent.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(Parent.ImageSet.getIconSize)
local BadgeVariantModule = require(Parent.Indicator.Enum.BadgeVariant)
local StatusIndicator = require(Parent2.Foundation).StatusIndicator
local ControlStateModule = require(Core.Control.Enum.ControlState)
local InteractableModule = require(Core.Control.Interactable)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local ValidateImageModule = require(Core.ImageSet.Validator.validateImage)
local ValidateColorInfoModule = require(Parent1.Core.Style.Validator.validateColorInfo)
local ValidateFontInfoModule = require(Parent1.Core.Style.Validator.validateFontInfo)
local ValidateTypographyInfoModule = require(Parent1.Core.Style.Validator.validateTypographyInfo)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local DivideTransparencyModule = require(Parent1.Utility.divideTransparency)
local CursorTypeModule = require(Parent.SelectionCursor.CursorType)
local UseCursorByTypeModule = require(Parent.SelectionCursor.useCursorByType)
local GetTextSizeModule = require(Parent1.Core.Text.GetTextSize)
local MigrateBadgeVariantModule = require(Parent1.Utility.migrateBadgeVariant)
local _UDim = UDim.new(0, 12)
local _UDim1 = UDim.new(0, 8)
local config = { frequency = 6, dampingRatio = 1 }
local MenuTile = RoactModule.Component:extend("MenuTile")
MenuTile.defaultProps = { size = UDim2.fromScale(1, 1), styleProps = {} }
MenuTile.validateProps = TModule.strictInterface({
	size = TModule.optional(TModule.UDim2),
	position = TModule.optional(TModule.UDim2),
	layoutOrder = TModule.optional(TModule.number),
	cursor = TModule.table,
	badgeValue = TModule.optional(TModule.union(TModule.string, TModule.number, BadgeStatesModule.isEnumValue)),
	badgeVariant = TModule.optional(BadgeVariantModule.isEnumValue),
	icon = TModule.optional(ValidateImageModule),
	title = TModule.string,
	onActivated = TModule.callback,
	styleProps = TModule.optional(TModule.strictInterface({
		iconStyle = TModule.optional(ValidateColorInfoModule),
		iconSize = TModule.optional(IconSizeModule.isEnumValue),
		titleStyle = TModule.optional(ValidateColorInfoModule),
		titleFont = TModule.optional(TModule.union(ValidateFontInfoModule, ValidateTypographyInfoModule))
	}))
})

local function withProviders(Callback, Cursor)
	-- upvalues: WithStyleModule (copy)
	return WithStyleModule(function(p1)
		-- upvalues: Callback (copy), Cursor (copy)
		return Callback(p1, nil, Cursor)
	end)
end

local function getStyleProps(StyleProps, p1)
	-- upvalues: GetIconSizeModule (copy), IconSizeModule (copy)
	local Theme = p1.Theme
	local _Font = p1.Font
	
	return {
		iconStyle = StyleProps.iconStyle or Theme.IconDefault,
		iconSize = if StyleProps.iconSize then GetIconSizeModule(StyleProps.iconSize, p1) else GetIconSizeModule(IconSizeModule.Large),
		titleStyle = StyleProps.titleStyle or Theme.TextDefault,
		titleFont = StyleProps.titleFont or _Font.SubHeader1
	}
end

function MenuTile.init(p1)
	-- upvalues: RoactModule (copy), OtterModule (copy)
	p1.hoverTransparency, p1.updateHoverTransparency = RoactModule.createBinding(1)
	p1.hoverTransparencyMotor = OtterModule.createSingleMotor(1)
	p1.hoverTransparencyMotor:onStep(p1.updateHoverTransparency)
	p1.hoverTransparencyMotor:onComplete(function(p2)
		-- upvalues: p1 (copy)
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

function MenuTile.render(p1)
	-- upvalues: withProviders (copy), getStyleProps (copy), GetTextSizeModule (copy), ControlStateModule (copy), OtterModule (copy), config (copy), DivideTransparencyModule (copy), RoactModule (copy), InteractableModule (copy), _UDim (copy), _UDim1 (copy), ImageSetComponentModule (copy), StatusIndicator (copy), MigrateBadgeVariantModule (copy)
	local BackgroundTransparency = p1.state.backgroundTransparency
	local IconTransparency = p1.state.iconTransparency
	local TitleTransparency = p1.state.titleTransparency
	local BadgeValue = p1.props.badgeValue
	local Icon = p1.props.icon
	local LayoutOrder = p1.props.layoutOrder
	local OnActivated = p1.props.onActivated
	local Position = p1.props.position
	local Size = p1.props.size
	local Title = p1.props.title
	
	return withProviders(function(p2, _, SelectionImageObject)
		-- upvalues: getStyleProps (upval), p1 (copy), GetTextSizeModule (upval), Title (copy), ControlStateModule (upval), OtterModule (upval), config (upval), DivideTransparencyModule (upval), RoactModule (upval), InteractableModule (upval), Size (copy), Position (copy), LayoutOrder (copy), OnActivated (copy), BackgroundTransparency (copy), _UDim (upval), _UDim1 (upval), Icon (copy), ImageSetComponentModule (upval), IconTransparency (copy), TitleTransparency (copy), BadgeValue (copy), StatusIndicator (upval), MigrateBadgeVariantModule (upval)
		local Theme = p2.Theme
		local StyleProps = getStyleProps(p1.props.styleProps, p2)
		local BackgroundUIDefault = Theme.BackgroundUIDefault
		local BackgroundOnHover = Theme.BackgroundOnHover
		local IconStyle = StyleProps.iconStyle
		local IconSize = StyleProps.iconSize
		local TitleStyle = StyleProps.titleStyle
		local TitleFont = StyleProps.titleFont
		local ScaledRelativeSize = if TitleFont.RelativeSize then TitleFont.RelativeSize * p2.Font.BaseSize else TitleFont.FontSize
		local Y: number = GetTextSizeModule(Title, ScaledRelativeSize, TitleFont.Font, Vector2.new(100, ScaledRelativeSize)).Y
		
		return RoactModule.createElement(InteractableModule, {
			Size = Size,
			Position = Position,
			BackgroundTransparency = 1,
			SelectionImageObject = SelectionImageObject,
			LayoutOrder = LayoutOrder,
			onStateChanged = function(_, Default)
				-- upvalues: ControlStateModule (upval), p1 (upval), BackgroundUIDefault (copy), IconStyle (copy), TitleStyle (copy), OtterModule (upval), BackgroundOnHover (copy), config (upval), DivideTransparencyModule (upval)
				if Default == ControlStateModule.Hover then
					p1:setState({
						showHoverMask = true,
						backgroundTransparency = BackgroundUIDefault.Transparency,
						iconTransparency = IconStyle.Transparency,
						titleTransparency = TitleStyle.Transparency
					})
					p1.hoverTransparencyMotor:setGoal(OtterModule.spring(BackgroundOnHover.Transparency, config))
					
					return
				end
				if Default == ControlStateModule.Default then
					p1:setState({
						backgroundTransparency = BackgroundUIDefault.Transparency,
						iconTransparency = IconStyle.Transparency,
						titleTransparency = TitleStyle.Transparency
					})
					p1.hoverTransparencyMotor:setGoal(OtterModule.spring(1, config))
					
					return
				end
				if Default == ControlStateModule.Pressed then
					p1:setState({
						showHoverMask = false,
						backgroundTransparency = DivideTransparencyModule(BackgroundUIDefault.Transparency, 2),
						iconTransparency = DivideTransparencyModule(IconStyle.Transparency, 2),
						titleTransparency = DivideTransparencyModule(TitleStyle.Transparency, 2)
					})
					p1.hoverTransparencyMotor:setGoal(OtterModule.instant(1))
				end
			end,
			[RoactModule.Event.Activated] = OnActivated
		}, {
			MenuTileFrame = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = Size }, {
				Background = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 1,
					BackgroundColor3 = BackgroundUIDefault.Color,
					BackgroundTransparency = BackgroundTransparency,
					Size = UDim2.fromScale(1, 1)
				}, {
					RoundedCornerUI = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				}),
				HoverMask = p1.state.showHoverMask and RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 2,
					BackgroundColor3 = BackgroundOnHover.Color,
					BackgroundTransparency = p1.hoverTransparency,
					Size = UDim2.fromScale(1, 1)
				}, {
					RoundedCornerUI = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				}),
				IconAndTitleContainer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Size = UDim2.fromScale(1, 1)
				}, {
					IconAndTitleUIListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = _UDim,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					IconAndTitleUIPadding = RoactModule.createElement("UIPadding", {
						PaddingBottom = _UDim1,
						PaddingLeft = _UDim1,
						PaddingRight = _UDim1,
						PaddingTop = _UDim1 + UDim.new(0, Y)
					}),
					Icon = Icon and RoactModule.createElement(ImageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Image = Icon,
						ImageColor3 = IconStyle.Color,
						ImageTransparency = IconTransparency,
						Size = UDim2.fromOffset(IconSize, IconSize)
					}),
					Title = Title and RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						TextWrapped = true,
						Font = TitleFont.Font,
						Size = UDim2.new(1, 0, 0, Y * 2),
						Text = Title,
						TextColor3 = TitleStyle.Color,
						TextSize = ScaledRelativeSize,
						TextTransparency = TitleTransparency,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextYAlignment = Enum.TextYAlignment.Top
					})
				}),
				BadgeContainer = BadgeValue and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 4,
					Size = UDim2.fromScale(1, 1)
				}, {
					BadgeUIListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = _UDim,
						VerticalAlignment = Enum.VerticalAlignment.Top
					}),
					BadgeUIPadding = RoactModule.createElement("UIPadding", {
						PaddingBottom = _UDim1,
						PaddingLeft = _UDim1,
						PaddingRight = _UDim1,
						PaddingTop = _UDim1
					}),
					Badge = RoactModule.createElement(StatusIndicator, {
						value = tonumber(BadgeValue),
						max = if tonumber(BadgeValue) then 99 else nil,
						variant = MigrateBadgeVariantModule(p1.props.badgeVariant)
					})
				})
			})
		})
	end, p1.props.cursor)
end

function MenuTile.willUnmount(p1)
	if p1.hoverTransparencyMotor then
		p1.hoverTransparencyMotor:destroy()
	end
end

function MenuTileFunctionalWrapper(p1)
	-- upvalues: UseCursorByTypeModule (copy), CursorTypeModule (copy), RoactModule (copy), MenuTile (copy), CryoModule (copy)
	return RoactModule.createElement(MenuTile, CryoModule.Dictionary.join(p1, {
		cursor = UseCursorByTypeModule(CursorTypeModule.RoundedRect)
	}))
end

return MenuTileFunctionalWrapper