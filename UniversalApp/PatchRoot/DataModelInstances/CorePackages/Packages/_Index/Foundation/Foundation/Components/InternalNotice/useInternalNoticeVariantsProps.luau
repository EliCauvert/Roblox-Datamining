local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.IconSize)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local t = { tag = "text-align-x-left" }
local t_1 = {
	container = { tag = "col size-full-0 auto-y" },
	content = { tag = "row align-y-top size-full-0 auto-y" },
	leading = { tag = "row align-y-top fill auto-y" },
	stack = { tag = "col fill auto-y" },
	message = t,
	link = t
}
local t_2 = { tag = "size-full-0 auto-y" }
local t_3 = {
	[false] = {
		message = { tag = "fill auto-y" },
		link = { tag = "auto-xy" }
	},
	[true] = { message = t_2, link = { tag = t_2.tag, padding = {} } }
}

return function(p1, p2, p3)
	-- upvalues: composeStyleVariantModule (ref), t_1 (ref), t_3 (ref)
	local t = { tag = if p3 then "text-truncate-end" else "text-wrap" }
	local t_2 = { tag = p1.leading.gap }
	local t_4 = { tag = p1.stack.gap }
	
	return composeStyleVariantModule(t_1, p1, if p2 then { content = t_2, stack = t_4 } else {
		content = { tag = p1.content.gap },
		leading = t_2,
		stack = t_4
	}, t_3[p2], { message = t, link = t })
end