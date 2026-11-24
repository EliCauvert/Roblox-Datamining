local UseGetRatingDisplayByUniverseIdModule = require(script.Parent.useGetRatingDisplayByUniverseId)

return function(p1)
	-- upvalues: UseGetRatingDisplayByUniverseIdModule (copy)
	local UseGetRatingDisplayByUniverseIdModuleResult = UseGetRatingDisplayByUniverseIdModule(if p1 == "" then nil else p1)
	local MinimizedIconVariant = if type(UseGetRatingDisplayByUniverseIdModuleResult) == "table" then UseGetRatingDisplayByUniverseIdModuleResult.minimizedIconVariant else nil
	local ContentId = if type(MinimizedIconVariant) == "table" then MinimizedIconVariant.contentId else nil
	local AspectRatio = if type(MinimizedIconVariant) == "table" then MinimizedIconVariant.aspectRatio else nil
	
	if type(ContentId) == "string" and ContentId ~= "" and type(AspectRatio) == "number" and AspectRatio > 0 then
		return ContentId, AspectRatio
	else
		return nil, nil
	end
end