local getFStringPioneerLaunchPlaceId = require(script:FindFirstAncestor("PioneerUtils").Parent.SharedFlags).GetFStringPioneerLaunchPlaceId
local pioneerDataModelApiEngineFeature = game:GetEngineFeature("PioneerDataModelApi")

return {
	isPioneerApp = function()
		-- upvalues: pioneerDataModelApiEngineFeature (ref)
		return if pioneerDataModelApiEngineFeature then game:IsPioneerApp() == true else false
	end,
	getPioneerSource = function()
		-- upvalues: pioneerDataModelApiEngineFeature (ref)
		return if pioneerDataModelApiEngineFeature then game:GetPioneerSource() else nil
	end,
	getPioneerRootPlaceId = function()
		-- upvalues: getFStringPioneerLaunchPlaceId (ref), pioneerDataModelApiEngineFeature (ref)
		local var1 = getFStringPioneerLaunchPlaceId()
		
		if var1 then
			return var1
		elseif not pioneerDataModelApiEngineFeature then
			return nil
		end
		local pioneerRootPlaceId = game:GetPioneerRootPlaceId()
		
		return if type(pioneerRootPlaceId) == "number" and pioneerRootPlaceId > 0 then pioneerRootPlaceId else nil
	end
}