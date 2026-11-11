local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local View = require(CorePackages.Packages.Foundation).View
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local AppFeaturePolicies = require(CorePackages.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies
local ChatPolicies = require(CorePackages.Workspace.Packages.SocialPolicies).ChatPolicies
local AvatarPolicies = require(CorePackages.Workspace.Packages.AvatarPolicies).AvatarPolicies
local SharePolicies = require(CorePackages.Workspace.Packages.SocialPolicies).SharePolicies
local ShareTargetGamePolicies = require(CorePackages.Workspace.Packages.SocialPolicies).ShareTargetGamePolicies
local EnumsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)
local InstallReducerModule = require(CorePackages.Workspace.Packages.ProfilePlatform.installReducer)
local ConstantsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Constants)
local ProfileTypes = EnumsModule.ProfileTypes
local ProfileWrapperContextModule = require(CorePackages.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local PlayerProfileModule = require(script.Parent.PlayerProfile)

local function createStore(p1)
	-- upvalues: RoduxModule (copy), ConstantsModule (copy), InstallReducerModule (copy)
	return RoduxModule.Store.new(RoduxModule.combineReducers({ [ConstantsModule.RODUX_KEY] = InstallReducerModule() }), p1 or {}, { RoduxModule.thunkMiddleware })
end

return function(p1)
	-- upvalues: ReactModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), ChatPolicies (copy), AvatarPolicies (copy), SharePolicies (copy), ShareTargetGamePolicies (copy), ProfileWrapperContextModule (copy), ProfileTypes (copy), EnumsModule (copy), CoreScriptsRootProvider (copy), RoactRoduxModule (copy), createStore (copy), ResponsiveModule (copy), View (copy), PlayerProfileModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.createElement(RoactAppPolicy.Provider, {
		policy = {
			AppFeaturePolicies,
			ChatPolicies,
			AvatarPolicies,
			SharePolicies,
			ShareTargetGamePolicies
		}
	}, {
		ProfileWrapperProvider = ReactModule.createElement(ProfileWrapperContextModule.Provider, {
			value = {
				profileId = tostring(p1.userId),
				profileType = ProfileTypes.User,
				sourceInfo = {
					contextualInfoType = "",
					source = EnumsModule.Sources.InExperienceProfile
				},
				navigateTo = {
					qRCodePage = function() end,
					previousView = function(_) end,
					itemDetails = function(_) end,
					itemOrBundleDetails = function(_, _) end,
					catalogSearch = function(_) end,
					tryOnItem = function(_, _, _, _) end,
					inspectAvatar = p1.inspectAvatar,
					editUsername = function() end,
					openLeaveRobloxAlertUIBlox = function(_) end,
					closeLeaveRobloxAlert = function() end
				},
				externalAnalytics = { catalogAnalytics = {} }
			}
		}, {
			CoreScriptsRootProvider = ReactModule.createElement(CoreScriptsRootProvider, {}, {
				RoduxStore = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore() }, {
					ResponsiveProvider = ReactModule.createElement(ResponsiveModule.ContainerRef.Provider, { value = UseRefResult }, {
						PlayerProfileContainer = ReactModule.createElement(View, { tag = "size-full", ref = UseRefResult }, {
							PlayerProfile = ReactModule.createElement(PlayerProfileModule, { userId = p1.userId, closePage = p1.closePage })
						})
					})
				})
			})
		})
	})
end