local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

local function _(p1): string --[[ Line: 16 | Named "computeChannelId" ]]
	return if p1 then if game:GetEngineFeature("VoiceChatServiceExposesChannelId") and p1.service then tostring(p1.service:GetChannelId()) elseif p1.service then tostring(p1.service:GetGroupId()) else "" else ""
end

local function buildState(p1) --[[ Line: 28 ]]
	local List = {}
	
	if p1 and p1.participants then
		for participant in pairs(p1.participants) do
			local Number: number? = tonumber(participant)
			
			if Number then
				table.insert(List, Number)
			end
		end
		table.sort(List)
	end
	return {
		sortedPlayerListUserIds = List,
		channelId = if p1 then if game:GetEngineFeature("VoiceChatServiceExposesChannelId") and p1.service then tostring(p1.service:GetChannelId()) elseif p1.service then tostring(p1.service:GetGroupId()) else "" else "",
		voiceUserCount = #List
	}
end

return {
	useVoiceSnapshot = function(p2) --[[ Line: 53 ]]
		-- upvalues: ReactModule (copy), buildState (copy)
		local UseRefResult = ReactModule.useRef((buildState(p2)))
		ReactModule.useEffect(function() --[[ Line: 56 ]]
			-- upvalues: p2 (copy), UseRefResult (copy), buildState (upval)
			if not p2 then return end
			UseRefResult.current = buildState(p2)
			local EventConnection = p2.participantsUpdate.Event:Connect(function() --[[ Line: 63 ]]
				-- upvalues: UseRefResult (upval), buildState (upval), p2 (upval)
				UseRefResult.current = buildState(p2)
			end)
			
			return function() --[[ Line: 67 ]]
				-- upvalues: EventConnection (copy)
				EventConnection:Disconnect()
			end
		end, { p2 })
		
		return UseRefResult
	end
}