local createSignal = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function() --[[ line: 31 | named "createUploadStore" ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal("Idle")
	local var2, var3 = createSignal(nil)
	local var4, var5 = createSignal(nil)
	
	return {
		getState = var0,
		getErrorKind = var2,
		getUploadedMoment = var4,
		setUploading = function() --[[ line: 36 ]]
			-- upvalues: var1 (ref), var3 (ref), var5 (ref)
			var1("Uploading")
			var3(nil)
			var5(nil)
		end,
		setSuccess = function(value) --[[ line: 42 ]]
			-- upvalues: var1 (ref), var3 (ref), var5 (ref)
			var1("Success")
			var3(nil)
			var5(value)
		end,
		setFailed = function(value) --[[ line: 48 ]]
			-- upvalues: var1 (ref), var3 (ref), var5 (ref)
			var1("Failed")
			var3(value)
			var5(nil)
		end,
		reset = function() --[[ line: 54 ]]
			-- upvalues: var1 (ref), var3 (ref), var5 (ref)
			var1("Idle")
			var3(nil)
			var5(nil)
		end
	}
end