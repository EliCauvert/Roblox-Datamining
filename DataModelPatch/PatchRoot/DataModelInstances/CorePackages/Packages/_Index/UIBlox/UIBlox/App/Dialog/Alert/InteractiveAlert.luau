local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local AlertModule = require(Parent.Alert)
local AlertTypeModule = require(Parent.Enum.AlertType)
local FitFrameOnAxis = require(Parent3.FitFrame).FitFrameOnAxis
local MinValue = 272
local MaxValue = 400
local GenericTextLabelModule = require(Parent2.Core.Text.GenericTextLabel.GenericTextLabel)
local ImageSetComponentModule = require(Parent2.Core.ImageSet.ImageSetComponent)
local GetTextHeightModule = require(Parent2.Core.Text.GetTextHeight)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local InteractiveAlert = RoactModule.PureComponent:extend("InteractiveAlert")
InteractiveAlert.validateProps = TModule.strictInterface({
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	screenSize = TModule.Vector2,
	onMounted = TModule.optional(TModule.callback),
	onAbsoluteSizeChanged = TModule.optional(TModule.callback),
	title = TModule.string,
	titleIcon = TModule.optional(TModule.union(TModule.table, TModule.string)),
	titleContent = TModule.optional(TModule.callback),
	bodyText = TModule.optional(TModule.string),
	richText = TModule.optional(TModule.boolean),
	middleContent = TModule.optional(TModule.callback),
	buttonStackInfo = require(Parent1.Button.ButtonStack).validateProps,
	footerText = TModule.optional(TModule.string),
	footerContent = TModule.optional(TModule.callback),
	onCloseClicked = TModule.optional(TModule.callback),
	bottomMargin = TModule.optional(TModule.number),
	defaultChildRef = TModule.optional(TModule.union(TModule.table, TModule.callback)),
	isMiddleContentFocusable = TModule.optional(TModule.boolean),
	isFooterContentFocusable = TModule.optional(TModule.boolean),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
InteractiveAlert.defaultProps = { bottomMargin = 24 }

function InteractiveAlert.render(p1)
	-- upvalues: WithStyleModule (copy), MinValue (ref), MaxValue (ref), RoactModule (copy), FitFrameOnAxis (copy), ImageSetComponentModule (copy), GetTextHeightModule (copy), GenericTextLabelModule (copy), AlertModule (copy), AlertTypeModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: MinValue (upval), MaxValue (upval), p1 (copy), RoactModule (upval), FitFrameOnAxis (upval), ImageSetComponentModule (upval), GetTextHeightModule (upval), GenericTextLabelModule (upval), AlertModule (upval), AlertTypeModule (upval)
		MinValue = p2.Tokens.Global.Size_200 * 17
		MaxValue = p2.Tokens.Global.Size_500 * 10
		local Theme = p2.Theme
		local _Font = p2.Font
		local BodyFont = _Font.Body.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
		local TitleContent = if p1.props.titleIcon then function()
			-- upvalues: RoactModule (upval), FitFrameOnAxis (upval), ImageSetComponentModule (upval), p1 (upval), Theme (copy)
			return RoactModule.createElement(FitFrameOnAxis, {
				BackgroundTransparency = 1,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				margin = { top = 12, bottom = 0, left = 0, right = 0 },
				minimumSize = UDim2.new(1, 0, 0, 0)
			}, {
				Icon = RoactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					Image = p1.props.titleIcon,
					ImageColor3 = Theme.IconEmphasis.Color,
					ImageTransparency = Theme.IconEmphasis.Transparency,
					Size = UDim2.new(0, 48, 0, 48)
				})
			})
		end else p1.props.titleContent
		local ClampedValueDelta = math.clamp(p1.props.screenSize.X - 48, MinValue, MaxValue) - 48
		local FooterContent: () -> any = p1.props.footerContent
		
		if p1.props.footerText then
			local TextHeightModule = p1.props.footerText and GetTextHeightModule(p1.props.footerText, _Font.Footer.Font, _Font.BaseSize * _Font.Footer.RelativeSize, ClampedValueDelta, 100) or 0
			
			FooterContent = function()
				-- upvalues: RoactModule (upval), GenericTextLabelModule (upval), Theme (copy), _Font (copy), p1 (upval), ScaledBaseSize (copy), TextHeightModule (copy)
				return RoactModule.createElement(GenericTextLabelModule, {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					colorStyle = Theme.TextDefault,
					fontStyle = _Font.Footer,
					Text = p1.props.footerText,
					TextSize = ScaledBaseSize,
					TextXAlignment = Enum.TextXAlignment.Center,
					Size = UDim2.new(1, 0, 0, TextHeightModule)
				})
			end
		end
		local TextHeightModule1 = p1.props.bodyText and GetTextHeightModule(p1.props.bodyText, BodyFont, ScaledBaseSize, ClampedValueDelta, 200) or 0
		
		return RoactModule.createElement(AlertModule, {
			anchorPoint = p1.props.anchorPoint,
			alertType = AlertTypeModule.Interactive,
			margin = {
				top = 0,
				left = 24,
				right = 24,
				bottom = p1.props.bottomMargin
			},
			maxWidth = MaxValue,
			minWidth = MinValue,
			buttonStackInfo = p1.props.buttonStackInfo,
			middleContent = if p1.props.bodyText then function()
				-- upvalues: RoactModule (upval), FitFrameOnAxis (upval), GenericTextLabelModule (upval), Theme (copy), _Font (copy), p1 (upval), ScaledBaseSize (copy), TextHeightModule1 (copy)
				return RoactModule.createElement(FitFrameOnAxis, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					contentPadding = UDim.new(0, 12),
					minimumSize = UDim2.new(1, 0, 0, 0)
				}, {
					BodyText = RoactModule.createElement(GenericTextLabelModule, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						colorStyle = Theme.TextDefault,
						fontStyle = _Font.Body,
						Text = p1.props.bodyText,
						RichText = p1.props.richText,
						TextSize = ScaledBaseSize,
						TextXAlignment = Enum.TextXAlignment.Center,
						Size = UDim2.new(1, 0, 0, TextHeightModule1)
					}),
					CustomContent = p1.props.middleContent and RoactModule.createElement(FitFrameOnAxis, {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						minimumSize = UDim2.new(1, 0, 0, 0)
					}, { Content = p1.props.middleContent() })
				})
			end else p1.props.middleContent,
			isMiddleContentFocusable = p1.props.isMiddleContentFocusable,
			onMounted = p1.props.onMounted,
			onAbsoluteSizeChanged = p1.props.onAbsoluteSizeChanged,
			position = p1.props.position,
			screenSize = p1.props.screenSize,
			title = p1.props.title,
			titleContent = TitleContent,
			footerContent = FooterContent,
			isFooterContentFocusable = p1.props.isFooterContentFocusable,
			onCloseClicked = p1.props.onCloseClicked,
			defaultChildRef = p1.props.defaultChildRef,
			isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled
		})
	end)
end

return InteractiveAlert