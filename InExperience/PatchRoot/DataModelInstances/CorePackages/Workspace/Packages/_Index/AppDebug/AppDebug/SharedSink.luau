local t = {}
t.__index = t

function t.new(p0) --[[ line: 14 ]]
	-- upvalues: t (ref)
	local t_1 = { lastContext = nil, log = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t.newSink(p1, p2) --[[ line: 23 ]]
	return {
		maxLevel = p2,
		log = function(p3, p4, p5) --[[ line: 26 ]]
			-- upvalues: p1 (ref)
			if p5 ~= p1.lastContext then
				p1.lastContext = p5
				p1.log(p3, p4, p5)
			end
		end
	}
end

return t