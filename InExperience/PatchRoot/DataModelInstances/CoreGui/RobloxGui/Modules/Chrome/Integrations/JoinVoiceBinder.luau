local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local crossExperienceVoiceModule = require(corePackagesService.Workspace.Packages.CrossExperienceVoice)
local var1 = if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then require(chrome.ChromeShared.Service) else nil
local isVoiceFocused = require(corePackagesService.Workspace.Packages.CrossExperience).Utils.isVoiceFocused
local useIsVoiceFocused = crossExperienceVoiceModule.Hooks.useIsVoiceFocused
local useIsVoiceConnecting = crossExperienceVoiceModule.Hooks.useIsVoiceConnecting
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local VOICE_JOIN_PROGRESS = constantsModule.VOICE_JOIN_PROGRESS
local promptTypeModule = require(robloxGui.Modules.VoiceChatPrompt.PromptType)
local getFFlagEnableConnectDisconnectInSettingsAndChromeModule = require(robloxGui.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome)
local getFFlagIntegratePhoneUpsellJoinVoice = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice
local getFFlagEnableVoiceUxUpdates = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates
local fFlagVoiceRewarmTelemetry = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagVoiceRewarmTelemetry

local _ = function(p1)
	local var2 = false
	
	return function(...)
		-- upvalues: var2 (write), p1 (ref)
		if var2 then
			return nil
		end
		var2 = true
		
		return p1(...)
	end
end

local var2 = function()
	-- upvalues: default (ref), fFlagVoiceRewarmTelemetry (ref)
	default:reportJoinVoiceUpsellEvent("Shown", if fFlagVoiceRewarmTelemetry then default.joinVoiceButtonContext else nil)
end

local var3 = false

local var4 = function(...)
	-- upvalues: var3 (write), var2 (ref)
	if var3 then
		return nil
	end
	var12 = true
	
	return var2(...)
end

return function()
	-- upvalues: useIsVoiceFocused (ref), useIsVoiceConnecting (ref), reactModule (ref), var1 (ref), var4 (ref), getFFlagIntegratePhoneUpsellJoinVoice (ref), default (ref), isVoiceFocused (ref), VOICE_JOIN_PROGRESS (ref), getFFlagEnableVoiceUxUpdates (ref), constantsModule (ref), promptTypeModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref)
	local var5 = useIsVoiceFocused()
	local var6 = useIsVoiceConnecting()
	local var7 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), var6 (ref)
		return var5 or var6
	end, { var6, var5 })
	local var8 = reactModule.useMemo(function()
		-- upvalues: var1 (copy)
		return if var1 then var1:integrations().join_voice else nil
	end, {})
	local var9 = reactModule.useCallback(function(p1)
		-- upvalues: var8 (ref), var1 (copy), var5 (ref), var4 (copy)
		if not var8 or not var1 then return end
		if not var5 then
			if p1 == var1.AvailabilitySignal.Available then
				var4()
				var8.availability:available()
				
				return
			elseif p1 == var1.AvailabilitySignal.Unavailable then
				var8.availability:unavailable()
			end
		end
	end, {})
	local var10 = reactModule.useCallback(function()
		-- upvalues: var1 (copy), getFFlagIntegratePhoneUpsellJoinVoice (copy), default (copy), var7 (ref), isVoiceFocused (copy), var9 (ref)
		if not var1 then return end
		if getFFlagIntegratePhoneUpsellJoinVoice() then
			task.spawn(function()
				-- upvalues: default (copy), var7 (copy), isVoiceFocused (copy), var9 (copy), var1 (copy)
				if default:ShouldShowJoinVoice() and not var7 and not isVoiceFocused() then
					var9(var1.AvailabilitySignal.Available)
				end
			end)
			
			return
		elseif default:ShouldShowJoinVoice() and not var7 and not isVoiceFocused() then
			var9(var1.AvailabilitySignal.Available)
		end
	end, { var8, var7 })
	local var11 = reactModule.useCallback(function(p1)
		-- upvalues: var8 (ref), var7 (ref), isVoiceFocused (copy), VOICE_JOIN_PROGRESS (copy), var10 (ref), getFFlagEnableVoiceUxUpdates (copy), default (copy), constantsModule (copy), promptTypeModule (copy)
		if not var8 then return end
		if var7 or isVoiceFocused() then
			var8.availability:unavailable()
			
			return
		elseif p1 == VOICE_JOIN_PROGRESS.Idle then
			var10()
			
			return
		elseif not getFFlagEnableVoiceUxUpdates() and p1 == VOICE_JOIN_PROGRESS.Suspended then
			var8.availability:available()
			
			return
		elseif p1 == VOICE_JOIN_PROGRESS.Joined then
			var8.availability:unavailable()
			
			if default.inExpUpsellEntrypoint == constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				default:ToggleMic()
				default:showPrompt(promptTypeModule.VoiceConsentAcceptedToast)
			end
		end
	end, { var8, var7 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var8 (ref)
		var8.availability:unavailable()
	end, { var8 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), isVoiceFocused (copy), var8 (ref)
		if var7 or isVoiceFocused() then
			var8.availability:unavailable()
			
			return
		end
		var8.availability:available()
	end, { var8, var7 })
	local var14 = reactModule.useCallback(function()
		-- upvalues: default (copy), var11 (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), var12 (ref), getFFlagEnableVoiceUxUpdates (copy), var13 (ref)
		local eventConnection = nil
		local eventConnection_1 = nil
		local eventConnection_2 = default.VoiceJoinProgressChanged.Event:Connect(var11)
		
		if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
			eventConnection = default.showVoiceUI.Event:Connect(var12)
			
			if not getFFlagEnableVoiceUxUpdates() then
				eventConnection_1 = default.hideVoiceUI.Event:Connect(var13)
			end
		end
		return function()
			-- upvalues: eventConnection_2 (ref), eventConnection (write), eventConnection_1 (write)
			if eventConnection_2 then
				eventConnection_2:Disconnect()
			end
			if eventConnection then
				eventConnection:Disconnect()
			end
			if eventConnection_1 then
				eventConnection_1:Disconnect()
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var14 (ref)
		var10()
		var14()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), default (copy)
		var11(default.VoiceJoinProgress)
	end, { var7 })
	
	return nil
end