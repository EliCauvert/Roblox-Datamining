local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local getUniverseIdModule = require(inExperienceSideSheet.Utils.getUniverseId)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailType = foundationModule.Enums.ThumbnailType
local thumbnailSize = foundationModule.Enums.ThumbnailSize

return function()
	-- upvalues: getUniverseIdModule (ref), reactModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref)
	local var1 = getUniverseIdModule()
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), getRbxThumb (copy), thumbnailType (copy), thumbnailSize (copy)
		return if var1 then getRbxThumb(thumbnailType.GameIcon, var1, thumbnailSize.Small) else nil
	end, { var1 })
end