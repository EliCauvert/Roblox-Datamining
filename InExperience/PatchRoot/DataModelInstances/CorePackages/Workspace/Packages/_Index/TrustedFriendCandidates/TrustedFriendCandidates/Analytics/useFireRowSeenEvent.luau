local ReactModule = require(script:FindFirstAncestor("TrustedFriendCandidates").Parent.React)
local EventNamesModule = require(script.Parent.EventNames)
local FireAnalyticsEventModule = require(script.Parent.fireAnalyticsEvent)

local function fireRowSeenEvent(Infos)
	-- upvalues: FireAnalyticsEventModule (copy), EventNamesModule (copy)
	if #Infos == 0 then return end
	local TargetUserId = ""
	local AbsolutePosition = ""
	local ContextType = ""
	local FriendRequestOriginSource = ""
	local CandidateState = ""
	
	for _, info in Infos do
		TargetUserId ..= info.targetUserId .. ","
		AbsolutePosition ..= info.absolutePosition .. ","
		ContextType ..= info.contextType or "" .. ","
		FriendRequestOriginSource ..= info.friendRequestOriginSource or "" .. ","
		CandidateState ..= info.candidateState or "" .. ","
	end
	FireAnalyticsEventModule(EventNamesModule.RowSeen, {
		targetUserId = TargetUserId,
		absolutePosition = AbsolutePosition,
		contextType = ContextType,
		friendRequestOriginSource = FriendRequestOriginSource,
		candidateState = CandidateState
	})
end

return function()
	-- upvalues: ReactModule (copy), fireRowSeenEvent (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef({})
	
	return {
		onRowAnalyticsInfo = ReactModule.useCallback(function(Info, IsReady)
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), fireRowSeenEvent (upval)
			UseRefResult.current[Info.absolutePosition] = { info = Info, isReady = IsReady }
			
			if IsReady and UseRefResult1.current[Info.targetUserId] == false then
				UseRefResult1.current[Info.targetUserId] = true
				fireRowSeenEvent({ Info })
			end
		end, {}),
		sendImpressions = ReactModule.useCallback(function(List)
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), fireRowSeenEvent (upval)
			local Infos = {}
			
			for _, value in List do
				local CurrentEntry = UseRefResult.current[value]
				
				if CurrentEntry and UseRefResult1.current[CurrentEntry.info.targetUserId] == nil then
					UseRefResult1.current[CurrentEntry.info.targetUserId] = CurrentEntry.isReady
					
					if CurrentEntry.isReady then
						table.insert(Infos, CurrentEntry.info)
					end
				end
			end
			fireRowSeenEvent(Infos)
		end, {})
	}
end