local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetHydratedWidgetDataModule = require(Modules.AvatarExperience.Catalog.Actions.SetHydratedWidgetData)
local SetSearchInCatalogModule = require(Modules.AvatarExperience.Catalog.Actions.SetSearchInCatalog)
local SetAvatarsTabSearchInfoModule = require(Modules.AvatarExperience.Catalog.Actions.SetAvatarsTabSearchInfo)
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local Api = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Api
local FFlagAXMigrateAllTabToSduiDev = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateAllTabToSduiDev
local AXAvatarsTabNoItemsFound = game:DefineFastFlag("AXAvatarsTabNoItemsFound", false)
local _ = require(CorePackages.Packages.LuauPolyfill)

return function(p1, p2)
	-- upvalues: SendAXCounterV2Function (copy), ConstantsModule (copy), SetSearchInCatalogModule (copy), Api (copy), AXAvatarsTabNoItemsFound (copy), WebApiModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), SetHydratedWidgetDataModule (copy), SetAvatarsTabSearchInfoModule (copy), Logging (copy)
	return function(p3)
		-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval), p1 (copy), SetSearchInCatalogModule (upval), Api (upval), p2 (copy), AXAvatarsTabNoItemsFound (upval), WebApiModule (upval), FFlagAXMigrateAllTabToSduiDev (upval), SetHydratedWidgetDataModule (upval), SetAvatarsTabSearchInfoModule (upval), Logging (upval)
		local function showAvatarsTabError()
			-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval), p1 (upval), p3 (copy), SetSearchInCatalogModule (upval)
			SendAXCounterV2Function(ConstantsModule.Counter.FetchCatalogSearchForLooksError, {
				page = if p1.searchKeyword == nil then "Catalog" else "Search"
			})
			p3:dispatch(SetSearchInCatalogModule(p1.searchUuid, {
				hasMoreEntries = true,
				items = {},
				keyword = p1.searchKeyword
			}))
		end
		
		assert(Api.getLooksFromWidgetListInfo, "Function exists if Avatars Tab is enabled. Assert can be removed with Avatars Tab Experiment removal")
		local LooksFromWidgetListInfo, _ = Api.getLooksFromWidgetListInfo(p2, p1.searchUuid, p1.searchKeyword, p1.categoryInfo)
		
		return LooksFromWidgetListInfo:andThen(function(Result)
			-- upvalues: AXAvatarsTabNoItemsFound (upval), p3 (copy), SetSearchInCatalogModule (upval), p1 (upval), showAvatarsTabError (copy), WebApiModule (upval), p2 (upval), FFlagAXMigrateAllTabToSduiDev (upval), SetHydratedWidgetDataModule (upval), SetAvatarsTabSearchInfoModule (upval), Logging (upval)
			local Success, Result1 = pcall(function()
				-- upvalues: Result (copy)
				local Widgets = Result and Result.widgets or {}
				for _, widget in Widgets do
					return widget.content
				end
				return {}
			end)
			
			return if Success and #Result1 ~= 0 then WebApiModule.HydrateWidgetContent(p2, Result1):andThen(function(Result)
				-- upvalues: FFlagAXMigrateAllTabToSduiDev (upval), p1 (upval), Result1 (copy), showAvatarsTabError (upval), p3 (upval), SetHydratedWidgetDataModule (upval), SetSearchInCatalogModule (upval), SetAvatarsTabSearchInfoModule (upval)
				local ResponseBody = if Result then Result.responseBody else nil
				local HydratedContent = if ResponseBody then ResponseBody.hydratedContent else nil
				
				if HydratedContent == nil then return end
				assert(HydratedContent, "")
				local config = { Look = {} }
				
				for _, value in HydratedContent do
					if not FFlagAXMigrateAllTabToSduiDev then
						local Type = value.type
						assert(Type, "Look")
						config[Type][tostring(value.id)] = value
					elseif value.type == "Look" then
						config.Look[tostring(value.id)] = value
					end
				end
				local config1 = {
					hasMoreEntries = false,
					items = {},
					keyword = p1.searchKeyword
				}
				
				for _, value1 in Result1 do
					local Text = tostring(value1.id)
					
					if config.Look[Text] then
						table.insert(config1.items, { id = Text, type = "Look" })
					end
				end
				if #config1.items == 0 then
					return showAvatarsTabError()
				end
				p3:dispatch(SetHydratedWidgetDataModule(config))
				p3:dispatch(SetSearchInCatalogModule(p1.searchUuid, config1))
				
				if p1.searchKeyword then
					p3:dispatch(SetAvatarsTabSearchInfoModule(p1.searchUuid, p1.searchKeyword))
				end
			end, function(p4)
				-- upvalues: Logging (upval), showAvatarsTabError (upval)
				Logging.warn("WebApi failure in FetchHydratedWidgetContent: " .. tostring(p4))
				
				return showAvatarsTabError()
			end) elseif AXAvatarsTabNoItemsFound and #Result1 == 0 then p3:dispatch(SetSearchInCatalogModule(p1.searchUuid, {
				hasMoreEntries = false,
				items = {},
				keyword = p1.searchKeyword
			})) else showAvatarsTabError()
		end)
	end
end