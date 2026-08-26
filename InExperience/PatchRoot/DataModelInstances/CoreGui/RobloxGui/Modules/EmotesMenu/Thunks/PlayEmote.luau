local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local localPlayer = game:GetService("Players").LocalPlayer
local parent = script.Parent.Parent
local actions = parent.Actions
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local eventStream = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local maybeSendEmoteFailureAnalyticsFromPlayerModule = require(coreGuiService.RobloxGui.Modules.EmotesMenu.Utility.MaybeSendEmoteFailureAnalyticsFromPlayer)
local hideMenuModule = require(actions.HideMenu)
local hideErrorModule = require(actions.HideError)
local showErrorModule = require(actions.ShowError)
local var1 = analyticsModule.new():withEventStream(eventStream.new(rbxAnalyticsService))

local function handlePlayFailure(p1, p2, p3, p4)
	-- upvalues: var1 (ref), constantsModule (ref), robloxTranslatorModule (ref), showErrorModule (ref), hideErrorModule (ref), hideMenuModule (ref)
	if p2 then
		var1:onEmoteFailed(p3, p4, p2)
		p1:dispatch(showErrorModule(robloxTranslatorModule:FormatByKeyForLocale(constantsModule.LocalizationKeys.ErrorMessages[p2], p1:getState().locale)))
		delay(constantsModule.ErrorDisplayTimeSeconds, function()
			-- upvalues: p1 (ref), hideErrorModule (copy)
			p1:dispatch(hideErrorModule())
		end)
	end
	p1:dispatch(hideMenuModule())
end

return function(_, p1, p2, _, _)
	-- upvalues: localPlayer (ref), maybeSendEmoteFailureAnalyticsFromPlayerModule (ref), handlePlayFailure (ref), hideMenuModule (ref), var1 (ref), constantsModule (ref)
	return function(p3)
		-- upvalues: localPlayer (copy), maybeSendEmoteFailureAnalyticsFromPlayerModule (copy), handlePlayFailure (copy), p1 (ref), p2 (ref), hideMenuModule (copy), var1 (copy), constantsModule (copy)
		if maybeSendEmoteFailureAnalyticsFromPlayerModule(localPlayer, function(p4)
			-- upvalues: handlePlayFailure (copy), p3 (ref), p1 (copy), p2 (copy)
			handlePlayFailure(p3, p4, p1, p2)
		end) then return end
		p3:dispatch(hideMenuModule())
		local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
		local ok, status, _ = pcall(function()
			-- upvalues: humanoid (ref), p2 (copy)
			return humanoid:PlayEmoteAndGetAnimTrackById(p2)
		end)
		
		if ok and status then
			var1:onEmotePlayed(p1, p2)
			
			return
		end
		handlePlayFailure(p3, constantsModule.ErrorTypes.TemporarilyUnavailable, p1, p2)
	end
end