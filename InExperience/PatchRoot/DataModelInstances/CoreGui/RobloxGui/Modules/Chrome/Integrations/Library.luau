local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local buildExperienceModule = require(corePackagesService.Workspace.Packages.BuildExperience)
local serviceModule = require(chrome.Service)

local function _()
	-- upvalues: buildExperienceModule (ref), VRService (ref)
	return buildExperienceModule.isLibraryAvailableInExperience() and not VRService.VREnabled
end

return serviceModule:register({
	id = "library",
	label = "Library",
	initialAvailability = if buildExperienceModule.isLibraryAvailableInExperience() and not VRService.VREnabled then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable,
	activated = function()
		-- upvalues: buildExperienceModule (ref), VRService (ref)
		if buildExperienceModule.isLibraryAvailableInExperience() and not VRService.VREnabled then
			buildExperienceModule.GetLibraryStore().setIsOpen(true)
		end
	end,
	components = {
		Icon = function()
			-- upvalues: reactModule (ref), foundationModule (ref)
			return reactModule.createElement(foundationModule.Icon, { name = foundationModule.Enums.IconName.SquaresGridPlus })
		end
	}
})