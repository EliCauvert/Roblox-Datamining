local CorePackages = game:GetService("CorePackages")
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local UseBrowserTrackerExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useBrowserTrackerExperiment

local function _()
	-- upvalues: UseBrowserTrackerExperimentFunction (copy), AppBtidLayers (copy)
	return (UseBrowserTrackerExperimentFunction({ AppBtidLayers.IosPasswordSavingLayer }, function(p1)
		-- upvalues: AppBtidLayers (upval)
		return {
			enableNewIosPasswordSaving = (p1[AppBtidLayers.IosPasswordSavingLayer] or {}).enableNewIosPasswordSaving or false
		}
	end))
end

return {
	useIsIosAuthServiceEnabled = function()
		-- upvalues: UseBrowserTrackerExperimentFunction (copy), AppBtidLayers (copy)
		return UseBrowserTrackerExperimentFunction({ AppBtidLayers.IosPasswordSavingLayer }, function(p1)
			-- upvalues: AppBtidLayers (upval)
			return {
				enableNewIosPasswordSaving = (p1[AppBtidLayers.IosPasswordSavingLayer] or {}).enableNewIosPasswordSaving or false
			}
		end).enableNewIosPasswordSaving
	end
}