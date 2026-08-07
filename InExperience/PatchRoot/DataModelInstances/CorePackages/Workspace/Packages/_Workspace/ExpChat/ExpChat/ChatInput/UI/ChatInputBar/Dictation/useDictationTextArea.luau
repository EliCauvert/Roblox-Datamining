local expChat = script:FindFirstAncestor("ExpChat")
local reactModule = require(expChat.Parent.React)
local localizationModule = require(expChat.Localization)
local _ = require(script.Parent.useDictationInputBar)

local function _(startValue, endValue, alpha) --[[ line: 26 | named "lerp" ]]
	return startValue + (endValue - startValue) * alpha
end

return function(p0, p1) --[[ line: 40 | named "useDictationTextArea" ]]
	-- upvalues: localizationModule (ref), reactModule (ref)
	local var3 = localizationModule.useLocalization({
		transcribingText = "CoreScripts.TextChat.ChatWindow.Transcribing"
	})
	local var4 = if var3.transcribingText and var3.transcribingText ~= "" then var3.transcribingText else "Transcribing..."
	local var5 = if p0 then p0.dictation.bindings.isAudioActive else nil
	local var6 = if p0 then p0.chatInputBarSettings else nil
	local var7 = if p0 then p0.state else nil
	local var8 = if p0 then p0.isTranscribing else false
	local var9 = if p1.showPlaceholderText then 0.5 else 0
	local var10 = reactModule.useMemo(function() --[[ line: 60 ]]
		-- upvalues: var5 (ref), p1 (ref), var9 (ref), reactModule (copy)
		return if var5 == nil then p1.transparencyValue:map(function(p3) --[[ line: 62 ]]
			-- upvalues: var9 (copy)
			return var9 + (1 - var9) * p3
		end) else reactModule.joinBindings({ fade = p1.transparencyValue, hide = var5 }):map(function(p2) --[[ line: 69 ]]
			-- upvalues: var9 (copy)
			local var17 = if p2.hide then 1 else var9
			
			return var17 + (1 - var17) * p2.fade
		end)
	end, { p1.transparencyValue, var5, var9 })
	local var11 = if var6 then var6.TextStrokeTransparency else 0
	local var12 = reactModule.useMemo(function() --[[ line: 76 ]]
		-- upvalues: var5 (ref), p1 (ref), var11 (ref), reactModule (copy)
		return if var5 == nil then p1.transparencyValue:map(function(p5) --[[ line: 78 ]]
			-- upvalues: var11 (copy)
			return var11 + (1 - var11) * p5
		end) else reactModule.joinBindings({ fade = p1.transparencyValue, hide = var5 }):map(function(p4) --[[ line: 85 ]]
			-- upvalues: var11 (copy)
			local var18 = if p4.hide then 1 else var11
			
			return var18 + (1 - var18) * p4.fade
		end)
	end, { p1.transparencyValue, var5, var11 })
	local var13 = if p0 then p0.customTextBoxRef else nil
	local var14 = if p0 then p0.textBoxRef else nil
	local var15 = if var6 then var6.PlaceholderColor3 else nil
	local var16 = if var6 then var6.TextColor3 else nil
	reactModule.useEffect(function() --[[ line: 99 ]]
		-- upvalues: var13 (ref), var14 (ref), var8 (ref), var4 (ref), var15 (ref), var16 (ref)
		if var13 == nil or var14 == nil then return end
		local var19 = if var13.current then var13.current else var14.current
		
		if var19 == nil then return end
		if var8 then
			var19.Text = var4
			var19.TextEditable = false
			var19.TextColor3 = var15
			
			return
		end
		var19.TextEditable = true
		var19.TextColor3 = var16
		
		if var19.Text == var4 then
			var19.Text = ""
		end
	end, {
		var7, var8, var4, var13, var14, var15, var16
	})
	
	return { textTransparency = var10, textStrokeTransparency = var12 }
end