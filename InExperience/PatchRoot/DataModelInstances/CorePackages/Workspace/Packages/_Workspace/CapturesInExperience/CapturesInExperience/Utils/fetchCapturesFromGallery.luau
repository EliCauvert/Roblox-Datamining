local parent = script.Parent.Parent
local captureService = game:GetService("CaptureService")
local _ = require(parent.Types)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local fFlagCaptureServiceRetrieveCapturesSafeguardModule = require(parent.Flags.FFlagCaptureServiceRetrieveCapturesSafeguard)

return function()
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureService (ref), fFlagCaptureServiceRetrieveCapturesSafeguardModule (ref)
	if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
		local ok, status = pcall(function()
			-- upvalues: captureService (copy)
			local var1, var2 = captureService:ReadCapturesFromGalleryAsync()
			
			return if var1 == Enum.ReadCapturesFromGalleryResult.Success then var2 else nil
		end)
		
		if ok and status then
			local t = {}
			
			for i, v in ipairs(status:GetCurrentPage()) do
				table.insert(t, v)
			end
			return t
		else
			warn("Failed to retrieve captures from gallery")
			
			return {}
		end
	elseif not fFlagCaptureServiceRetrieveCapturesSafeguardModule then
		return captureService:RetrieveCaptures()
	end
	local ok, status = pcall(function()
		-- upvalues: captureService (copy)
		return captureService:RetrieveCaptures()
	end)
	
	if ok then
		return status
	end
	warn("Failed to retrieve captures from gallery")
	
	return {}
end