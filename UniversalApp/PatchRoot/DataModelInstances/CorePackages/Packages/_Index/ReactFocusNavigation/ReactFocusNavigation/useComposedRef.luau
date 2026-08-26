local reactModule = require(script.Parent.Parent.React)

local function _(p1, p2)
	if type(p1) == "function" then
		p1(p2)
		
		return
	elseif type(p1) == "table" then
		p1.current = p2
	end
end

return function(p1, p2)
	-- upvalues: reactModule (ref)
	return reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref), p2 (ref)
		if type(p1) == "function" then
			p1(p3)
		elseif type(p1) == "table" then
			p1.current = p3
		end
		if type(p2) == "function" then
			p2(p3)
			
			return
		elseif type(p2) == "table" then
			p2.current = p3
		end
	end, { p1, p2 })
end