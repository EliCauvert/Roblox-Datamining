local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.React)
local Jest = require(Parent.Dev.JestGlobals).jest

return function(p1)
	-- upvalues: Jest (copy)
	local FnResult, FnResult2 = Jest.fn(p1 or function(_)
		return nil
	end)
	
	return { component = FnResult2, renderSpy = FnResult }
end