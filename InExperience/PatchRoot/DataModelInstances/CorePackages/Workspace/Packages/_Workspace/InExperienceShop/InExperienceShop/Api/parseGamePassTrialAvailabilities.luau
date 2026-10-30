local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

local function _(p1)
	return if typeof(p1) == "string" then DateTime.fromIsoDate(p1) else nil
end

local _ = function(p1, p2)
	p1.available[p2] = nil
	p1.active[p2] = nil
	p1.redeemed[p2] = nil
end

return function(List)
	local config = { available = {}, active = {}, redeemed = {} }
	
	for _, value in List do
		if typeof(value) == "table" and value.gamePassId ~= nil then
			local Text = tostring(value.gamePassId)
			local Status = value.status
			
			if Status == "Available" or Status == "Active" or Status == "Redeemed" then
				config.available[Text] = nil
				config.active[Text] = nil
				config.redeemed[Text] = nil
				
				if Status == "Available" then
					config.available[Text] = true
				elseif Status == "Active" then
					config.active[Text] = true
				else
					local EndTime = value.endTime
					config.redeemed[Text] = {
						endTime = if typeof(EndTime) == "string" then DateTime.fromIsoDate(EndTime) else nil
					}
				end
			end
		end
	end
	return config
end