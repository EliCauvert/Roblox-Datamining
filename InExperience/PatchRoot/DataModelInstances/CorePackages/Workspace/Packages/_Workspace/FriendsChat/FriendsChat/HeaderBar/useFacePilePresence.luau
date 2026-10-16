local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local FFlagFriendsChatFacePileGroupPresenceModule = require(FriendsChat.Flags.FFlagFriendsChatFacePileGroupPresence)
local UserPresence = require(Parent.Foundation).Enums.UserPresence
local PresenceType = DataHydrationModule.Presence.PresenceEnums.PresenceType
local GetResult = DataHydrationModule.Presence.PresenceStore.get()

local function _(InGame) --[[ Line: 33 | Named "toUserPresence" ]]
	-- upvalues: PresenceType (copy), UserPresence (copy)
	return if InGame == PresenceType.InGame then UserPresence.InExperience elseif InGame == PresenceType.InStudio or InGame == PresenceType.Online then UserPresence.Active else UserPresence.None
end

local function aggregateGroupPresence(List, p1) --[[ Line: 50 ]]
	-- upvalues: GetResult (copy), PresenceType (copy), UserPresence (copy)
	local Flag = false
	local Flag1 = false
	
	for _, value in List do
		local DataResult = GetResult.GetPresenceByUserId((tostring(value))).data(p1)
		
		if DataResult then
			local UserPresenceType = DataResult.userPresenceType
			
			if UserPresenceType == PresenceType.InGame or UserPresenceType == PresenceType.InStudio then
				Flag = true
			elseif UserPresenceType == PresenceType.Online then
				Flag1 = true
			end
		end
	end
	return if Flag then UserPresence.InExperience elseif Flag1 then UserPresence.Active else UserPresence.None
end

return function(Entry) --[[ Line: 74 | Named "useFacePilePresence" ]]
	-- upvalues: FFlagFriendsChatFacePileGroupPresenceModule (copy), ReactModule (copy), SignalsModule (copy), aggregateGroupPresence (copy), UserPresence (copy), GetResult (copy), PresenceType (copy), SignalsReactModule (copy)
	local Entry1 = Entry[1]
	local v1: boolean = FFlagFriendsChatFacePileGroupPresenceModule and #Entry >= 2
	
	return (SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 91 ]]
		-- upvalues: SignalsModule (upval), v1 (copy), aggregateGroupPresence (upval), Entry (copy), Entry1 (copy), UserPresence (upval), GetResult (upval), PresenceType (upval)
		return SignalsModule.createComputed(function(p2) --[[ Line: 92 ]]
			-- upvalues: v1 (upval), aggregateGroupPresence (upval), Entry (upval), Entry1 (upval), UserPresence (upval), GetResult (upval), PresenceType (upval)
			if v1 then
				return (aggregateGroupPresence(Entry, p2))
			elseif Entry1 == nil then
				return UserPresence.None
			else
				local DataResult = GetResult.GetPresenceByUserId((tostring(Entry1))).data(p2)
				local UserPresenceType = if DataResult then DataResult.userPresenceType else nil
				
				return if UserPresenceType == PresenceType.InGame then UserPresence.InExperience elseif UserPresenceType == PresenceType.InStudio or UserPresenceType == PresenceType.Online then UserPresence.Active else UserPresence.None
			end
		end)
	end, {
		if v1 then table.concat(Entry, ",") elseif Entry1 == nil then "" else tostring(Entry1)
	}))))
end