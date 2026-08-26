local default = require(script:FindFirstAncestor("ShareSheet").Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default

return function(p1)
	-- upvalues: default (ref)
	default:setClipboardText({ context = p1.context, text = p1.url })
end