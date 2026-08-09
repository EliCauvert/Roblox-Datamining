local parent = script:FindFirstAncestor("Style").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local theme = foundationModule.Enums.Theme
local getSceneOverridesStoreModule = require(script.Parent.getSceneOverridesStore)
local fFlagFixUiModeStyleProviderTreeShapeRace = require(parent.SharedFlags).FFlagFixUiModeStyleProviderTreeShapeRace

return function(p0) --[[ line: 15 | named "SceneOverridesRegistry" ]]
	-- upvalues: fFlagFixUiModeStyleProviderTreeShapeRace (ref), useTokens (ref), reactModule (ref), theme (ref), getSceneOverridesStoreModule (ref)
	local var3 = if fFlagFixUiModeStyleProviderTreeShapeRace then p0.isActive else nil
	local var4 = useTokens()
	local var5 = reactModule.useMemo(function() --[[ line: 19 ]]
		-- upvalues: var4 (ref), theme (copy)
		local color3 = var4.Color.Extended.Gray.Gray_300.Color3
		local color3_1 = var4.Color.Extended.Gray.Gray_400.Color3
		local color3_2 = var4.Color.Extended.Gray.Gray_500.Color3
		local color3_3 = var4.Color.Extended.Gray.Gray_700.Color3
		local color3_4 = var4.Color.Surface.Surface_200.Color3
		
		return if var4.Config.ColorMode.Name == theme.Light then {
			SkyboxBlockerTransparency = 0,
			FogStart = 400,
			FogEnd = 500,
			SkyboxBlockerColor = color3_1:Lerp(color3_4, 0.6),
			BackPanel = color3_2:Lerp(color3_4, 0.6),
			Clouds = color3_2:Lerp(color3_4, 0.3),
			LargerShapes = color3_2:Lerp(color3_4, 0.4),
			AvatarParticles = color3_2:Lerp(color3_4, 0.4),
			Baseplate = color3:Lerp(color3_4, 0.2),
			FogColor = color3_1:Lerp(color3_4, 0.4)
		} else {
			SkyboxBlockerTransparency = 0,
			FogStart = 400,
			FogEnd = 500,
			SkyboxBlockerColor = var4.Color.Extended.Gray.Gray_800.Color3:Lerp(color3_4, 0.3),
			BackPanel = color3_3:Lerp(color3_4, 0.3),
			Clouds = color3_3:Lerp(color3_4, 0.3),
			LargerShapes = color3_3:Lerp(var4.Color.Surface.Surface_100.Color3, 0.4),
			AvatarParticles = color3_3:Lerp(color3_4, 0.4),
			Baseplate = var4.Color.Extended.Gray.Gray_900.Color3:Lerp(color3_4, 0.2),
			FogColor = var4.Color.Extended.Gray.Gray_1100.Color3:Lerp(color3_4, 0.3)
		}
	end, { var4 })
	reactModule.useEffect(function() --[[ line: 60 ]]
		-- upvalues: getSceneOverridesStoreModule (copy), fFlagFixUiModeStyleProviderTreeShapeRace (copy), var3 (ref), var5 (ref)
		local var6 = getSceneOverridesStoreModule()
		
		if fFlagFixUiModeStyleProviderTreeShapeRace and not var3 then
			return
		end
		var6.setSceneOverrides(var5)
		
		return function() --[[ line: 67 ]]
			-- upvalues: var6 (ref)
			var6.setSceneOverrides(nil)
		end
	end, {
		if fFlagFixUiModeStyleProviderTreeShapeRace then var3 else nil,
		var5
	})
	
	return p0.children
end