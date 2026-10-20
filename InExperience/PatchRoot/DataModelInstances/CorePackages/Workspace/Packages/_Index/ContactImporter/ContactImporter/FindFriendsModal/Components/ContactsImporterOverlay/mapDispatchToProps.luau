local Parent = script.Parent.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Parent1 = Parent.Parent
local NetworkingUserSettings = DependenciesModule.NetworkingUserSettings
local UpdateContactImporterModalLogicFunction = DependenciesModule.SocialModalsCommon.Actions.UpdateContactImporterModalLogic
local AppPage = require(Parent1.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent1.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent1.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent1.RobloxAppNavigation).NavigationCommands else nil
local ToastRoduxModule = require(Parent1.ToastRodux)

return function(Callback)
	-- upvalues: UpdateContactImporterModalLogicFunction (copy), NetworkingUserSettings (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), ToastRoduxModule (copy)
	return {
		hideContactImporterModal = function()
			-- upvalues: Callback (copy), UpdateContactImporterModalLogicFunction (upval)
			return Callback(UpdateContactImporterModalLogicFunction({
				hasOSPermissions = true,
				shouldShowContactImporterUpsellModal = false
			}))
		end,
		getUserSettingsMetadata = function()
			-- upvalues: Callback (copy), NetworkingUserSettings (upval)
			return Callback(NetworkingUserSettings.GetUserSettingsMetadata.API())
		end,
		openLearnMoreLink = function()
			-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			local config = {
				detail = "https://en.help.roblox.com/hc/articles/7416652004884",
				name = AppPage.GenericWebPage,
				extraProps = { title = "" }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownFunction(config, nil))
			end
		end,
		showToast = function(ToastMessage)
			-- upvalues: Callback (copy), ToastRoduxModule (upval)
			Callback(ToastRoduxModule.Actions.SetCurrentToastMessage({ toastMessage = ToastMessage }))
		end
	}
end