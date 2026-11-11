local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local ApiFetchThumbnails = require(CorePackages.Workspace.Packages.Http).Utils.ApiFetchThumbnails
local DeveloperProductsGetThumbnailsModule = require(Modules.LuaApp.Http.Requests.DeveloperProductApi.DeveloperProductsGetThumbnails)
local SetDeveloperProductsThumbnailsModule = require(Modules.LuaApp.Actions.DeveloperProduct.SetDeveloperProductsThumbnails)

return function(p1, p2)
	-- upvalues: PromiseModule (copy), ApiFetchThumbnails (copy), DeveloperProductsGetThumbnailsModule (copy), SetDeveloperProductsThumbnailsModule (copy)
	return function(p3)
		-- upvalues: p2 (copy), PromiseModule (upval), ApiFetchThumbnails (upval), p1 (copy), DeveloperProductsGetThumbnailsModule (upval), SetDeveloperProductsThumbnailsModule (upval)
		local DeveloperProductsThumbnails = p3:getState().DeveloperProductsThumbnails
		local List = {}
		
		if DeveloperProductsThumbnails then
			for _, value in p2 do
				if DeveloperProductsThumbnails[tostring(value)] == nil then
					table.insert(List, value)
				end
			end
		else
			List = p2
		end
		return if #List == 0 then PromiseModule.resolve() else ApiFetchThumbnails.Fetch(p1, List, "150x150", "DeveloperProducts", DeveloperProductsGetThumbnailsModule, SetDeveloperProductsThumbnailsModule, p3)
	end
end