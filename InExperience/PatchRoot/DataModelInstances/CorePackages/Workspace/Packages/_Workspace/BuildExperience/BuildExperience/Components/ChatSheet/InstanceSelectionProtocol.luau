local HttpService = game:GetService("HttpService")
local MessageBusService = game:GetService("MessageBusService")
local BuildExperienceMessageId = MessageBusService:GetMessageId("BuildExperience", "instanceSelectionRequest")
local BuildExperienceMessageId1 = MessageBusService:GetMessageId("BuildExperience", "instanceSelectionResult")

local function getActiveRequest()
	-- upvalues: MessageBusService (copy), BuildExperienceMessageId (copy)
	local Last = MessageBusService:GetLast(BuildExperienceMessageId)
	
	return if typeof(Last) == "table" and Last.active == true and typeof(Last.requestId) == "string" and Last.requestId ~= "" then Last else nil
end

local function defaultDependencies()
	-- upvalues: HttpService (copy), getActiveRequest (copy), MessageBusService (copy), BuildExperienceMessageId (copy), BuildExperienceMessageId1 (copy)
	local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
	
	return {
		canEnterCaptureMode = function()
			-- upvalues: ExperienceStateCaptureService (copy)
			return not game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") or ExperienceStateCaptureService:CanEnterCaptureMode()
		end,
		createRequestId = function()
			-- upvalues: HttpService (upval)
			return HttpService:GenerateGUID(false)
		end,
		getActiveRequest = getActiveRequest,
		publishRequest = function(p1)
			-- upvalues: MessageBusService (upval), BuildExperienceMessageId (upval)
			MessageBusService:Publish(BuildExperienceMessageId, p1)
		end,
		publishResult = function(p1)
			-- upvalues: MessageBusService (upval), BuildExperienceMessageId1 (upval)
			MessageBusService:Publish(BuildExperienceMessageId1, p1)
		end,
		subscribeToResult = function(Callback)
			-- upvalues: MessageBusService (upval), BuildExperienceMessageId1 (upval)
			return MessageBusService:Subscribe(BuildExperienceMessageId1, Callback, false, false)
		end,
		subscribeToCaptureModeExit = function(Callback)
			-- upvalues: ExperienceStateCaptureService (copy)
			return if game:GetEngineFeature("ExperienceStateCaptureIsInBackground") then ExperienceStateCaptureService:GetPropertyChangedSignal("IsInBackground"):Connect(function()
				-- upvalues: ExperienceStateCaptureService (upval), Callback (copy)
				if not ExperienceStateCaptureService.IsInBackground then
					Callback()
				end
			end) else nil
		end,
		toggleCaptureMode = function()
			-- upvalues: ExperienceStateCaptureService (copy)
			ExperienceStateCaptureService:ToggleCaptureMode()
		end
	}
end

return {
	beginSelection = function(Callback, p1)
		-- upvalues: defaultDependencies (copy)
		local P3 = p1 or defaultDependencies()
		
		if not P3.canEnterCaptureMode() then
			return false
		end
		local RequestId = P3.createRequestId()
		local Connection = nil
		local Connection1 = nil
		
		local function _()
			-- upvalues: Connection (ref), Connection1 (ref)
			Connection:Disconnect()
			
			if Connection1 ~= nil then
				Connection1:Disconnect()
			end
		end
		
		Connection = P3.subscribeToResult(function(p2)
			-- upvalues: RequestId (copy), Connection (ref), Connection1 (ref), Callback (copy)
			if typeof(p2) ~= "table" or p2.requestId ~= RequestId then return end
			Connection:Disconnect()
			
			if Connection1 ~= nil then
				Connection1:Disconnect()
			end
			Callback(p2)
		end)
		Connection1 = P3.subscribeToCaptureModeExit(function()
			-- upvalues: P3 (copy), RequestId (copy), Connection1 (ref), Connection (ref), Callback (copy)
			local ActiveRequest = P3.getActiveRequest()
			
			if ActiveRequest == nil or ActiveRequest.requestId ~= RequestId then
				Connection1:Disconnect()
				
				return
			end
			Connection:Disconnect()
			
			if Connection1 ~= nil then
				Connection1:Disconnect()
			end
			P3.publishRequest({ active = false, requestId = RequestId })
			Callback({ status = "cancelled", requestId = RequestId })
		end)
		P3.publishRequest({ active = true, requestId = RequestId })
		local Success = pcall(P3.toggleCaptureMode)
		
		if not Success then
			Connection:Disconnect()
			
			if Connection1 ~= nil then
				Connection1:Disconnect()
			end
			P3.publishRequest({ active = false, requestId = RequestId })
		end
		return Success
	end,
	finishSelection = function(p1, p2): boolean
		-- upvalues: defaultDependencies (copy)
		local P6 = p2 or defaultDependencies()
		local ActiveRequest = P6.getActiveRequest()
		
		if ActiveRequest == nil then
			return false
		else
			P6.publishResult({
				requestId = ActiveRequest.requestId,
				status = p1.status,
				path = p1.path,
				displayName = p1.displayName,
				className = p1.className
			})
			P6.publishRequest({ active = false, requestId = ActiveRequest.requestId })
			P6.toggleCaptureMode()
			
			return true
		end
	end,
	getActiveRequest = getActiveRequest
}