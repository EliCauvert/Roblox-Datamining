local SessionService = game:GetService("SessionService")
local Parent = script:FindFirstAncestor("AppChat").Parent
local UseEffectFunction = require(Parent.React).useEffect
local String = require(Parent.LuauPolyfill).String
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local AppChatSessionName = game:DefineFastString("AppChatSessionName", "ChatPage")

return function(p1, p2)
	-- upvalues: SessionService (copy), UseEffectFunction (copy), SessionType (copy), AppChatSessionName (copy), String (copy)
	local P1 = p2 or SessionService
	UseEffectFunction(function()
		-- upvalues: p1 (copy), SessionType (upval), P1 (copy), AppChatSessionName (upval), String (upval)
		if p1 then
			local Level2a = SessionType.StructuralIdentifier.Level2a
			
			if P1:SessionExists(Level2a) then
				P1:SetSession(Level2a, AppChatSessionName, AppChatSessionName)
				local SessionTag = P1:GetSessionTag(Level2a)
				
				if game:GetEngineFeature("SessionGetSessionID") and String.startsWith(SessionTag, "ingame") then
					P1:SetMetadata(AppChatSessionName, "InGameSessionId", (P1:GetSessionID(Level2a)))
				end
			end
		elseif P1:SessionExists(AppChatSessionName) then
			P1:RemoveSession(AppChatSessionName)
		end
		return function() end
	end, { p1, P1 })
end