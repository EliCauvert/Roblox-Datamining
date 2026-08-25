local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local _ = require(script.Parent.DictationMode)
local dictationAnalyticsModule = require(script.Parent.DictationAnalytics)

local function classifyEditType(p0, p1)
	-- upvalues: dictationAnalyticsModule (ref)
	return if #p1 == 0 then dictationAnalyticsModule.EditTypes.FullClear elseif #p0 < #p1 and string.sub(p1, 1, #p0) == p0 then dictationAnalyticsModule.EditTypes.Addition elseif #p1 < #p0 and string.sub(p0, 1, #p1) == p1 then dictationAnalyticsModule.EditTypes.Deletion else dictationAnalyticsModule.EditTypes.Mixed
end

return function(p2)
	-- upvalues: reactModule (ref), dictationAnalyticsModule (ref), classifyEditType (ref)
	local enabled = p2.enabled
	local textBoxRef = p2.textBoxRef
	local customTextBoxRef = p2.customTextBoxRef
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useCallback(function(p3, p4)
		-- upvalues: enabled (ref), var4 (ref), var3 (ref), dictationAnalyticsModule (copy)
		if enabled then
			var4.current = p3
			var3.current = {
				mode = p4,
				outcome = dictationAnalyticsModule.Outcomes.Full,
				textStt = p3
			}
			
			return
		end
	end, { enabled })
	local var7 = reactModule.useCallback(function(p5)
		-- upvalues: enabled (ref), var3 (ref), var5 (ref)
		if not enabled then
			return nil
		end
		local current = var3.current
		var3.current = nil
		
		if current == nil then
			return nil
		end
		var5.current = true
		current.textSent = p5
		
		return current
	end, { enabled })
	reactModule.useEffect(function()
		-- upvalues: enabled (ref), customTextBoxRef (ref), textBoxRef (ref), var4 (ref), var5 (ref), var3 (ref), dictationAnalyticsModule (copy), classifyEditType (copy)
		if not enabled then return end
		local current = customTextBoxRef.current or textBoxRef.current
		
		if current == nil then
			return
		end
		local var9 = current:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: var4 (copy), var5 (copy), current (ref), var3 (copy), dictationAnalyticsModule (copy), classifyEditType (copy)
			local current_1 = var4.current
			
			if current_1 == nil then return end
			if var5.current then
				var5.current = false
				var4.current = nil
				
				return
			end
			local text = current.Text
			
			if text == current_1 then return end
			if var3.current then
				var3.current.outcome = dictationAnalyticsModule.Outcomes.Partial
			end
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.TextEdit, {
				[dictationAnalyticsModule.Properties.SttMode] = dictationAnalyticsModule.Modes.Standard,
				[dictationAnalyticsModule.Properties.EditType] = classifyEditType(current_1, text)
			})
		end)
		
		return function()
			-- upvalues: var9 (ref)
			var9:Disconnect()
		end
	end, { enabled, textBoxRef, customTextBoxRef })
	
	return { stageTranscription = var6, consumeOnSend = var7 }
end