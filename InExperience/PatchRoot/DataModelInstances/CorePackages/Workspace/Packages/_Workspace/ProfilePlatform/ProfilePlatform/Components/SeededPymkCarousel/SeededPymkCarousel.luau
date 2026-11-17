local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(Parent.AppCommonLib)
local CollectionLayoutStoreProvider = require(Parent.CollectionViews).CollectionLayoutStoreProvider
local ReactModule = require(Parent.React)
local HorizontalPageMargin = require(Parent.UIBlox).App.Container.HorizontalPageMargin
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local UseComponentConfigFunction = SduiSharedUtilitiesModule.useComponentConfig
local EnumsModule = require(ProfilePlatform.Common.Enums)
local SeededPymkModule = require(ProfilePlatform.Networking.SeededPymk)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)

return ReactModule.memo(function(p1)
	-- upvalues: SeededPymkModule (copy), UseComponentConfigFunction (copy), ReactModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), HorizontalPageMargin (copy), CollectionLayoutStoreProvider (copy), SduiFeatureEntryPoint (copy)
	local ConfigKey = SeededPymkModule.getConfigKey(p1.profileSessionId, p1.seedUserId)
	local UseComponentConfigResult = UseComponentConfigFunction(ConfigKey)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local Names = UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader).names
	local PrimaryName = if Names then Names.primaryName else nil
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
		-- upvalues: p1 (copy), PrimaryName (copy)
		return {
			analyticsSurface = p1.analyticsSurface,
			onRecommendationsShown = p1.onRecommendationsShown,
			seedUserDisplayName = PrimaryName,
			scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal
		}
	end, {
		p1.analyticsSurface,
		p1.onRecommendationsShown,
		PrimaryName,
		p1.scrollViewPositionChangedSignal
	})
	
	return if UseComponentConfigResult == nil then nil else ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		Row = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			ref = UseStateResult2
		}, {
			CollectionLayoutStoreProvider = ReactModule.createElement(CollectionLayoutStoreProvider, { container = UseStateResult }, {
				SduiFeatureEntryPoint = ReactModule.createElement(SduiFeatureEntryPoint, {
					shouldDisplayLoading = false,
					shouldDisplayError = false,
					appPage = p1.appPage,
					configKey = ConfigKey,
					extraLocalProps = UseMemoResult
				})
			})
		})
	})
end)