local userList = script:FindFirstAncestor("UserList")
local _ = require(userList.Parent.React)
local _ = require(userList.Common.Types)
local useCtaRenderRowModule = require(userList.Hooks.useCtaRenderRow)

return function(p0)
	-- upvalues: useCtaRenderRowModule (ref)
	return p0.render(useCtaRenderRowModule(p0.ctaConfig))
end