local SubscriptionStatusModelModule = {
	new = function()
		return { isSubscribed = false, isRenewing = false }
	end
}

function SubscriptionStatusModelModule.mock(IsSubscribed, IsRenewing)
	-- upvalues: SubscriptionStatusModelModule (copy)
	local NewSubscriptionStatusModel = SubscriptionStatusModelModule.new()
	NewSubscriptionStatusModel.isSubscribed = IsSubscribed
	NewSubscriptionStatusModel.isRenewing = IsRenewing
	
	return NewSubscriptionStatusModel
end

function SubscriptionStatusModelModule.fromJsonData(p1)
	-- upvalues: SubscriptionStatusModelModule (copy)
	local NewSubscriptionStatusModel = SubscriptionStatusModelModule.new()
	NewSubscriptionStatusModel.isSubscribed = p1.isSubscribed
	NewSubscriptionStatusModel.isRenewing = p1.isRenewing
	
	return NewSubscriptionStatusModel
end

return SubscriptionStatusModelModule