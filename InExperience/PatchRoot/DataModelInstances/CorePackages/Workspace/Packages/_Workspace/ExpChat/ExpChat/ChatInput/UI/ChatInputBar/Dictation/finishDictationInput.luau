return function(p1)
	return if p1 == nil then false else pcall(function()
		-- upvalues: p1 (ref)
		p1:FinishInput()
	end)
end