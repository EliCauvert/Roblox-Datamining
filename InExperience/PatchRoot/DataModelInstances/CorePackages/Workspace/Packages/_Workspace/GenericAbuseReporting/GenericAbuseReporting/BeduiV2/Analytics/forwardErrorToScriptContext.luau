return function(p0, p1) --[[ line: 11 | named "forwardErrorToScriptContext" ]]
	task.spawn(function() --[[ line: 12 ]]
		-- upvalues: p1 (ref), p0 (ref)
		error(tostring(p0) .. "\n" .. (p1 or ""), 0)
	end)
end