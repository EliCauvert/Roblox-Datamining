local roactModule = require(script.Parent.Parent.Roact)
local flagsModule = require(script.Parent.Flags)
local fStringAdGuiLivePreviewWatermark = flagsModule.GetFStringAdGuiLivePreviewWatermark()
local fStringAdGuiLivePreviewWatermarkV2 = flagsModule.GetFStringAdGuiLivePreviewWatermarkV2()
local fStringLivePreviewPlaceId = flagsModule.GetFStringLivePreviewPlaceId()
local fFlagUseV2LivePreviewWatermark = flagsModule.GetFFlagUseV2LivePreviewWatermark()
local livePreviewWatermark = roactModule.PureComponent:extend("LivePreviewWatermark")

function livePreviewWatermark.init(p1)
	p1.placeId = tostring(game.PlaceId)
end

function livePreviewWatermark.render(p1)
	-- upvalues: fStringLivePreviewPlaceId (ref), roactModule (ref), fFlagUseV2LivePreviewWatermark (ref), fStringAdGuiLivePreviewWatermarkV2 (ref), fStringAdGuiLivePreviewWatermark (ref)
	return fStringLivePreviewPlaceId == p1.placeId and p1.props.IsVisible and (roactModule.createElement("ImageLabel", {
		ZIndex = -999,
		Transparency = 1,
		Image = if fFlagUseV2LivePreviewWatermark then fStringAdGuiLivePreviewWatermarkV2 else fStringAdGuiLivePreviewWatermark,
		Size = fFlagUseV2LivePreviewWatermark and UDim2.new(1, 0, 1, 0) or UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		ScaleType = Enum.ScaleType.Fit,
		ImageTransparency = if fFlagUseV2LivePreviewWatermark then 0 else 0.7,
		Rotation = if fFlagUseV2LivePreviewWatermark then 0 else 15
	}) or nil)
end

return livePreviewWatermark