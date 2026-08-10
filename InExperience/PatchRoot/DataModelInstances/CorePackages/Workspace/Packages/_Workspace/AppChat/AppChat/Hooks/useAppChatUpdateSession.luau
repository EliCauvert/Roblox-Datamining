local sessionService = game:GetService("SessionService")
local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local string = require(parent.LuauPolyfill).String
local sessionType = require(parent.RobloxAppSessionization).SessionType
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local chatSessionRefCountModule = require(script.Parent.ChatSessionRefCount)
local appChatSessionName = game:DefineFastString("AppChatSessionName", "ChatPage")

local function createL3Session(p0) --[[ line: 23 ]]
	-- upvalues: sessionType (ref), appChatSessionName (ref), string (ref)
	local level2a = sessionType.StructuralIdentifier.Level2a
	
	if p0:SessionExists(level2a) then
		p0:SetSession(level2a, appChatSessionName, appChatSessionName)
		
		if game:GetEngineFeature("SessionGetSessionID") and string.startsWith(p0:GetSessionTag(level2a), "ingame") then
			p0:SetMetadata(appChatSessionName, "InGameSessionId", p0:GetSessionID(level2a))
		end
	end
end

return function(p1, p2) --[[ line: 36 ]]
	-- upvalues: sessionService (ref), fFlagExpChatEnableFriendsTab (ref), useRef (ref), chatSessionRefCountModule (ref), useEffect (ref), createL3Session (ref), appChatSessionName (ref)
	local var5 = p1 == nil or p1
	p2 = p2 or sessionService
	
	if not fFlagExpChatEnableFriendsTab then
		useEffect(function() --[[ line: 64 ]]
			-- upvalues: var5 (ref), createL3Session (copy), p2 (ref), appChatSessionName (copy)
			if var5 then
				createL3Session(p2)
			elseif p2:SessionExists(appChatSessionName) then
				p2:RemoveSession(appChatSessionName)
			end
			return function() --[[ line: 74 ]] end
		end, { p1, p2 })
		
		return
	end
	local var7 = useRef(false)
	
	if var5 then
		if not var7.current then
			chatSessionRefCountModule.acquire(p2)
			var7.current = true
		end
	elseif var7.current then
		chatSessionRefCountModule.release(p2)
		var7.current = false
	end
	useEffect(function() --[[ line: 55 ]]
		-- upvalues: var7 (ref), chatSessionRefCountModule (copy), p2 (ref)
		return function() --[[ line: 56 ]]
			-- upvalues: var7 (copy), chatSessionRefCountModule (copy), p2 (copy)
			if var7.current then
				chatSessionRefCountModule.release(p2)
				var7.current = false
			end
		end
	end, {})
end