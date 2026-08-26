local expChat = script:FindFirstAncestor("ExpChat")
local signalsModule = require(expChat.Parent.Signals)
local createSignal = signalsModule.createSignal
local fFlagExpChatTransparentFocusSupportModule = require(expChat.Flags.FFlagExpChatTransparentFocusSupport)
local fFlagExpChatDictationFadeOverrideModule = require(expChat.Flags.FFlagExpChatDictationFadeOverride)

local var1 = function() end

return function()
	-- upvalues: createSignal (ref), fFlagExpChatTransparentFocusSupportModule (ref), signalsModule (ref), fFlagExpChatDictationFadeOverrideModule (ref), var1 (ref)
	local var2, var3 = createSignal(0)
	local var4, var5 = createSignal(0)
	local var6, var7 = createSignal(false)
	local var8, var9 = createSignal(false)
	local var10, var11 = createSignal(false)
	local var12, var13 = createSignal(false)
	
	local function _(value)
		-- upvalues: var3 (ref), var5 (ref)
		return function()
			-- upvalues: value (ref), var3 (copy), var5 (copy)
			value()
			var3(os.clock())
			var5(os.clock())
		end
	end
	
	local t = {
		getLastActivity = var2,
		getLastMessageActivity = var4,
		getIsTextBoxFocused = var6,
		getIsFocused = if fFlagExpChatTransparentFocusSupportModule then signalsModule.createComputed(function(p1)
			-- upvalues: var6 (ref), var8 (ref), var10 (ref), fFlagExpChatDictationFadeOverrideModule (copy), var12 (ref)
			return var6(p1) or (var8(p1) or (var10(p1) or fFlagExpChatDictationFadeOverrideModule and var12(p1)))
		end) elseif fFlagExpChatDictationFadeOverrideModule then signalsModule.createComputed(function(p1)
			-- upvalues: var6 (ref), var12 (ref)
			return var6(p1) or var12(p1)
		end) else nil,
		resetAllTransparency = function()
			-- upvalues: var3 (ref), var5 (ref)
			var3(os.clock())
			var5(os.clock())
		end,
		resetTextTransparency = function()
			-- upvalues: var5 (ref)
			var5(os.clock())
		end
	}
	
	if fFlagExpChatTransparentFocusSupportModule then
		local var14 = function()
			-- upvalues: var7 (ref)
			var7(true)
		end
		
		local var15 = function()
			-- upvalues: var14 (ref), var3 (ref), var5 (ref)
			var14()
			var3(os.clock())
			var5(os.clock())
		end
	else
		local var15 = function()
			-- upvalues: var7 (ref), var3 (ref), var5 (ref)
			var7(true)
			var3(os.clock())
			var5(os.clock())
		end
	end
	t.setTextboxFocus = var15
	
	local var16 = function()
		-- upvalues: var7 (ref)
		var7(false)
	end
	
	function t.clearTextboxFocus()
		-- upvalues: var16 (ref), var3 (ref), var5 (ref)
		var16()
		var3(os.clock())
		var5(os.clock())
	end
	
	if fFlagExpChatTransparentFocusSupportModule then
		local var17 = function()
			-- upvalues: var9 (ref)
			var9(true)
		end
		
		local var18 = function()
			-- upvalues: var17 (ref), var3 (ref), var5 (ref)
			var17()
			var3(os.clock())
			var5(os.clock())
		end
	else
		local var18 = var1
	end
	t.setWindowFocusInput = var18
	
	if fFlagExpChatTransparentFocusSupportModule then
		local var19 = function()
			-- upvalues: var9 (ref)
			var9(false)
		end
		
		local var20 = function()
			-- upvalues: var19 (ref), var3 (ref), var5 (ref)
			var19()
			var3(os.clock())
			var5(os.clock())
		end
	else
		local var20 = var1
	end
	t.clearWindowFocusInput = var20
	
	if fFlagExpChatTransparentFocusSupportModule then
		local var21 = function()
			-- upvalues: var11 (ref)
			var11(true)
		end
		
		local var22 = function()
			-- upvalues: var21 (ref), var3 (ref), var5 (ref)
			var21()
			var3(os.clock())
			var5(os.clock())
		end
	else
		local var22 = var1
	end
	t.setContextMenuOpen = var22
	
	if fFlagExpChatTransparentFocusSupportModule then
		local var23 = function()
			-- upvalues: var11 (ref)
			var11(false)
		end
		
		local var24 = function()
			-- upvalues: var23 (ref), var3 (ref), var5 (ref)
			var23()
			var3(os.clock())
			var5(os.clock())
		end
	else
		local var24 = var1
	end
	t.clearContextMenuOpen = var24
	
	if fFlagExpChatDictationFadeOverrideModule then
		local var25 = function()
			-- upvalues: var13 (ref)
			var13(true)
		end
		
		local var26 = function()
			-- upvalues: var25 (ref), var3 (ref), var5 (ref)
			var25()
			var3(os.clock())
			var5(os.clock())
		end
	else
		local var26 = var1
	end
	t.setDictationActive = var26
	
	if fFlagExpChatDictationFadeOverrideModule then
		local var27 = function()
			-- upvalues: var13 (ref)
			var13(false)
		end
		
		local var28 = function()
			-- upvalues: var27 (ref), var3 (ref), var5 (ref)
			var27()
			var3(os.clock())
			var5(os.clock())
		end
	else
		local var28 = var1
	end
	t.clearDictationActive = var28
	
	return t
end