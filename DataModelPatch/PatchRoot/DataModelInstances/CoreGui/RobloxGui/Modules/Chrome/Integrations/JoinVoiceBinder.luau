local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ReactModule = require(CorePackages.Packages.React)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local CrossExperienceVoiceModule = require(CorePackages.Workspace.Packages.CrossExperienceVoice)
local ServiceModule = if require(CorePackages.Workspace.Packages.Chrome).Enabled() then require(Chrome.ChromeShared.Service) else nil
local IsVoiceFocusedFunction = require(CorePackages.Workspace.Packages.CrossExperience).Utils.isVoiceFocused
local UseIsVoiceFocusedFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceFocused
local UseIsVoiceConnectingFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceConnecting
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local VOICEJOINPROGRESS = ConstantsModule.VOICE_JOIN_PROGRESS
local PromptTypeModule = require(RobloxGui.Modules.VoiceChatPrompt.PromptType)
local GetFFlagEnableConnectDisconnectInSettingsAndChromeModule = require(RobloxGui.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome)
local GetFFlagIntegratePhoneUpsellJoinVoiceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice
local GetFFlagEnableVoiceUxUpdatesFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates
local FFlagVoiceRewarmTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagVoiceRewarmTelemetry

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

local function v13()
	-- upvalues: Default (copy), FFlagVoiceRewarmTelemetry (copy)
	Default:reportJoinVoiceUpsellEvent("Shown", if FFlagVoiceRewarmTelemetry then Default.joinVoiceButtonContext else nil)
end

local v1 = false

local function v15(...)
	-- upvalues: v1 (ref), v13 (copy)
	if v1 then
		return nil
	else
		v1 = true
		
		return v13(...)
	end
end

return function()
	-- upvalues: UseIsVoiceFocusedFunction (copy), UseIsVoiceConnectingFunction (copy), ReactModule (copy), ServiceModule (copy), v15 (copy), GetFFlagIntegratePhoneUpsellJoinVoiceFunction (copy), Default (copy), IsVoiceFocusedFunction (copy), VOICEJOINPROGRESS (copy), GetFFlagEnableVoiceUxUpdatesFunction (copy), ConstantsModule (copy), PromptTypeModule (copy), GetFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy)
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
		-- upvalues: UseMemoResult1 (copy), ServiceModule (upval), UseIsVoiceFocusedResult (copy), v15 (upval)
		if not UseMemoResult1 or not ServiceModule then return end
		if not UseIsVoiceFocusedResult then
			if Available == ServiceModule.AvailabilitySignal.Available then
				v15()
				UseMemoResult1.availability:available()
				
				return
			end
			if Available == ServiceModule.AvailabilitySignal.Unavailable then
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
		-- upvalues: UseMemoResult1 (copy), UseMemoResult (copy), IsVoiceFocusedFunction (upval), VOICEJOINPROGRESS (upval), UseResult1 (copy), GetFFlagEnableVoiceUxUpdatesFunction (upval), Default (upval), ConstantsModule (upval), PromptTypeModule (upval)
		if not UseMemoResult1 then return end
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
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult1 (copy)
		UseMemoResult1.availability:unavailable()
	end, { UseMemoResult1 })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), IsVoiceFocusedFunction (upval), UseMemoResult1 (copy)
		if UseMemoResult or IsVoiceFocusedFunction() then
			UseMemoResult1.availability:unavailable()
			
			return
		else
			UseMemoResult1.availability:available()
		end
	end, { UseMemoResult1, UseMemoResult })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: Default (upval), UseResult2 (copy), GetFFlagEnableConnectDisconnectInSettingsAndChromeModule (upval), UseResult3 (copy), GetFFlagEnableVoiceUxUpdatesFunction (upval), UseResult4 (copy)
		local Connection = nil
		local Connection1 = nil
		local EventConnection = Default.VoiceJoinProgressChanged.Event:Connect(UseResult2)
		
		if GetFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
			Connection = Default.showVoiceUI.Event:Connect(UseResult3)
			
			if not GetFFlagEnableVoiceUxUpdatesFunction() then
				Connection1 = Default.hideVoiceUI.Event:Connect(UseResult4)
			end
		end
		return function()
			-- upvalues: EventConnection (copy), Connection (ref), Connection1 (ref)
			if EventConnection then
				EventConnection:Disconnect()
			end
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy), UseResult5 (copy)
		UseResult1()
		UseResult5()
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseResult2 (copy), Default (upval)
		UseResult2(Default.VoiceJoinProgress)
	end, { UseMemoResult })
	
	return nil
end