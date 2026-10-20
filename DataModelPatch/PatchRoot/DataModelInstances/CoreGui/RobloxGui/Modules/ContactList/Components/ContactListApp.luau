local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local SoundManager = require(CorePackages.Workspace.Packages.SoundManager).SoundManager
local SoundGroups = require(CorePackages.Workspace.Packages.SoundManager).SoundGroups
local ContactList = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList
local ContactListContainerModule = require(ContactList.Components.ContactListContainer)
local CallBarContainerModule = require(ContactList.Components.CallBarContainer)
local CallDialogContainerModule = require(ContactList.Components.CallDialogContainer)
local PlayerMenuContainerModule = require(ContactList.Components.PlayerMenuContainer)

return function()
	-- upvalues: ReactModule (copy), RoactNavigationModule (copy), ContactListContainerModule (copy), SoundManager (copy), SoundGroups (copy), CallDialogContainerModule (copy), PlayerMenuContainerModule (copy), CallBarContainerModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: RoactNavigationModule (upval), ContactListContainerModule (upval)
		return RoactNavigationModule.createAppContainer(RoactNavigationModule.createRobloxStackNavigator({
			{ ContactList = { screen = ContactListContainerModule } }
		}, { defaultNavigationOptions = { absorbInput = false } }))
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: SoundManager (upval), SoundGroups (upval)
		SoundManager:CreateSoundGroup(SoundGroups.Iris.Name)
	end, {})
	
	return ReactModule.createElement("Folder", {}, {
		CallDialogContainer = ReactModule.createElement(CallDialogContainerModule),
		ContactListContainer = ReactModule.createElement(UseMemoResult),
		PlayerMenuContainer = ReactModule.createElement(PlayerMenuContainerModule),
		CallBarContainer = ReactModule.createElement(CallBarContainerModule)
	})
end