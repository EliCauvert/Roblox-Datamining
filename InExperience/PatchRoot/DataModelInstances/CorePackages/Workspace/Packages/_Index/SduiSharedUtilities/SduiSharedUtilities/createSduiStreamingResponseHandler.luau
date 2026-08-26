local sduiStreamingResponseUtilsModule = require(script:FindFirstAncestor("SduiSharedUtilities").SduiStreamingResponseUtils)

return function(a)
	-- upvalues: sduiStreamingResponseUtilsModule (ref)
	local var1 = 0
	local var2 = nil
	local var3 = nil
	local var4 = ""
	
	local function processExtractedFrames(p1)
		-- upvalues: a (ref), var1 (write), var2 (write), var3 (write)
		local var5
		for i, v in p1 do
			var6, var7 = a.processFrame(v)
			
			if not var6 then
				var3 = var5
				
				return
			end
			var1 += 1
			var2 = var5
		end
	end
	
	local function _(p2)
		-- upvalues: sduiStreamingResponseUtilsModule (copy), var3 (write), var4 (write), processExtractedFrames (ref)
		local ok, status, var6 = pcall(sduiStreamingResponseUtilsModule.extractFrames, p2)
		
		if ok then
			var4 = var6
			processExtractedFrames(status)
			
			return
		end
		var3 = status
	end
	
	return {
		handleChunk = function(p2)
			-- upvalues: a (ref), var3 (write), var4 (write), sduiStreamingResponseUtilsModule (copy), processExtractedFrames (ref)
			a.loadTimer.logUiStreamChunkReceived()
			
			if #p2 == 0 or var3 ~= nil then return end
			var4 ..= p2
			local ok, status, var6 = pcall(sduiStreamingResponseUtilsModule.extractFrames, var4)
			
			if ok then
				var4 = var6
				processExtractedFrames(status)
				
				return
			end
			var3 = status
		end,
		finalize = function(p2)
			-- upvalues: var1 (write), sduiStreamingResponseUtilsModule (copy), var4 (write), var3 (write), processExtractedFrames (ref), a (ref), var2 (write)
			if var1 == 0 and not sduiStreamingResponseUtilsModule.isEmptyResponseBody(p2) then
				local var6 = if typeof(p2) == "buffer" then buffer.tostring(p2) else p2
				
				if typeof(var6) == "string" and #var6 > 0 then
					var4 = var6
					local ok, status, var7 = pcall(sduiStreamingResponseUtilsModule.extractFrames, var4)
					
					if ok then
						var4 = var7
						processExtractedFrames(status)
					else
						var3 = status
					end
				end
			end
			return if var3 == nil then if #var4 > 0 then {
				ok = false,
				value = `Streaming response for {a.configKey} ended with {#var4} undecoded bytes remaining`
			} elseif var1 > 0 then { ok = true, value = var2 } else {
				ok = false,
				value = `Streaming request for {a.configKey} completed without receiving data`
			} else { ok = false, value = var3 }
		end
	}
end