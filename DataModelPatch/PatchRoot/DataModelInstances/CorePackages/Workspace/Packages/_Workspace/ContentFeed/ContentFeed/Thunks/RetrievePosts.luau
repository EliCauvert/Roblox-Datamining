local Parent = script.Parent.Parent
local GetDeepValueFunction = require(Parent.Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local GetExperiencesDetails = require(Parent.App.Networking).NetworkingGames.GetExperiencesDetails
local GetUniverseIdsModule = require(Parent.Utils.getUniverseIds)
local NetworkingModule = require(Parent.App.Networking)
local _ = require(Parent.Types)

return function(UserId, Cursor, SortOrder)
	-- upvalues: NetworkingModule (copy), GetDeepValueFunction (copy), GetUniverseIdsModule (copy), GetExperiencesDetails (copy)
	return function(p1)
		-- upvalues: NetworkingModule (upval), Cursor (copy), SortOrder (copy), UserId (copy), GetDeepValueFunction (upval), GetUniverseIdsModule (upval), GetExperiencesDetails (upval)
		p1:dispatch(NetworkingModule.ContentSharingNetworking.GetPostsByCursor.API({ cursor = Cursor, sortOrder = SortOrder, userId = UserId })):andThen(function()
			-- upvalues: GetDeepValueFunction (upval), p1 (copy), UserId (upval), GetUniverseIdsModule (upval), GetExperiencesDetails (upval)
			p1:dispatch(GetExperiencesDetails.API((GetUniverseIdsModule(GetDeepValueFunction(p1:getState(), "ContentSharing.byUserId." .. UserId .. ".posts") or {}))))
		end):catch(function() end)
	end
end