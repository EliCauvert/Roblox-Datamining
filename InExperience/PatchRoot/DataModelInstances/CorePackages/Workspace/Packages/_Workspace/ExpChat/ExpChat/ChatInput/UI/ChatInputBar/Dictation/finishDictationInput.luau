return function(p1)
	return p1 ~= nil and pcall(function()
		-- upvalues: p1 (copy)
		p1:FinishInput()
	end)
end