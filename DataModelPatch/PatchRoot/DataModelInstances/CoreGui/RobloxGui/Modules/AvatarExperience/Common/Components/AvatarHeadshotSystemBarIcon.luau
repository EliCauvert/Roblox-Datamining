local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithAnimationFunction = UIBloxModule.Core.Animation.withAnimation
local Placement = UIBloxModule.App.Navigation.Enum.Placement
local AvatarHeadshotLocalIconModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.AvatarHeadshotLocalIcon)
local config = { frequency = 3 }
local AvatarHeadshotSystemBarIcon = RoactModule.PureComponent:extend("AvatarHeadshotSystemBarIcon")
AvatarHeadshotSystemBarIcon.validateProps = TModule.strictInterface({
	placement = Placement.isEnumValue,
	hovered = TModule.boolean,
	selected = TModule.boolean,
	pressed = TModule.boolean,
	badgeValue = TModule.optional(TModule.union(TModule.number, TModule.string)),
	size = TModule.optional(TModule.number)
})

function AvatarHeadshotSystemBarIcon.render(p1)
	-- upvalues: WithStyleFunction (copy), Placement (copy), WithAnimationFunction (copy), RoactModule (copy), AvatarHeadshotLocalIconModule (copy), config (copy)
	local Size = p1.props.size or 42
	
	return WithStyleFunction(function(_)
		-- upvalues: p1 (copy), Placement (upval), WithAnimationFunction (upval), RoactModule (upval), AvatarHeadshotLocalIconModule (upval), Size (copy), config (upval)
		local HoverOffsetX = 0
		local HoverOffsetY = 0
		
		if p1.props.hovered then
			if p1.props.placement == Placement.Bottom then
				HoverOffsetY = -4
			else
				HoverOffsetX = 4
			end
		end
		return WithAnimationFunction({ hoverOffsetX = HoverOffsetX, hoverOffsetY = HoverOffsetY }, function(p2)
			-- upvalues: RoactModule (upval), AvatarHeadshotLocalIconModule (upval), Size (upval)
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, math.floor(p2.hoverOffsetX + 0.5), 0.5, (math.floor(p2.hoverOffsetY + 0.5))),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(42, 42)
			}, {
				AvatarHeadshotLocalIcon = RoactModule.createElement(AvatarHeadshotLocalIconModule, { ZIndex = 2, Size = Size })
			})
		end, config)
	end)
end

return AvatarHeadshotSystemBarIcon