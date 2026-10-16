local SduiStreamingResponseUtilsModule = require(script:FindFirstAncestor("SduiSharedUtilities").SduiStreamingResponseUtils)

return function(p1) --[[ Line: 20 | Named "createSduiStreamingResponseHandler" ]]
	-- upvalues: SduiStreamingResponseUtilsModule (copy)
	local Count = 0
	local Value = nil
	local Value1 = nil
	local Text = ""
	
	local function processExtractedFrames(List) --[[ Line: 28 ]]
		-- upvalues: p1 (copy), Count (ref), Value (ref), Value1 (ref)
		local ProcessFrameResult2 = nil
		for _, value in List do
			local ProcessFrameResult
			ProcessFrameResult, ProcessFrameResult2 = p1.processFrame(value)
			
			if not ProcessFrameResult then
				Value1 = ProcessFrameResult2
				break
			end
			Count += 1
			Value = ProcessFrameResult2
		end
	end
	
	local function _(p2) --[[ Line: 41 | Named "extractAndProcessFrames" ]]
		-- upvalues: SduiStreamingResponseUtilsModule (upval), Value1 (ref), Text (ref), processExtractedFrames (copy)
		local Success, Result, Result3 = pcall(SduiStreamingResponseUtilsModule.extractFrames, p2)
		
		if Success then
			Text = Result3
			processExtractedFrames(Result)
			
			return
		else
			Value1 = Result
		end
	end
	
	return {
		handleChunk = function(Text1) --[[ Line: 52 ]]
			-- upvalues: p1 (copy), Value1 (ref), Text (ref), SduiStreamingResponseUtilsModule (upval), processExtractedFrames (copy)
			p1.loadTimer.logUiStreamChunkReceived()
			
			if #Text1 == 0 or Value1 ~= nil then return end
			Text ..= Text1
			local Success, Result, Result3 = pcall(SduiStreamingResponseUtilsModule.extractFrames, Text)
			
			if Success then
				Text = Result3
				processExtractedFrames(Result)
				
				return
			else
				Value1 = Result
			end
		end,
		finalize = function(Buf) --[[ Line: 63 ]]
			-- upvalues: Count (ref), SduiStreamingResponseUtilsModule (upval), Text (ref), Value1 (ref), processExtractedFrames (copy), p1 (copy), Value (ref)
			if Count == 0 and not SduiStreamingResponseUtilsModule.isEmptyResponseBody(Buf) then
				local Text1 = if typeof(Buf) == "buffer" then buffer.tostring(Buf) else Buf
				
				if typeof(Text1) == "string" and #Text1 > 0 then
					Text = Text1
					local Success, Result, Result3 = pcall(SduiStreamingResponseUtilsModule.extractFrames, Text)
					
					if Success then
						Text = Result3
						processExtractedFrames(Result)
					else
						Value1 = Result
					end
				end
			end
			return if Value1 == nil then if #Text > 0 then {
				ok = false,
				value = `Streaming response for {p1.configKey} ended with {#Text} undecoded bytes remaining`
			} elseif Count > 0 then { ok = true, value = Value } else {
				ok = false,
				value = `Streaming request for {p1.configKey} completed without receiving data`
			} else { ok = false, value = Value1 }
		end
	}
end