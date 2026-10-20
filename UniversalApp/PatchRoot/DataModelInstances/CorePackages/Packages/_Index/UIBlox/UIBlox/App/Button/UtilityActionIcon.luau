local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local Label = require(Parent.Core.ImageSet.ImageSetComponent).Label
local UseStyleModule = require(Parent.Core.Style.useStyle)
local _ = require(Parent.App.ImageSet.ImagesTypes)
local _ = require(Parent.App.Style.StyleTypes)
local WithHoverTooltipFunction = require(Parent.App.Dialog.TooltipV2.Controllers).withHoverTooltip
local TooltipOrientationModule = require(Parent.App.Dialog.Tooltip.Enum.TooltipOrientation)
local StateLayerModule = require(Parent.Core.Control.StateLayer)
local MigrateBadgeVariantModule = require(Parent.Utility.migrateBadgeVariant)
local StatusIndicator = require(Parent1.Foundation).StatusIndicator
local config = {
	disableOutset = false,
	onMedia = false,
	badgeVariant = require(Parent.App.Indicator.Enum.BadgeVariant).Alert,
	tooltipTarget = game:GetService("CoreGui")
}

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: CryoModule (copy), config (copy), UseStyleModule (copy), ReactModule (copy), WithHoverTooltipFunction (copy), TooltipOrientationModule (copy), StateLayerModule (copy), Label (copy), StatusIndicator (copy), MigrateBadgeVariantModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local AnchorPoint = JoinResult.anchorPoint
	local Position = JoinResult.position
	local LayoutOrder = JoinResult.layoutOrder
	local Icon = JoinResult.icon
	local BadgeValue = JoinResult.badgeValue
	local BadgeVariant = JoinResult.badgeVariant
	local TooltipText = JoinResult.tooltipText
	local TooltipTarget = JoinResult.tooltipTarget
	local DisableOutset = JoinResult.disableOutset
	local OnMedia = JoinResult.onMedia
	local OnActivated = JoinResult.onActivated
	local Tokens = UseStyleModule().Tokens
	local Size1000 = Tokens.Size.Size_1000
	local Size900 = Tokens.Size.Size_900
	local White100 = if OnMedia then Tokens.Color.Extended.White.White_100 else Tokens.Color.Content.Emphasis
	local IconColor = if JoinResult.iconColor then JoinResult.iconColor else White100
	local Darken: string = if OnMedia then "Darken" else "Standard"
	local _Vector2 = Vector2.new(0, 1)
	local _UDim2 = UDim2.new(0.5, Tokens.Size.Size_50, 0.5, -Tokens.Size.Size_50)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DisableOutset (copy), Tokens (copy)
		return if DisableOutset then nil else {
			top = UDim.new(0, Tokens.Size.Size_100),
			right = UDim.new(0, Tokens.Size.Size_100),
			bottom = UDim.new(0, Tokens.Size.Size_100),
			left = UDim.new(0, Tokens.Size.Size_100)
		}
	end, { DisableOutset, Tokens })
	local UseMemoResult1 = ReactModule.useMemo(function(): UDim2
		-- upvalues: Size1000 (copy), UseMemoResult (copy)
		local _UDim = UDim.new(0, Size1000)
		
		return if UseMemoResult then UDim2.new(_UDim + UseMemoResult.left + UseMemoResult.right, _UDim + UseMemoResult.top + UseMemoResult.bottom) else UDim2.new(_UDim, _UDim)
	end, { Size1000, UseMemoResult })
	
	return WithHoverTooltipFunction({ bodyText = TooltipText }, {
		DisplayOrder = 10,
		disabled = not TooltipText,
		preferredOrientation = TooltipOrientationModule.Bottom,
		guiTarget = TooltipTarget,
		DEBUG_useTargetDirectly = JoinResult._DEBUG_is_plugin
	}, function(p2, OnStateChanged)
		-- upvalues: ReactModule (upval), UseMemoResult1 (copy), AnchorPoint (copy), Position (copy), LayoutOrder (copy), Ref (copy), OnMedia (copy), Size1000 (copy), Tokens (copy), StateLayerModule (upval), Darken (copy), UseMemoResult (copy), OnActivated (copy), Label (upval), Size900 (copy), Icon (copy), IconColor (copy), BadgeValue (copy), StatusIndicator (upval), _UDim2 (copy), _Vector2 (copy), MigrateBadgeVariantModule (upval), BadgeVariant (copy), JoinResult (copy)
		return ReactModule.createElement("Frame", {
			Selectable = false,
			Size = UseMemoResult1,
			AnchorPoint = AnchorPoint,
			Position = Position,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = LayoutOrder,
			[ReactModule.Change.AbsoluteSize] = p2,
			[ReactModule.Change.AbsolutePosition] = p2,
			ref = Ref
		}, {
			Background = if OnMedia then ReactModule.createElement("Frame", {
				Selectable = false,
				BorderSizePixel = 0,
				BackgroundTransparency = 0.5,
				ZIndex = 1,
				Size = UDim2.fromOffset(Size1000, Size1000),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundColor3 = Tokens.Color.Extended.Black.Black_100.Color3
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Circle) })
			}) else nil,
			StateLayer = ReactModule.createElement(StateLayerModule, {
				zIndex = 2,
				size = UDim2.fromOffset(Size1000, Size1000),
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				cornerRadius = UDim.new(0, Tokens.Radius.Circle),
				stateStyle = Darken,
				outset = UseMemoResult,
				onStateChanged = OnStateChanged,
				onActivated = OnActivated
			}),
			Icon = ReactModule.createElement(Label, {
				Selectable = false,
				BackgroundTransparency = 1,
				ZIndex = 3,
				Size = UDim2.fromOffset(Size900, Size900),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = Icon,
				ImageColor3 = IconColor.Color3,
				ImageTransparency = IconColor.Transparency
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Circle) }),
				Badge = if BadgeValue then ReactModule.createElement(StatusIndicator, {
					Position = _UDim2,
					AnchorPoint = _Vector2,
					value = tonumber(BadgeValue),
					variant = MigrateBadgeVariantModule(BadgeVariant),
					max = if tonumber(BadgeValue) then 99 else nil
				}) else nil
			}, JoinResult.children)
		})
	end)
end)