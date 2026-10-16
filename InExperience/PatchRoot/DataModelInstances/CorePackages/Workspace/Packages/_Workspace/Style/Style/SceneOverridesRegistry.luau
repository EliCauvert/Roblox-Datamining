local Parent = script:FindFirstAncestor("Style").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ColorMode = FoundationModule.Enums.ColorMode
local GetSceneOverridesStoreModule = require(script.Parent.getSceneOverridesStore)

return function(p1) --[[ Line: 14 | Named "SceneOverridesRegistry" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ColorMode (copy), GetSceneOverridesStoreModule (copy)
	local IsActive = p1.isActive
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 18 ]]
		-- upvalues: UseTokensResult (copy), ColorMode (upval)
		local GrayColor3 = UseTokensResult.Color.Extended.Gray.Gray_300.Color3
		local GrayColor3_1 = UseTokensResult.Color.Extended.Gray.Gray_400.Color3
		local GrayColor3_2 = UseTokensResult.Color.Extended.Gray.Gray_500.Color3
		local GrayColor3_3 = UseTokensResult.Color.Extended.Gray.Gray_700.Color3
		local GrayColor3_4 = UseTokensResult.Color.Extended.Gray.Gray_800.Color3
		local GrayColor3_5 = UseTokensResult.Color.Extended.Gray.Gray_900.Color3
		local GrayColor3_6 = UseTokensResult.Color.Extended.Gray.Gray_1100.Color3
		local SurfaceColor3 = UseTokensResult.Color.Surface.Surface_200.Color3
		local SurfaceColor3_1 = UseTokensResult.Color.Surface.Surface_100.Color3
		
		return if UseTokensResult.Config.ColorMode.Name == ColorMode.Light then {
			SkyboxBlockerTransparency = 0,
			FogStart = 400,
			FogEnd = 500,
			SkyboxBlockerColor = GrayColor3_1:Lerp(SurfaceColor3, 0.6),
			BackPanel = GrayColor3_2:Lerp(SurfaceColor3, 0.6),
			Clouds = GrayColor3_2:Lerp(SurfaceColor3, 0.3),
			LargerShapes = GrayColor3_2:Lerp(SurfaceColor3, 0.4),
			AvatarParticles = GrayColor3_2:Lerp(SurfaceColor3, 0.4),
			Baseplate = GrayColor3:Lerp(SurfaceColor3, 0.2),
			FogColor = GrayColor3_1:Lerp(SurfaceColor3, 0.4)
		} else {
			SkyboxBlockerTransparency = 0,
			FogStart = 400,
			FogEnd = 500,
			SkyboxBlockerColor = GrayColor3_4:Lerp(SurfaceColor3, 0.3),
			BackPanel = GrayColor3_3:Lerp(SurfaceColor3, 0.3),
			Clouds = GrayColor3_3:Lerp(SurfaceColor3, 0.3),
			LargerShapes = GrayColor3_3:Lerp(SurfaceColor3_1, 0.4),
			AvatarParticles = GrayColor3_3:Lerp(SurfaceColor3, 0.4),
			Baseplate = GrayColor3_5:Lerp(SurfaceColor3, 0.2),
			FogColor = GrayColor3_6:Lerp(SurfaceColor3, 0.3)
		}
	end, { UseTokensResult })
	ReactModule.useEffect(function() --[[ Line: 59 ]]
		-- upvalues: GetSceneOverridesStoreModule (upval), IsActive (copy), UseMemoResult (copy)
		local SceneOverridesStoreModule = GetSceneOverridesStoreModule()
		
		if not IsActive then return end
		SceneOverridesStoreModule.setSceneOverrides(UseMemoResult)
		
		return function() --[[ Line: 66 ]]
			-- upvalues: SceneOverridesStoreModule (copy)
			SceneOverridesStoreModule.setSceneOverrides(nil)
		end
	end, { IsActive, UseMemoResult })
	
	return p1.children
end