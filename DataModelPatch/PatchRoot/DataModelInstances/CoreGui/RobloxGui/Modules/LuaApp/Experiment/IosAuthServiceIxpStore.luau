local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local UseBrowserTrackerExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useBrowserTrackerExperiment
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local ReactModule = require(CorePackages.Packages.React)
local IosAuthServiceEnabled = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey.IosAuthServiceEnabled

local function _(p1, p2)
	-- upvalues: AppStorageService (copy)
	pcall(function()
		-- upvalues: p1 (copy), AppStorageService (upval), p2 (copy)
		if p1 then
			AppStorageService:SetItem(p2, "true")
		else
			AppStorageService:SetItem(p2, "false")
		end
		AppStorageService:Flush()
	end)
end

return function(_)
	-- upvalues: UseBrowserTrackerExperimentFunction (copy), AppBtidLayers (copy), ReactModule (copy), IosAuthServiceEnabled (copy), AppStorageService (copy)
	local EnableNewIosPasswordSaving = UseBrowserTrackerExperimentFunction({ AppBtidLayers.IosPasswordSavingLayer }, function(p1)
		-- upvalues: AppBtidLayers (upval)
		return {
			enableNewIosPasswordSaving = (p1[AppBtidLayers.IosPasswordSavingLayer] or {}).enableNewIosPasswordSaving or false
		}
	end).enableNewIosPasswordSaving
	ReactModule.useEffect(function()
		-- upvalues: EnableNewIosPasswordSaving (copy), IosAuthServiceEnabled (upval), AppStorageService (upval)
		pcall(function()
			-- upvalues: EnableNewIosPasswordSaving (copy), AppStorageService (upval), IosAuthServiceEnabled (copy)
			if EnableNewIosPasswordSaving then
				AppStorageService:SetItem(IosAuthServiceEnabled, "true")
			else
				AppStorageService:SetItem(IosAuthServiceEnabled, "false")
			end
			AppStorageService:Flush()
		end)
	end, { EnableNewIosPasswordSaving })
	
	return nil
end