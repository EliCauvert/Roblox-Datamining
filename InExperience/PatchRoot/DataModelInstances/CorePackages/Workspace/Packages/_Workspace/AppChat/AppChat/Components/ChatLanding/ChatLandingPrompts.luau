local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.React)
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local UseChatIsVisibleModule = require(AppChat.Hooks.useChatIsVisible)

return function(p1)
	-- upvalues: UseNavigationFocusFunction (copy), UseChatIsVisibleModule (copy)
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseChatIsVisibleModuleResult = UseChatIsVisibleModule()
	
	return if UseNavigationFocusResult and UseChatIsVisibleModuleResult then p1.renderPrompts() else nil
end