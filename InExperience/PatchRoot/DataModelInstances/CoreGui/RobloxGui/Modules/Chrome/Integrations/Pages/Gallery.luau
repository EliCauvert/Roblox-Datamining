local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local CapturesPolicy = require(CorePackages.Workspace.Packages.CapturesInExperience).CapturesPolicy
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local FFlagFixSpatialUICaptures = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFixSpatialUICaptures
local UpdateGalleryIcon = game:DefineFastFlag("UpdateGalleryIcon", false)
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local ReadResult = CapturesPolicy.PolicyImplementation.read()
local Inverted: boolean = (if ReadResult then CapturesPolicy.Mapper(ReadResult).eligibleForCapturesFeature() else false) and (not (IsInExperienceUIVREnabled and FFlagFixSpatialUICaptures) or not IsSpatialFunction())

if Inverted then
	local CapturesPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("CapturesPage")
	
	return ServiceModule:register({
		id = "gallery",
		label = "Feature.Captures.Title.Gallery",
		initialAvailability = if Inverted then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable,
		sideSheetPlacement = SideSheetPlacement.BelowFold,
		activated = function(_)
			-- upvalues: InGameMenuIntegrationUtilsModule (copy), CapturesPage (copy)
			InGameMenuIntegrationUtilsModule.toggleIGMPage("CapturesPage", CapturesPage:get())
		end,
		isActivated = CapturesPage,
		components = {
			Icon = function(_)
				-- upvalues: UpdateGalleryIcon (copy), CommonIconModule (copy), CapturesPage (copy)
				return if UpdateGalleryIcon then CommonIconModule("Image", nil, CapturesPage) else CommonIconModule("icons/controls/cameraOff", "icons/controls/cameraOn", CapturesPage)
			end
		}
	})
else
	return nil
end