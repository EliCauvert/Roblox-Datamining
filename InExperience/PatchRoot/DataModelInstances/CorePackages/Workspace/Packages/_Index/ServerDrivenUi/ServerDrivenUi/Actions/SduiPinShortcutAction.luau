local sduiCoreSystemModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local pinExperienceShortcut = sduiCoreSystemModule.SduiActionType.PinExperienceShortcut

local function _()
	return game:GetEngineFeature("PinShortcutServiceEnabled")
end

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), pinExperienceShortcut (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = pinExperienceShortcut
		}, p2.appPage)
		
		return
	end
	local var2 = tonumber(var1.placeId)
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing placeId",
			propName = "placeId",
			name = pinExperienceShortcut
		}, p2.appPage)
		
		return
	end
	local universeId = tonumber(var1.universeId) or 0
	local gameName = var1.gameName or ""
	
	if game:GetEngineFeature("PinShortcutServiceEnabled") then
		task.spawn(function()
			-- upvalues: p2 (ref), sduiErrorType (copy), pinExperienceShortcut (copy), var2 (ref), universeId (ref), gameName (ref)
			local ok, status = pcall(game.GetService, game, "PinShortcutService")
			
			if not ok or status == nil then
				p2.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
					message = "PinShortcutService unavailable",
					name = pinExperienceShortcut
				}, p2.appPage)
				
				return
			end
			local ok_1, status_1 = pcall(function()
				-- upvalues: status (ref), var2 (copy), universeId (copy), gameName (copy)
				status:PinExperience(var2, universeId, gameName)
			end)
			
			if not ok_1 then
				p2.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
					name = pinExperienceShortcut,
					message = tostring(status_1)
				}, p2.appPage)
			end
		end)
		
		return
	end
end