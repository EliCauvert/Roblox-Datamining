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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: useDispatch (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), parseSectionsFromData (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), descriptionModule (ref)
	local var2 = useDispatch()
	local contactsProfileDescription = useLocalization({
		contactsProfileDescription = {
			textKeysModule.ContactsProfileBody,
			contactName = useProfileJsonComponentModule(enumsModule.Components.ContactDescription).contactName
		}
	}).contactsProfileDescription
	local var3 = reactModule.useMemo(function()
		-- upvalues: parseSectionsFromData (copy), contactsProfileDescription (ref), enumsModule (copy)
		return parseSectionsFromData({ description = contactsProfileDescription }, enumsModule.ProfileTypes.Contact)
	end, { contactsProfileDescription })
	
	return reactModule.createElement(descriptionModule, {
		description = contactsProfileDescription,
		layoutOrder = p1.layoutOrder,
		onActivateMoreButton = reactModule.useCallback(function()
			-- upvalues: appPage (copy), var3 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
			local t = {
				name = appPage.AboutDetailsSheet,
				extraProps = { sections = var3 }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(t))
				
				return
			end
			var2(navigateDown(t))
		end, { var2, var3 })
	})
end