local ContentProvider = game:GetService("ContentProvider")
local AcpProtocolModule = require(script.Parent.Parent.Acp.AcpProtocol)
local MyStatsExperienceStatsBaseUrl = game:DefineFastString("MyStatsExperienceStatsBaseUrl", "")

local function resolveCreatorAgentAcp() --[[ Line: 33 ]]
	-- upvalues: MyStatsExperienceStatsBaseUrl (copy), ContentProvider (copy), AcpProtocolModule (copy)
	if typeof(MyStatsExperienceStatsBaseUrl) == "string" and MyStatsExperienceStatsBaseUrl ~= "" then
		local Match: string? = string.match(MyStatsExperienceStatsBaseUrl, "sitetest(%d+)%.robloxlabs%.com")
		
		return {
			gateway = "robloxlabs-v1",
			url = MyStatsExperienceStatsBaseUrl,
			sitetestNumber = if Match == nil then nil else tonumber(Match)
		}
	end
	local Success, Result = pcall(function() --[[ Line: 43 ]]
		-- upvalues: ContentProvider (upval)
		return ContentProvider.BaseUrl
	end)
	
	if Success and typeof(Result) == "string" then
		local Match: string? = string.match(Result, "sitetest(%d+)%.robloxlabs%.com")
		local Number = if Match == nil then nil else tonumber(Match)
		
		if Number ~= nil then
			return {
				gateway = "robloxlabs-v1",
				url = `https://apis.sitetest{Number}.robloxlabs.com{AcpProtocolModule.ACP_PATH}`,
				sitetestNumber = Number
			}
		end
	end
	return {
		gateway = "robloxlabs-v1",
		sitetestNumber = nil,
		url = AcpProtocolModule.acpUrl()
	}
end

return {
	resolveCreatorAgentAcp = resolveCreatorAgentAcp,
	resolveCreatorAgentAcpUrl = function() --[[ Line: 64 ]]
		-- upvalues: resolveCreatorAgentAcp (copy)
		return resolveCreatorAgentAcp().url
	end,
	parseSitetestRobloxlabsNumber = function(Text: string) --[[ Line: 25 ]]
		local Match: string? = string.match(Text, "sitetest(%d+)%.robloxlabs%.com")
		
		return if Match == nil then nil else tonumber(Match)
	end,
	buildRobloxlabsAcpUrl = function(p1): string --[[ Line: 21 ]]
		-- upvalues: AcpProtocolModule (copy)
		return `https://apis.sitetest{p1}.robloxlabs.com{AcpProtocolModule.ACP_PATH}`
	end
}