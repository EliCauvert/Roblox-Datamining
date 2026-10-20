local Parent = script.Parent.Parent
local APIURLModule = require(Parent.API_URL)
local _ = require(Parent.networkingShareLinkTypes)

return function(p1)
	-- upvalues: APIURLModule (copy)
	local ResolveLink = p1.roduxNetworking.POST({ Name = "resolve-link" }, function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("sharelinks"):path("v1"):path("resolve-link"):body({ linkType = p2.linkType, linkId = p2.linkId })
	end)
	
	if p1.useMockedResponse then
		ResolveLink.Mock.clear()
		ResolveLink.Mock.reply(function()
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
	return ResolveLink
end