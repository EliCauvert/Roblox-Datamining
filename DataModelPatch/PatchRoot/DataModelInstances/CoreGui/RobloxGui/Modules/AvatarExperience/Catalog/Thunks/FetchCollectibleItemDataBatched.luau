local CorePackages = game:GetService("CorePackages")
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local WebApiModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Http.WebApi)
local FetchCollectibleItemDataBatchedSuccessFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).State.Actions.FetchCollectibleItemDataBatchedSuccess

local function _(List): string
	return "BatchCollectibles-" .. table.concat(List, ",")
end

return function(p1, List)
	-- upvalues: PerformFetch (copy), WebApiModule (copy), FetchCollectibleItemDataBatchedSuccessFunction (copy)
	return PerformFetch.Single("BatchCollectibles-" .. table.concat(List, ","), function(p2)
		-- upvalues: WebApiModule (upval), p1 (copy), List (copy), FetchCollectibleItemDataBatchedSuccessFunction (upval)
		return WebApiModule.FetchCollectibleItemDetails(p1, List):andThen(function(Result)
			-- upvalues: p2 (copy), FetchCollectibleItemDataBatchedSuccessFunction (upval)
			p2:dispatch(FetchCollectibleItemDataBatchedSuccessFunction({
				collectibleItemData = if Result then Result.responseBody else {}
			}))
		end)
	end)
end