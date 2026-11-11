local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local _ = require(Parent.Types)
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Image = FoundationModule.Image
local View = FoundationModule.View
local GetContentFromObjectFunction = require(Parent1.CapturesCommon).Utils.getContentFromObject

local function renderThumbnailSlot(SlotCapture, Thumbnail, IsActiveSlotMatch)
	-- upvalues: ReactModule (copy), View (copy), Image (copy), GetContentFromObjectFunction (copy)
	return ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center size-full",
		scale = Thumbnail.scale,
		ZIndex = if IsActiveSlotMatch then 2 else 1
	}, {
		Thumbnail = ReactModule.createElement(Image, {
			tag = "position-center-center anchor-center-center size-600-600 radius-small",
			ImageContent = if SlotCapture then GetContentFromObjectFunction(SlotCapture) else nil,
			imageStyle = Thumbnail.style,
			ScaleType = Enum.ScaleType.Crop
		})
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), renderThumbnailSlot (copy), Icon (copy), IconName (copy), IconSize (copy)
	return ReactModule.createElement(View, { tag = "size-1200-1200" }, {
		GalleryThumbnail1 = renderThumbnailSlot(p1.slotCaptures[1], p1.thumbnails[1], p1.activeSlot == 1),
		GalleryThumbnail2 = renderThumbnailSlot(p1.slotCaptures[2], p1.thumbnails[2], p1.activeSlot == 2),
		GalleryIcon = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center size-full",
			scale = p1.iconScale
		}, {
			Icon = ReactModule.createElement(Icon, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				name = IconName.ImageStacked,
				size = IconSize.Large,
				style = p1.iconStyle
			})
		})
	})
end