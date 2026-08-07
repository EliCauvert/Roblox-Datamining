-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:41 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)

return function(p0, p1) --[[ line: 9 | named "validateCanLoad" ]]
	-- upvalues: UGCValidationService (ref), analyticsModule (ref)
	local ok, status = pcall(function() --[[ line: 10 ]]
		-- upvalues: UGCValidationService (copy), p0 (ref)
		return UGCValidationService:CanLoadAsset(p0)
	end)
	
	if ok and status then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateCanLoad, nil, p1)
	
	return false, { "Asset could not be loaded" }
end