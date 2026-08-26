local default = require(script:FindFirstAncestor("ShareSheet").Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default

return function(p1)
	-- upvalues: default (ref)
	default:shareUrl({ context = p1.context, url = p1.url })
end