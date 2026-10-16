local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes
local FFlagProfileAboutDetailsUseSheet = SharedFlagsModule.FFlagProfileAboutDetailsUseSheet

return {
	[EnumsModule.ProfileActions.ViewAbout] = if SharedFlagsModule.FFlagProfilePlatformNewProfileHeader then function(p1) --[[ Line: 25 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), AppPage (copy), FFlagProfileAboutDetailsUseSheet (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.ViewAbout],
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 29 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), AppPage (upval), FFlagProfileAboutDetailsUseSheet (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonViewFullProfile, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					local config = {
						name = AppPage.AboutDetailsSheet,
						extraProps = {
							sections = p1.aboutSections,
							profileName = if FFlagProfileAboutDetailsUseSheet then p1.aboutProfileName else nil
						}
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