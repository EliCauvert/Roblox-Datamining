local fFlagLuaAppSduiHomePageSupport = require(script:FindFirstAncestor("Home").Parent.SharedFlags).FFlagLuaAppSduiHomePageSupport
local sduiHomeSortDetailExcludedTopicIds = game:DefineFastString("SduiHomeSortDetailExcludedTopicIds", "100000000, 300000000, 600000000, 100000010")
local sduiHomeSortDetailSupportedInputDataTypes = game:DefineFastString("SduiHomeSortDetailSupportedInputDataTypes", "experience_carousel")
local t = {}
local t_1 = {}

if fFlagLuaAppSduiHomePageSupport then
	for i in sduiHomeSortDetailExcludedTopicIds:gmatch("([^,%s]+)") do
		t[i] = true
	end
	for i_1 in sduiHomeSortDetailSupportedInputDataTypes:gmatch("([^,%s]+)") do
		t_1[i_1] = true
	end
end
return function(p1, p2)
	-- upvalues: t (ref), t_1 (ref)
	return p1 ~= nil and (p2 ~= nil and (t[tostring(p1)] ~= true and t_1[tostring(p2)] == true))
end