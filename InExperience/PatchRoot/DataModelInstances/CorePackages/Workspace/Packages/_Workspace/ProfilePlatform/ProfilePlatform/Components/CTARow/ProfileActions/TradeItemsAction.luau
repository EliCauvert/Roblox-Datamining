local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local Url = require(Parent.Http).Url
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.TradeItems] = if require(ProfilePlatform.Flags.FFlagProfilePlatformEnableTradeItems) then function(p1) --[[ Line: 28 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), AppPage (copy), Url (copy), TextKeysModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.TradeItems],
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 32 ]]
					-- upvalues: p1 (copy), EnumsModule (upval), EventNamesModule (upval), AppPage (upval), Url (upval), TextKeysModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
					if p1.buttonSurface == EnumsModule.ButtonSurface.ContextualMenu then
						p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonTradeItems, { buttonSurface = p1.buttonSurface })
					else
						p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonTradeItems, { buttonSurface = p1.buttonSurface })
					end
					local config = {
						name = AppPage.GenericWebPage,
						detail = `{Url.BASE_URL}users/{p1.profileId}/trade`,
						extraProps = { titleKey = TextKeysModule.TradeItems }
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						p1.dispatch(NavigateDownFunction(config))
					end
				end
			}
		}
	end else nil
}