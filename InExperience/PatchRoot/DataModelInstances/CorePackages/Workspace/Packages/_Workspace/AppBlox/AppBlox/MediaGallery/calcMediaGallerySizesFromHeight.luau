local ImageSet = require(script:FindFirstAncestor("AppBlox").Parent.UIBlox).App.ImageSet
local IconSize = ImageSet.Enum.IconSize
local GetIconSizeFunction = ImageSet.getIconSize
local CalcMediaGallerySizesFromWidthModule = require(script.Parent.calcMediaGallerySizesFromWidth)
local IconSize1 = GetIconSizeFunction(IconSize.Medium)

function calcMediaGallerySizesFromHeight(p1: number, p2: number, p3)
	-- upvalues: IconSize1 (copy), CalcMediaGallerySizesFromWidthModule (copy)
	return CalcMediaGallerySizesFromWidthModule(math.floor((math.floor((p1 - 24) * 1.7777777777777777 * p2) + (p2 - 1) * 12 + IconSize1 * 2 + IconSize1 * 2 * p2) / (p2 + 1)), p2, p3)
end

return calcMediaGallerySizesFromHeight