local userInputService = game:GetService("UserInputService")
local coreGuiCommon = script:FindFirstAncestor("CoreGuiCommon")
local parent = coreGuiCommon.Parent
local IXPServiceWrapper = require(parent.IXPServiceWrapper).IXPServiceWrapper
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local createEffect = signalsModule.createEffect
local logTopBarToggled = require(coreGuiCommon.Telemetry).LogTopBarToggled
local enableDesktopUILessMode = game:DefineFastFlag("EnableDesktopUILessMode", false)
local addUILessModeIxpLayer = game:DefineFastString("AddUILessModeIxpLayer", "")

return function()
	-- upvalues: createSignal (ref), enableDesktopUILessMode (ref), userInputService (ref), createEffect (ref), logTopBarToggled (ref), IXPServiceWrapper (ref), addUILessModeIxpLayer (ref)
	local var1, _ = createSignal(enableDesktopUILessMode and userInputService.PreferredInput == Enum.PreferredInput.KeyboardAndMouse)
	local var2, var3 = createSignal(not var1(false))
	local var4 = createEffect(function(p1)
		-- upvalues: var1 (ref), logTopBarToggled (copy), var2 (ref)
		if var1(false) then
			logTopBarToggled(var2(p1))
		end
	end)
	
	local function cleanup()
		-- upvalues: var4 (ref)
		var4()
	end
	
	if var1(false) then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(addUILessModeIxpLayer)
	end
	return {
		getUILessModeEnabled = var1,
		getUIVisible = var2,
		setUIVisible = var3,
		cleanup = cleanup
	}
end