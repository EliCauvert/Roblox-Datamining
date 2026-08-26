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
local var1 = nil
local var2 = false
local var3 = signal.new()
local var4 = signal.new()
var3:connect(function(p1)
	-- upvalues: var1 (write)
	var1 = p1
end)
var4:connect(function(p1)
	-- upvalues: var2 (write)
	var2 = p1
end)

return if getFFlagEnableCrossExpVoice() then serviceModule:register({
	id = constantsModule.TOGGLE_MIC_INTEGRATION_ID,
	label = if require(chrome.Flags.FFlagChangeToggleMicText) then "CoreScripts.TopBar.Mic" else "CoreScripts.TopBar.ToggleMic",
	sideSheetPlacement = sideSheetPlacement.Unibar,
	isActivated = mappedSignal.new(var3, function()
		-- upvalues: var2 (write), var1 (write)
		return var2 and var1 == false
	end),
	activated = function()
		-- upvalues: playersService (ref), var2 (write), var1 (write), default (ref)
		local userId = playersService and (playersService.LocalPlayer and (playersService.LocalPlayer.UserId or -1))
		
		if userId ~= -1 and var2 and var1 ~= nil then
			if var1 then
				default:unmuteVoiceParticipant(userId)
				
				return
			end
			default:muteVoiceParticipant(userId)
		end
	end,
	components = {
		Icon = function()
			-- upvalues: partyMicIconModule (ref), var3 (ref), var4 (ref)
			return partyMicIconModule({
				isLocalPlayerMutedSignal = var3,
				isVoiceConnectedSignal = var4
			})
		end
	},
	initialAvailability = serviceModule.AvailabilitySignal.Unavailable
}) else nil