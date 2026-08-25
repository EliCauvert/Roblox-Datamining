local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local retrievalStatus = require(corePackagesService.Workspace.Packages.Http).Enum.RetrievalStatus
local apiFetchUsersFriendsModule = require(shareGame.Thunks.ApiFetchUsersFriends)
local constantsModule = require(shareGame.Constants)
local userSortsModule = require(robloxGui.Modules.Settings.Enum.UserSorts)
local getFFlagInviteListRerank = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank

return function(p0, p1)
	-- upvalues: retrievalStatus (ref), apiFetchUsersFriendsModule (ref), constantsModule (ref), getFFlagInviteListRerank (ref), userSortsModule (ref)
	return function(p2)
		-- upvalues: p1 (ref), retrievalStatus (copy), apiFetchUsersFriendsModule (copy), p0 (ref), constantsModule (copy), getFFlagInviteListRerank (copy), userSortsModule (copy)
		if p2:getState().Friends.retrievalStatus[p1] ~= retrievalStatus.Fetching then
			p2:dispatch(apiFetchUsersFriendsModule(p0, p1, constantsModule.ThumbnailRequest.InviteToGame, if getFFlagInviteListRerank() then userSortsModule.StatusFrequents else nil))
		end
	end
end