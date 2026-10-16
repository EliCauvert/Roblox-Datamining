local ReactPageFactoryModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.ReactPageFactory)
local PlayerProfileContainerModule = require(script.PlayerProfileContainer)

function createPlayerProfilePage() --[[ Line: 9 ]]
	-- upvalues: ReactPageFactoryModule (copy), PlayerProfileContainerModule (copy)
	local PlayerProfile = ReactPageFactoryModule:createNewPage("PlayerProfile")
	PlayerProfile:setPage(PlayerProfileContainerModule)
	
	return PlayerProfile
end

return createPlayerProfilePage()