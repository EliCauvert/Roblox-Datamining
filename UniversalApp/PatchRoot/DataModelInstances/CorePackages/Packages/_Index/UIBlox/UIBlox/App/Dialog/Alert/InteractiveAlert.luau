local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local alertModule = require(parent.Alert)
local alertTypeModule = require(parent.Enum.AlertType)
local fitFrameOnAxis = require(parent_3.FitFrame).FitFrameOnAxis
local var4 = 272
local var5 = 400
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

function interactiveAlert.render(p0) --[[ line: 85 ]]
	-- upvalues: withStyleModule (ref), var4 (write), UIBloxConfigModule (ref), var5 (write), roactModule (ref), fitFrameOnAxis (ref), imageSetComponentModule (ref), getTextHeightModule (ref), genericTextLabelModule (ref), alertModule (ref), alertTypeModule (ref)
	return withStyleModule(function(p1) --[[ line: 86 ]]
		-- upvalues: var4 (copy), UIBloxConfigModule (copy), var5 (copy), p0 (ref), roactModule (copy), fitFrameOnAxis (copy), imageSetComponentModule (copy), getTextHeightModule (copy), genericTextLabelModule (copy), alertModule (copy), alertTypeModule (copy)
		var4 = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_400 else p1.Tokens.Global.Size_200) * 17
		var5 = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_1000 else p1.Tokens.Global.Size_500) * 10
		local theme = p1.Theme
		local font = p1.Font
		local font_1 = font.Body.Font
		local var12 = font.BaseSize * font.Body.RelativeSize
		local var13 = if p0.props.titleIcon then function() --[[ line: 105 ]]
			-- upvalues: roactModule (copy), fitFrameOnAxis (copy), imageSetComponentModule (copy), p0 (copy), theme (ref)
			return roactModule.createElement(fitFrameOnAxis, {
				BackgroundTransparency = 1,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				margin = { top = 12, bottom = 0, left = 0, right = 0 },
				minimumSize = UDim2.new(1, 0, 0, 0)
			}, {
				Icon = roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					Image = p0.props.titleIcon,
					ImageColor3 = theme.IconEmphasis.Color,
					ImageTransparency = theme.IconEmphasis.Transparency,
					Size = UDim2.new(0, 48, 0, 48)
				})
			})
		end else p0.props.titleContent
		local var14 = math.clamp(p0.props.screenSize.X - 48, var4, var5) - 48
		local footerContent = p0.props.footerContent
		
		if p0.props.footerText then
			local footerText = p0.props.footerText and getTextHeightModule(p0.props.footerText, font.Footer.Font, font.BaseSize * font.Footer.RelativeSize, var14, 100) or 0
			
			footerContent = function() --[[ line: 143 ]]
				-- upvalues: roactModule (copy), genericTextLabelModule (copy), theme (ref), font (ref), p0 (copy), var12 (ref), footerText (ref)
				return roactModule.createElement(genericTextLabelModule, {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					colorStyle = theme.TextDefault,
					fontStyle = font.Footer,
					Text = p0.props.footerText,
					TextSize = var12,
					TextXAlignment = Enum.TextXAlignment.Center,
					Size = UDim2.new(1, 0, 0, footerText)
				})
			end
		end
		local bodyText = p0.props.bodyText and getTextHeightModule(p0.props.bodyText, font_1, var12, var14, 200) or 0
		
		return roactModule.createElement(alertModule, {
			anchorPoint = p0.props.anchorPoint,
			alertType = alertTypeModule.Interactive,
			margin = {
				top = 0,
				left = 24,
				right = 24,
				bottom = p0.props.bottomMargin
			},
			maxWidth = var5,
			minWidth = var4,
			buttonStackInfo = p0.props.buttonStackInfo,
			middleContent = if p0.props.bodyText then function() --[[ line: 163 ]]
				-- upvalues: roactModule (copy), fitFrameOnAxis (copy), genericTextLabelModule (copy), theme (ref), font (ref), p0 (copy), var12 (ref), bodyText (ref)
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
						Text = p0.props.bodyText,
						RichText = p0.props.richText,
						TextSize = var12,
						TextXAlignment = Enum.TextXAlignment.Center,
						Size = UDim2.new(1, 0, 0, bodyText)
					}),
					CustomContent = p0.props.middleContent and roactModule.createElement(fitFrameOnAxis, {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						minimumSize = UDim2.new(1, 0, 0, 0)
					}, { Content = p0.props.middleContent() })
				})
			end else p0.props.middleContent,
			isMiddleContentFocusable = p0.props.isMiddleContentFocusable,
			onMounted = p0.props.onMounted,
			onAbsoluteSizeChanged = p0.props.onAbsoluteSizeChanged,
			position = p0.props.position,
			screenSize = p0.props.screenSize,
			title = p0.props.title,
			titleContent = var13,
			footerContent = footerContent,
			isFooterContentFocusable = p0.props.isFooterContentFocusable,
			onCloseClicked = p0.props.onCloseClicked,
			defaultChildRef = p0.props.defaultChildRef,
			isRoactGamepadEnabled = p0.props.isRoactGamepadEnabled
		})
	end)
end

return interactiveAlert