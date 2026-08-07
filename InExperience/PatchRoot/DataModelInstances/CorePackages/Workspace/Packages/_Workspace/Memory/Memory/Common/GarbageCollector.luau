local t = {
	collect = function() --[[ line: 8 ]]
		pcall(trigger)
		pcall(trigger)
		task.wait()
	end
}

function trigger() --[[ line: 3 ]]
	return collectgarbage("collect")
end

return t