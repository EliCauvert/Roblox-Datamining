local TransferStatusModule = {
	Initiated = "Initiated",
	Pending = "Pending",
	Cancelled = "Cancelled",
	Failed = "Failed",
	Completed = "Completed"
}
local config = {
	[0] = TransferStatusModule.Initiated,
	[1] = TransferStatusModule.Pending,
	[2] = TransferStatusModule.Cancelled,
	[3] = TransferStatusModule.Failed,
	[4] = TransferStatusModule.Completed
}

function TransferStatusModule.fromValue(p1) --[[ Line: 21 ]]
	-- upvalues: config (copy), TransferStatusModule (copy)
	if p1 == nil then
		return nil
	end
	if type(p1) == "number" then
		return config[p1]
	end
	if type(p1) == "string" then
		for _, value in pairs(TransferStatusModule) do
			if value == p1 then
				return p1
			end
		end
	end
	return nil
end

return TransferStatusModule