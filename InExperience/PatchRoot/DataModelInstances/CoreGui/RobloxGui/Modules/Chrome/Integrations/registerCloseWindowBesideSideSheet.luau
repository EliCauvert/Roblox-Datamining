local CorePackages = game:GetService("CorePackages")
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local IntegrationIds = InExperienceSideSheetModule.Constants.IntegrationIds
local GameInviteModalManager = require(CorePackages.Workspace.Packages.GameInvite).GameInviteModalManager
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local ServiceModule = require(script:FindFirstAncestor("Chrome").Service)

return function()
	-- upvalues: InExperienceSideSheetModule (copy), IntegrationIds (copy), GameInviteModalManager (copy), InExperienceAppChatModalModule (copy), ServiceModule (copy)
	InExperienceSideSheetModule.registerInGameMenuPeoplePageActions.registerCloseWindowShownBesideSideSheet(function()
		-- upvalues: InExperienceSideSheetModule (upval), IntegrationIds (upval), GameInviteModalManager (upval), InExperienceAppChatModalModule (upval), ServiceModule (upval)
		local WindowShownBesideSideSheet = InExperienceSideSheetModule.getWindowShownBesideSideSheet(false)
		
		if WindowShownBesideSideSheet == nil then return end
		InExperienceSideSheetModule.setWindowShownBesideSideSheet(nil)
		
		if WindowShownBesideSideSheet == IntegrationIds.InviteFriends then
			GameInviteModalManager:closeModal()
			
			return
		end
		if WindowShownBesideSideSheet == IntegrationIds.ConnectDropdown then
			if InExperienceAppChatModalModule:getVisible() then
				InExperienceAppChatModalModule.default:setVisible(false)
			end
			return
		elseif ServiceModule:integrations()[WindowShownBesideSideSheet] ~= nil and ServiceModule:isWindowOpen(WindowShownBesideSideSheet) then
			ServiceModule:toggleWindow(WindowShownBesideSideSheet)
		end
	end)
end