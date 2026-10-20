local CorePackages = game:GetService("CorePackages")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Parent = script.Parent.Parent
local Actions = Parent.Actions
local ConstantsModule = require(Parent.Constants)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local MaybeSendEmoteFailureAnalyticsFromPlayerModule = require(game:GetService("CoreGui").RobloxGui.Modules.EmotesMenu.Utility.MaybeSendEmoteFailureAnalyticsFromPlayer)
local HideMenuModule = require(Actions.HideMenu)
local HideErrorModule = require(Actions.HideError)
local ShowErrorModule = require(Actions.ShowError)
local WithEventStreamResult = require(Parent.Analytics).new():withEventStream(require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventStream.new((game:GetService("RbxAnalyticsService"))))

local function handlePlayFailure(p1, TemporarilyUnavailable, p2, EmoteId)
	-- upvalues: WithEventStreamResult (copy), ConstantsModule (copy), RobloxTranslatorModule (copy), ShowErrorModule (copy), HideErrorModule (copy), HideMenuModule (copy)
	if TemporarilyUnavailable then
		WithEventStreamResult:onEmoteFailed(p2, EmoteId, TemporarilyUnavailable)
		p1:dispatch(ShowErrorModule((RobloxTranslatorModule:FormatByKeyForLocale(ConstantsModule.LocalizationKeys.ErrorMessages[TemporarilyUnavailable], p1:getState().locale))))
		delay(ConstantsModule.ErrorDisplayTimeSeconds, function()
			-- upvalues: p1 (copy), HideErrorModule (upval)
			p1:dispatch(HideErrorModule())
		end)
	end
	p1:dispatch(HideMenuModule())
end

return function(_, p1, EmoteId, _, _)
	-- upvalues: LocalPlayer (copy), MaybeSendEmoteFailureAnalyticsFromPlayerModule (copy), handlePlayFailure (copy), HideMenuModule (copy), WithEventStreamResult (copy), ConstantsModule (copy)
	return function(p2)
		-- upvalues: LocalPlayer (upval), MaybeSendEmoteFailureAnalyticsFromPlayerModule (upval), handlePlayFailure (upval), p1 (copy), EmoteId (copy), HideMenuModule (upval), WithEventStreamResult (upval), ConstantsModule (upval)
		if MaybeSendEmoteFailureAnalyticsFromPlayerModule(LocalPlayer, function(p3)
			-- upvalues: handlePlayFailure (upval), p2 (copy), p1 (upval), EmoteId (upval)
			handlePlayFailure(p2, p3, p1, EmoteId)
		end) then return end
		p2:dispatch(HideMenuModule())
		local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		local Success, Result, _ = pcall(function()
			-- upvalues: Humanoid (copy), EmoteId (upval)
			return Humanoid:PlayEmoteAndGetAnimTrackById(EmoteId)
		end)
		
		if Success and Result then
			WithEventStreamResult:onEmotePlayed(p1, EmoteId)
			
			return
		else
			handlePlayFailure(p2, ConstantsModule.ErrorTypes.TemporarilyUnavailable, p1, EmoteId)
		end
	end
end