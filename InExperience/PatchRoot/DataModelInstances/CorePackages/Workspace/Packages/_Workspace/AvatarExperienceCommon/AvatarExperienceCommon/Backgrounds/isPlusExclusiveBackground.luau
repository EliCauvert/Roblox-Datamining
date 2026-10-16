local GetTemporaryPlusBackgroundIdsModule = require(script.Parent.getTemporaryPlusBackgroundIds)

return function(p1, p2) --[[ Line: 3 | Named "isPlusExclusiveBackground" ]]
	-- upvalues: GetTemporaryPlusBackgroundIdsModule (copy)
	if p2 == nil then
		local TemporaryPlusBackgroundIdsModule, TemporaryPlusBackgroundIdsModule2 = GetTemporaryPlusBackgroundIdsModule()
		
		return if TemporaryPlusBackgroundIdsModule2 then p1 ~= nil else p1 ~= nil and TemporaryPlusBackgroundIdsModule[tostring(p1)] == true
	else
		return p2
	end
end