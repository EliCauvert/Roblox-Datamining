local enableCaptureUploadForSupportTicketEngineFeature = game:GetEngineFeature("EnableCaptureUploadForSupportTicket")

return function(value, p0) --[[ line: 13 | named "uploadCaptureAsset" ]]
	-- upvalues: enableCaptureUploadForSupportTicketEngineFeature (ref)
	if not enableCaptureUploadForSupportTicketEngineFeature then
		return nil, Enum.UploadCaptureResult.UploadFailed
	end
	p0 = p0 or game:GetService("CaptureService")
	local ok, status, var2 = pcall(function() --[[ line: 20 ]]
		-- upvalues: p0 (ref), value (ref)
		return p0:StartUploadCaptureForSupportTicketAsync(value)
	end)
	
	if ok and status == Enum.UploadCaptureResult.Success then
		for _ = 1, 120 do
			task.wait(5)
			local ok_1, status_1, var3 = pcall(function() --[[ line: 33 ]]
				-- upvalues: p0 (ref), var2 (ref)
				return p0:CheckUploadCaptureStatusAsync(var2)
			end)
			
			if ok_1 then
				if status_1 ~= Enum.UploadCaptureResult.Success then
					if status_1 == Enum.UploadCaptureResult.UploadPending then
						continue
					end
					return nil, status_1
				end
				return var3, nil
			end
			return nil, Enum.UploadCaptureResult.UploadFailed
		end
		return nil, Enum.UploadCaptureResult.UploadFailed
	else
		return nil, if ok and status ~= nil then status else Enum.UploadCaptureResult.UploadFailed
	end
end