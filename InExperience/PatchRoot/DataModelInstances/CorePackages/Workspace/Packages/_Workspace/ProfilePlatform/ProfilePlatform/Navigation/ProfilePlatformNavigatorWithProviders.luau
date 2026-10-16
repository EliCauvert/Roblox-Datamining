local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local AppCommonLibModule = require(Parent.AppCommonLib)
local SubPages = require(Parent.SocialLuaAnalytics).Analytics.Enums.SubPages
local InitializeProfileAnalyticsModule = require(ProfilePlatform.Analytics.initializeProfileAnalytics)
local ProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.ProfileAnalyticsContext)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local ProfileScrollContextProviderModule = require(ProfilePlatform.Contexts.ProfileScrollContext.ProfileScrollContextProvider)
local HttpService = game:GetService("HttpService")
local FFlagProfilePlatformEnableImpressions = require(Parent.SharedFlags).FFlagProfilePlatformEnableImpressions
local ProfilePlatformNavigatorModule = require(script.Parent.ProfilePlatformNavigator)

local function v13(p1) --[[ Line: 18 ]]
	-- upvalues: FFlagProfilePlatformEnableImpressions (copy), ReactModule (copy), UseProfileWrapperContextModule (copy), AppCommonLibModule (copy), HttpService (copy), InitializeProfileAnalyticsModule (copy), SubPages (copy), CryoModule (copy), ProfileAnalyticsContextModule (copy), ProfileScrollContextProviderModule (copy), ProfilePlatformNavigatorModule (copy)
	local Ref = if FFlagProfilePlatformEnableImpressions then nil else ReactModule.createRef()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local NewResult = if FFlagProfilePlatformEnableImpressions then AppCommonLibModule.Signal.new() else nil
	
	return ReactModule.createElement(ProfileAnalyticsContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 27 ]]
			-- upvalues: FFlagProfilePlatformEnableImpressions (upval), Ref (copy), HttpService (upval), InitializeProfileAnalyticsModule (upval), UseProfileWrapperContextModuleResult (copy), ProfileId (copy), SubPages (upval), CryoModule (upval), NewResult (copy)
			if not FFlagProfilePlatformEnableImpressions and Ref.current == nil then
				Ref.current = HttpService:GenerateGUID(false)
			end
			local InitializeProfileAnalyticsModuleResult = InitializeProfileAnalyticsModule()
			InitializeProfileAnalyticsModuleResult.updateInfoForAllEvents({
				profileSessionId = if FFlagProfilePlatformEnableImpressions then UseProfileWrapperContextModuleResult.profileSessionId elseif UseProfileWrapperContextModuleResult.sessionIdOverride then UseProfileWrapperContextModuleResult.sessionIdOverride else Ref.current,
				profileId = ProfileId,
				profileType = UseProfileWrapperContextModuleResult.profileType,
				subpage = SubPages.PeekView
			})
			
			return if FFlagProfilePlatformEnableImpressions then CryoModule.Dictionary.join(InitializeProfileAnalyticsModuleResult, { scrollViewPositionChangedSignal = NewResult }) else InitializeProfileAnalyticsModuleResult
		end, {
			ProfileId,
			UseProfileWrapperContextModuleResult.sessionIdOverride
		})
	}, {
		ReactModule.createElement(ProfileScrollContextProviderModule, nil, {
			ReactModule.createElement(ProfilePlatformNavigatorModule, p1)
		})
	})
end

local ProfilePlatformNavigatorWithProviders = ReactModule.PureComponent:extend("ProfilePlatformNavigatorWithProviders")

function ProfilePlatformNavigatorWithProviders.render(p1) --[[ Line: 61 ]]
	-- upvalues: ReactModule (copy), v13 (copy)
	return ReactModule.createElement(v13, p1.props)
end

ProfilePlatformNavigatorWithProviders.router = ProfilePlatformNavigatorModule.router

return ProfilePlatformNavigatorWithProviders