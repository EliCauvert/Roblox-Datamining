local parent = script.Parent.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local networkingUserSettings = dependenciesModule.NetworkingUserSettings
local updateContactImporterModalLogic = dependenciesModule.SocialModalsCommon.Actions.UpdateContactImporterModalLogic
local appPage = require(parent_1.RobloxAppEnums).AppPage
local navigateDown = require(parent_1.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent_1.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent_1.RobloxAppNavigation).NavigationCommands else nil
local toastRoduxModule = require(parent_1.ToastRodux)

return function(p1)
	-- upvalues: updateContactImporterModalLogic (ref), networkingUserSettings (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), toastRoduxModule (ref)
	return {
		hideContactImporterModal = function()
			-- upvalues: p1 (ref), updateContactImporterModalLogic (copy)
			return p1(updateContactImporterModalLogic({
				hasOSPermissions = true,
				shouldShowContactImporterUpsellModal = false
			}))
		end,
		getUserSettingsMetadata = function()
			-- upvalues: p1 (ref), networkingUserSettings (copy)
			return p1(networkingUserSettings.GetUserSettingsMetadata.API())
		end,
		openLearnMoreLink = function()
			-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), p1 (ref), navigateDown (copy)
			local t = {
				detail = "https://en.help.roblox.com/hc/articles/7416652004884",
				name = appPage.GenericWebPage,
				extraProps = { title = "" }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(t))
				
				return
			end
			p1(navigateDown(t, nil))
		end,
		showToast = function(p2)
			-- upvalues: p1 (ref), toastRoduxModule (copy)
			p1(toastRoduxModule.Actions.SetCurrentToastMessage({ toastMessage = p2 }))
		end
	}
end