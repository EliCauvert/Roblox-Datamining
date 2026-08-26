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

function HurtOverlay(p1)
	-- upvalues: starterGuiService (ref), motionModule (ref), t (ref), reactModule (ref), signalsReactModule (ref), getLocalHumanoidStore (ref), signalsModule (ref), constantsModule (ref), fFlagUseNewHurtOverlayImage (ref), color (ref), cachedPolicyServiceModule (ref), color3 (ref), image (ref), fFlagUseNewHurtOverlayAnimation (ref)
	local mockStarterGui = p1.mockStarterGui or starterGuiService
	local var1, var2 = motionModule.useMotion(t.hideOverlay)
	local var3, var4 = reactModule.useState(mockStarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health))
	local var5 = signalsReactModule.useSignalState(getLocalHumanoidStore)
	local var6 = reactModule.useRef(var5.getHealthValue(false))
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var5 (ref), var6 (ref), constantsModule (copy), var2 (ref), t (copy), mockStarterGui (ref), var4 (ref)
		local var7 = signalsModule.createEffect(function(p2)
			-- upvalues: var5 (copy), var6 (copy), constantsModule (copy), var2 (copy), t (copy)
			local healthValue = var5.getHealthValue(p2)
			local current = var6.current
			var6.current = healthValue
			
			if not healthValue.health or not healthValue.maxHealth or not current.health or healthValue.isDead and current.isDead then return end
			if (current.health - healthValue.health) / healthValue.maxHealth < constantsModule.HealthPercentForOverlay then
				return
			end
			var2(t.showOverlay, {
				onAnimationComplete = function(p3)
					-- upvalues: var2 (copy), t (copy)
					if p3 == true then
						var2(t.hideOverlay)
					end
				end
			})
		end)
		local coreGuiChangedSignalConnection = mockStarterGui.CoreGuiChangedSignal:Connect(function(p2, p3)
			-- upvalues: var4 (copy)
			if p2 == Enum.CoreGuiType.Health or p2 == Enum.CoreGuiType.All then
				var4(p3)
			end
		end)
		
		return function()
			-- upvalues: var7 (ref), coreGuiChangedSignalConnection (ref)
			var7()
			coreGuiChangedSignalConnection:Disconnect()
		end
	end, { var5 })
	local var7 = if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then color3 else color
	
	return if var3 then reactModule.createElement(image, {
		tag = "anchor-center-center position-center-center",
		testId = "hurt-overlay",
		Image = if fFlagUseNewHurtOverlayImage then "rbxasset://textures/ui/TopBar/HurtOverlayAsset.png" else "rbxasset://textures/ui/TopBar/WhiteOverlayAsset.png",
		imageStyle = var1.transparency:map(function(p2)
			-- upvalues: var7 (write)
			return { Color3 = var7, Transparency = p2 }
		end),
		ScaleType = Enum.ScaleType.Crop,
		Size = if fFlagUseNewHurtOverlayAnimation then UDim2.fromScale(1, 1) else var1.size
	}) else nil
end

return reactModule.memo(HurtOverlay)