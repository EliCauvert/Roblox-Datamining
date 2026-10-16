local SessionService = game:GetService("SessionService")

return {
	SessionChangedSignal = require(script:FindFirstAncestor("SessionizationUtil").Parent.AppCommonLib).Signal.new(),
	GetRootSID = function(_) --[[ Line: 15 ]]
		-- upvalues: SessionService (copy)
		return SessionService:GetRootSID()
	end,
	SetSession = function(p1, ParentSid, Sid, Tag) --[[ Line: 19 ]]
		-- upvalues: SessionService (copy)
		local SessionTag = SessionService:GetSessionTag(Sid)
		SessionService:SetSession(ParentSid, Sid, Tag)
		local SessionTag1 = SessionService:GetSessionTag(Sid)
		
		if SessionTag1 ~= SessionTag then
			p1.SessionChangedSignal:fire(Sid, SessionTag1)
		end
	end,
	ReplaceSession = function(p1, Sid, Tag) --[[ Line: 31 ]]
		-- upvalues: SessionService (copy)
		local SessionTag = SessionService:GetSessionTag(Sid)
		SessionService:ReplaceSession(Sid, Tag)
		local SessionTag1 = SessionService:GetSessionTag(Sid)
		
		if SessionTag1 ~= SessionTag then
			p1.SessionChangedSignal:fire(Sid, SessionTag1)
		end
	end,
	RemoveSession = function(_, Sid) --[[ Line: 43 ]]
		-- upvalues: SessionService (copy)
		SessionService:RemoveSession(Sid)
	end,
	RemoveSessionsWithMetadataKey = function(_, Key) --[[ Line: 47 ]]
		-- upvalues: SessionService (copy)
		SessionService:RemoveSessionsWithMetadataKey(Key)
	end,
	GetMetadata = function(_, Sid, Key) --[[ Line: 51 ]]
		-- upvalues: SessionService (copy)
		return SessionService:GetMetadata(Sid, Key)
	end,
	SetMetadata = function(_, Sid, Key, Value) --[[ Line: 55 ]]
		-- upvalues: SessionService (copy)
		SessionService:SetMetadata(Sid, Key, Value)
	end,
	RemoveMetadata = function(_, Sid, Key) --[[ Line: 59 ]]
		-- upvalues: SessionService (copy)
		SessionService:RemoveMetadata(Sid, Key)
	end,
	SessionExists = function(_, Sid) --[[ Line: 63 ]]
		-- upvalues: SessionService (copy)
		return SessionService:SessionExists(Sid)
	end,
	GetSessionTag = function(_, Sid) --[[ Line: 67 ]]
		-- upvalues: SessionService (copy)
		return SessionService:GetSessionTag(Sid)
	end,
	generateSessionInfoString = function(_, IncludeArbitrarySessions, IncludeTag, IncludeTimestamps, IncludeMetadata) --[[ Line: 71 ]]
		-- upvalues: SessionService (copy)
		return SessionService:GenerateSessionInfoString(IncludeArbitrarySessions, IncludeTag, IncludeTimestamps, IncludeMetadata)
	end
}