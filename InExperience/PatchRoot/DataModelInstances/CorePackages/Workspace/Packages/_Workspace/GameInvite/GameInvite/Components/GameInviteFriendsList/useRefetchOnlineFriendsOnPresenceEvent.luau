local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local UseRealtimeNamespaceFunction = require(Parent.RealtimeDelivery).useRealtimeNamespace
local UserModel = require(Parent.UserLib).Models.UserModel
local _ = require(script.Parent.GameInviteFriendRow)
local FIntGameInviteOnlineFriendsRefetchThrottleSecModule = require(GameInvite.Flags.FIntGameInviteOnlineFriendsRefetchThrottleSec)

local function _(p1): boolean
	local PresenceReport = p1.PresenceReport
	
	return PresenceReport ~= nil and PresenceReport.userPresenceType == 0
end

local function hasListedFriendComeOnline(List, Current): boolean
	-- upvalues: UserModel (copy)
	for _, Player in List do
		local CurrentEntry = Current[tostring(Player.UserId)]
		local NoCurrentEntry: boolean = CurrentEntry == nil or CurrentEntry.presence ~= UserModel.PresenceType.OFFLINE
		
		if not NoCurrentEntry then
			local PresenceReport = Player.PresenceReport
			NoCurrentEntry = PresenceReport ~= nil and PresenceReport.userPresenceType == 0
		end
		if not NoCurrentEntry then
			return true
		end
	end
	return false
end

return function(Current)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), UseRealtimeNamespaceFunction (copy), hasListedFriendComeOnline (copy), FIntGameInviteOnlineFriendsRefetchThrottleSecModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef(os.clock())
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), DataHydrationModule (upval)
		UseRefResult2.current = nil
		UseRefResult1.current = os.clock()
		DataHydrationModule.Friends.FriendsStore.get().RefetchOnlineFriends()
	end, {})
	UseRealtimeNamespaceFunction("PresenceBulkNotifications", function(p1)
		-- upvalues: UseRefResult2 (copy), hasListedFriendComeOnline (upval), UseRefResult (copy), FIntGameInviteOnlineFriendsRefetchThrottleSecModule (upval), UseRefResult1 (copy), UseResult (copy)
		if type(p1) ~= "table" or UseRefResult2.current ~= nil then return end
		if not hasListedFriendComeOnline(p1, UseRefResult.current) then return end
		local FIntGameInviteOnlineFriendsRefetchThrottleSecModuleDelta = FIntGameInviteOnlineFriendsRefetchThrottleSecModule - (os.clock() - UseRefResult1.current)
		
		if FIntGameInviteOnlineFriendsRefetchThrottleSecModuleDelta <= 0 then
			UseResult()
			
			return
		else
			UseRefResult2.current = task.delay(FIntGameInviteOnlineFriendsRefetchThrottleSecModuleDelta, UseResult)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy)
		return function()
			-- upvalues: UseRefResult2 (upval)
			local Current = UseRefResult2.current
			
			if Current ~= nil then
				task.cancel(Current)
				UseRefResult2.current = nil
			end
		end
	end, {})
end