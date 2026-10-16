return function(p1) --[[ Line: 1 | Named "forwardErrorToScriptContext" ]]
	task.spawn(function() --[[ Line: 3 ]]
		-- upvalues: p1 (copy)
		error(p1, 0)
	end)
end