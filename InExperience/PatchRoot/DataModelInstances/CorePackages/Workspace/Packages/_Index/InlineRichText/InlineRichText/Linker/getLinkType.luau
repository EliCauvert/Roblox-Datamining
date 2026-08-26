local inlineRichText = script:FindFirstAncestor("InlineRichText")
local linkTypeModule = require(inlineRichText.Enums.LinkType)
local default = require(inlineRichText.Parent.LinkingProtocol).LinkingProtocol.default
local list = {
	{
		isLinkType = function(p1)
			return string.match(p1, "^https://") ~= nil
		end,
		type = linkTypeModule.Http
	},
	{
		isLinkType = function(p1)
			-- upvalues: default (ref)
			local var1, var2 = default:isURLRegistered(p1):await()
			
			return var1 and var2
		end,
		type = linkTypeModule.LinkingProtocolRegistered
	},
	{
		isLinkType = function(_)
			return true
		end,
		type = linkTypeModule.Default
	}
}

return function(p1)
	-- upvalues: list (ref), linkTypeModule (ref)
	for i, v in list do
		if v.isLinkType(p1) then
			return v.type
		end
	end
	return linkTypeModule.Default
end