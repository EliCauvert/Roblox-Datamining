local _ = require(script:FindFirstAncestor("AppChat").Parent.ShareLinksNetworking)

return function(p0) --[[ line: 14 | named "classifyShareLinkV2" ]]
	return if p0.status == "Valid" then if p0.linkType == "Moments" then { type = "moment", momentId = p0.targetId } else { type = "unhandled" } else { type = "invalid" }
end