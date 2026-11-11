local DashModule = require(script.Parent.Parent.Parent.Dash)
local config = {
	addListener = function() end,
	dispatch = function() end,
	getParam = function() end,
	goBack = function() end,
	isFocused = function() end,
	setParams = function() end,
	state = {
		key = "id-1234567",
		name = "ContentFeed",
		params = { extraProps = { postId = "asdf", userId = "1234" } }
	}
}

return function(p1)
	-- upvalues: DashModule (copy), config (copy)
	local JoinDeepResult = DashModule.joinDeep(config, p1 or {})
	
	function JoinDeepResult.getParam(p2, p3)
		-- upvalues: JoinDeepResult (copy)
		return JoinDeepResult.state.params[p2] or p3
	end
	
	return JoinDeepResult
end