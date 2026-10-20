local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local _ = require(Parent.React)
local _ = require(UserList.Common.Types)
local UseCtaRenderRowModule = require(UserList.Hooks.useCtaRenderRow)
local FFlagUserListComposeRenderRowWithCta = require(Parent.SharedFlags).FFlagUserListComposeRenderRowWithCta

return function(p1)
	-- upvalues: UseCtaRenderRowModule (copy), FFlagUserListComposeRenderRowWithCta (copy)
	return p1.render((UseCtaRenderRowModule(p1.ctaConfig, if FFlagUserListComposeRenderRowWithCta then p1.renderRow else nil)))
end