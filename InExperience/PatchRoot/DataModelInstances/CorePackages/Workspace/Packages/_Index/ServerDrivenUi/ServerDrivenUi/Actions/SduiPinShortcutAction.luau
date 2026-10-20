local IXPService = game:GetService("IXPService")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local FFlagPinShortcutEnableOnCompleteCallback = require(Parent.SharedFlags).FFlagPinShortcutEnableOnCompleteCallback
local FFlagEdpPinnedShortcutsLogExposure = require(Parent.SharedFlags).FFlagEdpPinnedShortcutsLogExposure
local FStringEdpPinnedShortcutsIxpLayer = require(Parent.SharedFlags).FStringEdpPinnedShortcutsIxpLayer
local PinExperienceAndNotifyFunction = require(Parent.PinShortcut).pinExperienceAndNotify
local PinExperienceShortcut = SduiCoreSystemModule.SduiActionType.PinExperienceShortcut

local function _()
	return game:GetEngineFeature("PinShortcutServiceEnabled")
end

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), PinExperienceShortcut (copy), FFlagEdpPinnedShortcutsLogExposure (copy), IXPService (copy), FStringEdpPinnedShortcutsIxpLayer (copy), FFlagPinShortcutEnableOnCompleteCallback (copy), PinExperienceAndNotifyFunction (copy)
	local ActionParams = if p1 then p1.actionParams else nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = PinExperienceShortcut
		}, p2.appPage)
		
		return
	end
	local Number: number? = tonumber(ActionParams.placeId)
	
	if Number == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing placeId",
			propName = "placeId",
			name = PinExperienceShortcut
		}, p2.appPage)
		
		return
	end
	local Number1: number = tonumber(ActionParams.universeId) or 0
	local GameName = ActionParams.gameName or ""
	
	if not game:GetEngineFeature("PinShortcutServiceEnabled") then return end
	if FFlagEdpPinnedShortcutsLogExposure and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
		pcall(function()
			-- upvalues: IXPService (upval), FStringEdpPinnedShortcutsIxpLayer (upval)
			IXPService:LogFlagLinkedUserLayerExposure(FStringEdpPinnedShortcutsIxpLayer)
		end)
	end
	task.spawn(function()
		-- upvalues: FFlagPinShortcutEnableOnCompleteCallback (upval), PinExperienceAndNotifyFunction (upval), Number (copy), Number1 (copy), GameName (copy), p2 (copy), SduiErrorType (upval), PinExperienceShortcut (upval)
		if FFlagPinShortcutEnableOnCompleteCallback then
			local Success, Result = pcall(function()
				-- upvalues: PinExperienceAndNotifyFunction (upval), Number (upval), Number1 (upval), GameName (upval), p2 (upval)
				PinExperienceAndNotifyFunction(Number, Number1, GameName, p2.dependencies.dispatch)
			end)
			
			if not Success then
				p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, { name = PinExperienceShortcut, message = tostring(Result) }, p2.appPage)
				
				return
			end
		else
			local Success1, Result1 = pcall(game.GetService, game, "PinShortcutService")
			
			if not Success1 or Result1 == nil then
				p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
					message = "PinShortcutService unavailable",
					name = PinExperienceShortcut
				}, p2.appPage)
				
				return
			end
			local Success2, Result2 = pcall(function()
				-- upvalues: Result1 (copy), Number (upval), Number1 (upval), GameName (upval)
				Result1:PinExperience(Number, Number1, GameName)
			end)
			
			if not Success2 then
				p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
					name = PinExperienceShortcut,
					message = tostring(Result2)
				}, p2.appPage)
			end
		end
	end)
end