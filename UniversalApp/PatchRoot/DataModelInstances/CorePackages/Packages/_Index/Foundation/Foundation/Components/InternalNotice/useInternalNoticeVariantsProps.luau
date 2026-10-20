local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local Link = { tag = "text-align-x-left" }
local config = {
	container = { tag = "col size-full-0 auto-y" },
	content = { tag = "row align-y-top size-full-0 auto-y" },
	leading = { tag = "row align-y-top fill auto-y" },
	stack = { tag = "col fill auto-y" },
	message = Link,
	link = Link
}
local Message = { tag = "size-full-0 auto-y" }
local config1 = {
	[false] = {
		message = { tag = "fill auto-y" },
		link = { tag = "auto-xy" }
	},
	[true] = {
		message = Message,
		link = { tag = Message.tag, padding = {} }
	}
}

return function(p1, p2, p3)
	-- upvalues: ComposeStyleVariantModule (copy), config (copy), config1 (copy)
	local Link = { tag = if p3 then "text-truncate-end" else "text-wrap" }
	local Content = { tag = p1.leading.gap }
	local Stack = { tag = p1.stack.gap }
	
	return (ComposeStyleVariantModule(config, p1, if p2 then { content = Content, stack = Stack } else {
		content = { tag = p1.content.gap },
		leading = Content,
		stack = Stack
	}, config1[p2], { message = Link, link = Link }))
end