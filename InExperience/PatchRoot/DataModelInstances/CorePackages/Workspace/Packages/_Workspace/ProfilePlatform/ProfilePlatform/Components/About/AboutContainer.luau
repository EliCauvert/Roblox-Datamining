local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseAboutSectionsModule = require(ProfilePlatform.Hooks.useAboutSections)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local DescriptionModule = require(ProfilePlatform.Components.Description)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local ParseSectionsFromDataModule = require(script.Parent.parseSectionsFromData)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagProfilePlatformNewProfileHeader = SharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local FFlagProfileAboutDetailsUseSheet = SharedFlagsModule.FFlagProfileAboutDetailsUseSheet
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1) --[[ Line: 31 | Named "AboutDescriptionContainer" ]]
	-- upvalues: UseDispatchFunction (copy), FFlagProfilePlatformNewProfileHeader (copy), UseAboutSectionsModule (copy), UseProfileWrapperContextModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), ReactModule (copy), ParseSectionsFromDataModule (copy), FFlagProfileAboutDetailsUseSheet (copy), UseLocalizationFunction (copy), TextKeysModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), DescriptionModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local AboutDetails = nil
	local AboutSections = nil
	
	if FFlagProfilePlatformNewProfileHeader then
		local UseAboutSectionsModuleResult = UseAboutSectionsModule()
		AboutDetails = UseAboutSectionsModuleResult.aboutDetails
		AboutSections = UseAboutSectionsModuleResult.aboutSections
	else
		local ProfileType = UseProfileWrapperContextModule().profileType
		AboutDetails = UseProfileJsonComponentModule(EnumsModule.Components.About)
		AboutSections = ReactModule.useMemo(function() --[[ Line: 43 ]]
			-- upvalues: ParseSectionsFromDataModule (upval), AboutDetails (ref), ProfileType (copy), EnumsModule (upval)
			return ParseSectionsFromDataModule(AboutDetails, ProfileType, if ProfileType == EnumsModule.ProfileTypes.User then `@{AboutDetails.name}` else AboutDetails.name)
		end, { AboutDetails, ProfileType, AboutDetails.name })
	end
	local Text = if FFlagProfileAboutDetailsUseSheet then if UseProfileWrapperContextModule().profileType == EnumsModule.ProfileTypes.User then `@{AboutDetails.name}` else AboutDetails.name else nil
	local Description = AboutDetails.description
	local UseLocalizationResult = UseLocalizationFunction({ noBioYet = TextKeysModule.NoBioYet })
	
	if Description == nil or Description == "" then
		Description = if FFlagProfilePlatformNewProfileHeader then nil else UseLocalizationResult.noBioYet
	end
	return ReactModule.createElement(DescriptionModule, {
		description = Description,
		layoutOrder = p1.layoutOrder,
		onActivateMoreButton = ReactModule.useCallback(function() --[[ Line: 69 ]]
			-- upvalues: AppPage (upval), AboutSections (ref), Text (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
			local config = {
				name = AppPage.AboutDetailsSheet,
				extraProps = { sections = AboutSections, profileName = Text }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				UseDispatchResult(NavigateDownFunction(config))
			end
		end, { UseDispatchResult, AboutSections, Text })
	})
end