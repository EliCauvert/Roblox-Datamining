return {
	createSignalIfSupported = function()
		local abortController = _G.AbortController
		
		if typeof(abortController) == "nil" then
			return { controller = false, signal = false }
		end
		local var1 = abortController.new()
		
		return { controller = var1, signal = var1.signal }
	end
}