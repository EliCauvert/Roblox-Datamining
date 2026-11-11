local RequestTypeModule = require(script:FindFirstAncestor("PurchasePrompt").Enums.RequestType)
local BlackbirdUpsellHiddenRequestTypes2 = game:DefineFastString("BlackbirdUpsellHiddenRequestTypes2", "")

local function _(Text: string)
	return (Text:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function matchesHiddenRequestTypeList(None, Text: string): boolean
	-- upvalues: RequestTypeModule (copy)
	if None == nil or None == RequestTypeModule.None then
		return false
	end
	if Text == "" then
		return false
	end
	local Lowered = string.lower((tostring(None)))
	
	for Text1 in string.gmatch(Text, "[^,]+") do
		local Lowered1 = string.lower((Text1:gsub("^%s+", ""):gsub("%s+$", "")))
		
		if Lowered1 ~= "" and Lowered == "requesttype." .. Lowered1 then
			return true
		end
	end
	return false
end

return {
	isRequestTypeHiddenFromBlackbirdUpsell = function(p1)
		-- upvalues: matchesHiddenRequestTypeList (copy), BlackbirdUpsellHiddenRequestTypes2 (copy)
		return (matchesHiddenRequestTypeList(p1, BlackbirdUpsellHiddenRequestTypes2))
	end,
	matchesHiddenRequestTypeList = matchesHiddenRequestTypeList
}