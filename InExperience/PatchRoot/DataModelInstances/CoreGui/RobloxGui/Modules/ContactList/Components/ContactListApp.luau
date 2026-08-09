local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local roactNavigationModule = require(corePackagesService.Packages.RoactNavigation)
local soundManager = require(corePackagesService.Workspace.Packages.SoundManager).SoundManager
local soundGroups = require(corePackagesService.Workspace.Packages.SoundManager).SoundGroups
local contactList = coreGuiService:WaitForChild("RobloxGui").Modules.ContactList
local contactListContainerModule = require(contactList.Components.ContactListContainer)
local callBarContainerModule = require(contactList.Components.CallBarContainer)
local callDialogContainerModule = require(contactList.Components.CallDialogContainer)
local playerMenuContainerModule = require(contactList.Components.PlayerMenuContainer)

return function() --[[ line: 19 ]]
	-- upvalues: reactModule (ref), roactNavigationModule (ref), contactListContainerModule (ref), soundManager (ref), soundGroups (ref), callDialogContainerModule (ref), playerMenuContainerModule (ref), callBarContainerModule (ref)
	local var8 = reactModule.useMemo(function() --[[ line: 23 ]]
		-- upvalues: roactNavigationModule (copy), contactListContainerModule (copy)
		return roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator({
			{ ContactList = { screen = contactListContainerModule } }
		}, { defaultNavigationOptions = { absorbInput = false } }))
	end, {})
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: soundManager (copy), soundGroups (copy)
		soundManager:CreateSoundGroup(soundGroups.Iris.Name)
	end, {})
	
	return reactModule.createElement("Folder", {}, {
		CallDialogContainer = reactModule.createElement(callDialogContainerModule),
		ContactListContainer = reactModule.createElement(var8),
		PlayerMenuContainer = reactModule.createElement(playerMenuContainerModule),
		CallBarContainer = reactModule.createElement(callBarContainerModule)
	})
end