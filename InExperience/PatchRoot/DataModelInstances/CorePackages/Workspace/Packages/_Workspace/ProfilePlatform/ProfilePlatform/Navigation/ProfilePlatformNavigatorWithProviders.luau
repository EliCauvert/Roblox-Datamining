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

local var10 = function(p0) --[[ line: 18 ]]
	-- upvalues: fFlagProfilePlatformEnableImpressions (ref), reactModule (ref), useProfileWrapperContextModule (ref), appCommonLibModule (ref), httpService (ref), initializeProfileAnalyticsModule (ref), subPages (ref), cryoModule (ref), profileAnalyticsContextModule (ref), profileScrollContextProviderModule (ref), profilePlatformNavigatorModule (ref)
	local var12 = if fFlagProfilePlatformEnableImpressions then nil else reactModule.createRef()
	local var13 = useProfileWrapperContextModule()
	local profileId = var13.profileId
	local var14 = if fFlagProfilePlatformEnableImpressions then appCommonLibModule.Signal.new() else nil
	
	return reactModule.createElement(profileAnalyticsContextModule.Provider, {
		value = reactModule.useMemo(function() --[[ line: 27 ]]
			-- upvalues: fFlagProfilePlatformEnableImpressions (copy), var12 (ref), httpService (copy), initializeProfileAnalyticsModule (copy), var13 (ref), profileId (ref), subPages (copy), cryoModule (copy), var14 (ref)
			if not fFlagProfilePlatformEnableImpressions and var12.current == nil then
				var12.current = httpService:GenerateGUID(false)
			end
			local var15 = initializeProfileAnalyticsModule()
			var15.updateInfoForAllEvents({
				profileSessionId = if fFlagProfilePlatformEnableImpressions then var13.profileSessionId elseif var13.sessionIdOverride then var13.sessionIdOverride else var12.current,
				profileId = profileId,
				profileType = var13.profileType,
				subpage = subPages.PeekView
			})
			
			return if fFlagProfilePlatformEnableImpressions then cryoModule.Dictionary.join(var15, { scrollViewPositionChangedSignal = var14 }) else var15
		end, { profileId, var13.sessionIdOverride })
	}, {
		reactModule.createElement(profileScrollContextProviderModule, nil, {
			reactModule.createElement(profilePlatformNavigatorModule, p0)
		})
	})
end

local profilePlatformNavigatorWithProviders = reactModule.PureComponent:extend("ProfilePlatformNavigatorWithProviders")

function profilePlatformNavigatorWithProviders.render(p1) --[[ line: 61 ]]
	-- upvalues: reactModule (ref), var10 (ref)
	return reactModule.createElement(var10, p1.props)
end

profilePlatformNavigatorWithProviders.router = profilePlatformNavigatorModule.router

return profilePlatformNavigatorWithProviders