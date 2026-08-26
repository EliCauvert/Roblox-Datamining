local imageSet = require(script:FindFirstAncestor("AppBlox").Parent.UIBlox).App.ImageSet
local iconSize = imageSet.getIconSize(imageSet.Enum.IconSize.Medium)

function calcMediaGallerySizesFromWidth(p1, p2, p3)
	-- upvalues: iconSize (ref)
	local var1 = if p3 then p1 else p1 - iconSize * 2
	local floored = math.floor(var1 / 1.777777777778)
	local var2 = if p3 then math.floor((p1 - (p2 - 1) * 12) / p2) else math.floor((p1 - (p2 - 1) * 12 - iconSize * 2) / p2)
	local floored_1 = math.floor(var2 / 1.777777777778)
	
	return {
		contentSize = UDim2.fromOffset(p1, floored + floored_1 + 24),
		previewSize = UDim2.fromOffset(var1, floored),
		paginationSize = UDim2.fromOffset(if p3 then p1 + iconSize * 2 else p1, floored_1),
		thumbnailSize = UDim2.fromOffset(var2, floored_1)
	}
end

return calcMediaGallerySizesFromWidth