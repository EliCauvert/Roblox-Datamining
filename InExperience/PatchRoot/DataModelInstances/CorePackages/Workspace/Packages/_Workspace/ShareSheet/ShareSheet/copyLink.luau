local default = require(script:FindFirstAncestor("ShareSheet").Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default

return function(p0)
	-- upvalues: default (ref)
	default:setClipboardText({ context = p0.context, text = p0.url })
end