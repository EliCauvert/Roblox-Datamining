local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local getUniverseIdModule = require(inExperienceSideSheet.Utils.getUniverseId)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailType = foundationModule.Enums.ThumbnailType
local thumbnailSize = foundationModule.Enums.ThumbnailSize

return function() --[[ line: 13 | named "useExperienceIcon" ]]
	-- upvalues: getUniverseIdModule (ref), reactModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref)
	local var4 = getUniverseIdModule()
	
	return reactModule.useMemo(function() --[[ line: 16 ]]
		-- upvalues: var4 (ref), getRbxThumb (copy), thumbnailType (copy), thumbnailSize (copy)
		return if var4 then getRbxThumb(thumbnailType.GameIcon, var4, thumbnailSize.Small) else nil
	end, { var4 })
end