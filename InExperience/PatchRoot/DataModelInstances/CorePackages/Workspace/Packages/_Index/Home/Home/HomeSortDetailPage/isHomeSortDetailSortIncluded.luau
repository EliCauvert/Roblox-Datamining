local SduiHomeSortDetailExcludedTopicIds: string = game:DefineFastString("SduiHomeSortDetailExcludedTopicIds", "100000000, 300000000, 600000000, 100000010")
local SduiHomeSortDetailSupportedInputDataTypes: string = game:DefineFastString("SduiHomeSortDetailSupportedInputDataTypes", "experience_carousel")
local t = {}
local t1 = {}

if require(script:FindFirstAncestor("Home").Parent.SharedFlags).FFlagLuaAppSduiHomePageSupport then
	for i in SduiHomeSortDetailExcludedTopicIds:gmatch("([^,%s]+)") do
		t[i] = true
	end
	for i1 in SduiHomeSortDetailSupportedInputDataTypes:gmatch("([^,%s]+)") do
		t1[i1] = true
	end
end
return function(p1, p2): boolean
	-- upvalues: t (copy), t1 (copy)
	return p1 ~= nil and (p2 ~= nil and (t[tostring(p1)] ~= true and t1[tostring(p2)] == true))
end