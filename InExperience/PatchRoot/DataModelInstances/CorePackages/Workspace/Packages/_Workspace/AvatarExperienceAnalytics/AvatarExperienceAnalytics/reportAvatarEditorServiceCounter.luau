local SendAXCounterV2Module = require(script.Parent.sendAXCounterV2)
local AVATAREDITORSERVICECOUNTERSTATUS = require(script.Parent.Constants).AVATAR_EDITOR_SERVICE_COUNTER_STATUS

return function(p1, Status, p2)
	-- upvalues: AVATAREDITORSERVICECOUNTERSTATUS (copy), SendAXCounterV2Module (copy)
	local config = { status = Status }
	
	if Status == AVATAREDITORSERVICECOUNTERSTATUS.Error and p2 ~= nil then
		config.message = string.sub(if typeof(p2) == "EnumItem" then p2.Name else tostring(p2), 1, 256)
	end
	SendAXCounterV2Module(p1, config)
end