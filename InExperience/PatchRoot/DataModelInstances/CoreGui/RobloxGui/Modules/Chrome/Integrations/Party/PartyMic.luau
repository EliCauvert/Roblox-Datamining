local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local crossExperienceVoiceModule = require(corePackagesService.Workspace.Packages.CrossExperienceVoice)
local getFFlagEnableCrossExpVoice = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local serviceModule = require(chrome.Service)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local partyMicIconModule = require(chrome.Integrations.Party.PartyMicIcon)
local constantsModule = require(chrome.Integrations.Party.Constants)
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local mappedSignal = chromeUtilsModule.MappedSignal
local default = crossExperienceVoiceModule.CrossExperienceVoiceManager.default
local var8 = nil
local var9 = false
local var10 = signal.new()
local var11 = signal.new()
var10:connect(function(p0)
	-- upvalues: var8 (write)
	var8 = p0
end)
var11:connect(function(p1)
	-- upvalues: var9 (write)
	var9 = p1
end)

return if getFFlagEnableCrossExpVoice() then serviceModule:register({
	id = constantsModule.TOGGLE_MIC_INTEGRATION_ID,
	label = if require(chrome.Flags.FFlagChangeToggleMicText) then "CoreScripts.TopBar.Mic" else "CoreScripts.TopBar.ToggleMic",
	sideSheetPlacement = sideSheetPlacement.Unibar,
	isActivated = mappedSignal.new(var10, function()
		-- upvalues: var9 (write), var8 (write)
		return var9 and var8 == false
	end),
	activated = function()
		-- upvalues: playersService (ref), var9 (write), var8 (write), default (ref)
		local userId = playersService and (playersService.LocalPlayer and (playersService.LocalPlayer.UserId or -1))
		
		if userId ~= -1 and var9 and var8 ~= nil then
			if var8 then
				default:unmuteVoiceParticipant(userId)
				
				return
			end
			default:muteVoiceParticipant(userId)
		end
	end,
	components = {
		Icon = function()
			-- upvalues: partyMicIconModule (ref), var10 (ref), var11 (ref)
			return partyMicIconModule({
				isLocalPlayerMutedSignal = var10,
				isVoiceConnectedSignal = var11
			})
		end
	},
	initialAvailability = serviceModule.AvailabilitySignal.Unavailable
}) else nil