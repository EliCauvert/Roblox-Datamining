local CorePackages = game:GetService("CorePackages")
local NotificationTypeModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.NotificationType)
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3hMisc
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local GetLegacyNavigationStoreFunction = require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore

return function(GuiService)
	-- upvalues: FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), NotificationTypeModule (copy)
	return function(p1)
		-- upvalues: FFlagSignalsNavP3hMisc (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), GuiService (copy), NotificationTypeModule (upval)
		local State = p1:getState()
		local CurrentLegacyRoute = if FFlagSignalsNavP3hMisc then GetLegacyNavigationStoreFunction(false).getCurrentLegacyRoute(false) elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(State) else State.Navigation.history[#State.Navigation.history]
		GuiService:BroadcastNotification(CurrentLegacyRoute[#CurrentLegacyRoute].name, NotificationTypeModule.APP_READY)
	end
end