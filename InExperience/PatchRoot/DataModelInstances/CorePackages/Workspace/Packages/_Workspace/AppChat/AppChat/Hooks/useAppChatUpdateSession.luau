local SessionService = game:GetService("SessionService")
local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local String = require(Parent.LuauPolyfill).String
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local ChatSessionRefCountModule = require(script.Parent.ChatSessionRefCount)
local AppChatSessionName = game:DefineFastString("AppChatSessionName", "ChatPage")

local function createL3Session(SessionService)
	-- upvalues: SessionType (copy), AppChatSessionName (copy), String (copy)
	local Level2a = SessionType.StructuralIdentifier.Level2a
	
	if SessionService:SessionExists(Level2a) then
		SessionService:SetSession(Level2a, AppChatSessionName, AppChatSessionName)
		local SessionTag = SessionService:GetSessionTag(Level2a)
		
		if game:GetEngineFeature("SessionGetSessionID") and String.startsWith(SessionTag, "ingame") then
			SessionService:SetMetadata(AppChatSessionName, "InGameSessionId", (SessionService:GetSessionID(Level2a)))
		end
	end
end

return function(p1, p2)
	-- upvalues: SessionService (copy), FFlagExpChatEnableFriendsTab (copy), UseRefFunction (copy), ChatSessionRefCountModule (copy), UseEffectFunction (copy), createL3Session (copy), AppChatSessionName (copy)
	local v1 = p1 == nil or p1
	local P2 = p2 or SessionService
	
	if not FFlagExpChatEnableFriendsTab then
		UseEffectFunction(function()
			-- upvalues: v1 (copy), createL3Session (upval), P2 (copy), AppChatSessionName (upval)
			if v1 then
				createL3Session(P2)
			elseif P2:SessionExists(AppChatSessionName) then
				P2:RemoveSession(AppChatSessionName)
			end
			return function() end
		end, { p1, P2 })
		
		return
	end
	local UseRefResult = UseRefFunction(false)
	
	if v1 then
		if not UseRefResult.current then
			ChatSessionRefCountModule.acquire(P2)
			UseRefResult.current = true
		end
	elseif UseRefResult.current then
		ChatSessionRefCountModule.release(P2)
		UseRefResult.current = false
	end
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), ChatSessionRefCountModule (upval), P2 (copy)
		return function()
			-- upvalues: UseRefResult (upval), ChatSessionRefCountModule (upval), P2 (upval)
			if UseRefResult.current then
				ChatSessionRefCountModule.release(P2)
				UseRefResult.current = false
			end
		end
	end, {})
end