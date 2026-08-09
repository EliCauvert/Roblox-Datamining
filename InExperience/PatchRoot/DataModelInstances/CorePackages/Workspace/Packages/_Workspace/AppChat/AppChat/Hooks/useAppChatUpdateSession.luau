local sessionService = game:GetService("SessionService")
local parent = script:FindFirstAncestor("AppChat").Parent
local useEffect = require(parent.React).useEffect
local string = require(parent.LuauPolyfill).String
local sessionType = require(parent.RobloxAppSessionization).SessionType
local appChatSessionName = game:DefineFastString("AppChatSessionName", "ChatPage")

return function(p0, p1) --[[ line: 19 ]]
	-- upvalues: sessionService (ref), useEffect (ref), sessionType (ref), appChatSessionName (ref), string (ref)
	p1 = p1 or sessionService
	useEffect(function() --[[ line: 22 ]]
		-- upvalues: p0 (ref), sessionType (copy), p1 (ref), appChatSessionName (copy), string (copy)
		if p0 then
			local level2a = sessionType.StructuralIdentifier.Level2a
			
			if p1:SessionExists(level2a) then
				p1:SetSession(level2a, appChatSessionName, appChatSessionName)
				
				if game:GetEngineFeature("SessionGetSessionID") and string.startsWith(p1:GetSessionTag(level2a), "ingame") then
					p1:SetMetadata(appChatSessionName, "InGameSessionId", p1:GetSessionID(level2a))
				end
			end
		elseif p1:SessionExists(appChatSessionName) then
			p1:RemoveSession(appChatSessionName)
		end
		return function() --[[ line: 43 ]] end
	end, { p0, p1 })
end