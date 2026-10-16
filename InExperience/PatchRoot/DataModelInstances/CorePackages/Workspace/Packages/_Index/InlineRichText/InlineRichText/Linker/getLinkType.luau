local InlineRichText = script:FindFirstAncestor("InlineRichText")
local LinkTypeModule = require(InlineRichText.Enums.LinkType)
local Default = require(InlineRichText.Parent.LinkingProtocol).LinkingProtocol.default
local list = {
	{
		isLinkType = function(Text: string): boolean --[[ Line: 11 ]]
			return string.match(Text, "^https://") ~= nil
		end,
		type = LinkTypeModule.Http
	},
	{
		isLinkType = function(p1) --[[ Line: 18 ]]
			-- upvalues: Default (copy)
			local v1, v2 = Default:isURLRegistered(p1):await()
			
			return v1 and v2
		end,
		type = LinkTypeModule.LinkingProtocolRegistered
	},
	{
		isLinkType = function(_): boolean --[[ Line: 26 ]]
			return true
		end,
		type = LinkTypeModule.Default
	}
}

return function(p1) --[[ Line: 33 | Named "getLinkType" ]]
	-- upvalues: list (copy), LinkTypeModule (copy)
	for _, value in list do
		if value.isLinkType(p1) then
			return value.type
		end
	end
	return LinkTypeModule.Default
end