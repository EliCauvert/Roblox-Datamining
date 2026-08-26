local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local retrievalStatus = require(corePackagesService.Workspace.Packages.Http).Enum.RetrievalStatus
local apiFetchUsersFriendsModule = require(shareGame.Thunks.ApiFetchUsersFriends)
local constantsModule = require(shareGame.Constants)
local userSortsModule = require(robloxGui.Modules.Settings.Enum.UserSorts)
local getFFlagInviteListRerank = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank

return function(p1, p2)
	-- upvalues: retrievalStatus (ref), apiFetchUsersFriendsModule (ref), constantsModule (ref), getFFlagInviteListRerank (ref), userSortsModule (ref)
	return function(p3)
		-- upvalues: p2 (ref), retrievalStatus (copy), apiFetchUsersFriendsModule (copy), p1 (ref), constantsModule (copy), getFFlagInviteListRerank (copy), userSortsModule (copy)
		if p3:getState().Friends.retrievalStatus[p2] ~= retrievalStatus.Fetching then
			p3:dispatch(apiFetchUsersFriendsModule(p1, p2, constantsModule.ThumbnailRequest.InviteToGame, if getFFlagInviteListRerank() then userSortsModule.StatusFrequents else nil))
		end
	end
end