local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local LaunchExperienceModule = require(Parent.BuildExperiencePlaytestLaunch.launchExperience)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local PregameOverride = require(Parent.ProgressLoading).PregameOverride

local function renderPregameSkeleton(p1)
	-- upvalues: BuildExperience (copy), ReactModule (copy)
	return ReactModule.createElement(require(BuildExperience.Components.Library.LibraryPregameSkeleton), p1)
end

return function(PlaceId, ConversationId)
	-- upvalues: SendBuildExperienceEventModule (copy), FFlagBuildExperienceLibrary (copy), PregameOverride (copy), renderPregameSkeleton (copy), LaunchExperienceModule (copy)
	SendBuildExperienceEventModule("LIBRARY_IMPRESSION", { placeId = PlaceId, conversationId = ConversationId }, { phase = "requested", surface = "App" })
	
	if FFlagBuildExperienceLibrary then
		PregameOverride.setPregameOverride({ placeId = PlaceId, render = renderPregameSkeleton })
	end
	LaunchExperienceModule(PlaceId, "BuildLibrary", false, { sessionId = ConversationId })
end