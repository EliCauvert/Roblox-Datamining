local Default = require(script:FindFirstAncestor("ShareSheet").Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default

return function(p1) --[[ Line: 12 | Named "shareLink" ]]
	-- upvalues: Default (copy)
	Default:shareUrl({ context = p1.context, url = p1.url })
end