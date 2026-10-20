local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local UseBrowserTrackerExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useBrowserTrackerExperiment
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local ReactModule = require(CorePackages.Packages.React)

local function _(p1)
	-- upvalues: AppStorageService (copy)
	pcall(function()
		-- upvalues: p1 (copy), AppStorageService (upval)
		if p1 == nil then
			AppStorageService:SetItem("AndroidRecentlyPlayedWidgetVariant", "no_widget")
		else
			AppStorageService:SetItem("AndroidRecentlyPlayedWidgetVariant", p1)
		end
		AppStorageService:Flush()
	end)
end

function AndroidWidgetStoreIXP(_)
	-- upvalues: UseBrowserTrackerExperimentFunction (copy), AppBtidLayers (copy), ReactModule (copy), AppStorageService (copy)
	local RecentlyPlayedWidgetVariant2 = UseBrowserTrackerExperimentFunction({ AppBtidLayers.AndroidWidgetLayer }, function(p1)
		-- upvalues: AppBtidLayers (upval)
		return {
			recentlyPlayedWidgetVariant2 = (p1[AppBtidLayers.AndroidWidgetLayer] or {}).recentlyPlayedWidgetVariant2
		}
	end).recentlyPlayedWidgetVariant2
	ReactModule.useEffect(function()
		-- upvalues: RecentlyPlayedWidgetVariant2 (copy), AppStorageService (upval)
		pcall(function()
			-- upvalues: RecentlyPlayedWidgetVariant2 (copy), AppStorageService (upval)
			if RecentlyPlayedWidgetVariant2 == nil then
				AppStorageService:SetItem("AndroidRecentlyPlayedWidgetVariant", "no_widget")
			else
				AppStorageService:SetItem("AndroidRecentlyPlayedWidgetVariant", RecentlyPlayedWidgetVariant2)
			end
			AppStorageService:Flush()
		end)
	end, { RecentlyPlayedWidgetVariant2 })
	
	return nil
end

return AndroidWidgetStoreIXP