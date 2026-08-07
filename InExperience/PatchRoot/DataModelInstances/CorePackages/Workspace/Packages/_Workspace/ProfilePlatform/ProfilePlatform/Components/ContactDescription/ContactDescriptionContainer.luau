local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local enumsModule = require(profilePlatform.Common.Enums)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local parseSectionsFromData = require(profilePlatform.Components.About).parseSectionsFromData
local useLocalization = require(parent.Localization).Hooks.useLocalization
local descriptionModule = require(profilePlatform.Components.Description)
local navigationRoduxModule = require(parent.NavigationRodux)
local roactUtilsModule = require(parent.RoactUtils)
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var8 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0) --[[ line: 32 | named "ContactDescriptionContainer" ]]
	-- upvalues: useDispatch (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), parseSectionsFromData (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var8 (ref), navigateDown (ref), descriptionModule (ref)
	local var9 = useDispatch()
	local contactsProfileDescription = useLocalization({
		contactsProfileDescription = {
			textKeysModule.ContactsProfileBody,
			contactName = useProfileJsonComponentModule(enumsModule.Components.ContactDescription).contactName
		}
	}).contactsProfileDescription
	local var10 = reactModule.useMemo(function() --[[ line: 40 ]]
		-- upvalues: parseSectionsFromData (copy), contactsProfileDescription (ref), enumsModule (copy)
		return parseSectionsFromData({ description = contactsProfileDescription }, enumsModule.ProfileTypes.Contact)
	end, { contactsProfileDescription })
	
	return reactModule.createElement(descriptionModule, {
		description = contactsProfileDescription,
		layoutOrder = p0.layoutOrder,
		onActivateMoreButton = reactModule.useCallback(function() --[[ line: 44 ]]
			-- upvalues: appPage (copy), var10 (ref), fFlagSignalsNavP3Dispatch (copy), var8 (copy), var9 (ref), navigateDown (copy)
			local t = {
				name = appPage.AboutDetailsSheet,
				extraProps = { sections = var10 }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var8.down(var8.fromLegacyPage(t))
				
				return
			end
			var9(navigateDown(t))
		end, { var9, var10 })
	})
end