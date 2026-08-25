local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local navigationRoduxModule = require(parent.NavigationRodux)
local appPage = require(parent.RobloxAppEnums).AppPage
local roactUtilsModule = require(parent.RoactUtils)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local useAboutSectionsModule = require(profilePlatform.Hooks.useAboutSections)
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local descriptionModule = require(profilePlatform.Components.Description)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local parseSectionsFromDataModule = require(script.Parent.parseSectionsFromData)
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagProfilePlatformNewProfileHeader = sharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local fFlagProfileAboutDetailsUseSheet = sharedFlagsModule.FFlagProfileAboutDetailsUseSheet
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var12 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0)
	-- upvalues: useDispatch (ref), fFlagProfilePlatformNewProfileHeader (ref), useAboutSectionsModule (ref), useProfileWrapperContextModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), parseSectionsFromDataModule (ref), fFlagProfileAboutDetailsUseSheet (ref), useLocalization (ref), textKeysModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var12 (ref), navigateDown (ref), descriptionModule (ref)
	local aboutDetails, aboutSections
	local var13 = useDispatch()
	local _ = nil
	local _ = nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var14 = useAboutSectionsModule()
		aboutDetails = var14.aboutDetails
		aboutSections = var14.aboutSections
	else
		local profileType = useProfileWrapperContextModule().profileType
		aboutDetails = useProfileJsonComponentModule(enumsModule.Components.About)
		aboutSections = reactModule.useMemo(function()
			-- upvalues: parseSectionsFromDataModule (copy), aboutDetails (write), profileType (ref), enumsModule (copy)
			return parseSectionsFromDataModule(aboutDetails, profileType, if profileType == enumsModule.ProfileTypes.User then `@{aboutDetails.name}` else aboutDetails.name)
		end, { aboutDetails, profileType, aboutDetails.name })
	end
	local var15 = if fFlagProfileAboutDetailsUseSheet then if useProfileWrapperContextModule().profileType == enumsModule.ProfileTypes.User then `@{aboutDetails.name}` else aboutDetails.name else nil
	local description = aboutDetails.description
	local var16 = useLocalization({ noBioYet = textKeysModule.NoBioYet })
	
	if description == nil or description == "" then
		description = if fFlagProfilePlatformNewProfileHeader then nil else var16.noBioYet
	end
	return reactModule.createElement(descriptionModule, {
		description = description,
		layoutOrder = p0.layoutOrder,
		onActivateMoreButton = reactModule.useCallback(function()
			-- upvalues: appPage (copy), aboutSections (write), var15 (ref), fFlagSignalsNavP3Dispatch (copy), var12 (copy), var13 (ref), navigateDown (copy)
			local t = {
				name = appPage.AboutDetailsSheet,
				extraProps = { sections = aboutSections, profileName = var15 }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var12.down(var12.fromLegacyPage(t))
				
				return
			end
			var13(navigateDown(t))
		end, { var13, aboutSections, var15 })
	})
end