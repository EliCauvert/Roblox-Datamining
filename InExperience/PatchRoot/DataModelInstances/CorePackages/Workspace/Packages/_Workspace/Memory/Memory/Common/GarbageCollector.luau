local t = {
	collect = function()
		pcall(trigger)
		pcall(trigger)
		task.wait()
	end
}

function trigger()
	return collectgarbage("collect")
end

return t