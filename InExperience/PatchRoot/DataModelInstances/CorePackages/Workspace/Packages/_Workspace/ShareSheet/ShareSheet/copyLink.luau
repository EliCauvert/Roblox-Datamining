local Default = require(script:FindFirstAncestor("ShareSheet").Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default

return function(p1) --[[ Line: 12 | Named "copyLink" ]]
	-- upvalues: Default (copy)
	Default:setClipboardText({ context = p1.context, text = p1.url })
end