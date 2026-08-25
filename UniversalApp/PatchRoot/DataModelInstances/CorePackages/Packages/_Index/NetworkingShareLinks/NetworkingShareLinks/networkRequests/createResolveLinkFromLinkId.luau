local SHARELINKS_URLModule = require(script.Parent.Parent.SHARELINKS_URL)
local _ = require(script.Parent.Parent.networkingShareLinkTypes)

return function(p0)
	-- upvalues: SHARELINKS_URLModule (ref)
	local var1 = p0.roduxNetworking.POST({ Name = "resolve-link" }, function(p1, p2)
		-- upvalues: SHARELINKS_URLModule (copy)
		return p1(SHARELINKS_URLModule):path("v1"):path("resolve-link"):body({ linkType = p2.linkType, linkId = p2.linkId })
	end)
	
	if p0.useMockedResponse then
		var1.Mock.clear()
		var1.Mock.reply(function()
			return {
				responseBody = {
					experienceInviteData = {
						instanceId = "ABCDEF",
						inviterId = 46430379,
						placeId = 1818,
						status = "Valid",
						universeId = 13058
					}
				}
			}
		end)
	end
	return var1
end