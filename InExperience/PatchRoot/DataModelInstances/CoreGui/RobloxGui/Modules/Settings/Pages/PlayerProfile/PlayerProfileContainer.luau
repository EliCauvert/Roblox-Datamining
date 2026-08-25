local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local view = require(corePackagesService.Packages.Foundation).View
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local roactAppPolicy = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local appFeaturePolicies = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies
local chatPolicies = require(corePackagesService.Workspace.Packages.SocialPolicies).ChatPolicies
local avatarPolicies = require(corePackagesService.Workspace.Packages.AvatarPolicies).AvatarPolicies
local sharePolicies = require(corePackagesService.Workspace.Packages.SocialPolicies).SharePolicies
local shareTargetGamePolicies = require(corePackagesService.Workspace.Packages.SocialPolicies).ShareTargetGamePolicies
local enumsModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.Enums)
local installReducerModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.installReducer)
local constantsModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.Constants)
local profileTypes = enumsModule.ProfileTypes
local profileWrapperContextModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local playerProfileModule = require(script.Parent.PlayerProfile)

local function createStore(p0)
	-- upvalues: roduxModule (ref), constantsModule (ref), installReducerModule (ref)
	return roduxModule.Store.new(roduxModule.combineReducers({ [constantsModule.RODUX_KEY] = installReducerModule() }), p0 or {}, { roduxModule.thunkMiddleware })
end

return function(p1)
	-- upvalues: reactModule (ref), roactAppPolicy (ref), appFeaturePolicies (ref), chatPolicies (ref), avatarPolicies (ref), sharePolicies (ref), shareTargetGamePolicies (ref), profileWrapperContextModule (ref), profileTypes (ref), enumsModule (ref), coreScriptsRootProvider (ref), roactRoduxModule (ref), createStore (ref), responsiveModule (ref), view (ref), playerProfileModule (ref)
	local var11 = reactModule.useRef(nil)
	
	return reactModule.createElement(roactAppPolicy.Provider, {
		policy = {
			appFeaturePolicies,
			chatPolicies,
			avatarPolicies,
			sharePolicies,
			shareTargetGamePolicies
		}
	}, {
		ProfileWrapperProvider = reactModule.createElement(profileWrapperContextModule.Provider, {
			value = {
				profileId = tostring(p1.userId),
				profileType = profileTypes.User,
				sourceInfo = {
					contextualInfoType = "",
					source = enumsModule.Sources.InExperienceProfile
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
			CoreScriptsRootProvider = reactModule.createElement(coreScriptsRootProvider, {}, {
				RoduxStore = reactModule.createElement(roactRoduxModule.StoreProvider, { store = createStore() }, {
					ResponsiveProvider = reactModule.createElement(responsiveModule.ContainerRef.Provider, { value = var11 }, {
						PlayerProfileContainer = reactModule.createElement(view, { tag = "size-full", ref = var11 }, {
							PlayerProfile = reactModule.createElement(playerProfileModule, { userId = p1.userId, closePage = p1.closePage })
						})
					})
				})
			})
		})
	})
end