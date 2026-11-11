local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local ApiFetchThumbnails = require(CorePackages.Workspace.Packages.Http).Utils.ApiFetchThumbnails
local PassesGetThumbnailsModule = require(Modules.LuaApp.Http.Requests.PassesGetThumbnails)
local SetPassesThumbnailsModule = require(Modules.LuaApp.Actions.SetPassesThumbnails)

return function(p1, p2)
	-- upvalues: PromiseModule (copy), ApiFetchThumbnails (copy), PassesGetThumbnailsModule (copy), SetPassesThumbnailsModule (copy)
	return function(p3)
		-- upvalues: p2 (copy), PromiseModule (upval), ApiFetchThumbnails (upval), p1 (copy), PassesGetThumbnailsModule (upval), SetPassesThumbnailsModule (upval)
		local PassesThumbnails = p3:getState().PassesThumbnails
		local List = {}
		
		if PassesThumbnails then
			for _, value in ipairs(p2) do
				if PassesThumbnails[tostring(value)] == nil then
					table.insert(List, value)
				end
			end
		else
			List = p2
		end
		return if #List == 0 then PromiseModule.resolve() else ApiFetchThumbnails.Fetch(p1, List, "150x150", "Pass", PassesGetThumbnailsModule, SetPassesThumbnailsModule, p3)
	end
end