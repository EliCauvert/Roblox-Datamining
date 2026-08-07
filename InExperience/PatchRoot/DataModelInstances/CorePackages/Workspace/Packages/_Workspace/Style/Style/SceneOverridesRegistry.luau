local parent = script:FindFirstAncestor("Style").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local theme = foundationModule.Enums.Theme
local getSceneOverridesStoreModule = require(script.Parent.getSceneOverridesStore)

return function(p0) --[[ line: 14 | named "SceneOverridesRegistry" ]]
	-- upvalues: useTokens (ref), reactModule (ref), theme (ref), getSceneOverridesStoreModule (ref)
	local isActive = p0.isActive
	local var3 = useTokens()
	local var4 = reactModule.useMemo(function() --[[ line: 18 ]]
		-- upvalues: var3 (ref), theme (copy)
		local color3 = var3.Color.Extended.Gray.Gray_300.Color3
		local color3_1 = var3.Color.Extended.Gray.Gray_400.Color3
		local color3_2 = var3.Color.Extended.Gray.Gray_500.Color3
		local color3_3 = var3.Color.Extended.Gray.Gray_700.Color3
		local color3_4 = var3.Color.Surface.Surface_200.Color3
		
		return if var3.Config.ColorMode.Name == theme.Light then {
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
			SkyboxBlockerColor = var3.Color.Extended.Gray.Gray_800.Color3:Lerp(color3_4, 0.3),
			BackPanel = color3_3:Lerp(color3_4, 0.3),
			Clouds = color3_3:Lerp(color3_4, 0.3),
			LargerShapes = color3_3:Lerp(var3.Color.Surface.Surface_100.Color3, 0.4),
			AvatarParticles = color3_3:Lerp(color3_4, 0.4),
			Baseplate = var3.Color.Extended.Gray.Gray_900.Color3:Lerp(color3_4, 0.2),
			FogColor = var3.Color.Extended.Gray.Gray_1100.Color3:Lerp(color3_4, 0.3)
		}
	end, { var3 })
	reactModule.useEffect(function() --[[ line: 59 ]]
		-- upvalues: getSceneOverridesStoreModule (copy), isActive (ref), var4 (ref)
		local var5 = getSceneOverridesStoreModule()
		
		if isActive then
			var5.setSceneOverrides(var4)
			
			return function() --[[ line: 66 ]]
				-- upvalues: var5 (ref)
				var5.setSceneOverrides(nil)
			end
		end
	end, { isActive, var4 })
	
	return p0.children
end