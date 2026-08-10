local teleportService = game:GetService("TeleportService")
local inExperienceDetailsPrompt = script:FindFirstAncestor("InExperienceDetailsPrompt")
local parent = inExperienceDetailsPrompt.Parent
local reactModule = require(parent.React)
local inExperienceDetailsPromptContainerModule = require(inExperienceDetailsPrompt.Features.InExperienceDetailsPromptContainer)
local fireInExperienceDetailsPromptOpenedEvent = require(parent.DiscoveryAnalytics).Events.fireInExperienceDetailsPromptOpenedEvent
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagLuaAppIedpOverlayAndNavigationFix = require(parent.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix

return function() --[[ line: 15 | named "InExperienceDetailsPromptApp" ]]
	-- upvalues: reactModule (ref), teleportService (ref), fireInExperienceDetailsPromptOpenedEvent (ref), discoveryEventErrorLogger (ref), fFlagLuaAppIedpOverlayAndNavigationFix (ref), inExperienceDetailsPromptContainerModule (ref)
	local var4, var5 = reactModule.useState(nil)
	local var6, var7 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 19 ]]
		-- upvalues: teleportService (copy), var5 (ref), var7 (ref), fireInExperienceDetailsPromptOpenedEvent (copy)
		local openExperienceDetailsPromptConnection = teleportService.OpenExperienceDetailsPrompt:Connect(function(p0) --[[ line: 20 ]]
			-- upvalues: var5 (copy), var7 (copy), fireInExperienceDetailsPromptOpenedEvent (copy)
			var5(tostring(p0))
			var7(true)
			fireInExperienceDetailsPromptOpenedEvent({ targetUniverseId = tostring(p0) })
		end)
		
		return function() --[[ line: 27 ]]
			-- upvalues: openExperienceDetailsPromptConnection (ref)
			if openExperienceDetailsPromptConnection then
				openExperienceDetailsPromptConnection:Disconnect()
			end
		end
	end, {})
	
	if not var6 or not var4 then
		return nil
	end
	local function _() --[[ line: 38 | named "closePrompt" ]]
		-- upvalues: var5 (ref), var7 (ref)
		var5(nil)
		var7(false)
	end
	
	local t = {
		universeId = var4,
		onJoin = function(p1) --[[ line: 45 ]]
			-- upvalues: teleportService (copy), var5 (ref), var7 (ref), discoveryEventErrorLogger (copy), var4 (ref)
			if p1 then
				teleportService:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.TeleportAttempted)
				teleportService:Teleport(p1)
				var5(nil)
				var7(false)
				
				return
			end
			discoveryEventErrorLogger.reportError("InExperienceDetailsPromptAppOnJoinMissingRootPlaceId", "Missing valid root place id for universe id", { universeId = var4 })
		end,
		onClose = function() --[[ line: 58 ]]
			-- upvalues: teleportService (copy), var5 (ref), var7 (ref)
			teleportService:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.PromptClosed)
			var5(nil)
			var7(false)
		end
	}
	
	return if fFlagLuaAppIedpOverlayAndNavigationFix then reactModule.createElement(inExperienceDetailsPromptContainerModule, t) else reactModule.createElement("ScreenGui", { ScreenInsets = Enum.ScreenInsets.None }, {
		InExperienceDetailsPrompt = reactModule.createElement(inExperienceDetailsPromptContainerModule, t)
	})
end