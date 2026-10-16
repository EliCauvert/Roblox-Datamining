local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local ParseSectionsFromDataFunction = require(ProfilePlatform.Components.About).parseSectionsFromData
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local DescriptionModule = require(ProfilePlatform.Components.Description)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1) --[[ Line: 32 | Named "ContactDescriptionContainer" ]]
	-- upvalues: UseDispatchFunction (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), ParseSectionsFromDataFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), DescriptionModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local ContactsProfileDescription = UseLocalizationFunction({
		contactsProfileDescription = {
			TextKeysModule.ContactsProfileBody,
			contactName = UseProfileJsonComponentModule(EnumsModule.Components.ContactDescription).contactName
		}
	}).contactsProfileDescription
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 40 ]]
		-- upvalues: ParseSectionsFromDataFunction (upval), ContactsProfileDescription (copy), EnumsModule (upval)
		return ParseSectionsFromDataFunction({ description = ContactsProfileDescription }, EnumsModule.ProfileTypes.Contact)
	end, { ContactsProfileDescription })
	
	return ReactModule.createElement(DescriptionModule, {
		description = ContactsProfileDescription,
		layoutOrder = p1.layoutOrder,
		onActivateMoreButton = ReactModule.useCallback(function() --[[ Line: 44 ]]
			-- upvalues: AppPage (upval), UseMemoResult (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
			local config = {
				name = AppPage.AboutDetailsSheet,
				extraProps = { sections = UseMemoResult }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				UseDispatchResult(NavigateDownFunction(config))
			end
		end, { UseDispatchResult, UseMemoResult })
	})
end