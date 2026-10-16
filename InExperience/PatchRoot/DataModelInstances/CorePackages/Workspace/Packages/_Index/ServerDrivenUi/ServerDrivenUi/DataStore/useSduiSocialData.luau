local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local PresenceType = require(Parent.DataHydration).Presence.PresenceEnums.PresenceType
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(Parent.SduiCoreSystem)
local UseGetOnlineFriendsFunction = require(Parent.FriendsHydrationReact).useGetOnlineFriends
local FFlagSduiSocialDataMigrateOffLegacyPresence = require(Parent.SharedFlags).FFlagSduiSocialDataMigrateOffLegacyPresence

local function useOnlineFriendsInGameByUniverseId() --[[ Line: 24 ]]
	-- upvalues: UseGetOnlineFriendsFunction (copy), ReactModule (copy), PresenceType (copy)
	local UseGetOnlineFriendsResult = UseGetOnlineFriendsFunction()
	
	return ReactModule.useMemo(function() --[[ Line: 27 ]]
		-- upvalues: UseGetOnlineFriendsResult (copy), PresenceType (upval)
		local t = {}
		local UseGetOnlineFriendsResult1 = UseGetOnlineFriendsResult or {}
		for _, value in UseGetOnlineFriendsResult1 do
			local Presence = value.presence
			
			if Presence and Presence.userPresenceType == PresenceType.InGame and Presence.universeId and Presence.universeId ~= "" then
				local Entry = t[Presence.universeId] or {}
				Entry[value.id] = value.id
				t[Presence.universeId] = Entry
			end
		end
		return t
	end, { UseGetOnlineFriendsResult })
end

local function useFriendsInGame() --[[ Line: 47 ]]
	-- upvalues: UseSelectorFunction (copy), ReactModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 48 ]]
		return p1.LocalUserId
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1) --[[ Line: 52 ]]
		return p1.InGameUsersByGame
	end)
	
	return ReactModule.useMemo(function() --[[ Line: 56 ]]
		-- upvalues: UseSelectorResult1 (copy), UseSelectorResult (copy)
		local t = {}
		
		for i, value in UseSelectorResult1 do
			local t1 = {}
			
			for i1, _ in value do
				if i1 ~= tostring(UseSelectorResult) then
					t1[i1] = i1
				end
			end
			if next(t1) then
				t[tostring(i)] = t1
			end
		end
		return t
	end, { UseSelectorResult, UseSelectorResult1 })
end

return function() --[[ Line: 74 | Named "useSduiSocialData" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), FFlagSduiSocialDataMigrateOffLegacyPresence (copy), useOnlineFriendsInGameByUniverseId (copy), useFriendsInGame (copy)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 75 ]]
		-- upvalues: SignalsModule (upval)
		return SignalsModule.createSignal({})
	end, {})
	UseMemoResult2(if FFlagSduiSocialDataMigrateOffLegacyPresence then useOnlineFriendsInGameByUniverseId() else useFriendsInGame())
	
	return ReactModule.useMemo(function() --[[ Line: 85 ]]
		-- upvalues: UseMemoResult (copy)
		return { getInGameFriendsByGame = UseMemoResult }
	end, { UseMemoResult })
end