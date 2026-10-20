local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local ApiFetchThumbnails = require(CorePackages.Workspace.Packages.Http).Utils.ApiFetchThumbnails
local SubscriptionProductsGetThumbnailsModule = require(Modules.LuaApp.Http.Requests.EconomyAPI.SubscriptionProductsGetThumbnails)
local SetSubscriptionProductsThumbnailsModule = require(Modules.LuaApp.Actions.Subscription.SetSubscriptionProductsThumbnails)

return function(p1, p2)
	-- upvalues: PromiseModule (copy), ApiFetchThumbnails (copy), SubscriptionProductsGetThumbnailsModule (copy), SetSubscriptionProductsThumbnailsModule (copy)
	return function(p3)
		-- upvalues: p2 (copy), PromiseModule (upval), ApiFetchThumbnails (upval), p1 (copy), SubscriptionProductsGetThumbnailsModule (upval), SetSubscriptionProductsThumbnailsModule (upval)
		local SubscriptionProductsThumbnails = p3:getState().SubscriptionProductsThumbnails
		local List = {}
		
		if SubscriptionProductsThumbnails then
			for _, value in p2 do
				if SubscriptionProductsThumbnails[tostring(value)] == nil then
					table.insert(List, value)
				end
			end
		else
			List = p2
		end
		return if #List == 0 then PromiseModule.resolve() else ApiFetchThumbnails.Fetch(p1, List, "150x150", "SubscriptionProducts", SubscriptionProductsGetThumbnailsModule, SetSubscriptionProductsThumbnailsModule, p3)
	end
end