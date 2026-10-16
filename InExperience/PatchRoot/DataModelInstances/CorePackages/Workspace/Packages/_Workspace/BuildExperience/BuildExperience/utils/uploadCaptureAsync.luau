local Parent = script:FindFirstAncestor("BuildExperience").Parent
local PromiseModule = require(Parent.Promise)
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug
local CaptureService = game:GetService("CaptureService")
local AssetIds = {}

return function(Capture) --[[ Line: 20 | Named "uploadCaptureAsync" ]]
	-- upvalues: PromiseModule (copy), AssetIds (copy), Debug (copy), CaptureService (copy)
	local Success, Result = pcall(function() --[[ Line: 21 ]]
		return game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
	end)
	
	if not Success or Result ~= true then
		return PromiseModule.reject("Capture upload is not supported on this platform")
	end
	local AssetId = AssetIds[Capture]
	
	if AssetId then
		return PromiseModule.resolve({ assetId = AssetId })
	else
		Debug.log("info", "capture_upload starting")
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 35 ]]
			-- upvalues: CaptureService (upval), Capture (copy), Debug (upval), AssetIds (upval)
			local Success, Result, Result3 = pcall(function() --[[ Line: 36 ]]
				-- upvalues: CaptureService (upval), Capture (upval)
				return CaptureService:StartUploadCaptureAsync(Capture)
			end)
			
			if not Success then
				Debug.log("warn", "capture_upload start failed", { error = tostring(Result) })
				Callback(`Failed to start capture upload: {Result}`)
				
				return
			end
			if Result ~= Enum.UploadCaptureResult.Success then
				Debug.log("warn", "capture_upload rejected", { status = tostring(Result) })
				Callback(`Upload rejected: {tostring(Result)}`)
				
				return
			end
			local Result1 = nil
			local Result3_1 = nil
			for _ = 1, 30 do
				task.wait(2)
				local Success1
				Success1, Result1, Result3_1 = pcall(function() --[[ Line: 55 ]]
					-- upvalues: CaptureService (upval), Result3 (copy)
					return CaptureService:CheckUploadCaptureStatusAsync(Result3)
				end)
				
				if not Success1 then
					Debug.log("warn", "capture_upload poll error", { error = tostring(Result1) })
					Callback(`Upload poll error: {Result1}`)
					
					return
				end
				if Result1 == Enum.UploadCaptureResult.Success then
					Debug.log("info", "capture_upload succeeded", { assetId = Result3_1 })
					AssetIds[Capture] = Result3_1
					Callback1({ assetId = Result3_1 })
					
					return
				end
				if Result1 ~= Enum.UploadCaptureResult.UploadPending then
					Debug.log("warn", "capture_upload failed", { status = tostring(Result1) })
					Callback(`Upload failed: {tostring(Result1)}`)
					
					return
				end
			end
			Callback("Upload timed out")
		end)
	end
end