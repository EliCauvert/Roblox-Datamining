local expChat = script:FindFirstAncestor("ExpChat")
local signalsModule = require(expChat.Parent.Signals)
local createSignal = signalsModule.createSignal
local fFlagExpChatDictationFadeOverrideModule = require(expChat.Flags.FFlagExpChatDictationFadeOverride)

local var1 = function() end

return function()
	-- upvalues: createSignal (ref), signalsModule (ref), fFlagExpChatDictationFadeOverrideModule (ref), var1 (ref)
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
		getIsFocused = signalsModule.createComputed(function(p1)
			-- upvalues: var6 (ref), var8 (ref), var10 (ref), fFlagExpChatDictationFadeOverrideModule (copy), var12 (ref)
			return var6(p1) or (var8(p1) or (var10(p1) or fFlagExpChatDictationFadeOverrideModule and var12(p1)))
		end),
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
	
	local var14 = function()
		-- upvalues: var7 (ref)
		var7(true)
	end
	
	function t.setTextboxFocus()
		-- upvalues: var14 (ref), var3 (ref), var5 (ref)
		var14()
		var3(os.clock())
		var5(os.clock())
	end
	
	local var15 = function()
		-- upvalues: var7 (ref)
		var7(false)
	end
	
	function t.clearTextboxFocus()
		-- upvalues: var15 (ref), var3 (ref), var5 (ref)
		var15()
		var3(os.clock())
		var5(os.clock())
	end
	
	local var16 = function()
		-- upvalues: var9 (ref)
		var9(true)
	end
	
	function t.setWindowFocusInput()
		-- upvalues: var16 (ref), var3 (ref), var5 (ref)
		var16()
		var3(os.clock())
		var5(os.clock())
	end
	
	local var17 = function()
		-- upvalues: var9 (ref)
		var9(false)
	end
	
	function t.clearWindowFocusInput()
		-- upvalues: var17 (ref), var3 (ref), var5 (ref)
		var17()
		var3(os.clock())
		var5(os.clock())
	end
	
	local var18 = function()
		-- upvalues: var11 (ref)
		var11(true)
	end
	
	function t.setContextMenuOpen()
		-- upvalues: var18 (ref), var3 (ref), var5 (ref)
		var18()
		var3(os.clock())
		var5(os.clock())
	end
	
	local var19 = function()
		-- upvalues: var11 (ref)
		var11(false)
	end
	
	function t.clearContextMenuOpen()
		-- upvalues: var19 (ref), var3 (ref), var5 (ref)
		var19()
		var3(os.clock())
		var5(os.clock())
	end
	
	if fFlagExpChatDictationFadeOverrideModule then
		local var20 = function()
			-- upvalues: var13 (ref)
			var13(true)
		end
		
		local var21 = function()
			-- upvalues: var20 (ref), var3 (ref), var5 (ref)
			var20()
			var3(os.clock())
			var5(os.clock())
		end
	else
		local var21 = var1
	end
	t.setDictationActive = var21
	
	if fFlagExpChatDictationFadeOverrideModule then
		local var22 = function()
			-- upvalues: var13 (ref)
			var13(false)
		end
		
		local var23 = function()
			-- upvalues: var22 (ref), var3 (ref), var5 (ref)
			var22()
			var3(os.clock())
			var5(os.clock())
		end
	else
		local var23 = var1
	end
	t.clearDictationActive = var23
	
	return t
end