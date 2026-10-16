return function(p1) --[[ Line: 1 | Named "finishDictationInput" ]]
	return p1 ~= nil and pcall(function() --[[ Line: 7 ]]
		-- upvalues: p1 (copy)
		p1:FinishInput()
	end)
end