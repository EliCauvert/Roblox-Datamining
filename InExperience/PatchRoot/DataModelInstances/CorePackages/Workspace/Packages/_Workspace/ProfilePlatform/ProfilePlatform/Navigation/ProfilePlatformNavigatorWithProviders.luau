local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local appCommonLibModule = require(parent.AppCommonLib)
local subPages = require(parent.SocialLuaAnalytics).Analytics.Enums.SubPages
local initializeProfileAnalyticsModule = require(profilePlatform.Analytics.initializeProfileAnalytics)
local profileAnalyticsContextModule = require(profilePlatform.Contexts.ProfileAnalyticsContext)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local profileScrollContextProviderModule = require(profilePlatform.Contexts.ProfileScrollContext.ProfileScrollContextProvider)
local httpService = game:GetService("HttpService")
local fFlagProfilePlatformEnableImpressions = require(parent.SharedFlags).FFlagProfilePlatformEnableImpressions
local profilePlatformNavigatorModule = require(script.Parent.ProfilePlatformNavigator)

local var1 = function(p1)
	-- upvalues: fFlagProfilePlatformEnableImpressions (ref), reactModule (ref), useProfileWrapperContextModule (ref), appCommonLibModule (ref), httpService (ref), initializeProfileAnalyticsModule (ref), subPages (ref), cryoModule (ref), profileAnalyticsContextModule (ref), profileScrollContextProviderModule (ref), profilePlatformNavigatorModule (ref)
	local var2 = if fFlagProfilePlatformEnableImpressions then nil else reactModule.createRef()
	local var3 = useProfileWrapperContextModule()
	local profileId = var3.profileId
	local var4 = if fFlagProfilePlatformEnableImpressions then appCommonLibModule.Signal.new() else nil
	
	return reactModule.createElement(profileAnalyticsContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: fFlagProfilePlatformEnableImpressions (copy), var2 (ref), httpService (copy), initializeProfileAnalyticsModule (copy), var3 (ref), profileId (ref), subPages (copy), cryoModule (copy), var4 (ref)
			if not fFlagProfilePlatformEnableImpressions and var2.current == nil then
				var2.current = httpService:GenerateGUID(false)
			end
			local var5 = initializeProfileAnalyticsModule()
			var5.updateInfoForAllEvents({
				profileSessionId = if fFlagProfilePlatformEnableImpressions then var3.profileSessionId elseif var3.sessionIdOverride then var3.sessionIdOverride else var2.current,
				profileId = profileId,
				profileType = var3.profileType,
				subpage = subPages.PeekView
			})
			
			return if fFlagProfilePlatformEnableImpressions then cryoModule.Dictionary.join(var5, { scrollViewPositionChangedSignal = var4 }) else var5
		end, { profileId, var3.sessionIdOverride })
	}, {
		reactModule.createElement(profileScrollContextProviderModule, nil, {
			reactModule.createElement(profilePlatformNavigatorModule, p1)
		})
	})
end

local profilePlatformNavigatorWithProviders = reactModule.PureComponent:extend("ProfilePlatformNavigatorWithProviders")

function profilePlatformNavigatorWithProviders.render(p1)
	-- upvalues: reactModule (ref), var1 (ref)
	return reactModule.createElement(var1, p1.props)
end

profilePlatformNavigatorWithProviders.router = profilePlatformNavigatorModule.router

return profilePlatformNavigatorWithProviders