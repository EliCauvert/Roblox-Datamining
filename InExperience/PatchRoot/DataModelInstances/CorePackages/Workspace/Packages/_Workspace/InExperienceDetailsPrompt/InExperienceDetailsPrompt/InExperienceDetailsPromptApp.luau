local teleportService = game:GetService("TeleportService")
local inExperienceDetailsPrompt = script:FindFirstAncestor("InExperienceDetailsPrompt")
local parent = inExperienceDetailsPrompt.Parent
local reactModule = require(parent.React)
local inExperienceDetailsPromptContainerModule = require(inExperienceDetailsPrompt.Features.InExperienceDetailsPromptContainer)
local fireInExperienceDetailsPromptOpenedEvent = require(parent.DiscoveryAnalytics).Events.fireInExperienceDetailsPromptOpenedEvent
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagLuaAppIedpOverlayAndNavigationFix = require(parent.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix

return function()
	-- upvalues: reactModule (ref), teleportService (ref), fireInExperienceDetailsPromptOpenedEvent (ref), discoveryEventErrorLogger (ref), fFlagLuaAppIedpOverlayAndNavigationFix (ref), inExperienceDetailsPromptContainerModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3, var4 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: teleportService (copy), var2 (ref), var4 (ref), fireInExperienceDetailsPromptOpenedEvent (copy)
		local openExperienceDetailsPromptConnection = teleportService.OpenExperienceDetailsPrompt:Connect(function(p1)
			-- upvalues: var2 (copy), var4 (copy), fireInExperienceDetailsPromptOpenedEvent (copy)
			var2(tostring(p1))
			var4(true)
			fireInExperienceDetailsPromptOpenedEvent({ targetUniverseId = tostring(p1) })
		end)
		
		return function()
			-- upvalues: openExperienceDetailsPromptConnection (ref)
			if openExperienceDetailsPromptConnection then
				openExperienceDetailsPromptConnection:Disconnect()
			end
		end
	end, {})
	
	if not var3 or not var1 then
		return nil
	end
	local function _()
		-- upvalues: var2 (ref), var4 (ref)
		var2(nil)
		var4(false)
	end
	
	local t = {
		universeId = var1,
		onJoin = function(p1)
			-- upvalues: teleportService (copy), var2 (ref), var4 (ref), discoveryEventErrorLogger (copy), var1 (ref)
			if p1 then
				teleportService:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.TeleportAttempted)
				teleportService:Teleport(p1)
				var2(nil)
				var4(false)
				
				return
			end
			discoveryEventErrorLogger.reportError("InExperienceDetailsPromptAppOnJoinMissingRootPlaceId", "Missing valid root place id for universe id", { universeId = var1 })
		end,
		onClose = function()
			-- upvalues: teleportService (copy), var2 (ref), var4 (ref)
			teleportService:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.PromptClosed)
			var2(nil)
			var4(false)
		end
	}
	
	return if fFlagLuaAppIedpOverlayAndNavigationFix then reactModule.createElement(inExperienceDetailsPromptContainerModule, t) else reactModule.createElement("ScreenGui", { ScreenInsets = Enum.ScreenInsets.None }, {
		InExperienceDetailsPrompt = reactModule.createElement(inExperienceDetailsPromptContainerModule, t)
	})
end