local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local fFlagProfileAboutDetailsUseSheet = sharedFlagsModule.FFlagProfileAboutDetailsUseSheet

return {
	[enumsModule.ProfileActions.ViewAbout] = if sharedFlagsModule.FFlagProfilePlatformNewProfileHeader then function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), fFlagProfileAboutDetailsUseSheet (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.ViewAbout],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), appPage (copy), fFlagProfileAboutDetailsUseSheet (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					local t = {
						name = appPage.AboutDetailsSheet,
						extraProps = {
							sections = p1.aboutSections,
							profileName = if fFlagProfileAboutDetailsUseSheet then p1.aboutProfileName else nil
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
						
						return
					end
					p1.dispatch(navigateDown(t))
				end
			}
		}
	end else nil
}