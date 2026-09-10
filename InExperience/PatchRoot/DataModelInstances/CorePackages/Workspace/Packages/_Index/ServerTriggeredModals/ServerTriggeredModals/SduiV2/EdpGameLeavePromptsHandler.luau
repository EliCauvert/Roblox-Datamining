local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local reactModule = require(parent.React)
local messageBus = require(parent.MessageBus).MessageBus
local tModule = require(parent.t)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local promptsHandler = require(script.Parent.PromptsHandler).PromptsHandler
local promptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local isPinShortcutAvailableModule = require(script.Parent.isPinShortcutAvailable)
local isCustomAppEntryPointAutoJoinAvailableModule = require(script.Parent.isCustomAppEntryPointAutoJoinAvailable)
local getAppFeaturePolicies = universalAppPolicyModule.getAppFeaturePolicies
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEdpGameLeavePromptsPassPinShortcutAvailable = require(parent.SharedFlags).FFlagEdpGameLeavePromptsPassPinShortcutAvailable
local fFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin = require(parent.SharedFlags).FFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin
local fFlagAddPinExperienceTargetDestinationGUACPolicy = sharedFlagsModule.FFlagAddPinExperienceTargetDestinationGUACPolicy
local avoidShowingMobileUpsellDialogOnDesktopHackyLuaFix = game:DefineFastFlag("AvoidShowingMobileUpsellDialogOnDesktopHackyLuaFix", false)
local passInPinShortcutTargetDestinationToUpsellResolver = game:DefineFastFlag("PassInPinShortcutTargetDestinationToUpsellResolver", false)

return function(p1)
	-- upvalues: reactModule (ref), isPinShortcutAvailableModule (ref), fFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin (ref), isCustomAppEntryPointAutoJoinAvailableModule (ref), fFlagAddPinExperienceTargetDestinationGUACPolicy (ref), getAppFeaturePolicies (ref), fFlagEdpGameLeavePromptsPassPinShortcutAvailable (ref), avoidShowingMobileUpsellDialogOnDesktopHackyLuaFix (ref), passInPinShortcutTargetDestinationToUpsellResolver (ref), messageBus (ref), tModule (ref), promptsHandler (ref), promptsEntryPointModule (ref)
	local var1, var2 = reactModule.useState(0)
	local var3 = reactModule.useMemo(isPinShortcutAvailableModule, {})
	local var4 = reactModule.useMemo(function()
		-- upvalues: fFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin (copy), isCustomAppEntryPointAutoJoinAvailableModule (copy)
		return fFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin and isCustomAppEntryPointAutoJoinAvailableModule()
	end, {})
	local var5 = if fFlagAddPinExperienceTargetDestinationGUACPolicy then getAppFeaturePolicies().getPinExperienceTargetDestination() else "HomeScreen"
	local var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), fFlagEdpGameLeavePromptsPassPinShortcutAvailable (copy), avoidShowingMobileUpsellDialogOnDesktopHackyLuaFix (copy), fFlagAddPinExperienceTargetDestinationGUACPolicy (copy), var5 (ref), var3 (ref), fFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin (copy), var4 (ref), passInPinShortcutTargetDestinationToUpsellResolver (copy), getAppFeaturePolicies (copy)
		if p1.universeId == nil then
			return nil
		end
		local t = { universeId = p1.universeId }
		
		if fFlagEdpGameLeavePromptsPassPinShortcutAvailable then
			if not avoidShowingMobileUpsellDialogOnDesktopHackyLuaFix or not fFlagAddPinExperienceTargetDestinationGUACPolicy then
				t.isPinnedShortcutAvailable = tostring(var3)
			elseif var5 == "Desktop" then
				t.isPinnedShortcutAvailableDesktop = tostring(var3)
				t.isPinnedShortcutAvailable = "false"
			else
				t.isPinnedShortcutAvailable = tostring(var3)
			end
		end
		if fFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin then
			t.isCustomAppEntryPointAutoJoinAvailable = tostring(var4)
		end
		if passInPinShortcutTargetDestinationToUpsellResolver and fFlagAddPinExperienceTargetDestinationGUACPolicy then
			t.pinnedShortcutTargetDestination = getAppFeaturePolicies().getPinExperienceTargetDestination()
		end
		return t
	end, { p1.universeId, var3, var4, var5 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), fFlagEdpGameLeavePromptsPassPinShortcutAvailable (copy), var3 (ref), messageBus (copy), tModule (copy), var2 (ref)
		if p1.universeId == nil then return end
		if fFlagEdpGameLeavePromptsPassPinShortcutAvailable or var3 then
			local var7 = messageBus.Subscriber.new()
			local game = messageBus.getMessageId("Game", "onGameLeave")
			var7:subscribe({ mid = game, validateParams = tModule.table }, function()
				-- upvalues: var2 (copy)
				var2(function(p2)
					return p2 + 1
				end)
			end)
			
			return function()
				-- upvalues: var7 (ref), game (ref)
				var7:unsubscribeWithMsgId(game)
			end
		end
	end, { var3, p1.universeId })
	
	return if var1 == 0 or var6 == nil then nil elseif fFlagEdpGameLeavePromptsPassPinShortcutAvailable or var3 then reactModule.createElement(promptsHandler, {
		key = "EdpPrompts" .. tostring(var1),
		entryPoint = promptsEntryPointModule.ExperienceDetailsPageSessionEnd,
		clientAttributes = var6
	}) else nil
end