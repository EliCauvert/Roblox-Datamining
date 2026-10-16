local RegExModule = require(script.Parent.RegEx)
local t = {}
local config = {
	__index = t,
	__tostring = function(p1): string --[[ Line: 14 ]]
		return (tostring(p1._innerRegEx))
	end
}

function t.exec(p1, Input) --[[ Line: 19 ]]
	local MatchResult = p1._innerRegEx:match(Input)
	
	if not MatchResult then
		return nil
	end
	local SpanResult = MatchResult:span()
	local GrouparrResult = MatchResult:grouparr()
	local list = { GrouparrResult[0] }
	
	for i = 1, GrouparrResult.n do
		list[i + 1] = GrouparrResult[i]
	end
	list.n = GrouparrResult.n + 1
	list.index = SpanResult
	list.input = Input
	
	return list
end

function t.test(p2, Input): boolean --[[ Line: 38 ]]
	return p2:exec(Input) ~= nil
end

return (setmetatable(t, {
	__call = function(_, Source, p2) --[[ Line: 42 ]]
		-- upvalues: RegExModule (copy), config (copy)
		local P7 = p2 or ""
		
		return (setmetatable({
			source = Source,
			ignoreCase = P7:find("i") ~= nil,
			global = P7:find("g") ~= nil,
			multiline = P7:find("m") ~= nil,
			_innerRegEx = RegExModule.new(Source, P7)
		}, config))
	end
}))