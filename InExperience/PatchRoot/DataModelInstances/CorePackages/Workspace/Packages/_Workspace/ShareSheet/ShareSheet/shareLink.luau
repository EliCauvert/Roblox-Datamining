local default = require(script:FindFirstAncestor("ShareSheet").Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default

return function(p0) --[[ line: 12 | named "shareLink" ]]
	-- upvalues: default (ref)
	default:shareUrl({ context = p0.context, url = p0.url })
end