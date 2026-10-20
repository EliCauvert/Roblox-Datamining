local ExpChat = script:FindFirstAncestor("ExpChat")
local SignalsModule = require(ExpChat.Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local FFlagExpChatDictationFadeOverrideModule = require(ExpChat.Flags.FFlagExpChatDictationFadeOverride)

local function v3() end

return function()
	-- upvalues: CreateSignalFunction (copy), SignalsModule (copy), FFlagExpChatDictationFadeOverrideModule (copy), v3 (copy)
	local Signal, Signal2 = CreateSignalFunction(0)
	local Signal1, Signal2_1 = CreateSignalFunction(0)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	local Signal5, Signal2_4 = CreateSignalFunction(false)
	local Signal6, Signal2_5 = CreateSignalFunction(false)
	
	local function _(Callback)
		-- upvalues: Signal2 (copy), Signal2_1 (copy)
		return function()
			-- upvalues: Callback (copy), Signal2 (upval), Signal2_1 (upval)
			Callback()
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	end
	
	local function v17()
		-- upvalues: Signal2_2 (copy)
		Signal2_2(true)
	end
	
	local function SetTextboxFocus()
		-- upvalues: v17 (copy), Signal2 (copy), Signal2_1 (copy)
		v17()
		Signal2(os.clock())
		Signal2_1(os.clock())
	end
	
	local function v19()
		-- upvalues: Signal2_2 (copy)
		Signal2_2(false)
	end
	
	local function ClearTextboxFocus()
		-- upvalues: v19 (copy), Signal2 (copy), Signal2_1 (copy)
		v19()
		Signal2(os.clock())
		Signal2_1(os.clock())
	end
	
	local function v21()
		-- upvalues: Signal2_3 (copy)
		Signal2_3(true)
	end
	
	local function SetWindowFocusInput()
		-- upvalues: v21 (copy), Signal2 (copy), Signal2_1 (copy)
		v21()
		Signal2(os.clock())
		Signal2_1(os.clock())
	end
	
	local function v23()
		-- upvalues: Signal2_3 (copy)
		Signal2_3(false)
	end
	
	local function ClearWindowFocusInput()
		-- upvalues: v23 (copy), Signal2 (copy), Signal2_1 (copy)
		v23()
		Signal2(os.clock())
		Signal2_1(os.clock())
	end
	
	local function v25()
		-- upvalues: Signal2_4 (copy)
		Signal2_4(true)
	end
	
	local function SetContextMenuOpen()
		-- upvalues: v25 (copy), Signal2 (copy), Signal2_1 (copy)
		v25()
		Signal2(os.clock())
		Signal2_1(os.clock())
	end
	
	local function v27()
		-- upvalues: Signal2_4 (copy)
		Signal2_4(false)
	end
	
	local config = {
		getLastActivity = Signal,
		getLastMessageActivity = Signal1,
		getIsTextBoxFocused = Signal3,
		getIsFocused = SignalsModule.createComputed(function(p1)
			-- upvalues: Signal3 (copy), Signal4 (copy), Signal5 (copy), FFlagExpChatDictationFadeOverrideModule (upval), Signal6 (copy)
			return Signal3(p1) or (Signal4(p1) or (Signal5(p1) or FFlagExpChatDictationFadeOverrideModule and Signal6(p1)))
		end),
		resetAllTransparency = function()
			-- upvalues: Signal2 (copy), Signal2_1 (copy)
			Signal2(os.clock())
			Signal2_1(os.clock())
		end,
		resetTextTransparency = function()
			-- upvalues: Signal2_1 (copy)
			Signal2_1(os.clock())
		end,
		setTextboxFocus = SetTextboxFocus,
		clearTextboxFocus = ClearTextboxFocus,
		setWindowFocusInput = SetWindowFocusInput,
		clearWindowFocusInput = ClearWindowFocusInput,
		setContextMenuOpen = SetContextMenuOpen,
		clearContextMenuOpen = function()
			-- upvalues: v27 (copy), Signal2 (copy), Signal2_1 (copy)
			v27()
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	}
	
	if FFlagExpChatDictationFadeOverrideModule then
		local function v29()
			-- upvalues: Signal2_5 (copy)
			Signal2_5(true)
		end
		
		local function SetDictationActive()
			-- upvalues: v29 (copy), Signal2 (copy), Signal2_1 (copy)
			v29()
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	else
		local SetDictationActive: () -> () = v3
	end
	config.setDictationActive = SetDictationActive
	
	if FFlagExpChatDictationFadeOverrideModule then
		local function v31()
			-- upvalues: Signal2_5 (copy)
			Signal2_5(false)
		end
		
		local function ClearDictationActive()
			-- upvalues: v31 (copy), Signal2 (copy), Signal2_1 (copy)
			v31()
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	else
		local ClearDictationActive: () -> () = v3
	end
	config.clearDictationActive = ClearDictationActive
	
	return config
end