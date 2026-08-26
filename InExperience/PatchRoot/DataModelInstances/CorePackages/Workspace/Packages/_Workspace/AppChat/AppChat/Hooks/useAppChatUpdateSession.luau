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

local function createL3Session(p1)
	-- upvalues: sessionType (ref), appChatSessionName (ref), string (ref)
	local level2a = sessionType.StructuralIdentifier.Level2a
	
	if p1:SessionExists(level2a) then
		p1:SetSession(level2a, appChatSessionName, appChatSessionName)
		
		if game:GetEngineFeature("SessionGetSessionID") and string.startsWith(p1:GetSessionTag(level2a), "ingame") then
			p1:SetMetadata(appChatSessionName, "InGameSessionId", p1:GetSessionID(level2a))
		end
	end
end

return function(p1, p2)
	-- upvalues: sessionService (ref), fFlagExpChatEnableFriendsTab (ref), useRef (ref), chatSessionRefCountModule (ref), useEffect (ref), createL3Session (ref), appChatSessionName (ref)
	local var1 = p1 == nil or p1
	p2 = p2 or sessionService
	
	if not fFlagExpChatEnableFriendsTab then
		useEffect(function()
			-- upvalues: var1 (ref), createL3Session (copy), p2 (ref), appChatSessionName (copy)
			if var1 then
				createL3Session(p2)
			elseif p2:SessionExists(appChatSessionName) then
				p2:RemoveSession(appChatSessionName)
			end
			return function() end
		end, { p1, p2 })
		
		return
	end
	local var2 = useRef(false)
	
	if var1 then
		if not var2.current then
			chatSessionRefCountModule.acquire(p2)
			var2.current = true
		end
	elseif var2.current then
		chatSessionRefCountModule.release(p2)
		var2.current = false
	end
	useEffect(function()
		-- upvalues: var2 (ref), chatSessionRefCountModule (copy), p2 (ref)
		return function()
			-- upvalues: var2 (copy), chatSessionRefCountModule (copy), p2 (copy)
			if var2.current then
				chatSessionRefCountModule.release(p2)
				var2.current = false
			end
		end
	end, {})
end