local CreateSignalFunction = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function() --[[ Line: 31 | Named "createUploadStore" ]]
	-- upvalues: CreateSignalFunction (copy)
	local Idle, Idle2 = CreateSignalFunction("Idle")
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	
	return {
		getState = Idle,
		getErrorKind = Signal,
		getUploadedMoment = Signal1,
		setUploading = function() --[[ Line: 36 ]]
			-- upvalues: Idle2 (copy), Signal2 (copy), Signal2_1 (copy)
			Idle2("Uploading")
			Signal2(nil)
			Signal2_1(nil)
		end,
		setSuccess = function(p1) --[[ Line: 42 ]]
			-- upvalues: Idle2 (copy), Signal2 (copy), Signal2_1 (copy)
			Idle2("Success")
			Signal2(nil)
			Signal2_1(p1)
		end,
		setFailed = function(p1) --[[ Line: 48 ]]
			-- upvalues: Idle2 (copy), Signal2 (copy), Signal2_1 (copy)
			Idle2("Failed")
			Signal2(p1)
			Signal2_1(nil)
		end,
		reset = function() --[[ Line: 54 ]]
			-- upvalues: Idle2 (copy), Signal2 (copy), Signal2_1 (copy)
			Idle2("Idle")
			Signal2(nil)
			Signal2_1(nil)
		end
	}
end