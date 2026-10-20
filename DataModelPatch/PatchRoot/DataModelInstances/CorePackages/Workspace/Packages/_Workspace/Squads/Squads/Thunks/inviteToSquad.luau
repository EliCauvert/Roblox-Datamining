local HttpService = game:GetService("HttpService")
local DependenciesModule = require(script:FindFirstAncestor("Squads").dependencies)
local Cryo = DependenciesModule.Cryo
local NetworkingSquads = DependenciesModule.NetworkingSquads

local function encodeInvitees(InvitedUserIds)
	-- upvalues: Cryo (copy), HttpService (copy)
	local MapResult = Cryo.List.map(InvitedUserIds, function(p1): number
		return (tonumber(p1))
	end)
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), MapResult (copy)
		return HttpService:JSONEncode(MapResult)
	end)
	
	return if Success then Result else "[]"
end

return function(SquadId, ParentChannelId, p1, InvitedUserIds, Callback, IsReparented)
	-- upvalues: NetworkingSquads (copy), encodeInvitees (copy), HttpService (copy)
	return function(p2)
		-- upvalues: NetworkingSquads (upval), SquadId (copy), ParentChannelId (copy), InvitedUserIds (copy), IsReparented (copy), encodeInvitees (upval), Callback (copy), p1 (copy), HttpService (upval)
		return p2:dispatch(NetworkingSquads.SquadInvite.API({
			squadId = SquadId,
			parentChannelId = ParentChannelId,
			invitedUserIds = InvitedUserIds,
			isReparented = IsReparented
		})):andThen(function()
			-- upvalues: encodeInvitees (upval), InvitedUserIds (upval), Callback (upval), p1 (upval)
			Callback({
				isSuccess = true,
				inviteeUserIds = encodeInvitees(InvitedUserIds),
				inviteeCount = #InvitedUserIds,
				userId = tonumber(p1)
			})
		end):catch(function(Err)
			-- upvalues: HttpService (upval), encodeInvitees (upval), InvitedUserIds (upval), Callback (upval), p1 (upval)
			local Body = Err.Body
			local Success, Result = pcall(function()
				-- upvalues: HttpService (upval), Body (copy)
				return HttpService:JSONDecode(Body)
			end)
			Callback({
				isSuccess = false,
				errorMessage = if Success then Result.errorType else nil,
				errorType = if Err.StatusCode then tostring(Err.StatusCode) else nil,
				inviteeUserIds = encodeInvitees(InvitedUserIds),
				inviteeCount = #InvitedUserIds,
				userId = tonumber(p1)
			})
		end)
	end
end