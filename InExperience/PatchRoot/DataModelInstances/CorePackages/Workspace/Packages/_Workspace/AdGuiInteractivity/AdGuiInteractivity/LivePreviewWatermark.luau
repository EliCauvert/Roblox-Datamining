local RoactModule = require(script.Parent.Parent.Roact)
local FlagsModule = require(script.Parent.Flags)
local FStringAdGuiLivePreviewWatermark = FlagsModule.GetFStringAdGuiLivePreviewWatermark()
local FStringAdGuiLivePreviewWatermarkV2 = FlagsModule.GetFStringAdGuiLivePreviewWatermarkV2()
local FStringLivePreviewPlaceId = FlagsModule.GetFStringLivePreviewPlaceId()
local FFlagUseV2LivePreviewWatermark = FlagsModule.GetFFlagUseV2LivePreviewWatermark()
local LivePreviewWatermark = RoactModule.PureComponent:extend("LivePreviewWatermark")

function LivePreviewWatermark.init(p1) --[[ Line: 13 ]]
	p1.placeId = tostring(game.PlaceId)
end

function LivePreviewWatermark.render(p1) --[[ Line: 17 ]]
	-- upvalues: FStringLivePreviewPlaceId (copy), RoactModule (copy), FFlagUseV2LivePreviewWatermark (copy), FStringAdGuiLivePreviewWatermarkV2 (copy), FStringAdGuiLivePreviewWatermark (copy)
	return FStringLivePreviewPlaceId == p1.placeId and p1.props.IsVisible and RoactModule.createElement("ImageLabel", {
		ZIndex = -999,
		Transparency = 1,
		Image = FFlagUseV2LivePreviewWatermark and FStringAdGuiLivePreviewWatermarkV2 or FStringAdGuiLivePreviewWatermark,
		Size = FFlagUseV2LivePreviewWatermark and UDim2.new(1, 0, 1, 0) or UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		ScaleType = Enum.ScaleType.Fit,
		ImageTransparency = if FFlagUseV2LivePreviewWatermark then 0 else 0.7,
		Rotation = if FFlagUseV2LivePreviewWatermark then 0 else 15
	}) or nil
end

return LivePreviewWatermark