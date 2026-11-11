local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local UseBrowserTrackerExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useBrowserTrackerExperiment
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local ReactModule = require(CorePackages.Packages.React)

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

function WidgetStoreIXP(_)
	-- upvalues: UseBrowserTrackerExperimentFunction (copy), AppBtidLayers (copy), ReactModule (copy), AppStorageService (copy)
	local UseBrowserTrackerExperimentResult = UseBrowserTrackerExperimentFunction({
		AppBtidLayers.WidgetLayer,
		AppBtidLayers.LockScreenWidgetLayer
	}, function(p1)
		-- upvalues: AppBtidLayers (upval)
		return {
			showRecentsWidget = (p1[AppBtidLayers.WidgetLayer] or {}).showRecentsWidget,
			showLockScreenWidget = (p1[AppBtidLayers.LockScreenWidgetLayer] or {}).showLockScreenWidget
		}
	end)
	local ShowRecentsWidget = UseBrowserTrackerExperimentResult.showRecentsWidget
	local ShowLockScreenWidget = UseBrowserTrackerExperimentResult.showLockScreenWidget
	ReactModule.useEffect(function()
		-- upvalues: ShowRecentsWidget (copy), AppStorageService (upval), ShowLockScreenWidget (copy)
		local v1 = "EnableWidgetExtension"
		pcall(function()
			-- upvalues: ShowRecentsWidget (copy), AppStorageService (upval), v1 (copy)
			if ShowRecentsWidget then
				AppStorageService:SetItem(v1, "true")
			else
				AppStorageService:SetItem(v1, "false")
			end
			AppStorageService:Flush()
		end)
		local Key = "EnableLockScreenWidgetExperiment"
		pcall(function()
			-- upvalues: ShowLockScreenWidget (copy), AppStorageService (upval), Key (copy)
			if ShowLockScreenWidget then
				AppStorageService:SetItem(Key, "true")
			else
				AppStorageService:SetItem(Key, "false")
			end
			AppStorageService:Flush()
		end)
	end, { ShowRecentsWidget, ShowLockScreenWidget })
	
	return nil
end

return WidgetStoreIXP