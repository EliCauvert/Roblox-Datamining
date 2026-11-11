local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ResultModule = require(Modules.LuaApp.Result)
local DEPRECATEDFriendsGetFriendStatusesFunction = require(CorePackages.Workspace.Packages.Http).Requests.DEPRECATED_FriendsGetFriendStatuses
local AddFriendStatusModule = require(Modules.LuaApp.Actions.AddFriendStatus)

local function _(p1)
	return if p1 == "NotFriends" then Enum.FriendStatus.NotFriend elseif p1 == "Friends" then Enum.FriendStatus.Friend elseif p1 == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif p1 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
end

return function(p1, p2)
	-- upvalues: CryoModule (copy), PerformFetch (copy), DEPRECATEDFriendsGetFriendStatusesFunction (copy), ResultModule (copy), AddFriendStatusModule (copy), PromiseModule (copy)
	local JoinResult = CryoModule.Dictionary.join({}, p2)
	table.sort(JoinResult)
	
	return PerformFetch.Single("luaapp.friends.statuses." .. table.concat(JoinResult), function(p3)
		-- upvalues: DEPRECATEDFriendsGetFriendStatusesFunction (upval), p1 (copy), p2 (copy), ResultModule (upval), AddFriendStatusModule (upval), PromiseModule (upval)
		return DEPRECATEDFriendsGetFriendStatusesFunction(p1, p2):andThen(function(Result)
			-- upvalues: ResultModule (upval), p3 (copy), AddFriendStatusModule (upval), PromiseModule (upval)
			if not Result or not Result.responseBody or not Result.responseBody.data then
				return PromiseModule.reject()
			end
			local Data = Result.responseBody.data
			
			if type(Data) ~= "table" then
				return ResultModule.error("ApiFetchFriendStatuses expects entries to be a table")
			end
			for i = 1, #Data do
				local Entry = Data[i]
				
				if type(Entry.id) ~= "number" then
					return ResultModule.error("ApiFetchFriendStatuses expects entry.id to be a number")
				elseif type(Entry.status) == "string" then
					local Status = Entry.status
					p3:dispatch(AddFriendStatusModule(tostring(Entry.id), if Status == "NotFriends" then Enum.FriendStatus.NotFriend elseif Status == "Friends" then Enum.FriendStatus.Friend elseif Status == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif Status == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown))
				else
					return ResultModule.error("ApiFetchFriendStatuses expects entry.status to be a string")
				end
			end
			return PromiseModule.resolve(Result)
		end, function(p4)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject(p4)
		end)
	end)
end