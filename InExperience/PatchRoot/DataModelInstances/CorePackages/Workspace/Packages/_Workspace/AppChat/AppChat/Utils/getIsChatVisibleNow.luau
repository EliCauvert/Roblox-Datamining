local Parent = script:FindFirstAncestor("AppChat").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagSignalsNavP3hMisc = require(Parent.SharedFlags).FFlagSignalsNavP3hMisc
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(Parent.NavigationRodux).GetLegacyNavigationStore else nil
local IsNavigationAvailable = if FFlagSignalsNavP3hMisc then require(Parent.RobloxAppNavigation).isNavigationAvailable else nil

return {
	getIsChatVisibleNow = function(): boolean
		-- upvalues: IsNavigationAvailable (copy), GetLegacyNavigationStore (copy), AppPage (copy)
		return not IsNavigationAvailable() or GetLegacyNavigationStore(false).getCurrentPageName(false) == AppPage.Chat
	end,
	isChatVisible = function(p1): boolean
		-- upvalues: IsNavigationAvailable (copy), GetLegacyNavigationStore (copy), AppPage (copy)
		return not IsNavigationAvailable() or GetLegacyNavigationStore(false).getCurrentPageName(p1) == AppPage.Chat
	end
}