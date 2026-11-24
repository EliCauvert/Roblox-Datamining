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
local FFlagVoiceRewarmTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagVoiceRewarmTelemetry
local FFlagAgeCheckJoinIntentUnmutes = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAgeCheckJoinIntentUnmutes
local FFlagProactiveVoiceRestrictionsUFR = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProactiveVoiceRestrictionsUFR
local FFlagVoiceRewarmGrafanaMetricsModule = require(RobloxGui.Modules.VoiceChat.Flags.FFlagVoiceRewarmGrafanaMetrics)

local function _(Callback)
	local Flag = false
	
	return function(...)
		-- upvalues: Flag (ref), Callback (copy)
		if Flag then
			return nil
		else
			Flag = true
			
			return Callback(...)
		end
	end
end

local function v16()
	-- upvalues: Default (copy), FFlagVoiceRewarmTelemetry (copy)
	Default:reportJoinVoiceUpsellEvent("Shown", if FFlagVoiceRewarmTelemetry then Default.joinVoiceButtonContext else nil)
end

local v1 = false

local function v18(...)
	-- upvalues: v1 (ref), v16 (copy)
	if v1 then
		return nil
	else
		v1 = true
		
		return v16(...)
	end
end

return function()
	-- upvalues: UseIsVoiceFocusedFunction (copy), UseIsVoiceConnectingFunction (copy), ReactModule (copy), ServiceModule (copy), FFlagProactiveVoiceRestrictionsUFR (copy), Default (copy), v18 (copy), FFlagVoiceRewarmGrafanaMetricsModule (copy), GetFFlagIntegratePhoneUpsellJoinVoiceFunction (copy), IsVoiceFocusedFunction (copy), VOICEJOINPROGRESS (copy), ConstantsModule (copy), PromptTypeModule (copy), SignalsModule (copy), FFlagAgeCheckJoinIntentUnmutes (copy)
	local UseIsVoiceFocusedResult = UseIsVoiceFocusedFunction()
	local UseIsVoiceConnectingResult = UseIsVoiceConnectingFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseIsVoiceFocusedResult (copy), UseIsVoiceConnectingResult (copy)
		return UseIsVoiceFocusedResult or UseIsVoiceConnectingResult
	end, { UseIsVoiceConnectingResult, UseIsVoiceFocusedResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ServiceModule (upval)
		return if ServiceModule then ServiceModule:integrations().join_voice else nil
	end, {})
	local UseResult = ReactModule.useCallback(function(Available)
		-- upvalues: UseMemoResult1 (copy), ServiceModule (upval), FFlagProactiveVoiceRestrictionsUFR (upval), Default (upval), UseIsVoiceFocusedResult (copy), v18 (upval), FFlagVoiceRewarmGrafanaMetricsModule (upval)
		if not UseMemoResult1 or not ServiceModule then return end
		if FFlagProactiveVoiceRestrictionsUFR and Default:GetVoiceRestrictionState(false) ~= "normal" then
			UseMemoResult1.availability:unavailable()
			
			return
		end
		if not UseIsVoiceFocusedResult then
			if Available == ServiceModule.AvailabilitySignal.Available then
				v18()
				
				if FFlagVoiceRewarmGrafanaMetricsModule then
					Default:reportVoiceRewarmShown()
				end
				UseMemoResult1.availability:available()
				
				return
			elseif Available == ServiceModule.AvailabilitySignal.Unavailable then
				UseMemoResult1.availability:unavailable()
			end
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ServiceModule (upval), GetFFlagIntegratePhoneUpsellJoinVoiceFunction (upval), Default (upval), UseMemoResult (copy), IsVoiceFocusedFunction (upval), UseResult (copy)
		if not ServiceModule then return end
		if GetFFlagIntegratePhoneUpsellJoinVoiceFunction() then
			task.spawn(function()
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
	local UseResult2 = ReactModule.useCallback(function(Idle)
		-- upvalues: UseMemoResult1 (copy), FFlagProactiveVoiceRestrictionsUFR (upval), Default (upval), UseMemoResult (copy), IsVoiceFocusedFunction (upval), VOICEJOINPROGRESS (upval), UseResult1 (copy), ConstantsModule (upval), PromptTypeModule (upval)
		if not UseMemoResult1 then return end
		if FFlagProactiveVoiceRestrictionsUFR and Default:GetVoiceRestrictionState(false) ~= "normal" then
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
		if Idle == VOICEJOINPROGRESS.Joined then
			UseMemoResult1.availability:unavailable()
			
			if Default.inExpUpsellEntrypoint == ConstantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				Default:ToggleMic()
				Default:showPrompt(PromptTypeModule.VoiceConsentAcceptedToast)
			end
		end
	end, { UseMemoResult1, UseMemoResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult1 (copy)
		UseMemoResult1.availability:unavailable()
	end, { UseMemoResult1 })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: FFlagProactiveVoiceRestrictionsUFR (upval), UseMemoResult1 (copy), SignalsModule (upval), Default (upval), UseResult2 (copy), UseResult3 (copy), FFlagAgeCheckJoinIntentUnmutes (upval)
		local EventConnection1 = nil
		local Effect = if FFlagProactiveVoiceRestrictionsUFR and UseMemoResult1 then SignalsModule.createEffect(function(p1)
			-- upvalues: Default (upval), UseMemoResult1 (upval)
			if Default:GetVoiceRestrictionState(p1) ~= "normal" then
				UseMemoResult1.availability:unavailable()
			end
		end) else nil
		local EventConnection = Default.VoiceJoinProgressChanged.Event:Connect(UseResult2)
		EventConnection1 = Default.showVoiceUI.Event:Connect(UseResult3)
		local EventConnection2 = if FFlagAgeCheckJoinIntentUnmutes then Default.ageCheckEndedWithoutVoice.Event:Connect(function()
			-- upvalues: UseMemoResult1 (upval)
			UseMemoResult1.availability:unavailable()
		end) else nil
		
		return function()
			-- upvalues: EventConnection2 (ref), Effect (ref), EventConnection (copy), EventConnection1 (ref)
			if EventConnection2 then
				EventConnection2:Disconnect()
			end
			if Effect then
				Effect()
			end
			if EventConnection then
				EventConnection:Disconnect()
			end
			if EventConnection1 then
				EventConnection1:Disconnect()
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy), FFlagProactiveVoiceRestrictionsUFR (upval), FFlagAgeCheckJoinIntentUnmutes (upval), UseResult4 (copy)
		UseResult1()
		
		if FFlagProactiveVoiceRestrictionsUFR or FFlagAgeCheckJoinIntentUnmutes then
			return UseResult4()
		else
			UseResult4()
			
			return nil
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseResult2 (copy), Default (upval)
		UseResult2(Default.VoiceJoinProgress)
	end, { UseMemoResult })
	
	return nil
end