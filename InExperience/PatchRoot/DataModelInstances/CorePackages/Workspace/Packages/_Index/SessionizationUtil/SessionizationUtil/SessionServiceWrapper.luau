local sessionService = game:GetService("SessionService")

return {
	SessionChangedSignal = require(script:FindFirstAncestor("SessionizationUtil").Parent.AppCommonLib).Signal.new(),
	GetRootSID = function(_)
		-- upvalues: sessionService (ref)
		return sessionService:GetRootSID()
	end,
	SetSession = function(value, p1, p2, p3)
		-- upvalues: sessionService (ref)
		local var1 = sessionService:GetSessionTag(p2)
		sessionService:SetSession(p1, p2, p3)
		local var2 = sessionService:GetSessionTag(p2)
		
		if var2 ~= var1 then
			value.SessionChangedSignal:fire(p2, var2)
		end
	end,
	ReplaceSession = function(p1, p2, p3)
		-- upvalues: sessionService (ref)
		local var1 = sessionService:GetSessionTag(p2)
		sessionService:ReplaceSession(p2, p3)
		local var2 = sessionService:GetSessionTag(p2)
		
		if var2 ~= var1 then
			p1.SessionChangedSignal:fire(p2, var2)
		end
	end,
	RemoveSession = function(_, p1)
		-- upvalues: sessionService (ref)
		sessionService:RemoveSession(p1)
	end,
	RemoveSessionsWithMetadataKey = function(_, p1)
		-- upvalues: sessionService (ref)
		sessionService:RemoveSessionsWithMetadataKey(p1)
	end,
	GetMetadata = function(_, p1, p2)
		-- upvalues: sessionService (ref)
		return sessionService:GetMetadata(p1, p2)
	end,
	SetMetadata = function(_, p1, p2, p3)
		-- upvalues: sessionService (ref)
		sessionService:SetMetadata(p1, p2, p3)
	end,
	RemoveMetadata = function(_, p1, p2)
		-- upvalues: sessionService (ref)
		sessionService:RemoveMetadata(p1, p2)
	end,
	SessionExists = function(_, p1)
		-- upvalues: sessionService (ref)
		return sessionService:SessionExists(p1)
	end,
	GetSessionTag = function(_, p1)
		-- upvalues: sessionService (ref)
		return sessionService:GetSessionTag(p1)
	end,
	generateSessionInfoString = function(_, p1, p2, p3, p4)
		-- upvalues: sessionService (ref)
		return sessionService:GenerateSessionInfoString(p1, p2, p3, p4)
	end
}