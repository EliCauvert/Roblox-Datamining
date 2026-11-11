local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetCollectibleItemInfoModule = require(Modules.AvatarExperience.Catalog.Actions.SetCollectibleItemInfo)

return function(p1, p2)
	-- upvalues: PerformFetch (copy), WebApiModule (copy), SetCollectibleItemInfoModule (copy)
	return PerformFetch.Single(p2, function(p3)
		-- upvalues: WebApiModule (upval), p1 (copy), p2 (copy), SetCollectibleItemInfoModule (upval)
		return WebApiModule.FetchCollectibleItemDetails(p1, { p2 }):andThen(function(Result)
			-- upvalues: p3 (copy), SetCollectibleItemInfoModule (upval), p2 (upval)
			local ResponseBody = if Result then Result.responseBody else nil
			local ResponseBodyEntry = if ResponseBody then ResponseBody[1] else nil
			
			if ResponseBodyEntry ~= nil then
				p3:dispatch(SetCollectibleItemInfoModule(p2, ResponseBodyEntry))
				
				return
			end
		end)
	end)
end