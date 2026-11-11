local Parent = script.Parent.Parent
local CaptureService = game:GetService("CaptureService")
local _ = require(Parent.Types)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local FFlagCaptureServiceRetrieveCapturesSafeguardModule = require(Parent.Flags.FFlagCaptureServiceRetrieveCapturesSafeguard)

return function()
	-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureService (copy), FFlagCaptureServiceRetrieveCapturesSafeguardModule (copy)
	if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then
		local Success, Result = pcall(function()
			-- upvalues: CaptureService (upval)
			local CapturesFromGalleryAsync, CapturesFromGalleryAsync2 = CaptureService:ReadCapturesFromGalleryAsync()
			
			return if CapturesFromGalleryAsync == Enum.ReadCapturesFromGalleryResult.Success then CapturesFromGalleryAsync2 else nil
		end)
		
		if not Success or not Result then
			warn("Failed to retrieve captures from gallery")
			
			return {}
		end
		local List = {}
		
		for _, value in ipairs((Result:GetCurrentPage())) do
			table.insert(List, value)
		end
		return List
	elseif not FFlagCaptureServiceRetrieveCapturesSafeguardModule then
		return CaptureService:RetrieveCaptures()
	else
		local Success1, Result1 = pcall(function()
			-- upvalues: CaptureService (upval)
			return CaptureService:RetrieveCaptures()
		end)
		
		if Success1 then
			return Result1
		else
			warn("Failed to retrieve captures from gallery")
			
			return {}
		end
	end
end