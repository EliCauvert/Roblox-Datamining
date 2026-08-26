local userList = script:FindFirstAncestor("UserList")
local _ = require(userList.Parent.React)
local _ = require(userList.Common.Types)
local useCtaRenderRowModule = require(userList.Hooks.useCtaRenderRow)

return function(p1)
	-- upvalues: useCtaRenderRowModule (ref)
	return p1.render(useCtaRenderRowModule(p1.ctaConfig))
end