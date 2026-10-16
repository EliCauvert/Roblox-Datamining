function trigger() --[[ Line: 3 ]]
	return collectgarbage("collect")
end

return {
	collect = function() --[[ Line: 8 ]]
		pcall(trigger)
		pcall(trigger)
		task.wait()
	end
}