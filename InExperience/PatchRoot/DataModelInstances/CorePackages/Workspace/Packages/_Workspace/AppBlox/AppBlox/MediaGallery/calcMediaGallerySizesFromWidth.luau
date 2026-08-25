local imageSet = require(script:FindFirstAncestor("AppBlox").Parent.UIBlox).App.ImageSet
local iconSize = imageSet.getIconSize(imageSet.Enum.IconSize.Medium)

function calcMediaGallerySizesFromWidth(p0, p1, p2)
	-- upvalues: iconSize (ref)
	local var1 = if p2 then p0 else p0 - iconSize * 2
	local floored = math.floor(var1 / 1.777777777778)
	local var3 = if p2 then math.floor((p0 - (p1 - 1) * 12) / p1) else math.floor((p0 - (p1 - 1) * 12 - iconSize * 2) / p1)
	local floored_1 = math.floor(var3 / 1.777777777778)
	
	return {
		contentSize = UDim2.fromOffset(p0, floored + floored_1 + 24),
		previewSize = UDim2.fromOffset(var1, floored),
		paginationSize = UDim2.fromOffset(if p2 then p0 + iconSize * 2 else p0, floored_1),
		thumbnailSize = UDim2.fromOffset(var3, floored_1)
	}
end

return calcMediaGallerySizesFromWidth