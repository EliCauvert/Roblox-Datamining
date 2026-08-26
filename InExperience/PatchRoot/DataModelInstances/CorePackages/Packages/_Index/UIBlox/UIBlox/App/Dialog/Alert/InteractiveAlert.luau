local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local alertModule = require(parent.Alert)
local alertTypeModule = require(parent.Enum.AlertType)
local fitFrameOnAxis = require(parent_3.FitFrame).FitFrameOnAxis
local var1 = 272
local var2 = 400
local genericTextLabelModule = require(parent_2.Core.Text.GenericTextLabel.GenericTextLabel)
local imageSetComponentModule = require(parent_2.Core.ImageSet.ImageSetComponent)
local getTextHeightModule = require(parent_2.Core.Text.GetTextHeight)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local UIBloxConfigModule = require(parent_2.UIBloxConfig)
local interactiveAlert = roactModule.PureComponent:extend("InteractiveAlert")
interactiveAlert.validateProps = tModule.strictInterface({
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	screenSize = tModule.Vector2,
	onMounted = tModule.optional(tModule.callback),
	onAbsoluteSizeChanged = tModule.optional(tModule.callback),
	title = tModule.string,
	titleIcon = tModule.optional(tModule.union(tModule.table, tModule.string)),
	titleContent = tModule.optional(tModule.callback),
	bodyText = tModule.optional(tModule.string),
	richText = tModule.optional(tModule.boolean),
	middleContent = tModule.optional(tModule.callback),
	buttonStackInfo = require(parent_1.Button.ButtonStack).validateProps,
	footerText = tModule.optional(tModule.string),
	footerContent = tModule.optional(tModule.callback),
	onCloseClicked = tModule.optional(tModule.callback),
	bottomMargin = tModule.optional(tModule.number),
	defaultChildRef = tModule.optional(tModule.union(tModule.table, tModule.callback)),
	isMiddleContentFocusable = tModule.optional(tModule.boolean),
	isFooterContentFocusable = tModule.optional(tModule.boolean),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
interactiveAlert.defaultProps = { bottomMargin = 24 }

function interactiveAlert.render(p1)
	-- upvalues: withStyleModule (ref), var1 (write), UIBloxConfigModule (ref), var2 (write), roactModule (ref), fitFrameOnAxis (ref), imageSetComponentModule (ref), getTextHeightModule (ref), genericTextLabelModule (ref), alertModule (ref), alertTypeModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: var1 (copy), UIBloxConfigModule (copy), var2 (copy), p1 (ref), roactModule (copy), fitFrameOnAxis (copy), imageSetComponentModule (copy), getTextHeightModule (copy), genericTextLabelModule (copy), alertModule (copy), alertTypeModule (copy)
		var1 = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p2.Tokens.Size.Size_400 else p2.Tokens.Global.Size_200) * 17
		var2 = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p2.Tokens.Size.Size_1000 else p2.Tokens.Global.Size_500) * 10
		local theme = p2.Theme
		local font = p2.Font
		local font_1 = font.Body.Font
		local var3 = font.BaseSize * font.Body.RelativeSize
		local var4 = if p1.props.titleIcon then function()
			-- upvalues: roactModule (copy), fitFrameOnAxis (copy), imageSetComponentModule (copy), p1 (copy), theme (ref)
			return roactModule.createElement(fitFrameOnAxis, {
				BackgroundTransparency = 1,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				margin = { top = 12, bottom = 0, left = 0, right = 0 },
				minimumSize = UDim2.new(1, 0, 0, 0)
			}, {
				Icon = roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					Image = p1.props.titleIcon,
					ImageColor3 = theme.IconEmphasis.Color,
					ImageTransparency = theme.IconEmphasis.Transparency,
					Size = UDim2.new(0, 48, 0, 48)
				})
			})
		end else p1.props.titleContent
		local var5 = math.clamp(p1.props.screenSize.X - 48, var1, var2) - 48
		local footerContent = p1.props.footerContent
		
		if p1.props.footerText then
			local footerText = p1.props.footerText and getTextHeightModule(p1.props.footerText, font.Footer.Font, font.BaseSize * font.Footer.RelativeSize, var5, 100) or 0
			
			footerContent = function()
				-- upvalues: roactModule (copy), genericTextLabelModule (copy), theme (ref), font (ref), p1 (copy), var3 (ref), footerText (ref)
				return roactModule.createElement(genericTextLabelModule, {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					colorStyle = theme.TextDefault,
					fontStyle = font.Footer,
					Text = p1.props.footerText,
					TextSize = var3,
					TextXAlignment = Enum.TextXAlignment.Center,
					Size = UDim2.new(1, 0, 0, footerText)
				})
			end
		end
		local bodyText = p1.props.bodyText and getTextHeightModule(p1.props.bodyText, font_1, var3, var5, 200) or 0
		
		return roactModule.createElement(alertModule, {
			anchorPoint = p1.props.anchorPoint,
			alertType = alertTypeModule.Interactive,
			margin = {
				top = 0,
				left = 24,
				right = 24,
				bottom = p1.props.bottomMargin
			},
			maxWidth = var2,
			minWidth = var1,
			buttonStackInfo = p1.props.buttonStackInfo,
			middleContent = if p1.props.bodyText then function()
				-- upvalues: roactModule (copy), fitFrameOnAxis (copy), genericTextLabelModule (copy), theme (ref), font (ref), p1 (copy), var3 (ref), bodyText (ref)
				return roactModule.createElement(fitFrameOnAxis, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					contentPadding = UDim.new(0, 12),
					minimumSize = UDim2.new(1, 0, 0, 0)
				}, {
					BodyText = roactModule.createElement(genericTextLabelModule, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						colorStyle = theme.TextDefault,
						fontStyle = font.Body,
						Text = p1.props.bodyText,
						RichText = p1.props.richText,
						TextSize = var3,
						TextXAlignment = Enum.TextXAlignment.Center,
						Size = UDim2.new(1, 0, 0, bodyText)
					}),
					CustomContent = p1.props.middleContent and roactModule.createElement(fitFrameOnAxis, {
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
			titleContent = var4,
			footerContent = footerContent,
			isFooterContentFocusable = p1.props.isFooterContentFocusable,
			onCloseClicked = p1.props.onCloseClicked,
			defaultChildRef = p1.props.defaultChildRef,
			isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled
		})
	end)
end

return interactiveAlert