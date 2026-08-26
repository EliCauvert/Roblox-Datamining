local contentProviderService = game:GetService("ContentProvider")
local acpProtocolModule = require(script.Parent.Parent.Acp.AcpProtocol)
local myStatsExperienceStatsBaseUrl = game:DefineFastString("MyStatsExperienceStatsBaseUrl", "")

local function resolveCreatorAgentAcp()
	-- upvalues: myStatsExperienceStatsBaseUrl (ref), contentProviderService (ref), acpProtocolModule (ref)
	if typeof(myStatsExperienceStatsBaseUrl) == "string" and myStatsExperienceStatsBaseUrl ~= "" then
		local t = {
			gateway = "robloxlabs-v1",
			url = myStatsExperienceStatsBaseUrl
		}
		local match = string.match(myStatsExperienceStatsBaseUrl, "sitetest(%d+)%.robloxlabs%.com")
		t.sitetestNumber = if match == nil then nil else tonumber(match)
		
		return t
	end
	local ok, status = pcall(function()
		-- upvalues: contentProviderService (copy)
		return contentProviderService.BaseUrl
	end)
	
	if ok and typeof(status) == "string" then
		local match = string.match(status, "sitetest(%d+)%.robloxlabs%.com")
		local var1 = if match == nil then nil else tonumber(match)
		
		return if var1 == nil then {
			gateway = "robloxlabs-v1",
			sitetestNumber = nil,
			url = acpProtocolModule.acpUrl()
		} else {
			gateway = "robloxlabs-v1",
			url = `https://apis.sitetest{var1}.robloxlabs.com{acpProtocolModule.ACP_PATH}`,
			sitetestNumber = var1
		}
	end
end

return {
	resolveCreatorAgentAcp = resolveCreatorAgentAcp,
	resolveCreatorAgentAcpUrl = function()
		-- upvalues: resolveCreatorAgentAcp (ref)
		return resolveCreatorAgentAcp().url
	end,
	parseSitetestRobloxlabsNumber = function(value)
		local match = string.match(value, "sitetest(%d+)%.robloxlabs%.com")
		
		return if match == nil then nil else tonumber(match)
	end,
	buildRobloxlabsAcpUrl = function(value)
		-- upvalues: acpProtocolModule (ref)
		return `https://apis.sitetest{value}.robloxlabs.com{acpProtocolModule.ACP_PATH}`
	end
}