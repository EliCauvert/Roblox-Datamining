local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local fFlagBuildExperienceLibrary = require(parent.SharedFlags).FFlagBuildExperienceLibrary
local progressLoadingModule = require(parent.ProgressLoading)
local launchExperienceModule = require(parent.BuildExperiencePlaytestLaunch.launchExperience)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local pregameOverride = progressLoadingModule.PregameOverride

local function renderPregameSkeleton(p1)
	-- upvalues: buildExperience (ref), reactModule (ref)
	return reactModule.createElement(require(buildExperience.Components.Library.LibraryPregameSkeleton), p1)
end

return function(p1, p2)
	-- upvalues: sendBuildExperienceEventModule (ref), fFlagBuildExperienceLibrary (ref), pregameOverride (ref), renderPregameSkeleton (ref), launchExperienceModule (ref)
	sendBuildExperienceEventModule("LIBRARY_IMPRESSION", { placeId = p1, conversationId = p2 }, { phase = "requested", surface = "App" })
	
	if fFlagBuildExperienceLibrary then
		pregameOverride.setPregameOverride({ placeId = p1, render = renderPregameSkeleton })
	end
	launchExperienceModule(p1, "BuildLibrary", false, { sessionId = p2 })
end