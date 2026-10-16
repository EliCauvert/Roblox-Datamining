local ImageSet = require(script:FindFirstAncestor("AppBlox").Parent.UIBlox).App.ImageSet
local IconSize = ImageSet.getIconSize(ImageSet.Enum.IconSize.Medium)

function calcMediaGallerySizesFromWidth(XOffset, p1: number, p2) --[[ Line: 15 ]]
	-- upvalues: IconSize (copy)
	local XOffset1 = if p2 then XOffset else XOffset - IconSize * 2
	local Floored = math.floor(XOffset1 / 1.7777777777777777)
	local Floored1: number = if p2 then math.floor((XOffset - (p1 - 1) * 12) / p1) else math.floor((XOffset - (p1 - 1) * 12 - IconSize * 2) / p1)
	local Floored2 = math.floor(Floored1 / 1.7777777777777777)
	
	return {
		contentSize = UDim2.fromOffset(XOffset, Floored + Floored2 + 24),
		previewSize = UDim2.fromOffset(XOffset1, Floored),
		paginationSize = UDim2.fromOffset(if p2 then XOffset + IconSize * 2 else XOffset, Floored2),
		thumbnailSize = UDim2.fromOffset(Floored1, Floored2)
	}
end

return calcMediaGallerySizesFromWidth