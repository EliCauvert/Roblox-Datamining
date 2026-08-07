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

local function createStore(p0) --[[ line: 29 ]]
	-- upvalues: roduxModule (ref), constantsModule (ref), installReducerModule (ref)
	return roduxModule.Store.new(roduxModule.combineReducers({ [constantsModule.RODUX_KEY] = installReducerModule() }), p0 or {}, { roduxModule.thunkMiddleware })
end

return function(p1) --[[ line: 42 | named "PlayerProfileContainer" ]]
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
					qRCodePage = function() --[[ line: 63 ]] end,
					previousView = function(_) --[[ line: 64 ]] end,
					itemDetails = function(_) --[[ line: 65 ]] end,
					itemOrBundleDetails = function(_, _) --[[ line: 66 ]] end,
					catalogSearch = function(_) --[[ line: 67 ]] end,
					tryOnItem = function(_, _, _, _) --[[ line: 68 ]] end,
					inspectAvatar = p1.inspectAvatar,
					editUsername = function() --[[ line: 76 ]] end,
					openLeaveRobloxAlertUIBlox = function(_) --[[ line: 77 ]] end,
					closeLeaveRobloxAlert = function() --[[ line: 78 ]] end
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