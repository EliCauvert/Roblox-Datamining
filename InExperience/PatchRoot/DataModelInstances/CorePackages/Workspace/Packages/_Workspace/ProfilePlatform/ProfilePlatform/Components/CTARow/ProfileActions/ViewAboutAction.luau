local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local fFlagProfileAboutDetailsUseSheet = sharedFlagsModule.FFlagProfileAboutDetailsUseSheet

return {
	[enumsModule.ProfileActions.ViewAbout] = if sharedFlagsModule.FFlagProfilePlatformNewProfileHeader then function(p0) --[[ line: 25 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), fFlagProfileAboutDetailsUseSheet (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateDown (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.ViewAbout],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 29 ]]
					-- upvalues: p0 (ref), eventNamesModule (copy), appPage (copy), fFlagProfileAboutDetailsUseSheet (copy), fFlagSignalsNavP3Dispatch (copy), var2 (copy), navigateDown (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, {
						buttonSurface = p0.buttonSurface,
						btnContext = p0.profileWrapperContext.sourceInfo.source
					})
					local t = {
						name = appPage.AboutDetailsSheet,
						extraProps = {
							sections = p0.aboutSections,
							profileName = if fFlagProfileAboutDetailsUseSheet then p0.aboutProfileName else nil
						}
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