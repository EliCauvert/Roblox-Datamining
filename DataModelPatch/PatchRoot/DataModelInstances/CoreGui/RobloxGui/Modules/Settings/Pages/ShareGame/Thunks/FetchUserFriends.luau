local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ShareGame = RobloxGui.Modules.Settings.Pages.ShareGame
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local ApiFetchUsersFriendsModule = require(ShareGame.Thunks.ApiFetchUsersFriends)
local ConstantsModule = require(ShareGame.Constants)
local UserSortsModule = require(RobloxGui.Modules.Settings.Enum.UserSorts)
local GetFFlagInviteListRerankFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank

return function(p1, p2)
	-- upvalues: RetrievalStatus (copy), ApiFetchUsersFriendsModule (copy), ConstantsModule (copy), GetFFlagInviteListRerankFunction (copy), UserSortsModule (copy)
	return function(p3)
		-- upvalues: p2 (copy), RetrievalStatus (upval), ApiFetchUsersFriendsModule (upval), p1 (copy), ConstantsModule (upval), GetFFlagInviteListRerankFunction (upval), UserSortsModule (upval)
		if p3:getState().Friends.retrievalStatus[p2] ~= RetrievalStatus.Fetching then
			p3:dispatch(ApiFetchUsersFriendsModule(p1, p2, ConstantsModule.ThumbnailRequest.InviteToGame, if GetFFlagInviteListRerankFunction() then UserSortsModule.StatusFrequents else nil))
		end
	end
end