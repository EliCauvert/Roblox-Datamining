local ImageSet = require(script:FindFirstAncestor("AppBlox").Parent.UIBlox).App.ImageSet
local CalcMediaGallerySizesFromWidthModule = require(script.Parent.calcMediaGallerySizesFromWidth)
local IconSize = ImageSet.getIconSize(ImageSet.Enum.IconSize.Medium)

function calcMediaGallerySizesFromHeight(p1: number, p2: number, p3)
	-- upvalues: IconSize (copy), CalcMediaGallerySizesFromWidthModule (copy)
	return CalcMediaGallerySizesFromWidthModule(math.floor((math.floor((p1 - 24) * 1.7777777777777777 * p2) + (p2 - 1) * 12 + IconSize * 2 + IconSize * 2 * p2) / (p2 + 1)), p2, p3)
end

return calcMediaGallerySizesFromHeight