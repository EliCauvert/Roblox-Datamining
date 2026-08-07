local requestTypeModule = require(script:FindFirstAncestor("PurchasePrompt").Enums.RequestType)
local blackbirdUpsellHiddenRequestTypes2 = game:DefineFastString("BlackbirdUpsellHiddenRequestTypes2", "")

local function _(p0) --[[ line: 17 | named "trim" ]]
	return p0:gsub("^%s+", ""):gsub("%s+$", "")
end

local function matchesHiddenRequestTypeList(p1, p2) --[[ line: 24 ]]
	-- upvalues: requestTypeModule (ref)
	if p1 == nil or p1 == requestTypeModule.None then
		return false
	elseif p2 == "" then
		return false
	end
	local lowerText = string.lower(tostring(p1))
	
	for i in string.gmatch(p2, "[^,]+") do
		local lowerText_1 = string.lower(i:gsub("^%s+", ""):gsub("%s+$", ""))
		
		if lowerText_1 ~= "" and lowerText == "requesttype." .. lowerText_1 then
			return true
		end
	end
	return false
end

return {
	isRequestTypeHiddenFromBlackbirdUpsell = function(p3) --[[ line: 45 ]]
		-- upvalues: matchesHiddenRequestTypeList (ref), blackbirdUpsellHiddenRequestTypes2 (ref)
		return matchesHiddenRequestTypeList(p3, blackbirdUpsellHiddenRequestTypes2)
	end,
	matchesHiddenRequestTypeList = matchesHiddenRequestTypeList
}