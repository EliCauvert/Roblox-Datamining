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

return function(_) --[[ line: 26 ]]
	-- upvalues: useBindCaptureShortcutModule (ref), useTopbarInsetHeightModule (ref), useSelector (ref), constantsModule (ref), useShowFlashOverlayModule (ref), useAnimatedBinding (ref), useEffect (ref), instant (ref), runService (ref), spring (ref), reactModule (ref)
	useBindCaptureShortcutModule()
	local var8 = useTopbarInsetHeightModule()
	local var9 = useSelector(function(p0) --[[ line: 31 ]]
		-- upvalues: constantsModule (copy)
		return p0[constantsModule.RoduxKey].IsOverlayActive
	end)
	local var10, var11 = useShowFlashOverlayModule()
	local var12, var13 = useAnimatedBinding(1)
	useEffect(function() --[[ line: 38 ]]
		-- upvalues: var10 (ref), var11 (ref), var13 (ref), instant (copy), runService (copy), spring (copy)
		if var10 then
			var11()
			var13(instant(0))
			task.defer(function() --[[ line: 48 ]]
				-- upvalues: runService (copy), var13 (copy), spring (copy)
				runService.RenderStepped:Wait()
				runService.RenderStepped:Wait()
				var13(spring(1))
			end)
		end
	end, { var10 })
	
	return reactModule.createElement("Frame", {
		Active = false,
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = if var10 then var12 else 1,
		Position = UDim2.fromOffset(0, -var8),
		Size = UDim2.new(1, 0, 1, var8),
		Visible = var9,
		ZIndex = constantsModule.ZIndex.Entrypoint
	}, {})
end