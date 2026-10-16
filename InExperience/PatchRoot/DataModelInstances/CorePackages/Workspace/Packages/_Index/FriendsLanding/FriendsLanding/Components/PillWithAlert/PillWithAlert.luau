local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Roact = DependenciesModule.Roact
local T = DependenciesModule.t
local TextService = DependenciesModule.TextService
local UIBlox = DependenciesModule.UIBlox
local Foundation = DependenciesModule.Foundation
local Radius = Foundation.Enums.Radius
local Skeleton = Foundation.Skeleton
local IconSize = UIBlox.App.ImageSet.Enum.IconSize
local GetIconSizeFunction = UIBlox.App.ImageSet.getIconSize
local WithStyleFunction = UIBlox.Core.Style.withStyle
local ControlState = UIBlox.Core.Control.Enum.ControlState
local Interactable = UIBlox.Core.Control.Interactable
local Badge = UIBlox.App.Indicator.Badge
local BadgeStates = UIBlox.App.Indicator.Enum.BadgeStates
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel

local function v15(p1, ControlState1, p2) --[[ Line: 30 ]]
	-- upvalues: ControlState (copy)
	local v1 = p1[ControlState1] or p1[ControlState.Default]
	local config = {
		Color = p2.Theme[v1].Color,
		Transparency = p2.Theme[v1].Transparency
	}
	
	if ControlState1 == ControlState.Disabled or ControlState1 == ControlState.Pressed then
		config.Transparency = 0.5 * config.Transparency + 0.5
	end
	return config
end

local Pill = Roact.PureComponent:extend("Pill")
Pill.validateProps = T.strictInterface({
	text = T.optional(T.string),
	isSelected = T.optional(T.boolean),
	isDisabled = T.optional(T.boolean),
	isLoading = T.optional(T.boolean),
	icon = T.union(T.string, UIBlox.Core.ImageSet.Validator.validateImage),
	onActivated = T.callback
})

function Pill.init(p1) --[[ Line: 58 ]]
	-- upvalues: ControlState (copy)
	p1.state = { controlState = ControlState.Initialize }
	
	function p1:onStateChanged(ControlState) --[[ Line: 63 ]]
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
	end
end

function Pill.render(p1) --[[ Line: 70 ]]
	-- upvalues: WithStyleFunction (copy), ControlState (copy), v15 (copy), GetIconSizeFunction (copy), IconSize (copy), TextService (copy), Roact (copy), Interactable (copy), ImageSetLabel (copy), StyledTextLabel (copy), Badge (copy), BadgeStates (copy), Skeleton (copy), Radius (copy)
	return WithStyleFunction(function(p2) --[[ Line: 71 ]]
		-- upvalues: p1 (copy), ControlState (upval), v15 (upval), GetIconSizeFunction (upval), IconSize (upval), TextService (upval), Roact (upval), Interactable (upval), ImageSetLabel (upval), StyledTextLabel (upval), Badge (upval), BadgeStates (upval), Skeleton (upval), Radius (upval)
		local _Font = p2.Font
		local IsSelected = p1.props.isSelected
		local IsDisabled = p1.props.isDisabled
		local IsLoading = p1.props.isLoading
		local Icon = p1.props.icon
		local Text: string = p1.props.text
		local OnActivated = p1.props.onActivated
		local config = {
			[ControlState.Default] = if IsSelected then "SystemPrimaryContent" else "TextDefault",
			[ControlState.Hover] = if IsSelected then "SystemPrimaryContent" else "TextEmphasis"
		}
		local config1 = {
			[ControlState.Default] = if IsSelected then "SystemPrimaryDefault" else "BackgroundUIDefault",
			[ControlState.Hover] = if IsSelected then "SystemPrimaryOnHover" else "BackgroundUIDefault"
		}
		local v1 = v15({
			[ControlState.Default] = if IsSelected then "SystemPrimaryContent" else "IconDefault",
			[ControlState.Hover] = if IsSelected then "SystemPrimaryContent" else "IconEmphasis"
		}, p1.state.controlState, p2)
		local ColorStyle = v15(config, p1.state.controlState, p2)
		local v2 = v15(config1, p1.state.controlState, p2)
		local IconSize1: number = GetIconSizeFunction(IconSize.Small)
		local ScaledRelativeSize = _Font.CaptionHeader.RelativeSize * _Font.BaseSize
		local X: number = TextService:GetTextSize(Text, ScaledRelativeSize, _Font.CaptionHeader.Font, Vector2.new(10000, 10000)).X
		local NewX = X + 24
		local XOffset = 240 - (32 + IconSize1 + 12)
		
		return if IsLoading then nil else Roact.createElement(Interactable, {
			Size = UDim2.new(0, NewX + 8 + IconSize1 + 12, 0, 28),
			BackgroundColor3 = v2.Color,
			BackgroundTransparency = v2.Transparency,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			isDisabled = IsDisabled,
			[Roact.Event.Activated] = if IsLoading then nil else OnActivated or nil,
			onStateChanged = p1.onStateChanged
		}, {
			UIListLayout = Roact.createElement("UIListLayout", {
				Padding = UDim.new(0, 0),
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			Content = Roact.createElement("Frame", {
				ClipsDescendants = true,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, X + 8 + IconSize1 + 12, 1, 0)
			}, {
				UIListLayout = Roact.createElement("UIListLayout", {
					Padding = UDim.new(0, 4),
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Icon = Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromOffset(IconSize1, IconSize1),
					Image = Icon,
					ImageColor3 = v1.Color,
					ImageTransparency = v1.Transparency
				}),
				TextArea = string.len(Text) > 0 and Roact.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(X, ScaledRelativeSize)
				}, {
					PillText = Roact.createElement(StyledTextLabel, {
						text = Text,
						fontStyle = _Font.CaptionHeader,
						colorStyle = ColorStyle,
						textTruncate = Enum.TextTruncate.AtEnd,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Center,
						size = UDim2.fromOffset(XOffset, ScaledRelativeSize),
						[Roact.Ref] = p1.PillText
					}),
					Roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(XOffset, 28) })
				}),
				BadgeFrame = Roact.createElement("Frame", {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(12, 12)
				}, {
					Badge = Roact.createElement(Badge, { value = BadgeStates.isEmpty })
				}),
				UISizeConstraint = Roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(216, 28) })
			}),
			UICorner = Roact.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			UISizeConstraint = Roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(240, 28) })
		}) or Roact.createElement(Skeleton, {
			Size = UDim2.new(0, NewX + 4 + IconSize1, 0, 28),
			radius = Radius.Circle
		})
	end)
end

return Pill