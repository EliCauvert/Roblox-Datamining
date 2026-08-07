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
local var10 = analyticsModule.new():withEventStream(eventStream.new(rbxAnalyticsService))

local function handlePlayFailure(p0, p1, p2, p3) --[[ line: 29 ]]
	-- upvalues: var10 (ref), constantsModule (ref), robloxTranslatorModule (ref), showErrorModule (ref), hideErrorModule (ref), hideMenuModule (ref)
	if p1 then
		var10:onEmoteFailed(p2, p3, p1)
		p0:dispatch(showErrorModule(robloxTranslatorModule:FormatByKeyForLocale(constantsModule.LocalizationKeys.ErrorMessages[p1], p0:getState().locale)))
		delay(constantsModule.ErrorDisplayTimeSeconds, function() --[[ line: 38 ]]
			-- upvalues: p0 (ref), hideErrorModule (copy)
			p0:dispatch(hideErrorModule())
		end)
	end
	p0:dispatch(hideMenuModule())
end

return function(_, p4, p5, _, _) --[[ line: 46 | named "PlayEmote" ]]
	-- upvalues: localPlayer (ref), maybeSendEmoteFailureAnalyticsFromPlayerModule (ref), handlePlayFailure (ref), hideMenuModule (ref), var10 (ref), constantsModule (ref)
	return function(p6) --[[ line: 47 ]]
		-- upvalues: localPlayer (copy), maybeSendEmoteFailureAnalyticsFromPlayerModule (copy), handlePlayFailure (copy), p4 (ref), p5 (ref), hideMenuModule (copy), var10 (copy), constantsModule (copy)
		if maybeSendEmoteFailureAnalyticsFromPlayerModule(localPlayer, function(p7) --[[ line: 49 ]]
			-- upvalues: handlePlayFailure (copy), p6 (ref), p4 (copy), p5 (copy)
			handlePlayFailure(p6, p7, p4, p5)
		end) then return end
		p6:dispatch(hideMenuModule())
		local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
		local ok, status, _ = pcall(function() --[[ line: 59 ]]
			-- upvalues: humanoid (ref), p5 (copy)
			return humanoid:PlayEmoteAndGetAnimTrackById(p5)
		end)
		
		if ok and status then
			var10:onEmotePlayed(p4, p5)
			
			return
		end
		handlePlayFailure(p6, constantsModule.ErrorTypes.TemporarilyUnavailable, p4, p5)
	end
end