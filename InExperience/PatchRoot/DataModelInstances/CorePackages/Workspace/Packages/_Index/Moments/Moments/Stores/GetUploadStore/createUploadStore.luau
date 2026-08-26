local createSignal = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal("Idle")
	local var3, var4 = createSignal(nil)
	local var5, var6 = createSignal(nil)
	
	return {
		getState = var1,
		getErrorKind = var3,
		getUploadedMoment = var5,
		setUploading = function()
			-- upvalues: var2 (ref), var4 (ref), var6 (ref)
			var2("Uploading")
			var4(nil)
			var6(nil)
		end,
		setSuccess = function(value)
			-- upvalues: var2 (ref), var4 (ref), var6 (ref)
			var2("Success")
			var4(nil)
			var6(value)
		end,
		setFailed = function(value)
			-- upvalues: var2 (ref), var4 (ref), var6 (ref)
			var2("Failed")
			var4(value)
			var6(nil)
		end,
		reset = function()
			-- upvalues: var2 (ref), var4 (ref), var6 (ref)
			var2("Idle")
			var4(nil)
			var6(nil)
		end
	}
end