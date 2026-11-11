local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local UseBrowserTrackerExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useBrowserTrackerExperiment
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local ReactModule = require(CorePackages.Packages.React)
local EnableIOSUIRefactorExperiment = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey.EnableIOSUIRefactorExperiment

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
	-- upvalues: UseBrowserTrackerExperimentFunction (copy), AppBtidLayers (copy), ReactModule (copy), EnableIOSUIRefactorExperiment (copy), AppStorageService (copy)
	local EnableIOSUIRefactor = UseBrowserTrackerExperimentFunction({ AppBtidLayers.ConsumerPlatformsIOSUIRefactor }, function(p1)
		-- upvalues: AppBtidLayers (upval)
		return {
			enableIOSUIRefactor = (p1[AppBtidLayers.ConsumerPlatformsIOSUIRefactor] or {}).enableIOSUIRefactor
		}
	end).enableIOSUIRefactor
	ReactModule.useEffect(function()
		-- upvalues: EnableIOSUIRefactor (copy), EnableIOSUIRefactorExperiment (upval), AppStorageService (upval)
		pcall(function()
			-- upvalues: EnableIOSUIRefactor (copy), AppStorageService (upval), EnableIOSUIRefactorExperiment (copy)
			if EnableIOSUIRefactor then
				AppStorageService:SetItem(EnableIOSUIRefactorExperiment, "true")
			else
				AppStorageService:SetItem(EnableIOSUIRefactorExperiment, "false")
			end
			AppStorageService:Flush()
		end)
	end, { EnableIOSUIRefactor })
	
	return nil
end