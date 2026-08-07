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

local var1 = function(p0, p1, p2) --[[ line: 30 ]]
	-- upvalues: controlState (ref)
	local var3 = p0[p1] or p0[controlState.Default]
	local t = {
		Color = p2.Theme[var3].Color,
		Transparency = p2.Theme[var3].Transparency
	}
	
	if p1 == controlState.Disabled or p1 == controlState.Pressed then
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

function pill.init(p3) --[[ line: 58 ]]
	-- upvalues: controlState (ref)
	p3.state = { controlState = controlState.Initialize }
	
	function p3.onStateChanged(_, p4) --[[ line: 63 ]]
		-- upvalues: p3 (ref)
		p3:setState({ controlState = p4 })
	end
end

function pill.render(p5) --[[ line: 70 ]]
	-- upvalues: withStyle (ref), controlState (ref), var1 (ref), getIconSize (ref), iconSize (ref), textService (ref), roact (ref), interactable (ref), imageSetLabel (ref), styledTextLabel (ref), badge (ref), badgeStates (ref), skeleton (ref), radius (ref)
	return withStyle(function(p6) --[[ line: 71 ]]
		-- upvalues: p5 (ref), controlState (copy), var1 (copy), getIconSize (copy), iconSize (copy), textService (copy), roact (copy), interactable (copy), imageSetLabel (copy), styledTextLabel (copy), badge (copy), badgeStates (copy), skeleton (copy), radius (copy)
		local font = p6.Font
		local isSelected = p5.props.isSelected
		local isDisabled = p5.props.isDisabled
		local isLoading = p5.props.isLoading
		local icon = p5.props.icon
		local text = p5.props.text
		local onActivated = p5.props.onActivated
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
		local var8 = var1(t, p5.state.controlState, p6)
		local var9 = var1(t_1, p5.state.controlState, p6)
		local var10 = var1(t_2, p5.state.controlState, p6)
		local var11 = getIconSize(iconSize.Small)
		local var12 = font.CaptionHeader.RelativeSize * font.BaseSize
		local x = textService:GetTextSize(text, var12, font.CaptionHeader.Font, Vector2.new(10000, 10000)).X
		local var13 = x + 24
		local var14 = 240 - (32 + var11 + 12)
		
		return if isLoading then nil else roact.createElement(interactable, {
			Size = UDim2.new(0, var13 + 8 + var11 + 12, 0, 28),
			BackgroundColor3 = var10.Color,
			BackgroundTransparency = var10.Transparency,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			isDisabled = isDisabled,
			[roact.Event.Activated] = if not isLoading then onActivated else nil,
			onStateChanged = p5.onStateChanged
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
				Size = UDim2.new(0, x + 8 + var11 + 12, 1, 0)
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
					Size = UDim2.fromOffset(var11, var11),
					Image = icon,
					ImageColor3 = var8.Color,
					ImageTransparency = var8.Transparency
				}),
				TextArea = string.len(text) > 0 and roact.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(x, var12)
				}, {
					PillText = roact.createElement(styledTextLabel, {
						text = text,
						fontStyle = font.CaptionHeader,
						colorStyle = var9,
						textTruncate = Enum.TextTruncate.AtEnd,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Center,
						size = UDim2.fromOffset(var14, var12),
						[roact.Ref] = p5.PillText
					}),
					roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(var14, 28) })
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
			Size = UDim2.new(0, var13 + 4 + var11, 0, 28),
			radius = radius.Circle
		})
	end)
end

return pill