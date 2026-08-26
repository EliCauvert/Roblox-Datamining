local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local runService = game:GetService("RunService")
local reactModule = require(parent_1.React)
local reactOtterModule = require(parent_1.ReactOtter)
local roactUtilsModule = require(parent_1.RoactUtils)
local constantsModule = require(parent.Constants)
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local useBindCaptureShortcutModule = require(parent.Hooks.useBindCaptureShortcut)
local useEffect = reactModule.useEffect
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useShowFlashOverlayModule = require(parent.Hooks.useShowFlashOverlay)
local useTopbarInsetHeightModule = require(parent.Hooks.useTopbarInsetHeight)
local instant = reactOtterModule.instant
local spring = reactOtterModule.spring

return function(_)
	-- upvalues: useBindCaptureShortcutModule (ref), useTopbarInsetHeightModule (ref), useSelector (ref), constantsModule (ref), useShowFlashOverlayModule (ref), useAnimatedBinding (ref), useEffect (ref), instant (ref), runService (ref), spring (ref), reactModule (ref)
	useBindCaptureShortcutModule()
	local var1 = useTopbarInsetHeightModule()
	local var2 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].IsOverlayActive
	end)
	local var3, var4 = useShowFlashOverlayModule()
	local var5, var6 = useAnimatedBinding(1)
	useEffect(function()
		-- upvalues: var3 (ref), var4 (ref), var6 (ref), instant (copy), runService (copy), spring (copy)
		if var3 then
			var4()
			var6(instant(0))
			task.defer(function()
				-- upvalues: runService (copy), var6 (copy), spring (copy)
				runService.RenderStepped:Wait()
				runService.RenderStepped:Wait()
				var6(spring(1))
			end)
		end
	end, { var3 })
	
	return reactModule.createElement("Frame", {
		Active = false,
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = if var3 then var5 else 1,
		Position = UDim2.fromOffset(0, -var1),
		Size = UDim2.new(1, 0, 1, var1),
		Visible = var2,
		ZIndex = constantsModule.ZIndex.Entrypoint
	}, {})
end