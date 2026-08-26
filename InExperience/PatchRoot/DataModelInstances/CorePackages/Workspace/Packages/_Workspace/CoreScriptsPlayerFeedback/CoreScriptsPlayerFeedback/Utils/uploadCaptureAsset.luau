local enableCaptureUploadForSupportTicketEngineFeature = game:GetEngineFeature("EnableCaptureUploadForSupportTicket")
local enableCheckUploadCaptureStatusForSupportTicketEngineFeature = game:GetEngineFeature("EnableCheckUploadCaptureStatusForSupportTicket")

return function(value, p1)
	-- upvalues: enableCaptureUploadForSupportTicketEngineFeature (ref), enableCheckUploadCaptureStatusForSupportTicketEngineFeature (ref)
	if not enableCaptureUploadForSupportTicketEngineFeature or not enableCheckUploadCaptureStatusForSupportTicketEngineFeature then
		return nil, Enum.UploadCaptureResult.UploadFailed
	end
	p1 = p1 or game:GetService("CaptureService")
	local ok, status, var1 = pcall(function()
		-- upvalues: p1 (ref), value (ref)
		return p1:StartUploadCaptureForSupportTicketAsync(value)
	end)
	
	if ok and status == Enum.UploadCaptureResult.Success then
		for _ = 1, 120 do
			task.wait(5)
			local ok_1, status_1, var2 = pcall(function()
				-- upvalues: p1 (ref), var1 (ref)
				return p1:CheckUploadCaptureStatusForSupportTicketAsync(var1)
			end)
			
			if ok_1 then
				if status_1 ~= Enum.UploadCaptureResult.Success then
					if status_1 == Enum.UploadCaptureResult.UploadPending then
						continue
					end
					return nil, status_1
				end
				return var2, nil
			end
			return nil, Enum.UploadCaptureResult.UploadFailed
		end
		return nil, Enum.UploadCaptureResult.UploadFailed
	else
		return nil, if ok and status ~= nil then status else Enum.UploadCaptureResult.UploadFailed
	end
end