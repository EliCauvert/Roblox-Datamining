local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local CapturesPolicy = require(CorePackages.Workspace.Packages.CapturesInExperience).CapturesPolicy
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetOpenBehavior = ChromeModule.Enums.SideSheetOpenBehavior
local SideSheetPlacement = ChromeModule.Enums.SideSheetPlacement
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagFixSpatialUICaptures = SharedFlagsModule.FFlagFixSpatialUICaptures
local FFlagKeepSideSheetOpenBesideMenu = SharedFlagsModule.FFlagKeepSideSheetOpenBesideMenu
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
		sideSheetOpenBehavior = if FFlagKeepSideSheetOpenBesideMenu then SideSheetOpenBehavior.MenuBesideSheet else nil,
		activated = function(_)
			-- upvalues: InGameMenuIntegrationUtilsModule (copy), CapturesPage (copy)
			InGameMenuIntegrationUtilsModule.toggleIGMPage("CapturesPage", CapturesPage:get())
		end,
		isActivated = CapturesPage,
		components = {
			Icon = function(_)
				-- upvalues: CommonIconModule (copy), CapturesPage (copy)
				return CommonIconModule("Image", nil, CapturesPage)
			end
		}
	})
else
	return nil
end