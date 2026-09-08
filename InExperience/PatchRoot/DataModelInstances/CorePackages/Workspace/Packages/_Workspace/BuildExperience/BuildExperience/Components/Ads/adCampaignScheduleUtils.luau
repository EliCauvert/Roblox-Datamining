return {
	MS_PER_DAY = 86400000,
	toStartMs = function(p1)
		if type(p1) ~= "string" then
			return 0
		end
		local ok, status = pcall(DateTime.fromIsoDate, p1)
		
		return if ok and status ~= nil then status.UnixTimestampMillis else 0
	end,
	campaignEndMs = function(p1, p2)
		return p1 + math.max(0, p2 - 1) * 86400000
	end,
	campaignEndExclusiveMs = function(p1, p2)
		return p1 + math.max(0, p2) * 86400000
	end,
	hasActiveCampaign = function(p1, p2, p3)
		if p1 == nil or p2 == nil or p2 == 0 then
			return false
		end
		local var1 = tostring(p2)
		
		for i, v in p1 do
			if v.targetUniverseId == var1 then
				if not (if v.status ~= "CANCELLED" then v.deliveryStatus == "REJECTED" else true) then
					if v.deliveryStatus ~= "IN_REVIEW" then
						if v.status ~= "PAUSED" then
							local var2
							local startTime = v.schedule.startTime
							
							if type(startTime) == "string" then
								local ok, status = pcall(DateTime.fromIsoDate, startTime)
								var2 = if ok and status ~= nil then status.UnixTimestampMillis else 0
							else
								var2 = 0
							end
							startTime = var2 > 0 and v.schedule.durationInDays > 0
							
							if v.deliveryStatus ~= "SERVING" or startTime then
								if p3 < var2 + math.max(0, v.schedule.durationInDays) * 86400000 then
									return true
								end
							end
							return true
						end
					end
					return true
				end
			end
		end
		return false
	end
}