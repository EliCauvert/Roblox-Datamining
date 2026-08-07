local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local capturesPolicy = require(corePackagesService.Workspace.Packages.CapturesInExperience).CapturesPolicy
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagFixSpatialUICaptures = sharedFlagsModule.FFlagFixSpatialUICaptures
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local updateGalleryIcon = game:DefineFastFlag("UpdateGalleryIcon", false)
local inGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local var7 = capturesPolicy.PolicyImplementation.read()
local var8 = (if var7 then capturesPolicy.Mapper(var7).eligibleForCapturesFeature() else false) and (if isInExperienceUIVREnabled and fFlagFixSpatialUICaptures then not isSpatial() else true)

if var8 then
	local capturesPage = inGameMenuIntegrationUtilsModule.createPageOpenSignal("CapturesPage")
	
	return serviceModule:register({
		id = "gallery",
		label = "Feature.Captures.Title.Gallery",
		initialAvailability = if var8 then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable,
		sideSheetPlacement = sideSheetPlacement.Page,
		activated = function(_) --[[ line: 39 ]]
			-- upvalues: inGameMenuIntegrationUtilsModule (ref), capturesPage (ref)
			inGameMenuIntegrationUtilsModule.toggleIGMPage("CapturesPage", capturesPage:get())
		end,
		isActivated = if fFlagChromeActivatedMappedSignal then capturesPage else function() --[[ line: 44 ]]
			-- upvalues: capturesPage (ref)
			return capturesPage:get()
		end,
		components = {
			Icon = function(_) --[[ line: 48 ]]
				-- upvalues: updateGalleryIcon (ref), commonIconModule (ref), capturesPage (ref)
				return if updateGalleryIcon then commonIconModule("Image", nil, capturesPage) else commonIconModule("icons/controls/cameraOff", "icons/controls/cameraOn", capturesPage)
			end
		}
	})
end
return nil