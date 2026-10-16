local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local CrossExperienceVoiceModule = require(CorePackages.Workspace.Packages.CrossExperienceVoice)
local ServiceModule = if require(CorePackages.Workspace.Packages.Chrome).Enabled() then require(Chrome.ChromeShared.Service) else nil
local IsVoiceFocusedFunction = require(CorePackages.Workspace.Packages.CrossExperience).Utils.isVoiceFocused
local UseIsVoiceFocusedFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceFocused
local UseIsVoiceConnectingFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceConnecting
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local VOICEJOINPROGRESS = ConstantsModule.VOICE_JOIN_PROGRESS
local PromptTypeModule = require(RobloxGui.Modules.VoiceChatPrompt.PromptType)
local GetFFlagIntegratePhoneUpsellJoinVoiceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice
local GetFFlagEnableVoiceUxUpdatesFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates
local FFlagVoiceRewarmTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagVoiceRewarmTelemetry
local FFlagProactiveVoiceRestrictionsUFRModule = require(RobloxGui.Modules.VoiceChat.Flags.FFlagProactiveVoiceRestrictionsUFR)

local function _(Callback) --[[ Line: 30 ]]
	local Flag = false
	
	return function(...) --[[ Line: 32 ]]
		-- upvalues: Flag (ref), Callback (copy)
		if Flag then
			return nil
		else
			Flag = true
			
			return Callback(...)
		end
	end
end

local function v14() --[[ Line: 42 ]]
	-- upvalues: Default (copy), FFlagVoiceRewarmTelemetry (copy)
	Default:reportJoinVoiceUpsellEvent("Shown", if FFlagVoiceRewarmTelemetry then Default.joinVoiceButtonContext else nil)
end

local v1 = false

local function v16(...) --[[ Line: 32 ]]
	-- upvalues: v1 (ref), v14 (copy)
	if v1 then
		return nil
	else
		v1 = true
		
		return v14(...)
	end
end

return function() --[[ Line: 49 | Named "JoinVoiceBinder" ]]
	-- upvalues: UseIsVoiceFocusedFunction (copy), UseIsVoiceConnectingFunction (copy), ReactModule (copy), ServiceModule (copy), FFlagProactiveVoiceRestrictionsUFRModule (copy), Default (copy), v16 (copy), GetFFlagIntegratePhoneUpsellJoinVoiceFunction (copy), IsVoiceFocusedFunction (copy), VOICEJOINPROGRESS (copy), GetFFlagEnableVoiceUxUpdatesFunction (copy), ConstantsModule (copy), PromptTypeModule (copy), SignalsModule (copy)
	local UseIsVoiceFocusedResult = UseIsVoiceFocusedFunction()
	local UseIsVoiceConnectingResult = UseIsVoiceConnectingFunction()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 52 ]]
		-- upvalues: UseIsVoiceFocusedResult (copy), UseIsVoiceConnectingResult (copy)
		return UseIsVoiceFocusedResult or UseIsVoiceConnectingResult
	end, { UseIsVoiceConnectingResult, UseIsVoiceFocusedResult })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 56 ]]
		-- upvalues: ServiceModule (upval)
		return if ServiceModule then ServiceModule:integrations().join_voice else nil
	end, {})
	local UseResult = ReactModule.useCallback(function(Available) --[[ Line: 63 ]]
		-- upvalues: UseMemoResult1 (copy), ServiceModule (upval), FFlagProactiveVoiceRestrictionsUFRModule (upval), Default (upval), UseIsVoiceFocusedResult (copy), v16 (upval)
		if not UseMemoResult1 or not ServiceModule then return end
		if FFlagProactiveVoiceRestrictionsUFRModule and Default:GetVoiceRestrictionState(false) ~= "normal" then
			UseMemoResult1.availability:unavailable()
			
			return
		end
		if not UseIsVoiceFocusedResult then
			if Available == ServiceModule.AvailabilitySignal.Available then
				v16()
				UseMemoResult1.availability:available()
				
				return
			end
			if Available == ServiceModule.AvailabilitySignal.Unavailable then
				UseMemoResult1.availability:unavailable()
			end
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 86 ]]
		-- upvalues: ServiceModule (upval), GetFFlagIntegratePhoneUpsellJoinVoiceFunction (upval), Default (upval), UseMemoResult (copy), IsVoiceFocusedFunction (upval), UseResult (copy)
		if not ServiceModule then return end
		if GetFFlagIntegratePhoneUpsellJoinVoiceFunction() then
			task.spawn(function() --[[ Line: 92 ]]
				-- upvalues: Default (upval), UseMemoResult (upval), IsVoiceFocusedFunction (upval), UseResult (upval), ServiceModule (upval)
				if Default:ShouldShowJoinVoice() and not UseMemoResult and not IsVoiceFocusedFunction() then
					UseResult(ServiceModule.AvailabilitySignal.Available)
				end
			end)
			
			return
		end
		if Default:ShouldShowJoinVoice() and not UseMemoResult and not IsVoiceFocusedFunction() then
			UseResult(ServiceModule.AvailabilitySignal.Available)
		end
	end, { UseMemoResult1, UseMemoResult })
	local UseResult2 = ReactModule.useCallback(function(Idle) --[[ Line: 108 ]]
		-- upvalues: UseMemoResult1 (copy), FFlagProactiveVoiceRestrictionsUFRModule (upval), Default (upval), UseMemoResult (copy), IsVoiceFocusedFunction (upval), VOICEJOINPROGRESS (upval), UseResult1 (copy), GetFFlagEnableVoiceUxUpdatesFunction (upval), ConstantsModule (upval), PromptTypeModule (upval)
		if not UseMemoResult1 then return end
		if FFlagProactiveVoiceRestrictionsUFRModule and Default:GetVoiceRestrictionState(false) ~= "normal" then
			UseMemoResult1.availability:unavailable()
			
			return
		end
		if UseMemoResult or IsVoiceFocusedFunction() then
			UseMemoResult1.availability:unavailable()
			
			return
		end
		if Idle == VOICEJOINPROGRESS.Idle then
			UseResult1()
			
			return
		end
		if not GetFFlagEnableVoiceUxUpdatesFunction() and Idle == VOICEJOINPROGRESS.Suspended then
			UseMemoResult1.availability:available()
			
			return
		end
		if Idle == VOICEJOINPROGRESS.Joined then
			UseMemoResult1.availability:unavailable()
			
			if Default.inExpUpsellEntrypoint == ConstantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				Default:ToggleMic()
				Default:showPrompt(PromptTypeModule.VoiceConsentAcceptedToast)
			end
		end
	end, { UseMemoResult1, UseMemoResult })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 137 ]]
		-- upvalues: UseMemoResult1 (copy)
		UseMemoResult1.availability:unavailable()
	end, { UseMemoResult1 })
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 141 ]]
		-- upvalues: FFlagProactiveVoiceRestrictionsUFRModule (upval), Default (upval), UseMemoResult1 (copy), UseMemoResult (copy), IsVoiceFocusedFunction (upval)
		if FFlagProactiveVoiceRestrictionsUFRModule and Default:GetVoiceRestrictionState(false) ~= "normal" then
			UseMemoResult1.availability:unavailable()
			
			return
		end
		if UseMemoResult or IsVoiceFocusedFunction() then
			UseMemoResult1.availability:unavailable()
			
			return
		else
			UseMemoResult1.availability:available()
		end
	end, { UseMemoResult1, UseMemoResult })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 156 ]]
		-- upvalues: FFlagProactiveVoiceRestrictionsUFRModule (upval), UseMemoResult1 (copy), SignalsModule (upval), Default (upval), UseResult2 (copy), UseResult3 (copy), GetFFlagEnableVoiceUxUpdatesFunction (upval), UseResult4 (copy)
		local EventConnection1 = nil
		local Connection = nil
		local Effect = if FFlagProactiveVoiceRestrictionsUFRModule and UseMemoResult1 then SignalsModule.createEffect(function(p1) --[[ Line: 161 ]]
			-- upvalues: Default (upval), UseMemoResult1 (upval)
			if Default:GetVoiceRestrictionState(p1) ~= "normal" then
				UseMemoResult1.availability:unavailable()
			end
		end) else nil
		local EventConnection = Default.VoiceJoinProgressChanged.Event:Connect(UseResult2)
		EventConnection1 = Default.showVoiceUI.Event:Connect(UseResult3)
		
		if not GetFFlagEnableVoiceUxUpdatesFunction() then
			Connection = Default.hideVoiceUI.Event:Connect(UseResult4)
		end
		return function() --[[ Line: 173 ]]
			-- upvalues: Effect (ref), EventConnection (copy), EventConnection1 (ref), Connection (ref)
			if Effect then
				Effect()
			end
			if EventConnection then
				EventConnection:Disconnect()
			end
			if EventConnection1 then
				EventConnection1:Disconnect()
			end
			if Connection then
				Connection:Disconnect()
			end
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 189 ]]
		-- upvalues: UseResult1 (copy), FFlagProactiveVoiceRestrictionsUFRModule (upval), UseResult5 (copy)
		UseResult1()
		
		if FFlagProactiveVoiceRestrictionsUFRModule then
			return UseResult5()
		else
			UseResult5()
			
			return nil
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 199 ]]
		-- upvalues: UseResult2 (copy), Default (upval)
		UseResult2(Default.VoiceJoinProgress)
	end, { UseMemoResult })
	
	return nil
end