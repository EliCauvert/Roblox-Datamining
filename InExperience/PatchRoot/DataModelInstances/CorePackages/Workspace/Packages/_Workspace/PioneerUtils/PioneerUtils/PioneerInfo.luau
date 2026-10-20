local GetFStringPioneerLaunchPlaceIdFunction = require(script:FindFirstAncestor("PioneerUtils").Parent.SharedFlags).GetFStringPioneerLaunchPlaceId
local PioneerDataModelApiEngineFeature = game:GetEngineFeature("PioneerDataModelApi")
local PioneerInfoModule = {
	isPioneerApp = function(): boolean
		-- upvalues: PioneerDataModelApiEngineFeature (copy)
		return if PioneerDataModelApiEngineFeature then game:IsPioneerApp() == true else false
	end,
	getPioneerSource = function()
		-- upvalues: PioneerDataModelApiEngineFeature (copy)
		return if PioneerDataModelApiEngineFeature then game:GetPioneerSource() else nil
	end
}

function PioneerInfoModule.isDaveyBazooka()
	-- upvalues: PioneerInfoModule (copy)
	local Success, Result = pcall(function(): boolean
		-- upvalues: PioneerInfoModule (upval)
		return PioneerInfoModule.getPioneerSource() == Enum.PioneerSource.DaveyBazooka
	end)
	
	return Success and Result
end

function PioneerInfoModule.getPioneerRootPlaceId()
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