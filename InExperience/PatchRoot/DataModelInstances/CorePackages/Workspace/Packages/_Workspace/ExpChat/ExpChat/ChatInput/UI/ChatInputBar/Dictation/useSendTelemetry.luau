local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local _ = require(script.Parent.DictationMode)
local DictationAnalyticsModule = require(script.Parent.DictationAnalytics)

local function classifyEditType(Text1: string, Text: string) --[[ Line: 29 ]]
	-- upvalues: DictationAnalyticsModule (copy)
	return if #Text == 0 then DictationAnalyticsModule.EditTypes.FullClear elseif #Text1 < #Text and string.sub(Text, 1, #Text1) == Text1 then DictationAnalyticsModule.EditTypes.Addition elseif #Text < #Text1 and string.sub(Text1, 1, #Text) == Text then DictationAnalyticsModule.EditTypes.Deletion else DictationAnalyticsModule.EditTypes.Mixed
end

return function(p1) --[[ Line: 42 | Named "useSendTelemetry" ]]
	-- upvalues: ReactModule (copy), DictationAnalyticsModule (copy), classifyEditType (copy)
	local Enabled = p1.enabled
	local TextBoxRef = p1.textBoxRef
	local CustomTextBoxRef = p1.customTextBoxRef
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Current, Mode) --[[ Line: 57 ]]
		-- upvalues: Enabled (copy), UseRefResult1 (copy), UseRefResult (copy), DictationAnalyticsModule (upval)
		if Enabled then
			UseRefResult1.current = Current
			UseRefResult.current = {
				mode = Mode,
				outcome = DictationAnalyticsModule.Outcomes.Full,
				textStt = Current
			}
			
			return
		end
	end, { Enabled })
	local UseResult1 = ReactModule.useCallback(function(TextSent) --[[ Line: 69 ]]
		-- upvalues: Enabled (copy), UseRefResult (copy), UseRefResult2 (copy)
		if not Enabled then
			return nil
		end
		local Current = UseRefResult.current
		UseRefResult.current = nil
		
		if Current == nil then
			return nil
		else
			UseRefResult2.current = true
			Current.textSent = TextSent
			
			return Current
		end
	end, { Enabled })
	ReactModule.useEffect(function() --[[ Line: 83 ]]
		-- upvalues: Enabled (copy), CustomTextBoxRef (copy), TextBoxRef (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult (copy), DictationAnalyticsModule (upval), classifyEditType (upval)
		if not Enabled then return end
		local Current = CustomTextBoxRef.current or TextBoxRef.current
		
		if Current == nil then return end
		local Connection = Current:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 91 ]]
			-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval), Current (copy), UseRefResult (upval), DictationAnalyticsModule (upval), classifyEditType (upval)
			local Current1 = UseRefResult1.current
			
			if Current1 == nil then return end
			if UseRefResult2.current then
				UseRefResult2.current = false
				UseRefResult1.current = nil
				
				return
			end
			local Text = Current.Text
			
			if Text == Current1 then return end
			if UseRefResult.current then
				UseRefResult.current.outcome = DictationAnalyticsModule.Outcomes.Partial
			end
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.TextEdit, {
				[DictationAnalyticsModule.Properties.SttMode] = DictationAnalyticsModule.Modes.Standard,
				[DictationAnalyticsModule.Properties.EditType] = classifyEditType(Current1, Text)
			})
		end)
		
		return function() --[[ Line: 113 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { Enabled, TextBoxRef, CustomTextBoxRef })
	
	return {
		stageTranscription = UseResult,
		consumeOnSend = UseResult1
	}
end