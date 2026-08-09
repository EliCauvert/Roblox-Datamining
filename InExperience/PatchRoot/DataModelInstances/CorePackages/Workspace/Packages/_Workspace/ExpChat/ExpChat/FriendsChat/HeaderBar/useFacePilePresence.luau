local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)
local userPresence = require(parent.Foundation).Enums.UserPresence
local presenceType = dataHydrationModule.Presence.PresenceEnums.PresenceType
local var4 = dataHydrationModule.Presence.PresenceStore.get()

local function _(p0) --[[ line: 26 | named "toUserPresence" ]]
	-- upvalues: presenceType (ref), userPresence (ref)
	return if p0 == presenceType.InGame then userPresence.InExperience elseif p0 == presenceType.InStudio or p0 == presenceType.Online then userPresence.Active else userPresence.None
end

return function(p1) --[[ line: 38 | named "useFacePilePresence" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), userPresence (ref), var4 (ref), presenceType (ref), signalsReactModule (ref)
	local var5 = p1[1]
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 48 ]]
		-- upvalues: signalsModule (copy), var5 (ref), userPresence (copy), var4 (copy), presenceType (copy)
		return signalsModule.createComputed(function(p2) --[[ line: 49 ]]
			-- upvalues: var5 (copy), userPresence (copy), var4 (copy), presenceType (copy)
			if var5 == nil then
				return userPresence.None
			end
			local var6 = var4.GetPresenceByUserId(tostring(var5)).data(p2)
			local var7 = if var6 then var6.userPresenceType else nil
			
			return if var7 == presenceType.InGame then userPresence.InExperience elseif var7 == presenceType.InStudio or var7 == presenceType.Online then userPresence.Active else userPresence.None
		end)
	end, { if var5 ~= nil then "" else tostring(var5) }))
end