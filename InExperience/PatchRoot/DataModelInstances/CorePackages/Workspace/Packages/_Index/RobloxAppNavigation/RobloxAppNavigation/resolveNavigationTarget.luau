local function resolveNavigationTarget(Action)
	-- upvalues: resolveNavigationTarget (copy)
	return if type(Action) == "table" then if type(Action.action) == "table" and Action.action.routeName then Action.action.routeName elseif Action.routeName then Action.routeName elseif type(Action.actions) == "table" and Action.index then resolveNavigationTarget(Action.actions[Action.index]) else nil else nil
end

return resolveNavigationTarget