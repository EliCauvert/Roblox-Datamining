local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)

return function(p0, p1)
	-- upvalues: UGCValidationService (ref), analyticsModule (ref)
	local ok, status = pcall(function()
		-- upvalues: UGCValidationService (copy), p0 (ref)
		return UGCValidationService:CanLoadAsset(p0)
	end)
	
	if ok and status then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateCanLoad, nil, p1)
	
	return false, { "Asset could not be loaded" }
end