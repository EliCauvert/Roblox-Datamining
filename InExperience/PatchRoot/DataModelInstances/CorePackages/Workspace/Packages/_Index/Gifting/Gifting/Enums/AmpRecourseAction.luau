local AmpRecourseActionModule = {
	Unknown = "Unknown",
	ParentConsentRecourse = "ParentConsentRecourse",
	AgeEstimationRecourse = "AgeEstimationRecourse",
	ParentLinkRecourse = "ParentLinkRecourse"
}
local t = {}

for _, value in pairs(AmpRecourseActionModule) do
	t[value] = true
end
function AmpRecourseActionModule.fromValue(p1)
	-- upvalues: t (copy)
	return if p1 == nil or not t[p1] then nil else p1
end

function AmpRecourseActionModule.fromValues(List)
	-- upvalues: AmpRecourseActionModule (copy)
	if type(List) ~= "table" then
		return nil
	end
	local FromValueResults = {}
	
	for _, value in List do
		local FromValueResult = AmpRecourseActionModule.fromValue(value)
		
		if FromValueResult == nil then
			return nil
		end
		table.insert(FromValueResults, FromValueResult)
	end
	return FromValueResults
end

return AmpRecourseActionModule