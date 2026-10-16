local ExperienceStateReplayMainModule = {}

if not game:GetEngineFeature("RecordingServicePlaybackApiLua") then
	return ExperienceStateReplayMainModule
end
if not game:GetEngineFeature("DmctPlaybackClientApp") and game.PlaceId ~= 123012592984338 then
	return ExperienceStateReplayMainModule
end
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Parent = script.Parent
ExperienceStateReplayMainModule.state = require(Parent.PlaybackState).new(false, false, false)
ExperienceStateReplayMainModule.screenGui = Instance.new("ScreenGui")
ExperienceStateReplayMainModule.screenGui.Parent = RobloxGui
require(Parent.CreateControlBar).createControlBar(ExperienceStateReplayMainModule)
require(Parent.CreateLoadingOverlay).createLoadingOverlay(ExperienceStateReplayMainModule)
require(Parent.CreateButtonsTime).createButtonsTime(ExperienceStateReplayMainModule)
require(Parent.CreateScrubber).createScrubber(ExperienceStateReplayMainModule)
require(Parent.CreateHelpText).createHelpText(ExperienceStateReplayMainModule)
require(Parent.ControlButtonsTime).setupControl(ExperienceStateReplayMainModule)
require(Parent.ControlVisibility).setupControl(ExperienceStateReplayMainModule)
local LoadSlicesModule = require(Parent.LoadSlices)

if not game:GetEngineFeature("DmctPlaybackClientApp") then
	LoadSlicesModule.experienceCallback(ExperienceStateReplayMainModule)
end
require(Parent.ControlScrubber).setupControl(ExperienceStateReplayMainModule)
require(Parent.ListenPlaybackStatusUpdated).setupListener(ExperienceStateReplayMainModule)
require(Parent.CreateSpectatorCamera).createSpectatorCamera(ExperienceStateReplayMainModule)

if game:GetEngineFeature("DmctPlaybackClientApp") then
	require(Parent.ReplaySelector).create(ExperienceStateReplayMainModule, function(p1) --[[ Line: 59 ]]
		-- upvalues: LoadSlicesModule (copy), ExperienceStateReplayMainModule (copy)
		LoadSlicesModule.loadGUID(ExperienceStateReplayMainModule, p1)
	end)
end
return ExperienceStateReplayMainModule