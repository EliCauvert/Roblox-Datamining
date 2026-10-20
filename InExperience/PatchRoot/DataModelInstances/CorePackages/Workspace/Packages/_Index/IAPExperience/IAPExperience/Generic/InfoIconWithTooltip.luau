local CoreGui = game:GetService("CoreGui")
local Parent = script.Parent.Parent.Parent
local UIBloxModule = require(Parent.UIBlox)
local RoactModule = require(Parent.Roact)
local WithHoverTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withHoverTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local Interactable = UIBloxModule.Core.Control.Interactable
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconsActionsInfo = UIBloxModule.App.ImageSet.Images["icons/actions/info"]

function InfoIconWithTooltip(p1)
	-- upvalues: WithHoverTooltipFunction (copy), TooltipOrientation (copy), CoreGui (copy), RoactModule (copy), ImageSetLabel (copy), IconsActionsInfo (copy), Interactable (copy)
	local _UDim2 = UDim2.new(0, 18, 0, 18)
	
	return WithHoverTooltipFunction({ bodyText = p1.text }, {
		DisplayOrder = 10,
		delayTime = 0.2,
		triggerPointName = "BonusBannerInfoIcon",
		preferredOrientation = TooltipOrientation.Bottom,
		guiTarget = CoreGui
	}, function(p2, OnStateChanged)
		-- upvalues: RoactModule (upval), _UDim2 (copy), p1 (copy), ImageSetLabel (upval), IconsActionsInfo (upval), Interactable (upval)
		return RoactModule.createElement("Frame", {
			Size = _UDim2,
			BackgroundTransparency = 1,
			LayoutOrder = p1.layoutOrder,
			AnchorPoint = Vector2.new(1, 0),
			[RoactModule.Change.AbsolutePosition] = p2,
			[RoactModule.Change.AbsoluteSize] = p2
		}, {
			TooltipIcon = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = _UDim2,
				Image = IconsActionsInfo,
				ImageColor3 = p1.color
			}),
			Hitbox = RoactModule.createElement(Interactable, {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				onStateChanged = OnStateChanged,
				[RoactModule.Event.Activated] = p1.eventActivated,
				ZIndex = 2
			})
		})
	end)
end

return InfoIconWithTooltip