local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(script.Parent.CaptureModeView)
local captureModeProtocolModule = require(script.Parent.CaptureModeProtocol)
local clientDataModelCollectorModule = require(buildExperience.Chat.clientDataModelCollector)

return function(p1)
	-- upvalues: reactModule (ref), clientDataModelCollectorModule (ref), captureModeProtocolModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), clientDataModelCollectorModule (copy), captureModeProtocolModule (copy)
		if p1 == nil then
			local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
			
			return {
				connectItemSelected = function(p2)
					-- upvalues: experienceStateCaptureService (ref)
					return experienceStateCaptureService.ItemSelectedInCaptureMode:Connect(p2)
				end,
				getInstancePath = clientDataModelCollectorModule.getInstancePath,
				getActiveRequest = captureModeProtocolModule.getActiveRequest,
				publishResult = captureModeProtocolModule.publishResult,
				scheduleInstructionDismissal = function(p2)
					local delayedThread = task.delay(4, p2)
					
					return function()
						-- upvalues: delayedThread (ref)
						pcall(task.cancel, delayedThread)
					end
				end,
				toggleCaptureMode = function()
					-- upvalues: experienceStateCaptureService (ref)
					experienceStateCaptureService:ToggleCaptureMode()
				end
			}
		end
		return p1
	end, { p1 })
	local var2 = reactModule.useRef(false)
	local var3, var4 = reactModule.useState(true)
	local var5 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref), var1 (ref)
		if var2.current then return end
		local activeRequest = var1.getActiveRequest()
		
		if activeRequest == nil then
			return
		end
		var2.current = true
		var1.publishResult({
			requestId = activeRequest.requestId,
			status = p2,
			path = if p3 ~= nil then nil else var1.getInstancePath(p3),
			className = if p3 ~= nil then nil else p3.ClassName,
			displayName = if p3 ~= nil then nil else p3.Name
		})
		var1.toggleCaptureMode()
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var4 (ref)
		return var1.scheduleInstructionDismissal(function()
			-- upvalues: var4 (copy)
			var4(false)
		end)
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var5 (ref)
		local var6 = var1.connectItemSelected(function(p2)
			-- upvalues: var5 (copy)
			if p2 ~= nil then
				var5("selected", p2)
			end
		end)
		
		return function()
			-- upvalues: var6 (ref)
			var6:Disconnect()
		end
	end, { var1, var5 })
	
	return {
		title = "Select an item",
		description = "Tap UI or a 3D object to attach it.",
		isVisible = var3,
		onClose = function()
			-- upvalues: var5 (ref)
			var5("cancelled", nil)
		end
	}
end