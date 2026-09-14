local httpService = game:GetService("HttpService")
local messageBusService = game:GetService("MessageBusService")
local buildExperienceMessageId = messageBusService:GetMessageId("BuildExperience", "captureModeRequest")
local buildExperienceMessageId_1 = messageBusService:GetMessageId("BuildExperience", "captureModeResult")

local function getActiveRequest()
	-- upvalues: messageBusService (ref), buildExperienceMessageId (ref)
	local var1 = messageBusService:GetLast(buildExperienceMessageId)
	
	return if typeof(var1) == "table" and var1.active == true and (typeof(var1.requestId) == "string" and var1.requestId ~= "") then var1 else nil
end

local function _(p1)
	-- upvalues: messageBusService (ref), buildExperienceMessageId (ref)
	messageBusService:Publish(buildExperienceMessageId, { active = false, requestId = p1 })
end

local function getDefaultBeginCaptureDependencies()
	-- upvalues: httpService (ref), messageBusService (ref), buildExperienceMessageId (ref), buildExperienceMessageId_1 (ref)
	local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
	
	return {
		canEnterCaptureMode = function()
			-- upvalues: experienceStateCaptureService (ref)
			return experienceStateCaptureService:CanEnterCaptureMode()
		end,
		generateRequestId = function()
			-- upvalues: httpService (copy)
			return httpService:GenerateGUID(false)
		end,
		isMinimumMemoryCheckEnabled = function()
			return game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled")
		end,
		publishRequest = function(p1)
			-- upvalues: messageBusService (copy), buildExperienceMessageId (copy)
			messageBusService:Publish(buildExperienceMessageId, p1)
		end,
		setCaptureModeForReport = function(value)
			game:GetService("SafetyService").IsCaptureModeForReport = value
		end,
		subscribeToResult = function(p1)
			-- upvalues: messageBusService (copy), buildExperienceMessageId_1 (copy)
			return messageBusService:Subscribe(buildExperienceMessageId_1, p1, false, false)
		end,
		toggleCaptureMode = function()
			-- upvalues: experienceStateCaptureService (ref)
			experienceStateCaptureService:ToggleCaptureMode()
		end
	}
end

return {
	beginCapture = function(p1, p2, p3)
		-- upvalues: getDefaultBeginCaptureDependencies (ref)
		p2 = p2 or getDefaultBeginCaptureDependencies()
		
		if not p3 and p2.isMinimumMemoryCheckEnabled() and not p2.canEnterCaptureMode() then
			return false
		end
		local var1 = p2.generateRequestId()
		local var2 = nil
		var2 = p2.subscribeToResult(function(p4)
			-- upvalues: var1 (ref), var2 (write), p1 (ref)
			if typeof(p4) == "table" and p4.requestId == var1 then
				var2:Disconnect()
				p1(p4)
				
				return
			end
		end)
		p2.publishRequest({ active = true, requestId = var1 })
		
		if pcall(function()
			-- upvalues: p2 (ref)
			p2.setCaptureModeForReport(true)
			p2.toggleCaptureMode()
		end) then
			return true
		end
		var2:Disconnect()
		p2.publishRequest({ active = false, requestId = var1 })
		
		return false
	end,
	cancelActiveRequest = function()
		-- upvalues: messageBusService (ref), buildExperienceMessageId (ref), buildExperienceMessageId_1 (ref)
		local var1 = messageBusService:GetLast(buildExperienceMessageId)
		local var2 = if typeof(var1) == "table" and var1.active == true and (typeof(var1.requestId) == "string" and var1.requestId ~= "") then var1 else nil
		
		if var2 ~= nil then
			var1 = { status = "cancelled", requestId = var2.requestId }
			messageBusService:Publish(buildExperienceMessageId_1, var1)
			messageBusService:Publish(buildExperienceMessageId, { active = false, requestId = var1.requestId })
		end
	end,
	configureCaptureMode = function(p1)
		local var1
		local _ = nil
		
		if p1 == nil then
			local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
			var1 = {
				getSafetyHighlightMode = function()
					local experienceStateCaptureSelectionMode = Enum.ExperienceStateCaptureSelectionMode
					
					return if experienceStateCaptureSelectionMode == nil then nil else experienceStateCaptureSelectionMode.SafetyHighlightMode
				end,
				isHiddenSelectionEnabled = function()
					return game:GetEngineFeature("ExperienceStateCaptureHiddenSelection")
				end,
				setHiddenSelectionEnabled = function()
					-- upvalues: experienceStateCaptureService (ref)
					experienceStateCaptureService.HiddenSelectionEnabled = true
				end,
				setSelectionMode = function(value)
					-- upvalues: experienceStateCaptureService (ref)
					experienceStateCaptureService.SelectionMode = value
				end
			}
		else
			var1 = p1
		end
		local safetyHighlightMode = var1.getSafetyHighlightMode()
		
		if safetyHighlightMode ~= nil then
			var1.setSelectionMode(safetyHighlightMode)
		end
		if var1.isHiddenSelectionEnabled() then
			var1.setHiddenSelectionEnabled()
		end
	end,
	getActiveRequest = getActiveRequest,
	publishResult = function(p1)
		-- upvalues: messageBusService (ref), buildExperienceMessageId_1 (ref), buildExperienceMessageId (ref)
		messageBusService:Publish(buildExperienceMessageId_1, p1)
		messageBusService:Publish(buildExperienceMessageId, { active = false, requestId = p1.requestId })
	end
}