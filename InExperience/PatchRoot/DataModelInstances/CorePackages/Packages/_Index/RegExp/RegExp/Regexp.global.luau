local regExModule = require(script.Parent.RegEx)
local t = {}
local t_1 = {
	__index = t,
	__tostring = function(p0)
		return tostring(p0._innerRegEx)
	end
}

function t.exec(p1, p2)
	local var3 = p1._innerRegEx:match(p2)
	
	if not var3 then
		return nil
	end
	local var4 = var3:span()
	local var5 = var3:grouparr()
	local list = { var5[0] }
	
	for i = 1, var5.n do
		list[i + 1] = var5[i]
	end
	list.n = var5.n + 1
	list.index = var4
	list.input = p2
	
	return list
end

function t.test(p3, p4)
	return p3:exec(p4) ~= nil
end

return setmetatable(t, {
	__call = function(_, p5, p6)
		-- upvalues: regExModule (ref), t_1 (ref)
		p6 = p6 or ""
		
		return setmetatable({
			source = p5,
			ignoreCase = p6:find("i") ~= nil,
			global = p6:find("g") ~= nil,
			multiline = p6:find("m") ~= nil,
			_innerRegEx = regExModule.new(p5, p6)
		}, t_1)
	end
})