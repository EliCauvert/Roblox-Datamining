local function finish(p1, ...)
	p1.done = true
	
	return ...
end

local function check(p1, ...)
	if not p1.done then
		error("Compose: reactive code yielded. Computeds and effects must complete without yielding; use an async resource for work that waits.", 4)
	end
	return ...
end

return function(Callback, ...)
	-- upvalues: finish (copy), check (copy)
	local config = { done = false }
	
	return check(config, coroutine.wrap(function(...)
		-- upvalues: finish (upval), config (copy), Callback (copy)
		return finish(config, Callback(...))
	end)(...))
end