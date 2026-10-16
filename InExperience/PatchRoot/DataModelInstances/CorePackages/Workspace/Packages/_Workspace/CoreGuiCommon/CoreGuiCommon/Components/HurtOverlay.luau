local StarterGui = game:GetService("StarterGui")
local CoreGuiCommon = script:FindFirstAncestor("CoreGuiCommon")
local Parent = CoreGuiCommon.Parent
local ConstantsModule = require(CoreGuiCommon.Constants)
local CachedPolicyServiceModule = require(Parent.CachedPolicyService)
local MotionModule = require(Parent.Motion)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagUseNewHurtOverlayImage = require(CoreGuiCommon.Flags).FFlagUseNewHurtOverlayImage
local FFlagUseNewHurtOverlayAnimation = require(CoreGuiCommon.Flags).FFlagUseNewHurtOverlayAnimation
local GetLocalHumanoidStore = require(CoreGuiCommon.Stores).GetLocalHumanoidStore
local Image = require(Parent.Foundation).Image
local _Color3 = Color3.fromRGB(187, 0, 4)
local _Color3_1 = Color3.new(1, 1, 1)
local config = {
	showOverlay = MotionModule.createState({
		transparency = 0,
		size = if FFlagUseNewHurtOverlayAnimation then nil else UDim2.fromScale(1.5, 1.5)
	}, {
		default = MotionModule.transition(MotionModule.TransitionPreset.Default, {
			duration = if FFlagUseNewHurtOverlayAnimation then 0.1 else 0
		})
	}),
	hideOverlay = MotionModule.createState({
		transparency = 1,
		size = if FFlagUseNewHurtOverlayAnimation then nil else UDim2.fromScale(3, 3)
	}, {
		default = MotionModule.transition(MotionModule.TransitionPreset.Default, {
			duration = if FFlagUseNewHurtOverlayAnimation then 0.5 else 0.3
		})
	})
}

function HurtOverlay(p1) --[[ Line: 51 ]]
	-- upvalues: StarterGui (copy), MotionModule (copy), config (copy), ReactModule (copy), SignalsReactModule (copy), GetLocalHumanoidStore (copy), SignalsModule (copy), ConstantsModule (copy), FFlagUseNewHurtOverlayImage (copy), _Color3 (copy), CachedPolicyServiceModule (copy), _Color3_1 (copy), Image (copy), FFlagUseNewHurtOverlayAnimation (copy)
	local MockStarterGui = p1.mockStarterGui or StarterGui
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion(config.hideOverlay)
	local UseStateResult, UseStateResult2 = ReactModule.useState(MockStarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health))
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetLocalHumanoidStore)
	local UseRefResult = ReactModule.useRef(UseSignalStateResult.getHealthValue(false))
	ReactModule.useEffect(function() --[[ Line: 60 ]]
		-- upvalues: SignalsModule (upval), UseSignalStateResult (copy), UseRefResult (copy), ConstantsModule (upval), UseMotionResult2 (copy), config (upval), MockStarterGui (copy), UseStateResult2 (copy)
		local Effect = SignalsModule.createEffect(function(p2) --[[ Line: 61 ]]
			-- upvalues: UseSignalStateResult (upval), UseRefResult (upval), ConstantsModule (upval), UseMotionResult2 (upval), config (upval)
			local HealthValue = UseSignalStateResult.getHealthValue(p2)
			local Current = UseRefResult.current
			UseRefResult.current = HealthValue
			
			if not HealthValue.health or not HealthValue.maxHealth or not Current.health or HealthValue.isDead and Current.isDead then return end
			if (Current.health - HealthValue.health) / HealthValue.maxHealth >= ConstantsModule.HealthPercentForOverlay then
				UseMotionResult2(config.showOverlay, {
					onAnimationComplete = function(Enabled) --[[ Line: 79 ]]
						-- upvalues: UseMotionResult2 (upval), config (upval)
						if Enabled == true then
							UseMotionResult2(config.hideOverlay)
						end
					end
				})
				
				return
			end
		end)
		local CoreGuiChangedSignalConnection = MockStarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, Enabled) --[[ Line: 88 ]]
			-- upvalues: UseStateResult2 (upval)
			if CoreGuiType == Enum.CoreGuiType.Health or CoreGuiType == Enum.CoreGuiType.All then
				UseStateResult2(Enabled)
			end
		end)
		
		return function() --[[ Line: 95 ]]
			-- upvalues: Effect (copy), CoreGuiChangedSignalConnection (copy)
			Effect()
			CoreGuiChangedSignalConnection:Disconnect()
		end
	end, { UseSignalStateResult })
	local HurtOverlayAssetPng: string = if FFlagUseNewHurtOverlayImage then "rbxasset://textures/ui/TopBar/HurtOverlayAsset.png" else "rbxasset://textures/ui/TopBar/WhiteOverlayAsset.png"
	local Color = if CachedPolicyServiceModule:IsSubjectToChinaPolicies() then _Color3_1 else _Color3
	
	return if UseStateResult then ReactModule.createElement(Image, {
		tag = "anchor-center-center position-center-center",
		testId = "hurt-overlay",
		Image = HurtOverlayAssetPng,
		imageStyle = UseMotionResult.transparency:map(function(Transparency) --[[ Line: 114 ]]
			-- upvalues: Color (ref)
			return { Color3 = Color, Transparency = Transparency }
		end),
		ScaleType = Enum.ScaleType.Crop,
		Size = if FFlagUseNewHurtOverlayAnimation then UDim2.fromScale(1, 1) else UseMotionResult.size
	}) else nil
end

return ReactModule.memo(HurtOverlay)