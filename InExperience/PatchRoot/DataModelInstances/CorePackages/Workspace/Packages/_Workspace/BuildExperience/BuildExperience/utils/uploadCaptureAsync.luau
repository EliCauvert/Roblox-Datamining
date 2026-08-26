local parent = script:FindFirstAncestor("BuildExperience").Parent
local promiseModule = require(parent.Promise)
local debug = require(parent.DataHydration.CreatorAgentChat).debug
local captureService = game:GetService("CaptureService")
local t = {}

return function(p1)
	-- upvalues: promiseModule (ref), t (ref), debug (ref), captureService (ref)
	local ok, status = pcall(function()
		return game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
	end)
	
	if not ok or status ~= true then
		return promiseModule.reject("Capture upload is not supported on this platform")
	end
	local var1 = t[p1]
	
	if var1 then
		return promiseModule.resolve({ assetId = var1 })
	end
	debug.log("info", "capture_upload starting")
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: captureService (copy), p1 (ref), debug (copy), t (copy)
		local ok, status, var2 = pcall(function()
			-- upvalues: captureService (copy), p1 (copy)
			return captureService:StartUploadCaptureAsync(p1)
		end)
		
		if not ok then
			debug.log("warn", "capture_upload start failed", { error = tostring(status) })
			p3(`Failed to start capture upload: {status}`)
			
			return
		elseif status ~= Enum.UploadCaptureResult.Success then
			debug.log("warn", "capture_upload rejected", { status = tostring(status) })
			p3(`Upload rejected: {tostring(status)}`)
			
			return
		end
		for _ = 1, 30 do
			task.wait(2)
			local ok_1, status_1, var3 = pcall(function()
				-- upvalues: captureService (copy), var2 (ref)
				return captureService:CheckUploadCaptureStatusAsync(var2)
			end)
			
			if ok_1 then
				if status_1 ~= Enum.UploadCaptureResult.Success then
					if status_1 == Enum.UploadCaptureResult.UploadPending then
						continue
					end
					debug.log("warn", "capture_upload failed", { status = tostring(status_1) })
					p3(`Upload failed: {tostring(status_1)}`)
					
					return
				end
				debug.log("info", "capture_upload succeeded", { assetId = var3 })
				t[p1] = var3
				p2({ assetId = var3 })
				
				return
			end
			debug.log("warn", "capture_upload poll error", { error = tostring(status_1) })
			p3(`Upload poll error: {status_1}`)
			
			return
		end
		p3("Upload timed out")
	end)
end