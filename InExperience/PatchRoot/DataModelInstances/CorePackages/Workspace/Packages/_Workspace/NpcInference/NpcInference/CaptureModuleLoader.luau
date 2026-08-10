local MLService = game:GetService("MLService")
local inferenceServerModule = require(script.Parent.InferenceServer)
local list = { 1, 2, 4 }

return {
	loadAsync = function() --[[ line: 22 ]]
		-- upvalues: list (ref), MLService (ref), inferenceServerModule (ref)
		for i, v in ipairs(list) do
			local ok, status = pcall(function() --[[ line: 24 ]]
				-- upvalues: MLService (copy), inferenceServerModule (copy)
				return MLService:GetNPCInferenceSpecAsync(inferenceServerModule.server, inferenceServerModule.port)
			end)
			
			if not ok or type(status) ~= "table" then
				warn("[NpcInference] GetNPCInferenceSpecAsync error (attempt " .. i .. "): " .. tostring(status))
				
				if i < #list then
					task.wait(v)
				end
			end
			local captureSource = status.capture_source
			
			if type(captureSource) == "string" and captureSource ~= "" then
				local ok_1, status_1 = pcall(function() --[[ line: 31 ]]
					-- upvalues: MLService (copy), captureSource (ref)
					return MLService:CreateInferenceModule(captureSource)
				end)
				
				if ok_1 and status_1 ~= nil then
					local var3 = if type(status.feature_flags) == "table" then status.feature_flags else {}
					print("[NpcInference] Compiled capture module: " .. tostring(status.capture_module))
					
					return { module = status_1, featureFlags = var3 }
				end
				warn("[NpcInference] CreateInferenceModule failed: " .. tostring(status_1))
				
				return nil
			else
				warn("[NpcInference] /spec missing capture_source; refusing to run.")
				
				return nil
			end
		end
		warn("[NpcInference] Failed to load capture module after retries")
		
		return nil
	end
}