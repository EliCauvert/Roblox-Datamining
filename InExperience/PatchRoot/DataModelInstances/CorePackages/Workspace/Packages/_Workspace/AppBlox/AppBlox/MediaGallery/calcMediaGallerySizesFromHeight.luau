local imageSet = require(script:FindFirstAncestor("AppBlox").Parent.UIBlox).App.ImageSet
local calcMediaGallerySizesFromWidthModule = require(script.Parent.calcMediaGallerySizesFromWidth)
local iconSize = imageSet.getIconSize(imageSet.Enum.IconSize.Medium)

function calcMediaGallerySizesFromHeight(p0, p1, p2)
	-- upvalues: iconSize (ref), calcMediaGallerySizesFromWidthModule (ref)
	return calcMediaGallerySizesFromWidthModule(math.floor((math.floor((p0 - 24) * 1.777777777778 * p1) + (p1 - 1) * 12 + iconSize * 2 + iconSize * 2 * p1) / (p1 + 1)), p1, p2)
end

return calcMediaGallerySizesFromHeight