return function(a)
	local var1 = if a.beginDate and a.beginDate ~= "" then DateTime.fromIsoDate(a.beginDate) else nil
	local var2 = if a.endDate and a.endDate ~= "" then DateTime.fromIsoDate(a.endDate) else nil
	
	if var1 and var2 then
		local var3 = var2.UnixTimestamp - var1.UnixTimestamp > 1800
		
		return {
			isAppealable = var3 or a.onAppeal ~= nil,
			shouldOpenAppealsPortal = var3
		}
	end
	return {
		isAppealable = if a.onAppeal == nil then a.acknowledgeable else true,
		shouldOpenAppealsPortal = a.acknowledgeable
	}
end