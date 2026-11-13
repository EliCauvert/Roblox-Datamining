local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(Parent.AppCommonLib)
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local UseComponentConfigFunction = SduiSharedUtilitiesModule.useComponentConfig
local SeededPymkModule = require(ProfilePlatform.Networking.SeededPymk)

return ReactModule.memo(function(p1)
	-- upvalues: SeededPymkModule (copy), UseComponentConfigFunction (copy), ReactModule (copy), SduiFeatureEntryPoint (copy)
	local ConfigKey = SeededPymkModule.getConfigKey(p1.profileSessionId, p1.seedUserId)
	local UseComponentConfigResult = UseComponentConfigFunction(ConfigKey)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), SeededPymkModule (upval)
		local ProfileSessionId = p1.profileSessionId
		local SeedUserId = p1.seedUserId
		
		return function()
			-- upvalues: SeededPymkModule (upval), ProfileSessionId (copy), SeedUserId (copy)
			SeededPymkModule.clearSeededPymkRow(ProfileSessionId, SeedUserId)
		end
	end, { p1.profileSessionId, p1.seedUserId })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return {
			analyticsSurface = p1.analyticsSurface,
			onRecommendationsShown = p1.onRecommendationsShown,
			scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal
		}
	end, {
		p1.analyticsSurface,
		p1.onRecommendationsShown,
		p1.scrollViewPositionChangedSignal
	})
	
	return if UseComponentConfigResult == nil then nil else ReactModule.createElement(SduiFeatureEntryPoint, {
		shouldDisplayLoading = false,
		shouldDisplayError = false,
		appPage = p1.appPage,
		configKey = ConfigKey,
		LayoutOrder = p1.layoutOrder,
		extraLocalProps = UseMemoResult
	})
end)