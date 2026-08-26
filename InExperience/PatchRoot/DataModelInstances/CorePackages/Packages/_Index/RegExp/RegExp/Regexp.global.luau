local regExModule = require(script.Parent.RegEx)
local t = {}
local t_1 = {
	__index = t,
	__tostring = function(p1)
		return tostring(p1._innerRegEx)
	end
}

function t.exec(p1, p2)
	local var1 = p1._innerRegEx:match(p2)
	
	if not var1 then
		return nil
	end
	local var2 = var1:span()
	local var3 = var1:grouparr()
	local list = { var3[0] }
	
	for i = 1, var3.n do
		list[i + 1] = var3[i]
	end
	list.n = var3.n + 1
	list.index = var2
	list.input = p2
	
	return list
end

function t.test(p3, p4)
	return p3:exec(p4) ~= nil
end

return setmetatable(t, {
	__call = function(_, p3, p4)
		-- upvalues: regExModule (ref), t_1 (ref)
		p4 = p4 or ""
		
		return setmetatable({
			source = p3,
			ignoreCase = p4:find("i") ~= nil,
			global = p4:find("g") ~= nil,
			multiline = p4:find("m") ~= nil,
			_innerRegEx = regExModule.new(p3, p4)
		}, t_1)
	end
})