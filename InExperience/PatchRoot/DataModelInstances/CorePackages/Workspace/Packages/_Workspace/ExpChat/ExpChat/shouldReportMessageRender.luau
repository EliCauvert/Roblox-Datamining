local t = {}

return function(p1): boolean
	-- upvalues: t (copy)
	if not p1.isHistorical then
		return true
	elseif t[p1.messageId] then
		return false
	else
		t[p1.messageId] = true
		
		return true
	end
end