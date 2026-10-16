local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)

return function(AssetId, p1) --[[ Line: 9 | Named "validateCanLoad" ]]
	-- upvalues: UGCValidationService (copy), AnalyticsModule (copy)
	local Success, Result = pcall(function() --[[ Line: 10 ]]
		-- upvalues: UGCValidationService (upval), AssetId (copy)
		return UGCValidationService:CanLoadAsset(AssetId)
	end)
	
	if Success and Result then
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCanLoad, nil, p1)
		
		return false, { "Asset could not be loaded" }
	end
end