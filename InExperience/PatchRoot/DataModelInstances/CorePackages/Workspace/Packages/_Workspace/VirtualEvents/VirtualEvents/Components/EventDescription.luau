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

return function(p1)
	-- upvalues: useStyle (ref), useLocalization (ref), useTextSizeOffset (ref), uDim2 (ref), reactModule (ref), styledTextLabel (ref), skeleton (ref), experienceTileV3 (ref)
	local var1 = useStyle()
	
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
			fontStyle = var1.Font.Header1,
			colorStyle = var1.Theme.TextEmphasis
		}),
		Description = if p1.description then reactModule.createElement(styledTextLabel, {
			layoutOrder = 1,
			text = p1.description,
			automaticSize = Enum.AutomaticSize.XY,
			fontStyle = var1.Font.Body,
			colorStyle = var1.Theme.TextDefault
		}) else reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, var1.Font.BaseSize) }),
		ExperienceTileWrapper = reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = uDim2 + UDim2.fromOffset(0, useTextSizeOffset() * 2)
		}, {
			ExperienceTile = reactModule.createElement(experienceTileV3, {
				experienceName = p1.experienceName,
				thumbnail = p1.experienceThumbnail,
				onActivated = p1.onExperienceTileActivated,
				styleProps = { overlayColors = { Hover = var1.Theme.BackgroundOnHover } }
			})
		})
	})
end