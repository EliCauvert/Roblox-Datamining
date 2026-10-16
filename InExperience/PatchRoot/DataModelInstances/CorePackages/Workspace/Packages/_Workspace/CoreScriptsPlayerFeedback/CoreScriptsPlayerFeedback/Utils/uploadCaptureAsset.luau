local EnableCaptureUploadForSupportTicketEngineFeature = game:GetEngineFeature("EnableCaptureUploadForSupportTicket")
local EnableCheckUploadCaptureStatusForSupportTicketEngineFeature = game:GetEngineFeature("EnableCheckUploadCaptureStatusForSupportTicket")

return function(Capture, p1) --[[ Line: 15 | Named "uploadCaptureAsset" ]]
	-- upvalues: EnableCaptureUploadForSupportTicketEngineFeature (copy), EnableCheckUploadCaptureStatusForSupportTicketEngineFeature (copy)
	if not EnableCaptureUploadForSupportTicketEngineFeature or not EnableCheckUploadCaptureStatusForSupportTicketEngineFeature then
		return nil, Enum.UploadCaptureResult.UploadFailed
	end
	local P1 = p1 or game:GetService("CaptureService")
	local Success, Result, Result3 = pcall(function() --[[ Line: 25 ]]
		-- upvalues: P1 (copy), Capture (copy)
		return P1:StartUploadCaptureForSupportTicketAsync(Capture)
	end)
	
	if not Success or Result ~= Enum.UploadCaptureResult.Success then
		return nil, if Success and Result ~= nil then Result else Enum.UploadCaptureResult.UploadFailed
	end
	local Result1 = nil
	local Result3_1 = nil
	for _ = 1, 120 do
		task.wait(5)
		local Success1
		Success1, Result1, Result3_1 = pcall(function() --[[ Line: 38 ]]
			-- upvalues: P1 (copy), Result3 (copy)
			return P1:CheckUploadCaptureStatusForSupportTicketAsync(Result3)
		end)
		
		if not Success1 then
			return nil, Enum.UploadCaptureResult.UploadFailed
		elseif Result1 ~= Enum.UploadCaptureResult.Success then
			if Result1 ~= Enum.UploadCaptureResult.UploadPending then
				return nil, Result1
			end
		else
			return Result3_1, nil
		end
	end
	return nil, Enum.UploadCaptureResult.UploadFailed
end