local reactPageFactoryModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.ReactPageFactory)
local playerProfileContainerModule = require(script.PlayerProfileContainer)

function createPlayerProfilePage()
	-- upvalues: reactPageFactoryModule (ref), playerProfileContainerModule (ref)
	local playerProfile = reactPageFactoryModule:createNewPage("PlayerProfile")
	playerProfile:setPage(playerProfileContainerModule)
	
	return playerProfile
end

return createPlayerProfilePage()