local ExpChat = script:FindFirstAncestor("ExpChat")
local SignalsModule = require(ExpChat.Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local FFlagExpChatTransparentFocusSupportModule = require(ExpChat.Flags.FFlagExpChatTransparentFocusSupport)
local FFlagExpChatDictationFadeOverrideModule = require(ExpChat.Flags.FFlagExpChatDictationFadeOverride)

local function v4() end

return function()
	-- upvalues: CreateSignalFunction (copy), FFlagExpChatTransparentFocusSupportModule (copy), SignalsModule (copy), FFlagExpChatDictationFadeOverrideModule (copy), v4 (copy)
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
	
	local config = {
		getLastActivity = Signal,
		getLastMessageActivity = Signal1,
		getIsTextBoxFocused = Signal3,
		getIsFocused = if FFlagExpChatTransparentFocusSupportModule then SignalsModule.createComputed(function(p1)
			-- upvalues: Signal3 (copy), Signal4 (copy), Signal5 (copy), FFlagExpChatDictationFadeOverrideModule (upval), Signal6 (copy)
			return Signal3(p1) or (Signal4(p1) or (Signal5(p1) or FFlagExpChatDictationFadeOverrideModule and Signal6(p1)))
		end) elseif FFlagExpChatDictationFadeOverrideModule then SignalsModule.createComputed(function(p1)
			-- upvalues: Signal3 (copy), Signal6 (copy)
			return Signal3(p1) or Signal6(p1)
		end) else nil,
		resetAllTransparency = function()
			-- upvalues: Signal2 (copy), Signal2_1 (copy)
			Signal2(os.clock())
			Signal2_1(os.clock())
		end,
		resetTextTransparency = function()
			-- upvalues: Signal2_1 (copy)
			Signal2_1(os.clock())
		end
	}
	
	if FFlagExpChatTransparentFocusSupportModule then
		local function v19()
			-- upvalues: Signal2_2 (copy)
			Signal2_2(true)
		end
		
		local function SetTextboxFocus()
			-- upvalues: v19 (copy), Signal2 (copy), Signal2_1 (copy)
			v19()
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	else
		local function SetTextboxFocus()
			-- upvalues: Signal2_2 (copy), Signal2 (copy), Signal2_1 (copy)
			Signal2_2(true)
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	end
	config.setTextboxFocus = SetTextboxFocus
	
	local function v21()
		-- upvalues: Signal2_2 (copy)
		Signal2_2(false)
	end
	
	function config.clearTextboxFocus()
		-- upvalues: v21 (copy), Signal2 (copy), Signal2_1 (copy)
		v21()
		Signal2(os.clock())
		Signal2_1(os.clock())
	end
	
	if FFlagExpChatTransparentFocusSupportModule then
		local function v22()
			-- upvalues: Signal2_3 (copy)
			Signal2_3(true)
		end
		
		local function SetWindowFocusInput()
			-- upvalues: v22 (copy), Signal2 (copy), Signal2_1 (copy)
			v22()
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	else
		local SetWindowFocusInput: () -> () = v4
	end
	config.setWindowFocusInput = SetWindowFocusInput
	
	if FFlagExpChatTransparentFocusSupportModule then
		local function v24()
			-- upvalues: Signal2_3 (copy)
			Signal2_3(false)
		end
		
		local function ClearWindowFocusInput()
			-- upvalues: v24 (copy), Signal2 (copy), Signal2_1 (copy)
			v24()
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	else
		local ClearWindowFocusInput: () -> () = v4
	end
	config.clearWindowFocusInput = ClearWindowFocusInput
	
	if FFlagExpChatTransparentFocusSupportModule then
		local function v26()
			-- upvalues: Signal2_4 (copy)
			Signal2_4(true)
		end
		
		local function SetContextMenuOpen()
			-- upvalues: v26 (copy), Signal2 (copy), Signal2_1 (copy)
			v26()
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	else
		local SetContextMenuOpen: () -> () = v4
	end
	config.setContextMenuOpen = SetContextMenuOpen
	
	if FFlagExpChatTransparentFocusSupportModule then
		local function v28()
			-- upvalues: Signal2_4 (copy)
			Signal2_4(false)
		end
		
		local function ClearContextMenuOpen()
			-- upvalues: v28 (copy), Signal2 (copy), Signal2_1 (copy)
			v28()
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	else
		local ClearContextMenuOpen: () -> () = v4
	end
	config.clearContextMenuOpen = ClearContextMenuOpen
	
	if FFlagExpChatDictationFadeOverrideModule then
		local function v30()
			-- upvalues: Signal2_5 (copy)
			Signal2_5(true)
		end
		
		local function SetDictationActive()
			-- upvalues: v30 (copy), Signal2 (copy), Signal2_1 (copy)
			v30()
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	else
		local SetDictationActive: () -> () = v4
	end
	config.setDictationActive = SetDictationActive
	
	if FFlagExpChatDictationFadeOverrideModule then
		local function v32()
			-- upvalues: Signal2_5 (copy)
			Signal2_5(false)
		end
		
		local function ClearDictationActive()
			-- upvalues: v32 (copy), Signal2 (copy), Signal2_1 (copy)
			v32()
			Signal2(os.clock())
			Signal2_1(os.clock())
		end
	else
		local ClearDictationActive: () -> () = v4
	end
	config.clearDictationActive = ClearDictationActive
	
	return config
end