local sessionService = game:GetService("SessionService")
local parent = script:FindFirstAncestor("AppChat").Parent
local string = require(parent.LuauPolyfill).String
local sessionType = require(parent.RobloxAppSessionization).SessionType
local appChatSessionName = game:DefineFastString("AppChatSessionName", "ChatPage")
local var1 = 0
local var2 = 0
local t = {}

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

local function _(p1)
	-- upvalues: appChatSessionName (ref)
	if p1:SessionExists(appChatSessionName) then
		p1:RemoveSession(appChatSessionName)
	end
end

function t.acquire(p1)
	-- upvalues: sessionService (ref), var2 (write), var1 (write), createL3Session (ref)
	p1 = p1 or sessionService
	
	if var2 > 0 then
		var2 -= 1
		
		return
	end
	var1 += 1
	
	if var1 == 1 then
		createL3Session(p1)
	end
end

function t.release(p1)
	-- upvalues: sessionService (ref), var1 (write), appChatSessionName (ref)
	p1 = p1 or sessionService
	var1 -= 1
	
	if var1 == 0 and p1:SessionExists(appChatSessionName) then
		p1:RemoveSession(appChatSessionName)
	end
end

function t.reserve(p1)
	-- upvalues: sessionService (ref), var2 (write), var1 (write), createL3Session (ref)
	p1 = p1 or sessionService
	var2 += 1
	var1 += 1
	
	if var1 == 1 then
		createL3Session(p1)
	end
end

function t.getCount()
	-- upvalues: var1 (write)
	return var1
end

function t.getReservations()
	-- upvalues: var2 (write)
	return var2
end

function t._resetForTesting()
	-- upvalues: var1 (write), var2 (write)
	var1 = 0
	var2 = 0
end

return t