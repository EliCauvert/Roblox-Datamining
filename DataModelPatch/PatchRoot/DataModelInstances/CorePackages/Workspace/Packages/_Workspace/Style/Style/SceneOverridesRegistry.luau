local Parent = script:FindFirstAncestor("Style").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Theme = FoundationModule.Enums.Theme
local GetSceneOverridesStoreModule = require(script.Parent.getSceneOverridesStore)
local FFlagFixUiModeStyleProviderTreeShapeRace = require(Parent.SharedFlags).FFlagFixUiModeStyleProviderTreeShapeRace

return function(p1)
	-- upvalues: FFlagFixUiModeStyleProviderTreeShapeRace (copy), UseTokensFunction (copy), ReactModule (copy), Theme (copy), GetSceneOverridesStoreModule (copy)
	local IsActive = if FFlagFixUiModeStyleProviderTreeShapeRace then p1.isActive else nil
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy), Theme (upval)
		local GrayColor3 = UseTokensResult.Color.Extended.Gray.Gray_300.Color3
		local GrayColor3_1 = UseTokensResult.Color.Extended.Gray.Gray_400.Color3
		local GrayColor3_2 = UseTokensResult.Color.Extended.Gray.Gray_500.Color3
		local GrayColor3_3 = UseTokensResult.Color.Extended.Gray.Gray_700.Color3
		local GrayColor3_4 = UseTokensResult.Color.Extended.Gray.Gray_800.Color3
		local GrayColor3_5 = UseTokensResult.Color.Extended.Gray.Gray_900.Color3
		local GrayColor3_6 = UseTokensResult.Color.Extended.Gray.Gray_1100.Color3
		local SurfaceColor3 = UseTokensResult.Color.Surface.Surface_200.Color3
		local SurfaceColor3_1 = UseTokensResult.Color.Surface.Surface_100.Color3
		
		return if UseTokensResult.Config.ColorMode.Name == Theme.Light then {
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
	ReactModule.useEffect(function()
		-- upvalues: GetSceneOverridesStoreModule (upval), FFlagFixUiModeStyleProviderTreeShapeRace (upval), IsActive (copy), UseMemoResult (copy)
		local SceneOverridesStoreModule = GetSceneOverridesStoreModule()
		
		if FFlagFixUiModeStyleProviderTreeShapeRace and not IsActive then return end
		SceneOverridesStoreModule.setSceneOverrides(UseMemoResult)
		
		return function()
			-- upvalues: SceneOverridesStoreModule (copy)
			SceneOverridesStoreModule.setSceneOverrides(nil)
		end
	end, {
		if FFlagFixUiModeStyleProviderTreeShapeRace then IsActive else nil,
		UseMemoResult
	})
	
	return p1.children
end