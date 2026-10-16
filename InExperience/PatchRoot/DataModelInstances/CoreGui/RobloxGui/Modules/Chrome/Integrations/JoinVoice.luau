local Chrome = script:FindFirstAncestor("Chrome")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local CommonFtuxTooltipModule = require(Chrome.Integrations.CommonFtuxTooltip)
local ConstantsModule1 = require(Chrome.ChromeShared.Unibar.Constants)
local IsVoiceChatSupportedModule = require(Chrome.Integrations.isVoiceChatSupported)
local VOICEJOINPROGRESS = ConstantsModule.VOICE_JOIN_PROGRESS
local PromptTypeModule = require(RobloxGui.Modules.VoiceChatPrompt.PromptType)
local ObserveCurrentContextIdFunction: (any) -> () = require(CorePackages.Workspace.Packages.CrossExperience).Utils.observeCurrentContextId
local GetIconFunction = require(CorePackages.Workspace.Packages.VoiceChat).Utils.GetIcon
local CONTEXTID = require(CorePackages.Workspace.Packages.CrossExperience).Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID
local GetFFlagIntegratePhoneUpsellJoinVoiceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice
local GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local GetFFlagEnableVoiceUxUpdatesFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates
local FFlagProactiveVoiceRestrictionsUFRModule = require(RobloxGui.Modules.VoiceChat.Flags.FFlagProactiveVoiceRestrictionsUFR)
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(Chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local CheckShouldShowJoinVoiceInEvent = game:DefineFastFlag("CheckShouldShowJoinVoiceInEvent", false)
local ReplaceJoinVoiceIconToMuted = game:DefineFastFlag("ReplaceJoinVoiceIconToMuted", false)
local JoinVoiceFtuxShowDelayMs = game:DefineFastInt("JoinVoiceFtuxShowDelayMs", 1000)
local JoinVoiceFtuxDismissDelayMs = game:DefineFastInt("JoinVoiceFtuxDismissDelayMs", 5000)
local UnibarJoinVoiceTooltipPriority = game:DefineFastInt("UnibarJoinVoiceTooltipPriority", 1000)
local EnableChromeJoinVoiceTooltip = game:DefineFastFlag("EnableChromeJoinVoiceTooltip", false)
local ServiceModule = require(Chrome.Service)
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v1 = false
local Flag = false
local Unavailable = ServiceModule.AvailabilitySignal.Unavailable

function getShouldShowJoinVoiceTooltip() --[[ Line: 49 ]]
	-- upvalues: Default (copy), Flag (ref)
	local AgeVerificationOverlay = Default:FetchAgeVerificationOverlay()
	local ShowJoinVoiceUpsellTooltip = not Flag and (AgeVerificationOverlay and AgeVerificationOverlay.showJoinVoiceUpsellTooltip)
	Flag = true
	
	return ShowJoinVoiceUpsellTooltip
end

local RegisterResult = nil
RegisterResult = ServiceModule:register({
	id = "join_voice",
	label = "CoreScripts.TopBar.JoinVoice",
	initialAvailability = ServiceModule.AvailabilitySignal.Unavailable,
	sideSheetPlacement = SideSheetPlacement.Unibar,
	activated = function() --[[ Line: 64 ]]
		-- upvalues: FFlagProactiveVoiceRestrictionsUFRModule (copy), Default (copy), GetFFlagIntegratePhoneUpsellJoinVoiceFunction (copy), RobloxGui (copy), ConstantsModule (copy)
		if not FFlagProactiveVoiceRestrictionsUFRModule or Default:GetVoiceRestrictionState(false) == "normal" then
			local SettingsHubModule = if GetFFlagIntegratePhoneUpsellJoinVoiceFunction() then require(RobloxGui.Modules.Settings.SettingsHub) else nil
			Default.pendingConnectionSource = ConstantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
			Default:JoinVoice(SettingsHubModule)
			
			return
		end
	end,
	components = {
		Icon = function() --[[ Line: 78 ]]
			-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule1 (copy), ReplaceJoinVoiceIconToMuted (copy), GetIconFunction (copy), EnableChromeJoinVoiceTooltip (copy), ReactModule (copy), FoundationModule (copy), CommonIconModule (copy), CommonFtuxTooltipModule (copy), UnibarJoinVoiceTooltipPriority (copy), JoinVoiceFtuxShowDelayMs (copy), JoinVoiceFtuxDismissDelayMs (copy), Default (copy), ConstantsModule (copy)
			local ICONSIZE = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_SIZE else ConstantsModule1.ICON_SIZE
			local Muted = if ReplaceJoinVoiceIconToMuted then GetIconFunction("Muted", "MicLight") else "icons/controls/publicAudioJoin"
			
			return if EnableChromeJoinVoiceTooltip then ReactModule.createElement(FoundationModule.View, { Size = UDim2.new(0, ICONSIZE, 0, ICONSIZE) }, {
				Icon = CommonIconModule(Muted),
				Tooltip = CommonFtuxTooltipModule({
					id = "JOIN_VOICE",
					dismissOnOutsideInput = true,
					headerKey = "CoreScripts.FTUX.Heading.JoinVoice",
					bodyKey = "CoreScripts.FTUX.Label.JoinVoiceDescription",
					priority = UnibarJoinVoiceTooltipPriority,
					isIconVisible = getShouldShowJoinVoiceTooltip(),
					showDelay = JoinVoiceFtuxShowDelayMs,
					dismissDelay = JoinVoiceFtuxDismissDelayMs,
					onDismissed = function() --[[ Line: 106 ]]
						-- upvalues: Default (upval), ConstantsModule (upval)
						pcall(function() --[[ Line: 107 ]]
							-- upvalues: Default (upval), ConstantsModule (upval)
							Default:RecordUserSeenModal(ConstantsModule.MODAL_IDS.IN_EXP_JOIN_VOICE_UPSELL)
						end)
					end
				})
			}) else CommonIconModule(Muted)
		end
	}
})

if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() then
	return RegisterResult
end
local function setAvailability(Available) --[[ Line: 125 ]]
	-- upvalues: FFlagProactiveVoiceRestrictionsUFRModule (copy), Default (copy), RegisterResult (ref), Unavailable (ref), v1 (ref), ServiceModule (copy)
	if FFlagProactiveVoiceRestrictionsUFRModule and Default:GetVoiceRestrictionState(false) ~= "normal" then
		RegisterResult.availability:unavailable()
		
		return
	end
	Unavailable = Available
	
	if not v1 then
		if Available == ServiceModule.AvailabilitySignal.Available then
			RegisterResult.availability:available()
			
			return
		end
		if Available == ServiceModule.AvailabilitySignal.Unavailable then
			RegisterResult.availability:unavailable()
		end
	end
end

local function HideOrShowJoinVoiceButton(Joined) --[[ Line: 140 ]]
	-- upvalues: FFlagProactiveVoiceRestrictionsUFRModule (copy), Default (copy), RegisterResult (ref), VOICEJOINPROGRESS (copy), CheckShouldShowJoinVoiceInEvent (copy), setAvailability (copy), ServiceModule (copy), ConstantsModule (copy), PromptTypeModule (copy)
	if FFlagProactiveVoiceRestrictionsUFRModule and Default:GetVoiceRestrictionState(false) ~= "normal" then
		RegisterResult.availability:unavailable()
		
		return
	end
	if Joined == VOICEJOINPROGRESS.Suspended and (not CheckShouldShowJoinVoiceInEvent or Default:ShouldShowJoinVoice()) then
		setAvailability(ServiceModule.AvailabilitySignal.Available)
		
		return
	end
	if Joined == VOICEJOINPROGRESS.Joined then
		setAvailability(ServiceModule.AvailabilitySignal.Unavailable)
		
		if Default.inExpUpsellEntrypoint == ConstantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
			Default:ToggleMic()
			Default:showPrompt(PromptTypeModule.VoiceConsentAcceptedToast)
		end
	end
end

if FFlagProactiveVoiceRestrictionsUFRModule then
	script.Destroying:Once((SignalsModule.createEffect(function(p1) --[[ Line: 161 ]]
		-- upvalues: Default (copy), RegisterResult (ref)
		if Default:GetVoiceRestrictionState(p1) ~= "normal" then
			RegisterResult.availability:unavailable()
		end
	end)))
end
ObserveCurrentContextIdFunction(function(CONTEXTID1) --[[ Line: 169 ]]
	-- upvalues: CONTEXTID (copy), v1 (ref), Unavailable (ref), RegisterResult (ref), setAvailability (copy)
	local IsCONTEXTIDMatch = CONTEXTID1 == CONTEXTID
	
	if v1 ~= IsCONTEXTIDMatch then
		v1 = IsCONTEXTIDMatch
		
		if v1 then
			Unavailable = RegisterResult.availability:get()
			RegisterResult.availability:unavailable()
			
			return
		else
			setAvailability(Unavailable)
		end
	end
end)

if IsVoiceChatSupportedModule() then
	if GetFFlagIntegratePhoneUpsellJoinVoiceFunction() then
		task.spawn(function() --[[ Line: 184 ]]
			-- upvalues: Default (copy), setAvailability (copy), ServiceModule (copy), HideOrShowJoinVoiceButton (copy)
			if Default:ShouldShowJoinVoice() then
				setAvailability(ServiceModule.AvailabilitySignal.Available)
			end
			Default.VoiceJoinProgressChanged.Event:Connect(HideOrShowJoinVoiceButton)
		end)
	else
		if Default:ShouldShowJoinVoice() then
			setAvailability(ServiceModule.AvailabilitySignal.Available)
		end
		Default.VoiceJoinProgressChanged.Event:Connect(HideOrShowJoinVoiceButton)
	end
	if not GetFFlagEnableVoiceUxUpdatesFunction() then
		Default.showVoiceUI.Event:Connect(function() --[[ Line: 199 ]]
			-- upvalues: setAvailability (copy), ServiceModule (copy)
			setAvailability(ServiceModule.AvailabilitySignal.Unavailable)
		end)
		Default.hideVoiceUI.Event:Connect(function() --[[ Line: 202 ]]
			-- upvalues: setAvailability (copy), ServiceModule (copy)
			setAvailability(ServiceModule.AvailabilitySignal.Available)
		end)
	end
end
return RegisterResult