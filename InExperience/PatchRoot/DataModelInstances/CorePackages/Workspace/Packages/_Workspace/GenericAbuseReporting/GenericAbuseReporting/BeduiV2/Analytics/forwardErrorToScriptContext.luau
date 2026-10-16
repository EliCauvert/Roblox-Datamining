return function(p1, p2) --[[ Line: 11 | Named "forwardErrorToScriptContext" ]]
	task.spawn(function() --[[ Line: 12 ]]
		-- upvalues: p2 (copy), p1 (copy)
		error(tostring(p1) .. "\n" .. (if p2 then p2 else ""), 0)
	end)
end