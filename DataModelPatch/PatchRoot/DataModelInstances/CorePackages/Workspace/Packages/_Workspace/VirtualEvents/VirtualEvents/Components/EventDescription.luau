local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ReactModule = require(VirtualEvents.Parent.React)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local Skeleton = require(VirtualEvents.Parent.Foundation).Skeleton
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local ExperienceTileV3 = UIBloxModule.App.Tile.ExperienceTileV3
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local _UDim2 = UDim2.new(0, 150, 0, 210)

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), UseTextSizeOffsetFunction (copy), _UDim2 (copy), ReactModule (copy), StyledTextLabel (copy), Skeleton (copy), ExperienceTileV3 (copy)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 32)
		}),
		DescriptionHeader = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 0,
			text = UseLocalizationFunction({ header = "Feature.VirtualEvents.DescriptionLabel" }).header,
			automaticSize = Enum.AutomaticSize.XY,
			fontStyle = UseStyleResult.Font.Header1,
			colorStyle = UseStyleResult.Theme.TextEmphasis
		}),
		Description = if p1.description then ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 1,
			text = p1.description,
			automaticSize = Enum.AutomaticSize.XY,
			fontStyle = UseStyleResult.Font.Body,
			colorStyle = UseStyleResult.Theme.TextDefault
		}) else ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, UseStyleResult.Font.BaseSize) }),
		ExperienceTileWrapper = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = _UDim2 + UDim2.fromOffset(0, UseTextSizeOffsetFunction() * 2)
		}, {
			ExperienceTile = ReactModule.createElement(ExperienceTileV3, {
				experienceName = p1.experienceName,
				thumbnail = p1.experienceThumbnail,
				onActivated = p1.onExperienceTileActivated,
				styleProps = {
					overlayColors = { Hover = UseStyleResult.Theme.BackgroundOnHover }
				}
			})
		})
	})
end