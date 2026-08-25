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
	local var5, _ = createSignal(enableDesktopUILessMode and userInputService.PreferredInput == Enum.PreferredInput.KeyboardAndMouse)
	local var6, var7 = createSignal(not var5(false))
	local var8 = createEffect(function(p0)
		-- upvalues: var5 (ref), logTopBarToggled (copy), var6 (ref)
		if var5(false) then
			logTopBarToggled(var6(p0))
		end
	end)
	
	local function cleanup()
		-- upvalues: var8 (ref)
		var8()
	end
	
	if var5(false) then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(addUILessModeIxpLayer)
	end
	return {
		getUILessModeEnabled = var5,
		getUIVisible = var6,
		setUIVisible = var7,
		cleanup = cleanup
	}
end