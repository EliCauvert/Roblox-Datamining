return {
	createSignalIfSupported = function()
		local abortController = _G.AbortController
		
		if typeof(abortController) == "nil" then
			return { controller = false, signal = false }
		end
		local var0 = abortController.new()
		
		return { controller = var0, signal = var0.signal }
	end
}