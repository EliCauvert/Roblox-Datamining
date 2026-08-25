local coreGuiService = game:GetService("CoreGui")
local parent = script.Parent.Parent.Parent
local UIBloxModule = require(parent.UIBlox)
local roactModule = require(parent.Roact)
local withHoverTooltip = UIBloxModule.App.Dialog.TooltipV2.withHoverTooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local images = UIBloxModule.App.ImageSet.Images
local interactable = UIBloxModule.Core.Control.Interactable
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local info = images["icons/actions/info"]

function InfoIconWithTooltip(p0)
	-- upvalues: withHoverTooltip (ref), tooltipOrientation (ref), coreGuiService (ref), roactModule (ref), imageSetLabel (ref), info (ref), interactable (ref)
	local uDim2 = UDim2.new(0, 18, 0, 18)
	
	return withHoverTooltip({ bodyText = p0.text }, {
		DisplayOrder = 10,
		delayTime = 0.2,
		triggerPointName = "BonusBannerInfoIcon",
		preferredOrientation = tooltipOrientation.Bottom,
		guiTarget = coreGuiService
	}, function(p1, p2)
		-- upvalues: roactModule (copy), uDim2 (ref), p0 (ref), imageSetLabel (copy), info (copy), interactable (copy)
		return roactModule.createElement("Frame", {
			Size = uDim2,
			BackgroundTransparency = 1,
			LayoutOrder = p0.layoutOrder,
			AnchorPoint = Vector2.new(1, 0),
			[roactModule.Change.AbsolutePosition] = p1,
			[roactModule.Change.AbsoluteSize] = p1
		}, {
			TooltipIcon = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = uDim2,
				Image = info,
				ImageColor3 = p0.color
			}),
			Hitbox = roactModule.createElement(interactable, {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				onStateChanged = p2,
				[roactModule.Event.Activated] = p0.eventActivated,
				ZIndex = 2
			})
		})
	end)
end

return InfoIconWithTooltip