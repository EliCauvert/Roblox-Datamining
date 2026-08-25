local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({ passed = true, reasons = {} }, t)
end

function t:updateReasons(p0, p1)
	if p0 then
		return
	end
	table.insert(self.reasons, table.concat(p1, "\n"))
	self.passed = false
end

function t:getFinalResults()
	if self.passed then
		return true
	end
	return false, self.reasons
end

return t