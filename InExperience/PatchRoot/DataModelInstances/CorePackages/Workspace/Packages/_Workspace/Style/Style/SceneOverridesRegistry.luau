local parent = script:FindFirstAncestor("Style").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local colorMode = foundationModule.Enums.ColorMode
local getSceneOverridesStoreModule = require(script.Parent.getSceneOverridesStore)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), colorMode (ref), getSceneOverridesStoreModule (ref)
	local isActive = p1.isActive
	local var1 = useTokens()
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), colorMode (copy)
		local color3 = var1.Color.Extended.Gray.Gray_300.Color3
		local color3_1 = var1.Color.Extended.Gray.Gray_400.Color3
		local color3_2 = var1.Color.Extended.Gray.Gray_500.Color3
		local color3_3 = var1.Color.Extended.Gray.Gray_700.Color3
		local color3_4 = var1.Color.Surface.Surface_200.Color3
		
		return if var1.Config.ColorMode.Name == colorMode.Light then {
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
			SkyboxBlockerColor = var1.Color.Extended.Gray.Gray_800.Color3:Lerp(color3_4, 0.3),
			BackPanel = color3_3:Lerp(color3_4, 0.3),
			Clouds = color3_3:Lerp(color3_4, 0.3),
			LargerShapes = color3_3:Lerp(var1.Color.Surface.Surface_100.Color3, 0.4),
			AvatarParticles = color3_3:Lerp(color3_4, 0.4),
			Baseplate = var1.Color.Extended.Gray.Gray_900.Color3:Lerp(color3_4, 0.2),
			FogColor = var1.Color.Extended.Gray.Gray_1100.Color3:Lerp(color3_4, 0.3)
		}
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: getSceneOverridesStoreModule (copy), isActive (ref), var2 (ref)
		local var3 = getSceneOverridesStoreModule()
		
		if isActive then
			var3.setSceneOverrides(var2)
			
			return function()
				-- upvalues: var3 (ref)
				var3.setSceneOverrides(nil)
			end
		end
	end, { isActive, var2 })
	
	return p1.children
end