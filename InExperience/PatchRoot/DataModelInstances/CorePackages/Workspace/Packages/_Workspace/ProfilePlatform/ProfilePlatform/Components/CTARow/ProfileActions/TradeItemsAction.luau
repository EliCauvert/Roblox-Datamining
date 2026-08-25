local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local url = require(parent.Http).Url
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local textKeysModule = require(profilePlatform.Common.TextKeys)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.TradeItems] = if require(profilePlatform.Flags.FFlagProfilePlatformEnableTradeItems) then function(p0)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), url (ref), textKeysModule (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateDown (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.TradeItems],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p0 (ref), enumsModule (copy), eventNamesModule (copy), appPage (copy), url (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var2 (copy), navigateDown (copy)
					if p0.buttonSurface == enumsModule.ButtonSurface.ContextualMenu then
						p0.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonTradeItems, { buttonSurface = p0.buttonSurface })
					else
						p0.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonTradeItems, { buttonSurface = p0.buttonSurface })
					end
					local t = {
						name = appPage.GenericWebPage,
						detail = `{url.BASE_URL}users/{p0.profileId}/trade`,
						extraProps = { titleKey = textKeysModule.TradeItems }
					}
					
					if fFlagSignalsNavP3Dispatch then
						var2.down(var2.fromLegacyPage(t))
						
						return
					end
					p0.dispatch(navigateDown(t))
				end
			}
		}
	end else nil
}