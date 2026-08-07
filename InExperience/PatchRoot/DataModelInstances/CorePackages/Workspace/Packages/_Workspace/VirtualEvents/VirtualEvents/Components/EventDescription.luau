local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local skeleton = require(virtualEvents.Parent.Foundation).Skeleton
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local experienceTileV3 = UIBloxModule.App.Tile.ExperienceTileV3
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local uDim2 = UDim2.new(0, 150, 0, 210)

return function(p0) --[[ line: 28 | named "EventDescription" ]]
	-- upvalues: useStyle (ref), useLocalization (ref), useTextSizeOffset (ref), uDim2 (ref), reactModule (ref), styledTextLabel (ref), skeleton (ref), experienceTileV3 (ref)
	local var4 = useStyle()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 32)
		}),
		DescriptionHeader = reactModule.createElement(styledTextLabel, {
			layoutOrder = 0,
			text = useLocalization({ header = "Feature.VirtualEvents.DescriptionLabel" }).header,
			automaticSize = Enum.AutomaticSize.XY,
			fontStyle = var4.Font.Header1,
			colorStyle = var4.Theme.TextEmphasis
		}),
		Description = if p0.description then reactModule.createElement(styledTextLabel, {
			layoutOrder = 1,
			text = p0.description,
			automaticSize = Enum.AutomaticSize.XY,
			fontStyle = var4.Font.Body,
			colorStyle = var4.Theme.TextDefault
		}) else reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, var4.Font.BaseSize) }),
		ExperienceTileWrapper = reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = uDim2 + UDim2.fromOffset(0, useTextSizeOffset() * 2)
		}, {
			ExperienceTile = reactModule.createElement(experienceTileV3, {
				experienceName = p0.experienceName,
				thumbnail = p0.experienceThumbnail,
				onActivated = p0.onExperienceTileActivated,
				styleProps = { overlayColors = { Hover = var4.Theme.BackgroundOnHover } }
			})
		})
	})
end