local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local GetUniverseIdModule = require(InExperienceSideSheet.Utils.getUniverseId)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize

return function() --[[ Line: 13 | Named "useExperienceIcon" ]]
	-- upvalues: GetUniverseIdModule (copy), ReactModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy)
	local UniverseIdModule = GetUniverseIdModule()
	
	return ReactModule.useMemo(function() --[[ Line: 16 ]]
		-- upvalues: UniverseIdModule (copy), GetRbxThumbFunction (upval), ThumbnailType (upval), ThumbnailSize (upval)
		return if UniverseIdModule then GetRbxThumbFunction(ThumbnailType.GameIcon, UniverseIdModule, ThumbnailSize.Small) else nil
	end, { UniverseIdModule })
end