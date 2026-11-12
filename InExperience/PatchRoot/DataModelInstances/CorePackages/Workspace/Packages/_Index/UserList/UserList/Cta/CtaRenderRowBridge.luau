local UserList = script:FindFirstAncestor("UserList")
local _ = require(UserList.Parent.React)
local _ = require(UserList.Common.Types)
local UseCtaRenderRowModule = require(UserList.Hooks.useCtaRenderRow)

return function(p1)
	-- upvalues: UseCtaRenderRowModule (copy)
	return p1.render((UseCtaRenderRowModule(p1.ctaConfig, p1.renderRow)))
end