local t = {}

if not game:GetEngineFeature("RecordingServicePlaybackApiLua") then
	return t
elseif not game:GetEngineFeature("DmctPlaybackClientApp") and game.PlaceId ~= 123012592984338 then
	return t
end
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local parent = script.Parent
t.state = require(parent.PlaybackState).new(false, false, false)
t.screenGui = Instance.new("ScreenGui")
t.screenGui.Parent = robloxGui
require(parent.CreateControlBar).createControlBar(t)
require(parent.CreateLoadingOverlay).createLoadingOverlay(t)
require(parent.CreateButtonsTime).createButtonsTime(t)
require(parent.CreateScrubber).createScrubber(t)
require(parent.CreateHelpText).createHelpText(t)
require(parent.ControlButtonsTime).setupControl(t)
require(parent.ControlVisibility).setupControl(t)
local loadSlicesModule = require(parent.LoadSlices)

if not game:GetEngineFeature("DmctPlaybackClientApp") then
	loadSlicesModule.experienceCallback(t)
end
require(parent.ControlScrubber).setupControl(t)
require(parent.ListenPlaybackStatusUpdated).setupListener(t)
require(parent.CreateSpectatorCamera).createSpectatorCamera(t)

if game:GetEngineFeature("DmctPlaybackClientApp") then
	require(parent.ReplaySelector).create(t, function(p0) --[[ line: 59 ]]
		-- upvalues: loadSlicesModule (ref), t (ref)
		loadSlicesModule.loadGUID(t, p0)
	end)
end
return t