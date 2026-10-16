return {
	MS_PER_DAY = 86400000,
	toStartMs = function(p1) --[[ Line: 34 ]]
		if type(p1) == "string" then
			local Success, Result = pcall(DateTime.fromIsoDate, p1)
			
			return if Success and Result ~= nil then Result.UnixTimestampMillis else 0
		else
			return 0
		end
	end,
	campaignEndMs = function(p1, p2: number): number --[[ Line: 46 ]]
		return p1 + math.max(0, p2 - 1) * 86400000
	end,
	campaignEndExclusiveMs = function(p1, p2: number): number --[[ Line: 51 ]]
		return p1 + math.max(0, p2) * 86400000
	end,
	hasActiveCampaign = function(List, p1, p2): boolean --[[ Line: 72 ]]
		if List == nil or p1 == nil or p1 == 0 then
			return false
		end
		local Text = tostring(p1)
		
		for _, value in List do
			if value.targetUniverseId == Text and (value.status ~= "CANCELLED" and value.deliveryStatus ~= "REJECTED") then
				if value.deliveryStatus == "IN_REVIEW" then
					return true
				end
				if value.status ~= "PAUSED" then
					local StartTime = value.schedule.startTime
					local UnixTimestampMillis = nil
					
					if type(StartTime) == "string" then
						local Success, Result = pcall(DateTime.fromIsoDate, StartTime)
						UnixTimestampMillis = if Success and Result ~= nil then Result.UnixTimestampMillis else 0
					else
						UnixTimestampMillis = 0
					end
					local IsDurationInDaysAbove: boolean = UnixTimestampMillis > 0 and value.schedule.durationInDays > 0
					
					if value.deliveryStatus == "SERVING" and not IsDurationInDaysAbove then
						return true
					elseif p2 < UnixTimestampMillis + math.max(0, value.schedule.durationInDays) * 86400000 then
						return true
					end
					continue
				end
			end
		end
		return false
	end
}