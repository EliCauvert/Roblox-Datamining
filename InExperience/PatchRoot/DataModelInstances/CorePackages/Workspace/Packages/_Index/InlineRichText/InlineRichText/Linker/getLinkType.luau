local inlineRichText = script:FindFirstAncestor("InlineRichText")
local linkTypeModule = require(inlineRichText.Enums.LinkType)
local default = require(inlineRichText.Parent.LinkingProtocol).LinkingProtocol.default
local list = {
	{
		isLinkType = function(p0) --[[ line: 11 ]]
			return string.match(p0, "^https://") ~= nil
		end,
		type = linkTypeModule.Http
	},
	{
		isLinkType = function(p1) --[[ line: 18 ]]
			-- upvalues: default (ref)
			local var3, var4 = default:isURLRegistered(p1):await()
			
			return var3 and var4
		end,
		type = linkTypeModule.LinkingProtocolRegistered
	},
	{
		isLinkType = function(_) --[[ line: 26 ]]
			return true
		end,
		type = linkTypeModule.Default
	}
}

return function(p2) --[[ line: 33 | named "getLinkType" ]]
	-- upvalues: list (ref), linkTypeModule (ref)
	for i, v in list do
		if v.isLinkType(p2) then
			return v.type
		end
	end
	return linkTypeModule.Default
end