local httpService = game:GetService("HttpService")
local messageBusService = game:GetService("MessageBusService")
local buildExperienceMessageId = messageBusService:GetMessageId("BuildExperience", "instanceSelectionRequest")
local buildExperienceMessageId_1 = messageBusService:GetMessageId("BuildExperience", "instanceSelectionResult")

local function getActiveRequest()
	-- upvalues: messageBusService (ref), buildExperienceMessageId (ref)
	local var1 = messageBusService:GetLast(buildExperienceMessageId)
	
	return if typeof(var1) == "table" and var1.active == true and (typeof(var1.requestId) == "string" and var1.requestId ~= "") then var1 else nil
end

local function defaultDependencies()
	-- upvalues: httpService (ref), getActiveRequest (ref), messageBusService (ref), buildExperienceMessageId (ref), buildExperienceMessageId_1 (ref)
	local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
	
	return {
		canEnterCaptureMode = function()
			-- upvalues: experienceStateCaptureService (ref)
			return not game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") or experienceStateCaptureService:CanEnterCaptureMode()
		end,
		createRequestId = function()
			-- upvalues: httpService (copy)
			return httpService:GenerateGUID(false)
		end,
		getActiveRequest = getActiveRequest,
		publishRequest = function(p1)
			-- upvalues: messageBusService (copy), buildExperienceMessageId (copy)
			messageBusService:Publish(buildExperienceMessageId, p1)
		end,
		publishResult = function(p1)
			-- upvalues: messageBusService (copy), buildExperienceMessageId_1 (copy)
			messageBusService:Publish(buildExperienceMessageId_1, p1)
		end,
		subscribeToResult = function(p1)
			-- upvalues: messageBusService (copy), buildExperienceMessageId_1 (copy)
			return messageBusService:Subscribe(buildExperienceMessageId_1, p1, false, false)
		end,
		subscribeToCaptureModeExit = function(p1)
			-- upvalues: experienceStateCaptureService (ref)
			return if game:GetEngineFeature("ExperienceStateCaptureIsInBackground") then experienceStateCaptureService:GetPropertyChangedSignal("IsInBackground"):Connect(function()
				-- upvalues: experienceStateCaptureService (copy), p1 (ref)
				if not experienceStateCaptureService.IsInBackground then
					p1()
				end
			end) else nil
		end,
		toggleCaptureMode = function()
			-- upvalues: experienceStateCaptureService (ref)
			experienceStateCaptureService:ToggleCaptureMode()
		end
	}
end

return {
	beginSelection = function(p1, p2)
		-- upvalues: defaultDependencies (ref)
		p2 = p2 or defaultDependencies()
		
		if not p2.canEnterCaptureMode() then
			return false
		end
		local var1 = p2.createRequestId()
		local var2 = nil
		local var3 = nil
		
		local function _()
			-- upvalues: var2 (write), var3 (write)
			var2:Disconnect()
			
			if var3 ~= nil then
				var3:Disconnect()
			end
		end
		
		var2 = p2.subscribeToResult(function(p3)
			-- upvalues: var1 (ref), var2 (write), var3 (write), p1 (ref)
			if typeof(p3) ~= "table" or p3.requestId ~= var1 then return end
			var2:Disconnect()
			
			if var3 ~= nil then
				var3:Disconnect()
			end
			p1(p3)
		end)
		var3 = p2.subscribeToCaptureModeExit(function()
			-- upvalues: p2 (ref), var1 (ref), var3 (write), var2 (write), p1 (ref)
			local activeRequest = p2.getActiveRequest()
			
			if activeRequest == nil or activeRequest.requestId ~= var1 then
				var3:Disconnect()
				
				return
			end
			var2:Disconnect()
			
			if var3 ~= nil then
				var3:Disconnect()
			end
			p2.publishRequest({ active = false, requestId = var1 })
			p1({ status = "cancelled", requestId = var1 })
		end)
		p2.publishRequest({ active = true, requestId = var1 })
		local ok = pcall(p2.toggleCaptureMode)
		
		if not ok then
			var2:Disconnect()
			
			if var3 ~= nil then
				var3:Disconnect()
			end
			p2.publishRequest({ active = false, requestId = var1 })
		end
		return ok
	end,
	finishSelection = function(p1, p2)
		-- upvalues: defaultDependencies (ref)
		p2 = p2 or defaultDependencies()
		local activeRequest = p2.getActiveRequest()
		
		if activeRequest == nil then
			return false
		end
		p2.publishResult({
			requestId = activeRequest.requestId,
			status = p1.status,
			path = p1.path,
			displayName = p1.displayName,
			className = p1.className
		})
		p2.publishRequest({ active = false, requestId = activeRequest.requestId })
		p2.toggleCaptureMode()
		
		return true
	end,
	getActiveRequest = getActiveRequest
}