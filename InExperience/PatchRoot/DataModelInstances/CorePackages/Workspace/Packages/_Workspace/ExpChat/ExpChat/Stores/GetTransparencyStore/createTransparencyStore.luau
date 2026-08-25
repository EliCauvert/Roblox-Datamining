local expChat = script:FindFirstAncestor("ExpChat")
local signalsModule = require(expChat.Parent.Signals)
local createSignal = signalsModule.createSignal
local fFlagExpChatTransparentFocusSupportModule = require(expChat.Flags.FFlagExpChatTransparentFocusSupport)
local fFlagExpChatDictationFadeOverrideModule = require(expChat.Flags.FFlagExpChatDictationFadeOverride)

local var4 = function() end

return function()
	-- upvalues: createSignal (ref), fFlagExpChatTransparentFocusSupportModule (ref), signalsModule (ref), fFlagExpChatDictationFadeOverrideModule (ref), var4 (ref)
	local var5, var6 = createSignal(0)
	local var7, var8 = createSignal(0)
	local var9, var10 = createSignal(false)
	local var11, var12 = createSignal(false)
	local var13, var14 = createSignal(false)
	local var15, var16 = createSignal(false)
	
	local function _(value)
		-- upvalues: var6 (ref), var8 (ref)
		return function()
			-- upvalues: value (ref), var6 (copy), var8 (copy)
			value()
			var6(os.clock())
			var8(os.clock())
		end
	end
	
	local t = {
		getLastActivity = var5,
		getLastMessageActivity = var7,
		getIsTextBoxFocused = var9,
		getIsFocused = if fFlagExpChatTransparentFocusSupportModule then signalsModule.createComputed(function(p1)
			-- upvalues: var9 (ref), var11 (ref), var13 (ref), fFlagExpChatDictationFadeOverrideModule (copy), var15 (ref)
			return var9(p1) or (var11(p1) or (var13(p1) or fFlagExpChatDictationFadeOverrideModule and var15(p1)))
		end) elseif fFlagExpChatDictationFadeOverrideModule then signalsModule.createComputed(function(p0)
			-- upvalues: var9 (ref), var15 (ref)
			return var9(p0) or var15(p0)
		end) else nil,
		resetAllTransparency = function()
			-- upvalues: var6 (ref), var8 (ref)
			var6(os.clock())
			var8(os.clock())
		end,
		resetTextTransparency = function()
			-- upvalues: var8 (ref)
			var8(os.clock())
		end
	}
	
	if fFlagExpChatTransparentFocusSupportModule then
		local var19 = function()
			-- upvalues: var10 (ref)
			var10(true)
		end
		
		local var18 = function()
			-- upvalues: var19 (ref), var6 (ref), var8 (ref)
			var19()
			var6(os.clock())
			var8(os.clock())
		end
	else
		local var18 = function()
			-- upvalues: var10 (ref), var6 (ref), var8 (ref)
			var10(true)
			var6(os.clock())
			var8(os.clock())
		end
	end
	t.setTextboxFocus = var18
	
	local var20 = function()
		-- upvalues: var10 (ref)
		var10(false)
	end
	
	function t.clearTextboxFocus()
		-- upvalues: var20 (ref), var6 (ref), var8 (ref)
		var20()
		var6(os.clock())
		var8(os.clock())
	end
	
	if fFlagExpChatTransparentFocusSupportModule then
		local var21 = function()
			-- upvalues: var12 (ref)
			var12(true)
		end
		
		local var22 = function()
			-- upvalues: var21 (ref), var6 (ref), var8 (ref)
			var21()
			var6(os.clock())
			var8(os.clock())
		end
	else
		local var22 = var4
	end
	t.setWindowFocusInput = var22
	
	if fFlagExpChatTransparentFocusSupportModule then
		local var23 = function()
			-- upvalues: var12 (ref)
			var12(false)
		end
		
		local var24 = function()
			-- upvalues: var23 (ref), var6 (ref), var8 (ref)
			var23()
			var6(os.clock())
			var8(os.clock())
		end
	else
		local var24 = var4
	end
	t.clearWindowFocusInput = var24
	
	if fFlagExpChatTransparentFocusSupportModule then
		local var25 = function()
			-- upvalues: var14 (ref)
			var14(true)
		end
		
		local var26 = function()
			-- upvalues: var25 (ref), var6 (ref), var8 (ref)
			var25()
			var6(os.clock())
			var8(os.clock())
		end
	else
		local var26 = var4
	end
	t.setContextMenuOpen = var26
	
	if fFlagExpChatTransparentFocusSupportModule then
		local var27 = function()
			-- upvalues: var14 (ref)
			var14(false)
		end
		
		local var28 = function()
			-- upvalues: var27 (ref), var6 (ref), var8 (ref)
			var27()
			var6(os.clock())
			var8(os.clock())
		end
	else
		local var28 = var4
	end
	t.clearContextMenuOpen = var28
	
	if fFlagExpChatDictationFadeOverrideModule then
		local var29 = function()
			-- upvalues: var16 (ref)
			var16(true)
		end
		
		local var30 = function()
			-- upvalues: var29 (ref), var6 (ref), var8 (ref)
			var29()
			var6(os.clock())
			var8(os.clock())
		end
	else
		local var30 = var4
	end
	t.setDictationActive = var30
	
	if fFlagExpChatDictationFadeOverrideModule then
		local var31 = function()
			-- upvalues: var16 (ref)
			var16(false)
		end
		
		local var32 = function()
			-- upvalues: var31 (ref), var6 (ref), var8 (ref)
			var31()
			var6(os.clock())
			var8(os.clock())
		end
	else
		local var32 = var4
	end
	t.clearDictationActive = var32
	
	return t
end