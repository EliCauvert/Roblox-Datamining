local sessionService = game:GetService("SessionService")
local parent = script:FindFirstAncestor("AppChat").Parent
local string = require(parent.LuauPolyfill).String
local sessionType = require(parent.RobloxAppSessionization).SessionType
local appChatSessionName = game:DefineFastString("AppChatSessionName", "ChatPage")
local var2 = 0
local var3 = 0
local t = {}

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

local function _(p1) --[[ line: 39 | named "destroyL3Session" ]]
	-- upvalues: appChatSessionName (ref)
	if p1:SessionExists(appChatSessionName) then
		p1:RemoveSession(appChatSessionName)
	end
end

function t.acquire(p2) --[[ line: 45 ]]
	-- upvalues: sessionService (ref), var3 (write), var2 (write), createL3Session (ref)
	p2 = p2 or sessionService
	
	if var3 > 0 then
		var3 -= 1
		
		return
	end
	var2 += 1
	
	if var2 == 1 then
		createL3Session(p2)
	end
end

function t.release(p3) --[[ line: 57 ]]
	-- upvalues: sessionService (ref), var2 (write), appChatSessionName (ref)
	p3 = p3 or sessionService
	var2 -= 1
	
	if var2 == 0 and p3:SessionExists(appChatSessionName) then
		p3:RemoveSession(appChatSessionName)
	end
end

function t.reserve(p4) --[[ line: 68 ]]
	-- upvalues: sessionService (ref), var3 (write), var2 (write), createL3Session (ref)
	p4 = p4 or sessionService
	var3 += 1
	var2 += 1
	
	if var2 == 1 then
		createL3Session(p4)
	end
end

function t.getCount() --[[ line: 77 ]]
	-- upvalues: var2 (write)
	return var2
end

function t.getReservations() --[[ line: 81 ]]
	-- upvalues: var3 (write)
	return var3
end

function t._resetForTesting() --[[ line: 85 ]]
	-- upvalues: var2 (write), var3 (write)
	var2 = 0
	var3 = 0
end

return t