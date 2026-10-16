local GetFStringPioneerLaunchPlaceIdFunction = require(script:FindFirstAncestor("PioneerUtils").Parent.SharedFlags).GetFStringPioneerLaunchPlaceId
local PioneerDataModelApiEngineFeature = game:GetEngineFeature("PioneerDataModelApi")
local PioneerInfoModule = {
	isPioneerApp = function(): boolean --[[ Line: 12 ]]
		-- upvalues: PioneerDataModelApiEngineFeature (copy)
		return if PioneerDataModelApiEngineFeature then game:IsPioneerApp() == true else false
	end,
	getPioneerSource = function() --[[ Line: 20 ]]
		-- upvalues: PioneerDataModelApiEngineFeature (copy)
		return if PioneerDataModelApiEngineFeature then game:GetPioneerSource() else nil
	end
}

function PioneerInfoModule.isDaveyBazooka() --[[ Line: 28 ]]
	-- upvalues: PioneerInfoModule (copy)
	local Success, Result = pcall(function(): boolean --[[ Line: 29 ]]
		-- upvalues: PioneerInfoModule (upval)
		return PioneerInfoModule.getPioneerSource() == Enum.PioneerSource.DaveyBazooka
	end)
	
	return Success and Result
end

function PioneerInfoModule.getPioneerRootPlaceId() --[[ Line: 35 ]]
	-- upvalues: GetFStringPioneerLaunchPlaceIdFunction (copy), PioneerDataModelApiEngineFeature (copy)
	local FStringPioneerLaunchPlaceId = GetFStringPioneerLaunchPlaceIdFunction()
	
	if FStringPioneerLaunchPlaceId then
		return FStringPioneerLaunchPlaceId
	elseif PioneerDataModelApiEngineFeature then
		local PioneerRootPlaceId: number = game:GetPioneerRootPlaceId()
		
		return if type(PioneerRootPlaceId) == "number" and PioneerRootPlaceId > 0 then PioneerRootPlaceId else nil
	else
		return nil
	end
end

return PioneerInfoModule