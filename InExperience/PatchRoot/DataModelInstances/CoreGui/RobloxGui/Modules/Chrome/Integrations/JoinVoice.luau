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
local var18 = false
local var19 = false
local unavailable = serviceModule.AvailabilitySignal.Unavailable

function getShouldShowJoinVoiceTooltip()
	-- upvalues: default (ref), var19 (write)
	local var22 = default:FetchAgeVerificationOverlay()
	local showJoinVoiceUpsellTooltip = not var19 and (var22 and var22.showJoinVoiceUpsellTooltip)
	var19 = true
	
	return showJoinVoiceUpsellTooltip
end

local _ = nil
local var20 = serviceModule:register({
	id = "join_voice",
	label = "CoreScripts.TopBar.JoinVoice",
	initialAvailability = serviceModule.AvailabilitySignal.Unavailable,
	sideSheetPlacement = sideSheetPlacement.Unibar,
	activated = function()
		-- upvalues: getFFlagIntegratePhoneUpsellJoinVoice (ref), robloxGui (ref), default (ref), constantsModule (ref)
		local var24 = if getFFlagIntegratePhoneUpsellJoinVoice() then require(robloxGui.Modules.Settings.SettingsHub) else nil
		default.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
		default:JoinVoice(var24)
	end,
	components = {
		Icon = function()
			-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule_1 (ref), replaceJoinVoiceIconToMuted (ref), getIcon (ref), enableChromeJoinVoiceTooltip (ref), reactModule (ref), foundationModule (ref), commonIconModule (ref), commonFtuxTooltipModule (ref), unibarJoinVoiceTooltipPriority (ref), joinVoiceFtuxShowDelayMs (ref), joinVoiceFtuxDismissDelayMs (ref), default (ref), constantsModule (ref)
			local _ = nil
			local var25 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule_1.ICON_SIZE
			local var26 = if replaceJoinVoiceIconToMuted then getIcon("Muted", "MicLight") else "icons/controls/publicAudioJoin"
			
			return if enableChromeJoinVoiceTooltip then reactModule.createElement(foundationModule.View, { Size = UDim2.new(0, var25, 0, var25) }, {
				Icon = commonIconModule(var26),
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
			}) else commonIconModule(var26)
		end
	}
})

if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
	return var20
end
local function _(value)
	-- upvalues: unavailable (write), var18 (write), serviceModule (ref), var20 (write)
	unavailable = value
	
	if not var18 then
		if value == serviceModule.AvailabilitySignal.Available then
			var20.availability:available()
			
			return
		elseif value == serviceModule.AvailabilitySignal.Unavailable then
			var20.availability:unavailable()
		end
	end
end

local function HideOrShowJoinVoiceButton(p0)
	-- upvalues: VOICE_JOIN_PROGRESS (ref), checkShouldShowJoinVoiceInEvent (ref), default (ref), serviceModule (ref), unavailable (write), var18 (write), var20 (write), constantsModule (ref), promptTypeModule (ref)
	if p0 == VOICE_JOIN_PROGRESS.Suspended and (not checkShouldShowJoinVoiceInEvent or default:ShouldShowJoinVoice()) then
		local available = serviceModule.AvailabilitySignal.Available
		unavailable = available
		
		if not var18 then
			if available == serviceModule.AvailabilitySignal.Available then
				var20.availability:available()
				
				return
			elseif available == serviceModule.AvailabilitySignal.Unavailable then
				var20.availability:unavailable()
				
				return
			end
		end
	elseif p0 == VOICE_JOIN_PROGRESS.Joined then
		local unavailable_1 = serviceModule.AvailabilitySignal.Unavailable
		unavailable = unavailable_1
		
		if not var18 then
			if unavailable_1 == serviceModule.AvailabilitySignal.Available then
				var20.availability:available()
			elseif unavailable_1 == serviceModule.AvailabilitySignal.Unavailable then
				var20.availability:unavailable()
			end
		end
		if default.inExpUpsellEntrypoint == constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
			default:ToggleMic()
			default:showPrompt(promptTypeModule.VoiceConsentAcceptedToast)
		end
	end
end

observeCurrentContextId(function(p1)
	-- upvalues: CONTEXT_ID (ref), var18 (write), unavailable (write), var20 (write), serviceModule (ref)
	local var27 = p1 == CONTEXT_ID
	
	if var18 ~= var27 then
		var18 = var27
		
		if var18 then
			unavailable = var20.availability:get()
			var20.availability:unavailable()
			
			return
		end
		local var28 = unavailable
		unavailable = var28
		
		if not var18 then
			if var28 == serviceModule.AvailabilitySignal.Available then
				var20.availability:available()
				
				return
			elseif var28 == serviceModule.AvailabilitySignal.Unavailable then
				var20.availability:unavailable()
			end
		end
	end
end)

if game:GetEngineFeature("VoiceChatSupported") then
	if getFFlagIntegratePhoneUpsellJoinVoice() then
		task.spawn(function()
			-- upvalues: default (ref), serviceModule (ref), unavailable (write), var18 (write), var20 (write), HideOrShowJoinVoiceButton (ref)
			if default:ShouldShowJoinVoice() then
				local available = serviceModule.AvailabilitySignal.Available
				unavailable = available
				
				if not var18 then
					if available == serviceModule.AvailabilitySignal.Available then
						var20.availability:available()
					elseif available == serviceModule.AvailabilitySignal.Unavailable then
						var20.availability:unavailable()
					end
				end
			end
			default.VoiceJoinProgressChanged.Event:Connect(HideOrShowJoinVoiceButton)
		end)
	elseif default:ShouldShowJoinVoice() then
		local available = serviceModule.AvailabilitySignal.Available
		unavailable = available
		
		if available == serviceModule.AvailabilitySignal.Available then
			var20.availability:available()
		elseif available == serviceModule.AvailabilitySignal.Unavailable then
			var20.availability:unavailable()
		end
	end
	default.VoiceJoinProgressChanged.Event:Connect(HideOrShowJoinVoiceButton)
	if not getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
		default.VoiceJoinProgressChanged.Event:Connect(HideOrShowJoinVoiceButton)
	elseif not getFFlagEnableVoiceUxUpdates() then
		default.showVoiceUI.Event:Connect(function()
			-- upvalues: serviceModule (ref), unavailable (write), var18 (write), var20 (write)
			local unavailable_1 = serviceModule.AvailabilitySignal.Unavailable
			unavailable = unavailable_1
			
			if not var18 then
				if unavailable_1 == serviceModule.AvailabilitySignal.Available then
					var20.availability:available()
					
					return
				elseif unavailable_1 == serviceModule.AvailabilitySignal.Unavailable then
					var20.availability:unavailable()
				end
			end
		end)
		default.hideVoiceUI.Event:Connect(function()
			-- upvalues: serviceModule (ref), unavailable (write), var18 (write), var20 (write)
			local available = serviceModule.AvailabilitySignal.Available
			unavailable = available
			
			if not var18 then
				if available == serviceModule.AvailabilitySignal.Available then
					var20.availability:available()
					
					return
				elseif available == serviceModule.AvailabilitySignal.Unavailable then
					var20.availability:unavailable()
				end
			end
		end)
	end
end
return var20