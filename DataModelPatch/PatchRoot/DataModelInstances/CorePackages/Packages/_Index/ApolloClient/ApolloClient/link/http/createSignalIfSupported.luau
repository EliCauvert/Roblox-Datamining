return {
	createSignalIfSupported = function()
		local AbortController = _G.AbortController
		
		if typeof(AbortController) == "nil" then
			return { controller = false, signal = false }
		else
			local NewAbortController = AbortController.new()
			
			return {
				controller = NewAbortController,
				signal = NewAbortController.signal
			}
		end
	end
}