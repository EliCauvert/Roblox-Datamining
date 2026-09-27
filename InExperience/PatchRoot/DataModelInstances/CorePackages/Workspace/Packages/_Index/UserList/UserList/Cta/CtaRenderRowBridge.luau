local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local _ = require(parent.React)
local _ = require(userList.Common.Types)
local useCtaRenderRowModule = require(userList.Hooks.useCtaRenderRow)
local fFlagUserListComposeRenderRowWithCta = require(parent.SharedFlags).FFlagUserListComposeRenderRowWithCta

return function(p1)
	-- upvalues: useCtaRenderRowModule (ref), fFlagUserListComposeRenderRowWithCta (ref)
	return p1.render(useCtaRenderRowModule(p1.ctaConfig, if fFlagUserListComposeRenderRowWithCta then p1.renderRow else nil))
end