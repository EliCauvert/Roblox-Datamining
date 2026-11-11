local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local GetFFlagEnableCrossExpVoiceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local ServiceModule = require(Chrome.Service)
local PartyMicIconModule = require(Chrome.Integrations.Party.PartyMicIcon)
local ConstantsModule = require(Chrome.Integrations.Party.Constants)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local FFlagChromeActivatedMappedSignal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
local MappedSignal = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local Default = require(CorePackages.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default
local Enabled = nil
local v1 = false
local NewSignal = Signal.new()
local NewSignal1 = Signal.new()
NewSignal:connect(function(p1)
	-- upvalues: Enabled (ref)
	Enabled = p1
end)
NewSignal1:connect(function(p1)
	-- upvalues: v1 (ref)
	v1 = p1
end)
local NewMappedSignal = if FFlagChromeActivatedMappedSignal then MappedSignal.new(NewSignal, function(): boolean
	-- upvalues: v1 (ref), Enabled (ref)
	return v1 and Enabled == false
end) else nil
local FFlagChangeToggleMicTextModule = require(Chrome.Flags.FFlagChangeToggleMicText)

return if GetFFlagEnableCrossExpVoiceFunction() then ServiceModule:register({
	id = ConstantsModule.TOGGLE_MIC_INTEGRATION_ID,
	label = if FFlagChangeToggleMicTextModule then "CoreScripts.TopBar.Mic" else "CoreScripts.TopBar.ToggleMic",
	sideSheetPlacement = SideSheetPlacement.Unibar,
	isActivated = if FFlagChromeActivatedMappedSignal then NewMappedSignal else nil,
	activated = function()
		-- upvalues: Players (copy), v1 (ref), Enabled (ref), Default (copy)
		local UserId = Players and Players.LocalPlayer and Players.LocalPlayer.UserId or -1
		
		if UserId ~= -1 and v1 and Enabled ~= nil then
			if Enabled then
				Default:unmuteVoiceParticipant(UserId)
				
				return
			end
			Default:muteVoiceParticipant(UserId)
		end
	end,
	components = {
		Icon = function()
			-- upvalues: PartyMicIconModule (copy), NewSignal (copy), NewSignal1 (copy)
			return PartyMicIconModule({
				isLocalPlayerMutedSignal = NewSignal,
				isVoiceConnectedSignal = NewSignal1
			})
		end
	},
	initialAvailability = ServiceModule.AvailabilitySignal.Unavailable
}) else nil