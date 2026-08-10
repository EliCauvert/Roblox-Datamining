local parent = script:FindFirstAncestor("BuildExperience").Parent
local promiseModule = require(parent.Promise)
local debug = require(parent.DataHydration.CreatorAgentChat).debug
local captureService = game:GetService("CaptureService")
local t = {}

return function(p0) --[[ line: 20 | named "uploadCaptureAsync" ]]
	-- upvalues: promiseModule (ref), t (ref), debug (ref), captureService (ref)
	local ok, status = pcall(function() --[[ line: 21 ]]
		return game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
	end)
	
	if not ok or status ~= true then
		return promiseModule.reject("Capture upload is not supported on this platform")
	end
	local var3 = t[p0]
	
	if var3 then
		return promiseModule.resolve({ assetId = var3 })
	end
	debug.log("info", "capture_upload starting")
	
	return promiseModule.new(function(p1, p2) --[[ line: 35 ]]
		-- upvalues: captureService (copy), p0 (ref), debug (copy), t (copy)
		local ok, status, var4 = pcall(function() --[[ line: 36 ]]
			-- upvalues: captureService (copy), p0 (copy)
			return captureService:StartUploadCaptureAsync(p0)
		end)
		
		if not ok then
			debug.log("warn", "capture_upload start failed", { error = tostring(status) })
			p2(`Failed to start capture upload: {status}`)
			
			return
		elseif status ~= Enum.UploadCaptureResult.Success then
			debug.log("warn", "capture_upload rejected", { status = tostring(status) })
			p2(`Upload rejected: {tostring(status)}`)
			
			return
		end
		for _ = 1, 30 do
			task.wait(2)
			local ok_1, status_1, var5 = pcall(function() --[[ line: 55 ]]
				-- upvalues: captureService (copy), var4 (ref)
				return captureService:CheckUploadCaptureStatusAsync(var4)
			end)
			
			if ok_1 then
				if status_1 ~= Enum.UploadCaptureResult.Success then
					if status_1 == Enum.UploadCaptureResult.UploadPending then
						continue
					end
					debug.log("warn", "capture_upload failed", { status = tostring(status_1) })
					p2(`Upload failed: {tostring(status_1)}`)
					
					return
				end
				debug.log("info", "capture_upload succeeded", { assetId = var5 })
				t[p0] = var5
				p1({ assetId = var5 })
				
				return
			end
			debug.log("warn", "capture_upload poll error", { error = tostring(status_1) })
			p2(`Upload poll error: {status_1}`)
			
			return
		end
		p2("Upload timed out")
	end)
end