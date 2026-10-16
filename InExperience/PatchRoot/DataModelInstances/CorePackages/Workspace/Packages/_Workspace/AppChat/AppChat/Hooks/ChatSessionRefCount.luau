local SessionService = game:GetService("SessionService")
local Parent = script:FindFirstAncestor("AppChat").Parent
local String = require(Parent.LuauPolyfill).String
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local AppChatSessionName = game:DefineFastString("AppChatSessionName", "ChatPage")
local Count = 0
local Count1 = 0

local function createL3Session(SessionService) --[[ Line: 23 ]]
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

local function _(SessionService) --[[ Line: 39 | Named "destroyL3Session" ]]
	-- upvalues: AppChatSessionName (copy)
	if SessionService:SessionExists(AppChatSessionName) then
		SessionService:RemoveSession(AppChatSessionName)
	end
end

return {
	acquire = function(p1) --[[ Line: 45 ]]
		-- upvalues: SessionService (copy), Count1 (ref), Count (ref), createL3Session (copy)
		local P2 = p1 or SessionService
		
		if Count1 > 0 then
			Count1 -= 1
			
			return
		end
		Count += 1
		
		if Count == 1 then
			createL3Session(P2)
		end
	end,
	release = function(p1) --[[ Line: 57 ]]
		-- upvalues: SessionService (copy), Count (ref), AppChatSessionName (copy)
		local P3 = p1 or SessionService
		Count -= 1
		
		if Count == 0 and P3:SessionExists(AppChatSessionName) then
			P3:RemoveSession(AppChatSessionName)
		end
	end,
	reserve = function(p1) --[[ Line: 68 ]]
		-- upvalues: SessionService (copy), Count1 (ref), Count (ref), createL3Session (copy)
		local P4 = p1 or SessionService
		Count1 += 1
		Count += 1
		
		if Count == 1 then
			createL3Session(P4)
		end
	end,
	getCount = function() --[[ Line: 77 ]]
		-- upvalues: Count (ref)
		return Count
	end,
	getReservations = function() --[[ Line: 81 ]]
		-- upvalues: Count1 (ref)
		return Count1
	end,
	_resetForTesting = function() --[[ Line: 85 ]]
		-- upvalues: Count (ref), Count1 (ref)
		Count = 0
		Count1 = 0
	end
}