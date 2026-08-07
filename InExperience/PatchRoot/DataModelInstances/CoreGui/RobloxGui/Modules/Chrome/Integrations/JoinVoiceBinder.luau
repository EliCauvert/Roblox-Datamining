local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local crossExperienceVoiceModule = require(corePackagesService.Workspace.Packages.CrossExperienceVoice)
local var5 = if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then require(chrome.ChromeShared.Service) else nil
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

local _ = function(p0) --[[ line: 31 ]]
	local var12 = false
	
	return function(...) --[[ line: 33 ]]
		-- upvalues: var12 (write), p0 (ref)
		if var12 then
			return nil
		end
		var12 = true
		
		return p0(...)
	end
end

local var9 = function() --[[ line: 43 ]]
	-- upvalues: default (ref), fFlagVoiceRewarmTelemetry (ref)
	default:reportJoinVoiceUpsellEvent("Shown", if fFlagVoiceRewarmTelemetry then default.joinVoiceButtonContext else nil)
end

local var10 = false

local var11 = function(...) --[[ line: 33 ]]
	-- upvalues: var10 (write), var9 (ref)
	if var10 then
		return nil
	end
	var12 = true
	
	return var9(...)
end

return function() --[[ line: 50 | named "JoinVoiceBinder" ]]
	-- upvalues: useIsVoiceFocused (ref), useIsVoiceConnecting (ref), reactModule (ref), var5 (ref), var11 (ref), getFFlagIntegratePhoneUpsellJoinVoice (ref), default (ref), isVoiceFocused (ref), VOICE_JOIN_PROGRESS (ref), getFFlagEnableVoiceUxUpdates (ref), constantsModule (ref), promptTypeModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref)
	local var13 = useIsVoiceFocused()
	local var14 = useIsVoiceConnecting()
	local var15 = reactModule.useMemo(function() --[[ line: 53 ]]
		-- upvalues: var13 (ref), var14 (ref)
		return var13 or var14
	end, { var14, var13 })
	local var16 = reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: var5 (copy)
		return if var5 then var5:integrations().join_voice else nil
	end, {})
	local var17 = reactModule.useCallback(function(p1) --[[ line: 64 ]]
		-- upvalues: var16 (ref), var5 (copy), var13 (ref), var11 (copy)
		if not var16 or not var5 then return end
		if not var13 then
			if p1 == var5.AvailabilitySignal.Available then
				var11()
				var16.availability:available()
				
				return
			elseif p1 == var5.AvailabilitySignal.Unavailable then
				var16.availability:unavailable()
			end
		end
	end, {})
	local var18 = reactModule.useCallback(function() --[[ line: 79 ]]
		-- upvalues: var5 (copy), getFFlagIntegratePhoneUpsellJoinVoice (copy), default (copy), var15 (ref), isVoiceFocused (copy), var17 (ref)
		if not var5 then return end
		if getFFlagIntegratePhoneUpsellJoinVoice() then
			task.spawn(function() --[[ line: 85 ]]
				-- upvalues: default (copy), var15 (copy), isVoiceFocused (copy), var17 (copy), var5 (copy)
				if default:ShouldShowJoinVoice() and not var15 and not isVoiceFocused() then
					var17(var5.AvailabilitySignal.Available)
				end
			end)
			
			return
		elseif default:ShouldShowJoinVoice() and not var15 and not isVoiceFocused() then
			var17(var5.AvailabilitySignal.Available)
		end
	end, { var16, var15 })
	local var19 = reactModule.useCallback(function(p2) --[[ line: 101 ]]
		-- upvalues: var16 (ref), var15 (ref), isVoiceFocused (copy), VOICE_JOIN_PROGRESS (copy), var18 (ref), getFFlagEnableVoiceUxUpdates (copy), default (copy), constantsModule (copy), promptTypeModule (copy)
		if not var16 then return end
		if var15 or isVoiceFocused() then
			var16.availability:unavailable()
			
			return
		elseif p2 == VOICE_JOIN_PROGRESS.Idle then
			var18()
			
			return
		elseif not getFFlagEnableVoiceUxUpdates() and p2 == VOICE_JOIN_PROGRESS.Suspended then
			var16.availability:available()
			
			return
		elseif p2 == VOICE_JOIN_PROGRESS.Joined then
			var16.availability:unavailable()
			
			if default.inExpUpsellEntrypoint == constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				default:ToggleMic()
				default:showPrompt(promptTypeModule.VoiceConsentAcceptedToast)
			end
		end
	end, { var16, var15 })
	local var20 = reactModule.useCallback(function() --[[ line: 122 ]]
		-- upvalues: var16 (ref)
		var16.availability:unavailable()
	end, { var16 })
	local var21 = reactModule.useCallback(function() --[[ line: 126 ]]
		-- upvalues: var15 (ref), isVoiceFocused (copy), var16 (ref)
		if var15 or isVoiceFocused() then
			var16.availability:unavailable()
			
			return
		end
		var16.availability:available()
	end, { var16, var15 })
	local var22 = reactModule.useCallback(function() --[[ line: 134 ]]
		-- upvalues: default (copy), var19 (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), var20 (ref), getFFlagEnableVoiceUxUpdates (copy), var21 (ref)
		local eventConnection = nil
		local eventConnection_1 = nil
		local eventConnection_2 = default.VoiceJoinProgressChanged.Event:Connect(var19)
		
		if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
			eventConnection = default.showVoiceUI.Event:Connect(var20)
			
			if not getFFlagEnableVoiceUxUpdates() then
				eventConnection_1 = default.hideVoiceUI.Event:Connect(var21)
			end
		end
		return function() --[[ line: 146 ]]
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
	reactModule.useEffect(function() --[[ line: 159 ]]
		-- upvalues: var18 (ref), var22 (ref)
		var18()
		var22()
	end, {})
	reactModule.useEffect(function() --[[ line: 164 ]]
		-- upvalues: var19 (ref), default (copy)
		var19(default.VoiceJoinProgress)
	end, { var15 })
	
	return nil
end