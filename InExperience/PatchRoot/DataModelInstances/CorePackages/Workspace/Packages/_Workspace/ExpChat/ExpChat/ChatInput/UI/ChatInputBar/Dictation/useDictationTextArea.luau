local expChat = script:FindFirstAncestor("ExpChat")
local reactModule = require(expChat.Parent.React)
local fFlagExpChatComposerInputBarFigmaParityModule = require(expChat.Flags.FFlagExpChatComposerInputBarFigmaParity)
local localizationModule = require(expChat.Localization)
local _ = require(script.Parent.useDictationInputBar)

local function _(startValue, endValue, alpha)
	return startValue + (endValue - startValue) * alpha
end

return function(p1, p2)
	-- upvalues: localizationModule (ref), fFlagExpChatComposerInputBarFigmaParityModule (ref), reactModule (ref)
	local var1 = localizationModule.useLocalization({
		transcribingText = "CoreScripts.TextChat.ChatWindow.Transcribing"
	})
	local var2 = if var1.transcribingText and var1.transcribingText ~= "" then var1.transcribingText else "Transcribing..."
	local var3 = if p1 then p1.dictation.bindings.isAudioActive else nil
	local var4 = if p1 then p1.chatInputBarSettings else nil
	local var5 = if p1 then p1.state else nil
	local var6 = if p1 then p1.isTranscribing else false
	local var7 = if p2.showPlaceholderText and not fFlagExpChatComposerInputBarFigmaParityModule then 0.5 else 0
	local var8 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), p2 (ref), var7 (ref), reactModule (copy)
		return if var3 == nil then p2.transparencyValue:map(function(p3)
			-- upvalues: var7 (copy)
			return var7 + (1 - var7) * p3
		end) else reactModule.joinBindings({ fade = p2.transparencyValue, hide = var3 }):map(function(p3)
			-- upvalues: var7 (copy)
			local var9 = if p3.hide then 1 else var7
			
			return var9 + (1 - var9) * p3.fade
		end)
	end, { p2.transparencyValue, var3, var7 })
	local var9 = if var4 then var4.TextStrokeTransparency else 0
	local var10 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), p2 (ref), var9 (ref), reactModule (copy)
		return if var3 == nil then p2.transparencyValue:map(function(p3)
			-- upvalues: var9 (copy)
			return var9 + (1 - var9) * p3
		end) else reactModule.joinBindings({ fade = p2.transparencyValue, hide = var3 }):map(function(p3)
			-- upvalues: var9 (copy)
			local var11 = if p3.hide then 1 else var9
			
			return var11 + (1 - var11) * p3.fade
		end)
	end, { p2.transparencyValue, var3, var9 })
	local var11 = if p1 then p1.customTextBoxRef else nil
	local var12 = if p1 then p1.textBoxRef else nil
	local var13 = if var4 then var4.PlaceholderColor3 else nil
	local var14 = if var4 then var4.TextColor3 else nil
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var12 (ref), var6 (ref), var2 (ref), var13 (ref), var14 (ref)
		if var11 == nil or var12 == nil then return end
		local var15 = if var11.current then var11.current else var12.current
		
		if var15 == nil then return end
		if var6 then
			var15.Text = var2
			var15.TextEditable = false
			var15.TextColor3 = var13
			
			return
		end
		var15.TextEditable = true
		var15.TextColor3 = var14
		
		if var15.Text == var2 then
			var15.Text = ""
		end
	end, {
		var5, var6, var2, var11, var12, var13, var14
	})
	
	return { textTransparency = var8, textStrokeTransparency = var10 }
end