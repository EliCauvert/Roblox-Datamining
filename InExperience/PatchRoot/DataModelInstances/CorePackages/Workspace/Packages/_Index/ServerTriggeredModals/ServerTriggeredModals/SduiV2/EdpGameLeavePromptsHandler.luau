local Parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local ReactModule = require(Parent.React)
local MessageBus = require(Parent.MessageBus).MessageBus
local TModule = require(Parent.t)
local PromptsHandler = require(script.Parent.PromptsHandler).PromptsHandler
local PromptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local IsPinShortcutAvailableModule = require(script.Parent.isPinShortcutAvailable)
local IsCustomAppEntryPointAutoJoinAvailableModule = require(script.Parent.isCustomAppEntryPointAutoJoinAvailable)
local IsRecentInstallModule = require(script.Parent.isRecentInstall)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEdpGameLeavePromptsPassPinShortcutAvailable = require(Parent.SharedFlags).FFlagEdpGameLeavePromptsPassPinShortcutAvailable
local FFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin = require(Parent.SharedFlags).FFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin
local FFlagAddPinExperienceTargetDestinationGUACPolicy = SharedFlagsModule.FFlagAddPinExperienceTargetDestinationGUACPolicy
local AvoidShowingMobileUpsellDialogOnDesktopHackyLuaFix = game:DefineFastFlag("AvoidShowingMobileUpsellDialogOnDesktopHackyLuaFix", false)
local PassInPinShortcutTargetDestinationToUpsellResolver = game:DefineFastFlag("PassInPinShortcutTargetDestinationToUpsellResolver", false)
local FFlagEdpGameLeavePromptsPassIsRecentInstall = SharedFlagsModule.FFlagEdpGameLeavePromptsPassIsRecentInstall

return function(p1) --[[ Line: 34 | Named "EdpGameLeavePromptsHandler" ]]
	-- upvalues: ReactModule (copy), IsPinShortcutAvailableModule (copy), FFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin (copy), IsCustomAppEntryPointAutoJoinAvailableModule (copy), FFlagEdpGameLeavePromptsPassIsRecentInstall (copy), UseLocalUserIdFunction (copy), FFlagAddPinExperienceTargetDestinationGUACPolicy (copy), GetAppFeaturePoliciesFunction (copy), FFlagEdpGameLeavePromptsPassPinShortcutAvailable (copy), AvoidShowingMobileUpsellDialogOnDesktopHackyLuaFix (copy), IsRecentInstallModule (copy), PassInPinShortcutTargetDestinationToUpsellResolver (copy), MessageBus (copy), TModule (copy), PromptsHandler (copy), PromptsEntryPointModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseMemoResult = ReactModule.useMemo(IsPinShortcutAvailableModule, {})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 38 ]]
		-- upvalues: FFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin (upval), IsCustomAppEntryPointAutoJoinAvailableModule (upval)
		return FFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin and IsCustomAppEntryPointAutoJoinAvailableModule()
	end, {})
	local UseLocalUserIdResult = if FFlagEdpGameLeavePromptsPassIsRecentInstall then UseLocalUserIdFunction() else nil
	local PinExperienceTargetDestination = if FFlagAddPinExperienceTargetDestinationGUACPolicy then GetAppFeaturePoliciesFunction().getPinExperienceTargetDestination() else "HomeScreen"
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 48 ]]
		-- upvalues: p1 (copy), FFlagEdpGameLeavePromptsPassPinShortcutAvailable (upval), AvoidShowingMobileUpsellDialogOnDesktopHackyLuaFix (upval), FFlagAddPinExperienceTargetDestinationGUACPolicy (upval), PinExperienceTargetDestination (copy), UseMemoResult (copy), FFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin (upval), UseMemoResult1 (copy), FFlagEdpGameLeavePromptsPassIsRecentInstall (upval), UseStateResult (copy), IsRecentInstallModule (upval), UseLocalUserIdResult (copy), PassInPinShortcutTargetDestinationToUpsellResolver (upval), GetAppFeaturePoliciesFunction (upval)
		if p1.universeId == nil then
			return nil
		end
		local config = { universeId = p1.universeId }
		
		if FFlagEdpGameLeavePromptsPassPinShortcutAvailable then
			if AvoidShowingMobileUpsellDialogOnDesktopHackyLuaFix and FFlagAddPinExperienceTargetDestinationGUACPolicy then
				if PinExperienceTargetDestination == "Desktop" then
					config.isPinnedShortcutAvailableDesktop = tostring(UseMemoResult)
					config.isPinnedShortcutAvailable = "false"
				else
					config.isPinnedShortcutAvailable = tostring(UseMemoResult)
				end
			else
				config.isPinnedShortcutAvailable = tostring(UseMemoResult)
			end
		end
		if FFlagEdpGameLeavePromptsPassCustomAppEntryPointAutoJoin then
			config.isCustomAppEntryPointAutoJoinAvailable = tostring(UseMemoResult1)
		end
		if FFlagEdpGameLeavePromptsPassIsRecentInstall and UseStateResult > 0 then
			config.isRecentInstall = tostring(IsRecentInstallModule(UseLocalUserIdResult))
		end
		if PassInPinShortcutTargetDestinationToUpsellResolver and FFlagAddPinExperienceTargetDestinationGUACPolicy then
			config.pinnedShortcutTargetDestination = GetAppFeaturePoliciesFunction().getPinExperienceTargetDestination()
		end
		return config
	end, {
		p1.universeId, UseMemoResult, UseMemoResult1, PinExperienceTargetDestination,
		UseLocalUserIdResult, UseStateResult
	})
	ReactModule.useEffect(function() --[[ Line: 100 ]]
		-- upvalues: p1 (copy), FFlagEdpGameLeavePromptsPassPinShortcutAvailable (upval), UseMemoResult (copy), MessageBus (upval), TModule (upval), UseStateResult2 (copy)
		if p1.universeId == nil then return end
		if not FFlagEdpGameLeavePromptsPassPinShortcutAvailable and not UseMemoResult then return end
		local NewResult = MessageBus.Subscriber.new()
		local GameMessageId = MessageBus.getMessageId("Game", "onGameLeave")
		NewResult:subscribe({ mid = GameMessageId, validateParams = TModule.table }, function() --[[ Line: 113 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(function(p2: number): number --[[ Line: 114 ]]
				return p2 + 1
			end)
		end)
		
		return function() --[[ Line: 119 ]]
			-- upvalues: NewResult (copy), GameMessageId (copy)
			NewResult:unsubscribeWithMsgId(GameMessageId)
		end
	end, { UseMemoResult, p1.universeId })
	
	return if UseStateResult == 0 or UseMemoResult2 == nil then nil elseif FFlagEdpGameLeavePromptsPassPinShortcutAvailable or UseMemoResult then ReactModule.createElement(PromptsHandler, {
		key = "EdpPrompts" .. tostring(UseStateResult),
		entryPoint = PromptsEntryPointModule.ExperienceDetailsPageSessionEnd,
		clientAttributes = UseMemoResult2
	}) else nil
end