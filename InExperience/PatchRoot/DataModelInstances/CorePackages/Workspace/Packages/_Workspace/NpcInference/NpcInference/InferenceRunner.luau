local runService = game:GetService("RunService")
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local MLService = game:GetService("MLService")
local actionBufferModule = require(script.Parent.ActionBuffer)
local captureModuleLoaderModule = require(script.Parent.CaptureModuleLoader)
local inferenceServerModule = require(script.Parent.InferenceServer)
local inputInjectorModule = require(script.Parent.InputInjector)
local t = {}
local var9 = tostring(math.random(1000000000))
local var10 = 0
local var11 = 0
local var12 = nil
local var13 = nil
local t_1 = {}
local var15 = nil
local var16 = nil
local var17 = false
local var18 = false
local var19 = 0
local var20 = actionBufferModule.new(1)
local var21 = nil
local var22 = nil
local var23 = nil
local var24 = false

local function onHeartbeat() --[[ line: 58 ]]
	-- upvalues: var10 (write), var15 (write), playersService (ref), MLService (ref), var20 (ref), var23 (write), var24 (write), var12 (write), var13 (write), var9 (write), t_1 (write), inputInjectorModule (ref), t (ref), var11 (write)
	local processTime = os.clock()
	local var28 = var10 + 1
	local var15_1 = var15 or playersService.LocalPlayer
	local character = var15_1 and var15_1.Character
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
	local currentCamera = workspace.CurrentCamera
	local cFrame = currentCamera and currentCamera.CFrame
	local fieldOfView = currentCamera and currentCamera.FieldOfView
	local viewportSize = currentCamera and currentCamera.ViewportSize
	local t_2 = {}
	
	for i, v in ipairs(MLService:GetNPCInferenceResponses()) do
		if var20:checkResponse(v.client_time) then
			var23 = processTime
			var24 = false
			table.insert(t_2, { frame_id = v.frame_id, client_time = v.client_time })
			
			if v.subactions then
				if var12 == nil then
					warn("[NpcInference] ignoring prediction received before the session time-grid origin")
				else
					var20:mergePrediction(v, var12)
				end
			end
		end
	end
	if var23 and not var24 and processTime - var23 > 0.2 then
		warn(string.format("[NpcInference] no response in %.0fms", (processTime - var23) * 1000))
		var24 = true
	end
	local ok, status = pcall(function() --[[ line: 107 ]]
		-- upvalues: var13 (copy), humanoidRootPart (ref), var15_1 (ref), var28 (ref), var9 (copy), cFrame (ref), fieldOfView (ref), viewportSize (ref), t_1 (copy)
		return var13:Invoke({
			npc = humanoidRootPart,
			npcPlayer = var15_1,
			frameNumber = var28,
			sessionId = var9,
			cameraCFrame = cFrame,
			npcCameraFovDeg = fieldOfView,
			npcCameraViewportSize = viewportSize,
			featureFlags = t_1
		})
	end)
	
	if ok and type(status) == "table" then
		if var12 == nil then
			var12 = processTime
		end
		local var36 = var20:getFutureSubaction(var12, processTime)
		local ok_1, status_1 = pcall(function() --[[ line: 137 ]]
			-- upvalues: inputInjectorModule (copy), var36 (ref)
			inputInjectorModule.applyAction(var36)
		end)
		
		if not ok_1 then
			warn("[NpcInference] Failed to apply input: " .. tostring(status_1))
			t.stop()
			
			return
		end
		var10 = var28
		local t_3 = {
			frame_id = var10,
			client_time = processTime,
			client_time_t0 = var12,
			state = status,
			subaction = var36,
			observed_events = var20:queryObservedEvents(var11, processTime),
			received_server_responses = t_2
		}
		local ok_2, status_2 = pcall(function() --[[ line: 165 ]]
			-- upvalues: MLService (ref), t_3 (ref)
			MLService:SendNPCInferenceMessage(t_3)
		end)
		
		if ok_2 then
			var11 = processTime
			
			return
		end
		warn("[NpcInference] Failed to send observation: " .. tostring(status_2))
		
		return
	elseif not ok then
		warn("[NpcInference] Capture Invoke failed: " .. tostring(status))
	end
end

local function connectHeartbeat() --[[ line: 176 ]]
	-- upvalues: var16 (write), var21 (write), userInputService (ref), var22 (write), var11 (write), var23 (write), var24 (write), var12 (write), var20 (ref), inputInjectorModule (ref), var15 (write), runService (ref), onHeartbeat (ref), var17 (write)
	if var16 then
		var16:Disconnect()
	end
	var21 = userInputService.MouseBehavior
	var22 = userInputService.MouseIconEnabled
	userInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
	userInputService.MouseIconEnabled = false
	local processTime = os.clock()
	var11 = processTime
	var23 = processTime
	var24 = false
	var12 = nil
	var20:startListening()
	pcall(function() --[[ line: 197 ]]
		-- upvalues: inputInjectorModule (copy), var15 (copy)
		inputInjectorModule.reset(var15)
	end)
	var16 = runService.Heartbeat:Connect(onHeartbeat)
	var17 = true
end

function t.stop() --[[ line: 204 ]]
	-- upvalues: var16 (write), var19 (write), var17 (write), var18 (write), var20 (ref), inputInjectorModule (ref), var15 (write), MLService (ref), var21 (write), userInputService (ref), var22 (write)
	if var16 then
		var16:Disconnect()
		var16 = nil
	end
	var19 += 1
	var17 = false
	var18 = false
	var20:reset()
	pcall(function() --[[ line: 215 ]]
		-- upvalues: inputInjectorModule (copy), var15 (copy)
		inputInjectorModule.reset(var15)
	end)
	pcall(function() --[[ line: 218 ]]
		-- upvalues: MLService (copy)
		MLService:CloseNPCInferenceConnection()
	end)
	
	if var21 ~= nil then
		userInputService.MouseBehavior = var21
		var21 = nil
	end
	if var22 ~= nil then
		userInputService.MouseIconEnabled = var22
		var22 = nil
	end
	print("[NpcInference] Stopped.")
end

function t.resume() --[[ line: 232 ]]
	-- upvalues: var17 (write), var18 (write), var19 (write), captureModuleLoaderModule (ref), var13 (write), t_1 (write), var9 (write), var10 (write), MLService (ref), inferenceServerModule (ref), connectHeartbeat (ref)
	if var17 or var18 then
		return
	end
	var18 = true
	task.spawn(function() --[[ line: 238 ]]
		-- upvalues: captureModuleLoaderModule (copy), var19 (copy), var19 (ref), var18 (copy), var13 (copy), t_1 (copy), var9 (copy), var10 (copy), MLService (copy), inferenceServerModule (copy), connectHeartbeat (copy)
		local var39 = captureModuleLoaderModule.loadAsync()
		
		if var19 ~= var19 then return end
		if var39 == nil then
			var18 = false
			warn("[NpcInference] Cannot resume: capture module load failed.")
			
			return
		end
		var13 = var39.module
		t_1 = var39.featureFlags
		var9 = tostring(math.random(1000000000))
		var10 = 0
		local ok, status = pcall(function() --[[ line: 256 ]]
			-- upvalues: MLService (copy), inferenceServerModule (copy)
			MLService:OpenNPCInferenceConnectionAsync(inferenceServerModule.server, inferenceServerModule.port)
		end)
		
		if var19 ~= var19 then return end
		if ok then
			var18 = false
			connectHeartbeat()
			print("[NpcInference] Resumed.")
			
			return
		end
		var18 = false
		warn("[NpcInference] Failed to open connection: " .. tostring(status))
	end)
end

function t.toggle() --[[ line: 276 ]]
	-- upvalues: var17 (write), var18 (write), t (ref)
	if var17 or var18 then
		t.stop()
		
		return
	end
	t.resume()
end

function t.start(p0) --[[ line: 284 ]]
	-- upvalues: var15 (write), userInputService (ref), t (ref)
	var15 = p0
	userInputService.InputBegan:Connect(function(p1, p2) --[[ line: 287 ]]
		-- upvalues: t (copy)
		if not p2 and p1.KeyCode == Enum.KeyCode.F8 then
			t.toggle()
		end
	end)
	print("[NpcInference] Ready. Press F8 to start inference.")
end

return t