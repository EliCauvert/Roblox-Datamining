local starterGuiService = game:GetService("StarterGui")
local coreGuiCommon = script:FindFirstAncestor("CoreGuiCommon")
local parent = coreGuiCommon.Parent
local constantsModule = require(coreGuiCommon.Constants)
local cachedPolicyServiceModule = require(parent.CachedPolicyService)
local foundationModule = require(parent.Foundation)
local motionModule = require(parent.Motion)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local fFlagUseNewHurtOverlayImage = require(coreGuiCommon.Flags).FFlagUseNewHurtOverlayImage
local fFlagUseNewHurtOverlayAnimation = require(coreGuiCommon.Flags).FFlagUseNewHurtOverlayAnimation
local getLocalHumanoidStore = require(coreGuiCommon.Stores).GetLocalHumanoidStore
local image = foundationModule.Image
local color = Color3.fromRGB(187, 0, 4)
local color3 = Color3.new(1, 1, 1)
local t = {
	showOverlay = motionModule.createState({
		transparency = 0,
		size = if fFlagUseNewHurtOverlayAnimation then nil else UDim2.fromScale(1.5, 1.5)
	}, {
		default = motionModule.transition(motionModule.TransitionPreset.Default, {
			duration = if fFlagUseNewHurtOverlayAnimation then 0.1 else 0
		})
	}),
	hideOverlay = motionModule.createState({
		transparency = 1,
		size = if fFlagUseNewHurtOverlayAnimation then nil else UDim2.fromScale(3, 3)
	}, {
		default = motionModule.transition(motionModule.TransitionPreset.Default, {
			duration = if fFlagUseNewHurtOverlayAnimation then 0.5 else 0.3
		})
	})
}

function HurtOverlay(p0)
	-- upvalues: starterGuiService (ref), motionModule (ref), t (ref), reactModule (ref), signalsReactModule (ref), getLocalHumanoidStore (ref), signalsModule (ref), constantsModule (ref), fFlagUseNewHurtOverlayImage (ref), color (ref), cachedPolicyServiceModule (ref), color3 (ref), image (ref), fFlagUseNewHurtOverlayAnimation (ref)
	local mockStarterGui = p0.mockStarterGui or starterGuiService
	local var13, var14 = motionModule.useMotion(t.hideOverlay)
	local var15, var16 = reactModule.useState(mockStarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health))
	local var17 = signalsReactModule.useSignalState(getLocalHumanoidStore)
	local var18 = reactModule.useRef(var17.getHealthValue(false))
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var17 (ref), var18 (ref), constantsModule (copy), var14 (ref), t (copy), mockStarterGui (ref), var16 (ref)
		local var20 = signalsModule.createEffect(function(p1)
			-- upvalues: var17 (copy), var18 (copy), constantsModule (copy), var14 (copy), t (copy)
			local healthValue = var17.getHealthValue(p1)
			local current = var18.current
			var18.current = healthValue
			
			if not healthValue.health or not healthValue.maxHealth or not current.health or healthValue.isDead and current.isDead then return end
			if (current.health - healthValue.health) / healthValue.maxHealth < constantsModule.HealthPercentForOverlay then
				return
			end
			var14(t.showOverlay, {
				onAnimationComplete = function(p2)
					-- upvalues: var14 (copy), t (copy)
					if p2 == true then
						var14(t.hideOverlay)
					end
				end
			})
		end)
		local coreGuiChangedSignalConnection = mockStarterGui.CoreGuiChangedSignal:Connect(function(p3, p4)
			-- upvalues: var16 (copy)
			if p3 == Enum.CoreGuiType.Health or p3 == Enum.CoreGuiType.All then
				var16(p4)
			end
		end)
		
		return function()
			-- upvalues: var20 (ref), coreGuiChangedSignalConnection (ref)
			var20()
			coreGuiChangedSignalConnection:Disconnect()
		end
	end, { var17 })
	local var19 = if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then color3 else color
	
	return if var15 then reactModule.createElement(image, {
		tag = "anchor-center-center position-center-center",
		testId = "hurt-overlay",
		Image = if fFlagUseNewHurtOverlayImage then "rbxasset://textures/ui/TopBar/HurtOverlayAsset.png" else "rbxasset://textures/ui/TopBar/WhiteOverlayAsset.png",
		imageStyle = var13.transparency:map(function(p5)
			-- upvalues: var19 (write)
			return { Color3 = var19, Transparency = p5 }
		end),
		ScaleType = Enum.ScaleType.Crop,
		Size = if fFlagUseNewHurtOverlayAnimation then UDim2.fromScale(1, 1) else var13.size
	}) else nil
end

return reactModule.memo(HurtOverlay)