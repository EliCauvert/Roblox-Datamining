local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local roact = dependenciesModule.Roact
local t = dependenciesModule.t
local textService = dependenciesModule.TextService
local UIBlox = dependenciesModule.UIBlox
local foundation = dependenciesModule.Foundation
local radius = foundation.Enums.Radius
local skeleton = foundation.Skeleton
local iconSize = UIBlox.App.ImageSet.Enum.IconSize
local getIconSize = UIBlox.App.ImageSet.getIconSize
local withStyle = UIBlox.Core.Style.withStyle
local validateImage = UIBlox.Core.ImageSet.Validator.validateImage
local controlState = UIBlox.Core.Control.Enum.ControlState
local interactable = UIBlox.Core.Control.Interactable
local badge = UIBlox.App.Indicator.Badge
local badgeStates = UIBlox.App.Indicator.Enum.BadgeStates
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel

local var1 = function(p1, p2, p3)
	-- upvalues: controlState (ref)
	local var2 = p1[p2] or p1[controlState.Default]
	local t = {
		Color = p3.Theme[var2].Color,
		Transparency = p3.Theme[var2].Transparency
	}
	
	if p2 == controlState.Disabled or p2 == controlState.Pressed then
		t.Transparency = 0.5 * t.Transparency + 0.5
	end
	return t
end

local pill = roact.PureComponent:extend("Pill")
pill.validateProps = t.strictInterface({
	text = t.optional(t.string),
	isSelected = t.optional(t.boolean),
	isDisabled = t.optional(t.boolean),
	isLoading = t.optional(t.boolean),
	icon = t.union(t.string, validateImage),
	onActivated = t.callback
})

function pill.init(p1)
	-- upvalues: controlState (ref)
	p1.state = { controlState = controlState.Initialize }
	
	function p3.onStateChanged(_, p2)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p2 })
	end
end

function pill.render(p1)
	-- upvalues: withStyle (ref), controlState (ref), var1 (ref), getIconSize (ref), iconSize (ref), textService (ref), roact (ref), interactable (ref), imageSetLabel (ref), styledTextLabel (ref), badge (ref), badgeStates (ref), skeleton (ref), radius (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), controlState (copy), var1 (copy), getIconSize (copy), iconSize (copy), textService (copy), roact (copy), interactable (copy), imageSetLabel (copy), styledTextLabel (copy), badge (copy), badgeStates (copy), skeleton (copy), radius (copy)
		local font = p2.Font
		local isSelected = p1.props.isSelected
		local isDisabled = p1.props.isDisabled
		local isLoading = p1.props.isLoading
		local icon = p1.props.icon
		local text = p1.props.text
		local onActivated = p1.props.onActivated
		local t = {
			[controlState.Default] = if isSelected then "SystemPrimaryContent" else "IconDefault",
			[controlState.Hover] = if isSelected then "SystemPrimaryContent" else "IconEmphasis"
		}
		local t_1 = {
			[controlState.Default] = if isSelected then "SystemPrimaryContent" else "TextDefault",
			[controlState.Hover] = if isSelected then "SystemPrimaryContent" else "TextEmphasis"
		}
		local t_2 = {
			[controlState.Default] = if isSelected then "SystemPrimaryDefault" else "BackgroundUIDefault",
			[controlState.Hover] = if isSelected then "SystemPrimaryOnHover" else "BackgroundUIDefault"
		}
		local var2 = var1(t, p1.state.controlState, p2)
		local var3 = var1(t_1, p1.state.controlState, p2)
		local var4 = var1(t_2, p1.state.controlState, p2)
		local var5 = getIconSize(iconSize.Small)
		local var6 = font.CaptionHeader.RelativeSize * font.BaseSize
		local x = textService:GetTextSize(text, var6, font.CaptionHeader.Font, Vector2.new(10000, 10000)).X
		local var7 = x + 24
		local var8 = 240 - (32 + var5 + 12)
		
		return if isLoading then nil else roact.createElement(interactable, {
			Size = UDim2.new(0, var7 + 8 + var5 + 12, 0, 28),
			BackgroundColor3 = var4.Color,
			BackgroundTransparency = var4.Transparency,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			isDisabled = isDisabled,
			[roact.Event.Activated] = if not isLoading then onActivated else nil,
			onStateChanged = p1.onStateChanged
		}, {
			UIListLayout = roact.createElement("UIListLayout", {
				Padding = UDim.new(0, 0),
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			Content = roact.createElement("Frame", {
				ClipsDescendants = true,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, x + 8 + var5 + 12, 1, 0)
			}, {
				UIListLayout = roact.createElement("UIListLayout", {
					Padding = UDim.new(0, 4),
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Icon = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromOffset(var5, var5),
					Image = icon,
					ImageColor3 = var2.Color,
					ImageTransparency = var2.Transparency
				}),
				TextArea = string.len(text) > 0 and roact.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(x, var6)
				}, {
					PillText = roact.createElement(styledTextLabel, {
						text = text,
						fontStyle = font.CaptionHeader,
						colorStyle = var3,
						textTruncate = Enum.TextTruncate.AtEnd,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Center,
						size = UDim2.fromOffset(var8, var6),
						[roact.Ref] = p1.PillText
					}),
					roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(var8, 28) })
				}),
				BadgeFrame = roact.createElement("Frame", {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(12, 12)
				}, {
					Badge = roact.createElement(badge, { value = badgeStates.isEmpty })
				}),
				UISizeConstraint = roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(216, 28) })
			}),
			UICorner = roact.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			UISizeConstraint = roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(240, 28) })
		}) or roact.createElement(skeleton, {
			Size = UDim2.new(0, var7 + 4 + var5, 0, 28),
			radius = radius.Circle
		})
	end)
end

return pill