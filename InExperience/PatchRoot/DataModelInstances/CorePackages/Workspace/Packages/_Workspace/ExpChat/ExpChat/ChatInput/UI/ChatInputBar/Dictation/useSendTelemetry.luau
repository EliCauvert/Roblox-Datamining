local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local _ = require(script.Parent.DictationMode)
local dictationAnalyticsModule = require(script.Parent.DictationAnalytics)

local function classifyEditType(p1, p2)
	-- upvalues: dictationAnalyticsModule (ref)
	return if #p2 == 0 then dictationAnalyticsModule.EditTypes.FullClear elseif #p1 < #p2 and string.sub(p2, 1, #p1) == p1 then dictationAnalyticsModule.EditTypes.Addition elseif #p2 < #p1 and string.sub(p1, 1, #p2) == p2 then dictationAnalyticsModule.EditTypes.Deletion else dictationAnalyticsModule.EditTypes.Mixed
end

return function(p1)
	-- upvalues: reactModule (ref), dictationAnalyticsModule (ref), classifyEditType (ref)
	local enabled = p1.enabled
	local textBoxRef = p1.textBoxRef
	local customTextBoxRef = p1.customTextBoxRef
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useCallback(function(p2, p3)
		-- upvalues: enabled (ref), var2 (ref), var1 (ref), dictationAnalyticsModule (copy)
		if enabled then
			var2.current = p2
			var1.current = {
				mode = p3,
				outcome = dictationAnalyticsModule.Outcomes.Full,
				textStt = p2
			}
			
			return
		end
	end, { enabled })
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: enabled (ref), var1 (ref), var3 (ref)
		if not enabled then
			return nil
		end
		local current = var1.current
		var1.current = nil
		
		if current == nil then
			return nil
		end
		var3.current = true
		current.textSent = p2
		
		return current
	end, { enabled })
	reactModule.useEffect(function()
		-- upvalues: enabled (ref), customTextBoxRef (ref), textBoxRef (ref), var2 (ref), var3 (ref), var1 (ref), dictationAnalyticsModule (copy), classifyEditType (copy)
		if not enabled then return end
		local current = customTextBoxRef.current or textBoxRef.current
		
		if current == nil then
			return
		end
		local var6 = current:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: var2 (copy), var3 (copy), current (ref), var1 (copy), dictationAnalyticsModule (copy), classifyEditType (copy)
			local current_1 = var2.current
			
			if current_1 == nil then return end
			if var3.current then
				var3.current = false
				var2.current = nil
				
				return
			end
			local text = current.Text
			
			if text == current_1 then return end
			if var1.current then
				var1.current.outcome = dictationAnalyticsModule.Outcomes.Partial
			end
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.TextEdit, {
				[dictationAnalyticsModule.Properties.SttMode] = dictationAnalyticsModule.Modes.Standard,
				[dictationAnalyticsModule.Properties.EditType] = classifyEditType(current_1, text)
			})
		end)
		
		return function()
			-- upvalues: var6 (ref)
			var6:Disconnect()
		end
	end, { enabled, textBoxRef, customTextBoxRef })
	
	return { stageTranscription = var4, consumeOnSend = var5 }
end