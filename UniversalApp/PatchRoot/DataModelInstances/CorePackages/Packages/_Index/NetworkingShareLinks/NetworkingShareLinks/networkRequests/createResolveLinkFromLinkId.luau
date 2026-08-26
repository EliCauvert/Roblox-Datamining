local SHARELINKS_URLModule = require(script.Parent.Parent.SHARELINKS_URL)
local _ = require(script.Parent.Parent.networkingShareLinkTypes)

return function(p1)
	-- upvalues: SHARELINKS_URLModule (ref)
	local var1 = p1.roduxNetworking.POST({ Name = "resolve-link" }, function(p2, p3)
		-- upvalues: SHARELINKS_URLModule (copy)
		return p2(SHARELINKS_URLModule):path("v1"):path("resolve-link"):body({ linkType = p3.linkType, linkId = p3.linkId })
	end)
	
	if p1.useMockedResponse then
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