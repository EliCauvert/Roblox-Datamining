local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(game:GetService("CorePackages").Workspace.Packages.Analytics)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)

return {
	get = function(p1)
		-- upvalues: RoactAnalyticsModule (copy), CatalogConstantsModule (copy)
		local GetResult = RoactAnalyticsModule.get(p1)
		
		return {
			avatarRefineButtonTap = function(p2, Uid, Category)
				-- upvalues: GetResult (copy)
				GetResult.EventStream:sendEventDeferred(p2, "avatarRefineButtonTap", { category = Category, uid = Uid })
			end,
			avatarRefineLayersResetTap = function(p2, Uid)
				-- upvalues: GetResult (copy)
				GetResult.EventStream:sendEventDeferred(p2, "avatarRefineLayersResetTap", { uid = Uid })
			end,
			avatarRefineLayersResetConfirm = function(p2, Uid)
				-- upvalues: GetResult (copy)
				GetResult.EventStream:sendEventDeferred(p2, "avatarRefineLayersResetConfirm", { uid = Uid })
			end,
			avatarRefineGoBack = function(AvatarShop, Uid)
				-- upvalues: CatalogConstantsModule (upval), GetResult (copy)
				GetResult.EventStream:sendEventDeferred(AvatarShop, "avatarRefineGoBack", {
					page = if AvatarShop == CatalogConstantsModule.AnalyticsContext.AvatarShop then "Catalog" else "Editor",
					uid = Uid
				})
			end,
			avatarRefineAutosaved = function(p2, Uid)
				-- upvalues: GetResult (copy)
				GetResult.EventStream:sendEventDeferred(p2, "avatarRefineAutosaved", { uid = Uid })
			end
		}
	end
}