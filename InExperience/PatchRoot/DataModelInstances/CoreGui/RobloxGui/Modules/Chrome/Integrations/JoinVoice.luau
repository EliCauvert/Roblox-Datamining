local chrome = script:FindFirstAncestor("Chrome")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local commonFtuxTooltipModule = require(chrome.Integrations.CommonFtuxTooltip)
local constantsModule_1 = require(chrome.ChromeShared.Unibar.Constants)
local VOICE_JOIN_PROGRESS = constantsModule.VOICE_JOIN_PROGRESS
local promptTypeModule = require(robloxGui.Modules.VoiceChatPrompt.PromptType)
local observeCurrentContextId = require(corePackagesService.Workspace.Packages.CrossExperience).Utils.observeCurrentContextId
local getIcon = require(corePackagesService.Workspace.Packages.VoiceChat).Utils.GetIcon
local CONTEXT_ID = require(corePackagesService.Workspace.Packages.CrossExperience).Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID
local getFFlagEnableConnectDisconnectInSettingsAndChromeModule = require(robloxGui.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome)
local getFFlagIntegratePhoneUpsellJoinVoice = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice
local getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local getFFlagEnableVoiceUxUpdates = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local checkShouldShowJoinVoiceInEvent = game:DefineFastFlag("CheckShouldShowJoinVoiceInEvent", false)
local replaceJoinVoiceIconToMuted = game:DefineFastFlag("ReplaceJoinVoiceIconToMuted", false)
local joinVoiceFtuxShowDelayMs = game:DefineFastInt("JoinVoiceFtuxShowDelayMs", 1000)
local joinVoiceFtuxDismissDelayMs = game:DefineFastInt("JoinVoiceFtuxDismissDelayMs", 5000)
local unibarJoinVoiceTooltipPriority = game:DefineFastInt("UnibarJoinVoiceTooltipPriority", 1000)
local enableChromeJoinVoiceTooltip = game:DefineFastFlag("EnableChromeJoinVoiceTooltip", false)
local serviceModule = require(chrome.Service)
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local var1 = false
local var2 = false
local unavailable = serviceModule.AvailabilitySignal.Unavailable

function getShouldShowJoinVoiceTooltip()
	-- upvalues: default (ref), var2 (write)
	local var3 = default:FetchAgeVerificationOverlay()
	local showJoinVoiceUpsellTooltip = not var2 and (var3 and var3.showJoinVoiceUpsellTooltip)
	var2 = true
	
	return showJoinVoiceUpsellTooltip
end

local _ = nil
local var3 = serviceModule:register({
	id = "join_voice",
	label = "CoreScripts.TopBar.JoinVoice",
	initialAvailability = serviceModule.AvailabilitySignal.Unavailable,
	sideSheetPlacement = sideSheetPlacement.Unibar,
	activated = function()
		-- upvalues: getFFlagIntegratePhoneUpsellJoinVoice (ref), robloxGui (ref), default (ref), constantsModule (ref)
		local var4 = if getFFlagIntegratePhoneUpsellJoinVoice() then require(robloxGui.Modules.Settings.SettingsHub) else nil
		default.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
		default:JoinVoice(var4)
	end,
	components = {
		Icon = function()
			-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule_1 (ref), replaceJoinVoiceIconToMuted (ref), getIcon (ref), enableChromeJoinVoiceTooltip (ref), reactModule (ref), foundationModule (ref), commonIconModule (ref), commonFtuxTooltipModule (ref), unibarJoinVoiceTooltipPriority (ref), joinVoiceFtuxShowDelayMs (ref), joinVoiceFtuxDismissDelayMs (ref), default (ref), constantsModule (ref)
			local _ = nil
			local var4 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule_1.ICON_SIZE
			local var5 = if replaceJoinVoiceIconToMuted then getIcon("Muted", "MicLight") else "icons/controls/publicAudioJoin"
			
			return if enableChromeJoinVoiceTooltip then reactModule.createElement(foundationModule.View, { Size = UDim2.new(0, var4, 0, var4) }, {
				Icon = commonIconModule(var5),
				Tooltip = commonFtuxTooltipModule({
					id = "JOIN_VOICE",
					dismissOnOutsideInput = true,
					headerKey = "CoreScripts.FTUX.Heading.JoinVoice",
					bodyKey = "CoreScripts.FTUX.Label.JoinVoiceDescription",
					priority = unibarJoinVoiceTooltipPriority,
					isIconVisible = getShouldShowJoinVoiceTooltip(),
					showDelay = joinVoiceFtuxShowDelayMs,
					dismissDelay = joinVoiceFtuxDismissDelayMs,
					onDismissed = function()
						-- upvalues: default (copy), constantsModule (copy)
						pcall(function()
							-- upvalues: default (copy), constantsModule (copy)
							default:RecordUserSeenModal(constantsModule.MODAL_IDS.IN_EXP_JOIN_VOICE_UPSELL)
						end)
					end
				})
			}) else commonIconModule(var5)
		end
	}
})

if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
	return var3
end
local function _(value)
	-- upvalues: unavailable (write), var1 (write), serviceModule (ref), var3 (write)
	unavailable = value
	
	if not var1 then
		if value == serviceModule.AvailabilitySignal.Available then
			var3.availability:available()
			
			return
		elseif value == serviceModule.AvailabilitySignal.Unavailable then
			var3.availability:unavailable()
		end
	end
end

local function HideOrShowJoinVoiceButton(p1)
	-- upvalues: VOICE_JOIN_PROGRESS (ref), checkShouldShowJoinVoiceInEvent (ref), default (ref), serviceModule (ref), unavailable (write), var1 (write), var3 (write), constantsModule (ref), promptTypeModule (ref)
	if p1 == VOICE_JOIN_PROGRESS.Suspended and (not checkShouldShowJoinVoiceInEvent or default:ShouldShowJoinVoice()) then
		local available = serviceModule.AvailabilitySignal.Available
		unavailable = available
		
		if not var1 then
			if available == serviceModule.AvailabilitySignal.Available then
				var3.availability:available()
				
				return
			elseif available == serviceModule.AvailabilitySignal.Unavailable then
				var3.availability:unavailable()
				
				return
			end
		end
	elseif p1 == VOICE_JOIN_PROGRESS.Joined then
		local unavailable_1 = serviceModule.AvailabilitySignal.Unavailable
		unavailable = unavailable_1
		
		if not var1 then
			if unavailable_1 == serviceModule.AvailabilitySignal.Available then
				var3.availability:available()
			elseif unavailable_1 == serviceModule.AvailabilitySignal.Unavailable then
				var3.availability:unavailable()
			end
		end
		if default.inExpUpsellEntrypoint == constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
			default:ToggleMic()
			default:showPrompt(promptTypeModule.VoiceConsentAcceptedToast)
		end
	end
end

observeCurrentContextId(function(p1)
	-- upvalues: CONTEXT_ID (ref), var1 (write), unavailable (write), var3 (write), serviceModule (ref)
	local var4 = p1 == CONTEXT_ID
	
	if var1 ~= var4 then
		var1 = var4
		
		if var1 then
			unavailable = var3.availability:get()
			var3.availability:unavailable()
			
			return
		end
		local var5 = unavailable
		unavailable = var5
		
		if not var1 then
			if var5 == serviceModule.AvailabilitySignal.Available then
				var3.availability:available()
				
				return
			elseif var5 == serviceModule.AvailabilitySignal.Unavailable then
				var3.availability:unavailable()
			end
		end
	end
end)

if game:GetEngineFeature("VoiceChatSupported") then
	if getFFlagIntegratePhoneUpsellJoinVoice() then
		task.spawn(function()
			-- upvalues: default (ref), serviceModule (ref), unavailable (write), var1 (write), var3 (write), HideOrShowJoinVoiceButton (ref)
			if default:ShouldShowJoinVoice() then
				local available = serviceModule.AvailabilitySignal.Available
				unavailable = available
				
				if not var1 then
					if available == serviceModule.AvailabilitySignal.Available then
						var3.availability:available()
					elseif available == serviceModule.AvailabilitySignal.Unavailable then
						var3.availability:unavailable()
					end
				end
			end
			default.VoiceJoinProgressChanged.Event:Connect(HideOrShowJoinVoiceButton)
		end)
	elseif default:ShouldShowJoinVoice() then
		local available = serviceModule.AvailabilitySignal.Available
		unavailable = available
		
		if available == serviceModule.AvailabilitySignal.Available then
			var3.availability:available()
		elseif available == serviceModule.AvailabilitySignal.Unavailable then
			var3.availability:unavailable()
		end
	end
	default.VoiceJoinProgressChanged.Event:Connect(HideOrShowJoinVoiceButton)
	if not getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
		default.VoiceJoinProgressChanged.Event:Connect(HideOrShowJoinVoiceButton)
	elseif not getFFlagEnableVoiceUxUpdates() then
		default.showVoiceUI.Event:Connect(function()
			-- upvalues: serviceModule (ref), unavailable (write), var1 (write), var3 (write)
			local unavailable_1 = serviceModule.AvailabilitySignal.Unavailable
			unavailable = unavailable_1
			
			if not var1 then
				if unavailable_1 == serviceModule.AvailabilitySignal.Available then
					var3.availability:available()
					
					return
				elseif unavailable_1 == serviceModule.AvailabilitySignal.Unavailable then
					var3.availability:unavailable()
				end
			end
		end)
		default.hideVoiceUI.Event:Connect(function()
			-- upvalues: serviceModule (ref), unavailable (write), var1 (write), var3 (write)
			local available = serviceModule.AvailabilitySignal.Available
			unavailable = available
			
			if not var1 then
				if available == serviceModule.AvailabilitySignal.Available then
					var3.availability:available()
					
					return
				elseif available == serviceModule.AvailabilitySignal.Unavailable then
					var3.availability:unavailable()
				end
			end
		end)
	end
end
return var3