return function(a)
	local var0 = if a.beginDate and a.beginDate ~= "" then DateTime.fromIsoDate(a.beginDate) else nil
	local var1 = if a.endDate and a.endDate ~= "" then DateTime.fromIsoDate(a.endDate) else nil
	
	if var0 and var1 then
		local var2 = var1.UnixTimestamp - var0.UnixTimestamp > 1800
		
		return {
			isAppealable = var2 or a.onAppeal ~= nil,
			shouldOpenAppealsPortal = var2
		}
	end
	return {
		isAppealable = if a.onAppeal == nil then a.acknowledgeable else true,
		shouldOpenAppealsPortal = a.acknowledgeable
	}
end