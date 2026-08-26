local httpService = game:GetService("HttpService")
local dependenciesModule = require(script:FindFirstAncestor("Squads").dependencies)
local cryo = dependenciesModule.Cryo
local networkingSquads = dependenciesModule.NetworkingSquads

local function encodeInvitees(p1)
	-- upvalues: cryo (ref), httpService (ref)
	local var1 = cryo.List.map(p1, function(p2)
		return tonumber(p2)
	end)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), var1 (ref)
		return httpService:JSONEncode(var1)
	end)
	
	return if ok then status else "[]"
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: networkingSquads (ref), encodeInvitees (ref), httpService (ref)
	return function(p7)
		-- upvalues: networkingSquads (copy), p1 (ref), p2 (ref), p4 (ref), p6 (ref), encodeInvitees (copy), p5 (ref), p3 (ref), httpService (copy)
		return p7:dispatch(networkingSquads.SquadInvite.API({
			squadId = p1,
			parentChannelId = p2,
			invitedUserIds = p4,
			isReparented = p6
		})):andThen(function()
			-- upvalues: encodeInvitees (copy), p4 (copy), p5 (copy), p3 (copy)
			p5({
				isSuccess = true,
				inviteeUserIds = encodeInvitees(p4),
				inviteeCount = #p4,
				userId = tonumber(p3)
			})
		end):catch(function(p8)
			-- upvalues: httpService (copy), encodeInvitees (copy), p4 (copy), p5 (copy), p3 (copy)
			local body = p8.Body
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), body (ref)
				return httpService:JSONDecode(body)
			end)
			p5({
				isSuccess = false,
				errorMessage = if ok then status.errorType else nil,
				errorType = if p8.StatusCode then tostring(p8.StatusCode) else nil,
				inviteeUserIds = encodeInvitees(p4),
				inviteeCount = #p4,
				userId = tonumber(p3)
			})
		end)
	end
end