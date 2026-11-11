local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local ReactModule = require(CorePackages.Packages.React)

local function _(p1)
	-- upvalues: AppStorageService (copy)
	pcall(function()
		-- upvalues: AppStorageService (upval), p1 (copy)
		if p1 ~= AppStorageService:GetItem("ExperienceMenuVersion") then
			AppStorageService:SetItem("ExperienceMenuVersion", p1 or "")
			AppStorageService:Flush()
		end
	end)
end

function ExperienceMenuIXPPreload(_)
	-- upvalues: UseUserExperimentFunction (copy), AppUserLayers (copy), ReactModule (copy), AppStorageService (copy)
	local UseUserExperimentResult = UseUserExperimentFunction({
		AppUserLayers.ExperienceMenuLayer,
		AppUserLayers.ConsoleExperienceMenuLayer
	}, function(p1)
		-- upvalues: AppUserLayers (upval)
		return if p1[AppUserLayers.ExperienceMenuLayer] and p1[AppUserLayers.ExperienceMenuLayer].menuVersion then p1[AppUserLayers.ExperienceMenuLayer].menuVersion elseif p1[AppUserLayers.ConsoleExperienceMenuLayer] and p1[AppUserLayers.ConsoleExperienceMenuLayer].menuVersion then p1[AppUserLayers.ConsoleExperienceMenuLayer].menuVersion else ""
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseUserExperimentResult (copy), AppStorageService (upval)
		pcall(function()
			-- upvalues: AppStorageService (upval), UseUserExperimentResult (copy)
			if UseUserExperimentResult ~= AppStorageService:GetItem("ExperienceMenuVersion") then
				AppStorageService:SetItem("ExperienceMenuVersion", UseUserExperimentResult or "")
				AppStorageService:Flush()
			end
		end)
	end, { UseUserExperimentResult })
	
	return nil
end

return ExperienceMenuIXPPreload