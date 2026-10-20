local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local UserPresence = require(Parent.Foundation).Enums.UserPresence
local PresenceType = DataHydrationModule.Presence.PresenceEnums.PresenceType
local GetResult = DataHydrationModule.Presence.PresenceStore.get()

local function _(InGame)
	-- upvalues: PresenceType (copy), UserPresence (copy)
	return if InGame == PresenceType.InGame then UserPresence.InExperience elseif InGame == PresenceType.InStudio or InGame == PresenceType.Online then UserPresence.Active else UserPresence.None
end

return function(Entry)
	-- upvalues: ReactModule (copy), SignalsModule (copy), UserPresence (copy), GetResult (copy), PresenceType (copy), SignalsReactModule (copy)
	local Entry1 = Entry[1]
	
	return (SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Entry1 (copy), UserPresence (upval), GetResult (upval), PresenceType (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Entry1 (upval), UserPresence (upval), GetResult (upval), PresenceType (upval)
			if Entry1 == nil then
				return UserPresence.None
			else
				local DataResult = GetResult.GetPresenceByUserId((tostring(Entry1))).data(p1)
				local UserPresenceType = if DataResult then DataResult.userPresenceType else nil
				
				return if UserPresenceType == PresenceType.InGame then UserPresence.InExperience elseif UserPresenceType == PresenceType.InStudio or UserPresenceType == PresenceType.Online then UserPresence.Active else UserPresence.None
			end
		end)
	end, { if Entry1 == nil then "" else tostring(Entry1) }))))
end