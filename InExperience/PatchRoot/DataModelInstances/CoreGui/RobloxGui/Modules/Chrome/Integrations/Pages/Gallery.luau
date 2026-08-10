local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local capturesPolicy = require(corePackagesService.Workspace.Packages.CapturesInExperience).CapturesPolicy
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local fFlagFixSpatialUICaptures = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagFixSpatialUICaptures
local updateGalleryIcon = game:DefineFastFlag("UpdateGalleryIcon", false)
local inGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local var6 = capturesPolicy.PolicyImplementation.read()
local var7 = (if var6 then capturesPolicy.Mapper(var6).eligibleForCapturesFeature() else false) and (if isInExperienceUIVREnabled and fFlagFixSpatialUICaptures then not isSpatial() else true)

if var7 then
	local capturesPage = inGameMenuIntegrationUtilsModule.createPageOpenSignal("CapturesPage")
	
	return serviceModule:register({
		id = "gallery",
		label = "Feature.Captures.Title.Gallery",
		initialAvailability = if var7 then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable,
		sideSheetPlacement = sideSheetPlacement.Page,
		activated = function(_) --[[ line: 38 ]]
			-- upvalues: inGameMenuIntegrationUtilsModule (ref), capturesPage (ref)
			inGameMenuIntegrationUtilsModule.toggleIGMPage("CapturesPage", capturesPage:get())
		end,
		isActivated = capturesPage,
		components = {
			Icon = function(_) --[[ line: 43 ]]
				-- upvalues: updateGalleryIcon (ref), commonIconModule (ref), capturesPage (ref)
				return if updateGalleryIcon then commonIconModule("Image", nil, capturesPage) else commonIconModule("icons/controls/cameraOff", "icons/controls/cameraOn", capturesPage)
			end
		}
	})
end
return nil