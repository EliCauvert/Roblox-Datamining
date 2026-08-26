local imageSet = require(script:FindFirstAncestor("AppBlox").Parent.UIBlox).App.ImageSet
local calcMediaGallerySizesFromWidthModule = require(script.Parent.calcMediaGallerySizesFromWidth)
local iconSize = imageSet.getIconSize(imageSet.Enum.IconSize.Medium)

function calcMediaGallerySizesFromHeight(p1, p2, p3)
	-- upvalues: iconSize (ref), calcMediaGallerySizesFromWidthModule (ref)
	return calcMediaGallerySizesFromWidthModule(math.floor((math.floor((p1 - 24) * 1.777777777778 * p2) + (p2 - 1) * 12 + iconSize * 2 + iconSize * 2 * p2) / (p2 + 1)), p2, p3)
end

return calcMediaGallerySizesFromHeight