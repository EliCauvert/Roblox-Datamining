local httpService = game:GetService("HttpService")
local dependenciesModule = require(script:FindFirstAncestor("Squads").dependencies)
local cryo = dependenciesModule.Cryo
local networkingSquads = dependenciesModule.NetworkingSquads

local function encodeInvitees(p0) --[[ line: 9 ]]
	-- upvalues: cryo (ref), httpService (ref)
	local var3 = cryo.List.map(p0, function(p1) --[[ line: 10 ]]
		return tonumber(p1)
	end)
	local ok, status = pcall(function() --[[ line: 14 ]]
		-- upvalues: httpService (copy), var3 (ref)
		return httpService:JSONEncode(var3)
	end)
	
	return if ok then status else "[]"
end

return function(p2, p3, p4, p5, p6, p7) --[[ line: 25 ]]
	-- upvalues: networkingSquads (ref), encodeInvitees (ref), httpService (ref)
	return function(p8) --[[ line: 33 ]]
		-- upvalues: networkingSquads (copy), p2 (ref), p3 (ref), p5 (ref), p7 (ref), encodeInvitees (copy), p6 (ref), p4 (ref), httpService (copy)
		return p8:dispatch(networkingSquads.SquadInvite.API({
			squadId = p2,
			parentChannelId = p3,
			invitedUserIds = p5,
			isReparented = p7
		})):andThen(function() --[[ line: 41 ]]
			-- upvalues: encodeInvitees (copy), p5 (copy), p6 (copy), p4 (copy)
			p6({
				isSuccess = true,
				inviteeUserIds = encodeInvitees(p5),
				inviteeCount = #p5,
				userId = tonumber(p4)
			})
		end):catch(function(p9) --[[ line: 51 ]]
			-- upvalues: httpService (copy), encodeInvitees (copy), p5 (copy), p6 (copy), p4 (copy)
			local body = p9.Body
			local ok, status = pcall(function() --[[ line: 53 ]]
				-- upvalues: httpService (copy), body (ref)
				return httpService:JSONDecode(body)
			end)
			p6({
				isSuccess = false,
				errorMessage = if ok then status.errorType else nil,
				errorType = if p9.StatusCode then tostring(p9.StatusCode) else nil,
				inviteeUserIds = encodeInvitees(p5),
				inviteeCount = #p5,
				userId = tonumber(p4)
			})
		end)
	end
end