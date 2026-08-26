local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local core = parent_1.Core
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local foundationModule = require(parent_2.Foundation)
local iconSizeModule = require(parent.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.ImageSet.getIconSize)
local withStyleModule = require(core.Style.withStyle)
local validateImageSetDataModule = require(core.ImageSet.Validator.validateImageSetData)
local controlStateModule = require(core.Control.Enum.ControlState)
local interactableModule = require(core.Control.Interactable)
local getContentStyleModule = require(core.Button.getContentStyle)
local genericTextLabelModule = require(core.Text.GenericTextLabel.GenericTextLabel)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local getTextSizeModule = require(parent_1.Core.Text.GetTextSize)
local pill = roactModule.PureComponent:extend("Pill")
pill.validateProps = tModule.strictInterface({
	text = tModule.optional(tModule.string),
	isSelected = tModule.optional(tModule.boolean),
	isDisabled = tModule.optional(tModule.boolean),
	isLoading = tModule.optional(tModule.boolean),
	icon = tModule.union(tModule.string, validateImageSetDataModule),
	onActivated = tModule.callback
})
pill.defaultProps = {
	text = "",
	isSelected = false,
	isDisabled = false,
	isLoading = false
}

function pill.init(p1)
	-- upvalues: controlStateModule (ref)
	p1.state = { controlState = controlStateModule.Initialize }
end

function pill.render(p1)
	-- upvalues: withStyleModule (ref), controlStateModule (ref), getContentStyleModule (ref), getIconSizeModule (ref), iconSizeModule (ref), getTextSizeModule (ref), roactModule (ref), interactableModule (ref), imageSetComponentModule (ref), genericTextLabelModule (ref), skeleton (ref), radius (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), controlStateModule (copy), getContentStyleModule (copy), getIconSizeModule (copy), iconSizeModule (copy), getTextSizeModule (copy), roactModule (copy), interactableModule (copy), imageSetComponentModule (copy), genericTextLabelModule (copy), skeleton (copy), radius (copy)
		local var1
		local font = p2.Font
		local isSelected = p1.props.isSelected
		local isDisabled = p1.props.isDisabled
		local isLoading = p1.props.isLoading
		local icon = p1.props.icon
		local text = p1.props.text
		local onActivated = p1.props.onActivated
		local t = {
			[controlStateModule.Default] = if isSelected then "SystemPrimaryContent" else "IconDefault",
			[controlStateModule.Hover] = if isSelected then "SystemPrimaryContent" else "IconEmphasis"
		}
		local t_1 = {
			[controlStateModule.Default] = if isSelected then "SystemPrimaryContent" else "TextDefault",
			[controlStateModule.Hover] = if isSelected then "SystemPrimaryContent" else "TextEmphasis"
		}
		local t_2 = {
			[controlStateModule.Default] = if isSelected then "SystemPrimaryDefault" else "BackgroundUIDefault",
			[controlStateModule.Hover] = if isSelected then "SystemPrimaryOnHover" else "BackgroundUIDefault"
		}
		local var2 = getContentStyleModule(t, p1.state.controlState, p2)
		local var3 = getContentStyleModule(t_1, p1.state.controlState, p2)
		local var4 = getContentStyleModule(t_2, p1.state.controlState, p2)
		local var5 = getIconSizeModule(iconSizeModule.Small)
		local var6 = font.CaptionHeader.RelativeSize * font.BaseSize
		local x = getTextSizeModule(text, var6, font.CaptionHeader.Font, Vector2.new(10000, 10000)).X
		local var7 = x + 24
		local var8 = 240 - (28 + var5)
		
		if not isLoading then
			var1 = roactModule.createElement(interactableModule, {
				Size = UDim2.new(0, var7 + 4 + var5, 0, 28),
				BackgroundColor3 = var4.Color,
				BackgroundTransparency = var4.Transparency,
				AutoButtonColor = false,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				isDisabled = isDisabled,
				[roactModule.Event.Activated] = if not isLoading then onActivated else nil,
				onStateChanged = function(_, p3)
					-- upvalues: p1 (copy)
					p1:setState({ controlState = p3 })
				end
			}, {
				UIListLayout = roactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Content = roactModule.createElement("Frame", {
					ClipsDescendants = true,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, x + 4 + var5, 1, 0)
				}, {
					UIListLayout = roactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, 4),
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					Icon = roactModule.createElement(imageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Size = UDim2.fromOffset(var5, var5),
						Image = icon,
						ImageColor3 = var2.Color,
						ImageTransparency = var2.Transparency
					}),
					TextArea = string.len(text) > 0 and roactModule.createElement("Frame", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Size = UDim2.fromOffset(x, var6)
					}, {
						PillText = roactModule.createElement(genericTextLabelModule, {
							Text = text,
							BackgroundTransparency = 1,
							fontStyle = font.CaptionHeader,
							colorStyle = var3,
							TextTruncate = Enum.TextTruncate.AtEnd,
							Size = UDim2.fromOffset(var8, var6),
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Center,
							[roactModule.Ref] = p1.PillText
						}),
						roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var8, 28) })
					}),
					UISizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(216, 28) })
				}),
				UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				UISizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(240, 28) })
			}) or roactModule.createElement(skeleton, {
				Size = UDim2.fromOffset(var7 + 4 + var5, 28),
				radius = radius.Circle
			})
		end
		return var1
	end)
end

return pill