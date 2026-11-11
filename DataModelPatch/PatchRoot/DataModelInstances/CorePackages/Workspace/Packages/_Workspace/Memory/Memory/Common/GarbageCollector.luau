function trigger()
	return collectgarbage("collect")
end

return {
	collect = function()
		pcall(trigger)
		pcall(trigger)
		task.wait()
	end
}