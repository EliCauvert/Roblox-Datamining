return function(p1)
	local _DateTime = if p1.beginDate and p1.beginDate ~= "" then DateTime.fromIsoDate(p1.beginDate) else nil
	local _DateTime1 = if p1.endDate and p1.endDate ~= "" then DateTime.fromIsoDate(p1.endDate) else nil
	
	if _DateTime and _DateTime1 then
		local IsUnixTimestampAbove = _DateTime1.UnixTimestamp - _DateTime.UnixTimestamp > 1800
		
		return {
			isAppealable = IsUnixTimestampAbove or p1.onAppeal ~= nil,
			shouldOpenAppealsPortal = IsUnixTimestampAbove
		}
	else
		return {
			isAppealable = p1.onAppeal ~= nil or p1.acknowledgeable,
			shouldOpenAppealsPortal = p1.acknowledgeable
		}
	end
end