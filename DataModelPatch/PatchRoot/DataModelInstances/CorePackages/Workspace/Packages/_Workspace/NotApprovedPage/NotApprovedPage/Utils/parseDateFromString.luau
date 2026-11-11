local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local RobloxLocaleIdKey = require(NotApprovedPage.Parent.Localization).RobloxLocaleIdKey
local _ = require(NotApprovedPage.Common.Types)

return function(p1, p2)
	-- upvalues: RobloxLocaleIdKey (copy)
	local _DateTime = DateTime.fromIsoDate(p1)
	
	return if _DateTime then _DateTime:FormatLocalTime("LLL", p2[RobloxLocaleIdKey]) else p1
end