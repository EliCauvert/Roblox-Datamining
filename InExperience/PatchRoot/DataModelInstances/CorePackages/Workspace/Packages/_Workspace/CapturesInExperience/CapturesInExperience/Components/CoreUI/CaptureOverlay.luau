local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RunService = game:GetService("RunService")
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local ConstantsModule = require(Parent.Constants)
local UseAnimatedBindingFunction = ReactOtterModule.useAnimatedBinding
local UseBindCaptureShortcutModule = require(Parent.Hooks.useBindCaptureShortcut)
local UseEffectFunction = ReactModule.useEffect
local UseSelectorFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useSelector
local UseShowFlashOverlayModule = require(Parent.Hooks.useShowFlashOverlay)
local UseTopbarInsetHeightModule = require(Parent.Hooks.useTopbarInsetHeight)
local InstantFunction = ReactOtterModule.instant
local SpringFunction = ReactOtterModule.spring

return function(_)
	-- upvalues: UseBindCaptureShortcutModule (copy), UseTopbarInsetHeightModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseShowFlashOverlayModule (copy), UseAnimatedBindingFunction (copy), UseEffectFunction (copy), InstantFunction (copy), RunService (copy), SpringFunction (copy), ReactModule (copy)
	UseBindCaptureShortcutModule()
	local UseTopbarInsetHeightModuleResult = UseTopbarInsetHeightModule()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].IsOverlayActive
	end)
	local UseShowFlashOverlayModuleResult, UseShowFlashOverlayModuleResult2 = UseShowFlashOverlayModule()
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(1)
	UseEffectFunction(function()
		-- upvalues: UseShowFlashOverlayModuleResult (copy), UseShowFlashOverlayModuleResult2 (copy), UseAnimatedBindingResult2 (copy), InstantFunction (upval), RunService (upval), SpringFunction (upval)
		if UseShowFlashOverlayModuleResult then
			UseShowFlashOverlayModuleResult2()
			UseAnimatedBindingResult2((InstantFunction(0)))
			task.defer(function()
				-- upvalues: RunService (upval), UseAnimatedBindingResult2 (upval), SpringFunction (upval)
				RunService.RenderStepped:Wait()
				RunService.RenderStepped:Wait()
				UseAnimatedBindingResult2(SpringFunction(1))
			end)
		end
	end, { UseShowFlashOverlayModuleResult })
	
	return ReactModule.createElement("Frame", {
		Active = false,
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = if UseShowFlashOverlayModuleResult then UseAnimatedBindingResult else 1,
		Position = UDim2.fromOffset(0, -UseTopbarInsetHeightModuleResult),
		Size = UDim2.new(1, 0, 1, UseTopbarInsetHeightModuleResult),
		Visible = UseSelectorResult,
		ZIndex = ConstantsModule.ZIndex.Entrypoint
	}, {})
end