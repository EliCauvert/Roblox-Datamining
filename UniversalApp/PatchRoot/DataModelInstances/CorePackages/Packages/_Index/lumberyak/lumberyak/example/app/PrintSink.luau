local loggerModule = require(script.Parent.Parent.Parent.Logger)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = { maxLevel = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t.log(_, p1, p2)
	-- upvalues: loggerModule (ref)
	if p2.level == loggerModule.Levels.Error then
		error(p1, 5)
		
		return
	elseif p2.level == loggerModule.Levels.Warning then
		warn(p1)
		
		return
	end
	print(p1)
end

return t