local UserInputService = game:GetService("UserInputService")
local CoreGuiCommon = script:FindFirstAncestor("CoreGuiCommon")
local Parent = CoreGuiCommon.Parent
local IXPServiceWrapper = require(Parent.IXPServiceWrapper).IXPServiceWrapper
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateEffectFunction = SignalsModule.createEffect
local LogTopBarToggledFunction = require(CoreGuiCommon.Telemetry).LogTopBarToggled
local EnableDesktopUILessMode = game:DefineFastFlag("EnableDesktopUILessMode", false)
local AddUILessModeIxpLayer = game:DefineFastString("AddUILessModeIxpLayer", "")

return function() --[[ Line: 25 ]]
	-- upvalues: CreateSignalFunction (copy), EnableDesktopUILessMode (copy), UserInputService (copy), CreateEffectFunction (copy), LogTopBarToggledFunction (copy), IXPServiceWrapper (copy), AddUILessModeIxpLayer (copy)
	local Signal, _ = CreateSignalFunction(EnableDesktopUILessMode and UserInputService.PreferredInput == Enum.PreferredInput.KeyboardAndMouse)
	local Signal1, Signal2 = CreateSignalFunction(not Signal(false))
	local Effect = CreateEffectFunction(function(p1) --[[ Line: 31 ]]
		-- upvalues: Signal (copy), LogTopBarToggledFunction (upval), Signal1 (copy)
		if Signal(false) then
			LogTopBarToggledFunction(Signal1(p1))
		end
	end)
	
	local function cleanup() --[[ Line: 37 ]]
		-- upvalues: Effect (copy)
		Effect()
	end
	
	if Signal(false) then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AddUILessModeIxpLayer)
	end
	return {
		getUILessModeEnabled = Signal,
		getUIVisible = Signal1,
		setUIVisible = Signal2,
		cleanup = cleanup
	}
end