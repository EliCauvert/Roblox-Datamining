local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

local function _(p0)
	return if p0 then if game:GetEngineFeature("VoiceChatServiceExposesChannelId") and p0.service then tostring(p0.service:GetChannelId()) elseif p0.service then tostring(p0.service:GetGroupId()) else "" else ""
end

local function buildState(p1)
	local t = {}
	
	if p1 and p1.participants then
		for i in pairs(p1.participants) do
			local var3 = tonumber(i)
			
			if var3 then
				table.insert(t, var3)
			end
		end
		table.sort(t)
	end
	return {
		sortedPlayerListUserIds = t,
		channelId = if not p1 then if game:GetEngineFeature("VoiceChatServiceExposesChannelId") and p1.service then tostring(p1.service:GetChannelId()) elseif p1.service then tostring(p1.service:GetGroupId()) else "" else "",
		voiceUserCount = #t
	}
end

return {
	useVoiceSnapshot = function(p2)
		-- upvalues: reactModule (ref), buildState (ref)
		local var4 = reactModule.useRef(buildState(p2))
		reactModule.useEffect(function()
			-- upvalues: p2 (ref), var4 (ref), buildState (copy)
			if p2 then
				var4.current = buildState(p2)
				local eventConnection = p2.participantsUpdate.Event:Connect(function()
					-- upvalues: var4 (copy), buildState (copy), p2 (copy)
					var4.current = buildState(p2)
				end)
				
				return function()
					-- upvalues: eventConnection (ref)
					eventConnection:Disconnect()
				end
			end
		end, { p2 })
		
		return var4
	end
}