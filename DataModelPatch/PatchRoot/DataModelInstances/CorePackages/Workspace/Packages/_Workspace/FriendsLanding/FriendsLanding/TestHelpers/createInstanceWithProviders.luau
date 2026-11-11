local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local DevDependenciesModule = require(FriendsLanding.devDependencies)
local Jest = DevDependenciesModule.JestGlobals.jest
local InstallReducerModule = require(FriendsLanding.installReducer)
local T = DependenciesModule.t
local FilterStatesModule = require(FriendsLanding.Friends.filterStates)
local FoldProvidersModule = require(FriendsLanding.Utils.foldProviders)
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local FriendsLandingAnalyticsModule = require(FriendsLanding.FriendsLandingAnalytics)
local EnumScreensModule = require(FriendsLanding.EnumScreens)
local Llama = DependenciesModule.llama
local Foundation = DevDependenciesModule.Foundation
local UIBlox = DependenciesModule.UIBlox
local Roact = DependenciesModule.Roact
local Rodux = DependenciesModule.Rodux
local RoactRodux = DependenciesModule.RoactRodux
local RoactNavigation = DependenciesModule.RoactNavigation
local ApolloClientModule = require(Parent.ApolloClient)
local UserProfilesModule = require(Parent.UserProfiles)
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationService = ReactFocusNavigationModule.FocusNavigationService
local CoreGui = ReactFocusNavigationModule.EngineInterface.CoreGui
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local StrictInterfaceResult = T.strictInterface({
	context = T.optional(T.table),
	initialState = T.optional(T.table),
	props = T.optional(T.table),
	store = T.optional(T.table),
	policy = T.optional(T.table),
	analytics = T.optional(T.table),
	navigation = T.optional(T.table),
	apolloClient = T.optional(T.table)
})
local config = {
	state = { routeName = "", key = "", params = {} },
	dispatch = function() end,
	goBack = function() end,
	addListener = function()
		return { remove = function() end }
	end,
	isFocused = function() end,
	setParams = function() end,
	getParam = function() end,
	navigate = function() end,
	_dangerouslyGetParent = function() end
}

return function(Callback)
	-- upvalues: StrictInterfaceResult (copy), Rodux (copy), InstallReducerModule (copy), Llama (copy), DependenciesModule (copy), MockApolloClientFunction (copy), UserProfilesModule (copy), ApolloClientModule (copy), Jest (copy), FilterStatesModule (copy), EnumScreensModule (copy), FriendsLandingContextModule (copy), FriendsLandingAnalyticsModule (copy), RoactNavigation (copy), config (copy), DesignTokenProvider (copy), FocusNavigationService (copy), CoreGui (copy), ReactFocusNavigationModule (copy), RoactRodux (copy), UIBlox (copy), Foundation (copy), Roact (copy), FoldProvidersModule (copy)
	return function(p1, p2)
		-- upvalues: StrictInterfaceResult (upval), Rodux (upval), InstallReducerModule (upval), Llama (upval), DependenciesModule (upval), MockApolloClientFunction (upval), UserProfilesModule (upval), ApolloClientModule (upval), Jest (upval), FilterStatesModule (upval), EnumScreensModule (upval), FriendsLandingContextModule (upval), FriendsLandingAnalyticsModule (upval), RoactNavigation (upval), config (upval), DesignTokenProvider (upval), FocusNavigationService (upval), CoreGui (upval), ReactFocusNavigationModule (upval), RoactRodux (upval), UIBlox (upval), Foundation (upval), Roact (upval), FoldProvidersModule (upval), Callback (copy)
		assert(StrictInterfaceResult(p2))
		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Parent = game:GetService("CoreGui")
		local List = {}
		local NewResult = Rodux.Store.new(Rodux.combineReducers({
			FriendsLanding = InstallReducerModule(),
			LocalUserId = function(p3)
				return p3
			end,
			ScreenSize = function(p3)
				return p3
			end
		}), Llama.Dictionary.join({
			LocalUserId = "LocalUserId",
			ScreenSize = Vector2.new(1000, 1000),
			FriendsLanding = {
				NetworkStatus = {
					["https://friends.roblox.com//v1/users/test/friends"] = "Done"
				}
			}
		}, p2.initialState), { Rodux.thunkMiddleware })
		local config1 = {
			getShowDisplayName = function(): boolean
				return true
			end,
			getFriendFinder = function(): boolean
				return true
			end,
			getAccountProviderName = function(): string
				return ""
			end,
			shouldInviteFromAccountProvider = function(): boolean
				return true
			end,
			getEnableProfileQrCode = function(): boolean
				return true
			end,
			getShouldHideContactImporterUpsell = function(): boolean
				return false
			end,
			getFriendRequestNicknamesEnabled = function(): boolean
				return true
			end,
			getCanAccessTrustedContacts = function(): boolean
				return false
			end,
			getRequiresOSAFriendingEducation = function(): boolean
				return false
			end,
			getWebViewSupport = function(): boolean
				return false
			end
		}
		table.insert(List, {
			DependenciesModule.UniversalAppPolicy.Provider,
			{
				policy = {
					function()
						-- upvalues: Llama (upval), config1 (copy), p2 (copy)
						return Llama.Dictionary.join(config1, p2.policy)
					end
				}
			}
		})
		local MockApolloClientResult = MockApolloClientFunction({})
		local UserProfilesFriendsLandingQueryByUserIds = UserProfilesModule.Queries.userProfilesFriendsLandingQueryByUserIds
		MockApolloClientResult:writeQuery({
			variables = { userIds = { "0" } },
			query = UserProfilesFriendsLandingQueryByUserIds,
			data = {
				userProfiles = {
					{
						__typename = "UserProfile",
						id = "0",
						isVerified = false,
						isDeleted = false,
						names = {
							__typename = "Names",
							combinedName = "test",
							username = "test"
						}
					}
				}
			}
		})
		MockApolloClientResult:writeQuery({
			variables = { userIds = { "40" } },
			query = UserProfilesFriendsLandingQueryByUserIds,
			data = {
				userProfiles = {
					{
						__typename = "UserProfile",
						id = "40",
						isVerified = false,
						isDeleted = false,
						names = {
							__typename = "Names",
							combinedName = "offlineFriend1",
							username = "offlineFriend1"
						}
					}
				}
			}
		})
		MockApolloClientResult:writeQuery({
			variables = { userIds = { "39" } },
			query = UserProfilesFriendsLandingQueryByUserIds,
			data = {
				userProfiles = {
					{
						__typename = "UserProfile",
						id = "39",
						isVerified = false,
						isDeleted = false,
						names = {
							__typename = "Names",
							combinedName = "offlineFriend2",
							username = "offlineFriend2"
						}
					}
				}
			}
		})
		MockApolloClientResult:writeQuery({
			variables = { userIds = { "38" } },
			query = UserProfilesFriendsLandingQueryByUserIds,
			data = {
				userProfiles = {
					{
						__typename = "UserProfile",
						id = "38",
						isVerified = false,
						isDeleted = false,
						names = {
							__typename = "Names",
							combinedName = "onlineFriend",
							username = "onlineFriend"
						}
					}
				}
			}
		})
		MockApolloClientResult:writeQuery({
			variables = { userIds = { "37" } },
			query = UserProfilesFriendsLandingQueryByUserIds,
			data = {
				userProfiles = {
					{
						__typename = "UserProfile",
						id = "37",
						isVerified = false,
						isDeleted = false,
						names = {
							__typename = "Names",
							combinedName = "inGameFriend",
							username = "inGameFriend"
						}
					}
				}
			}
		})
		MockApolloClientResult:writeQuery({
			variables = { userIds = { "36" } },
			query = UserProfilesFriendsLandingQueryByUserIds,
			data = {
				userProfiles = {
					{
						__typename = "UserProfile",
						id = "36",
						isVerified = false,
						isDeleted = false,
						names = {
							__typename = "Names",
							combinedName = "inStudioFriend",
							username = "inStudioFriend"
						}
					}
				}
			}
		})
		MockApolloClientResult:writeQuery({
			variables = { userIds = { "123" } },
			query = UserProfilesFriendsLandingQueryByUserIds,
			data = {
				userProfiles = {
					{
						__typename = "UserProfile",
						id = "123",
						isVerified = false,
						isDeleted = false,
						names = {
							__typename = "Names",
							combinedName = "rowan",
							username = "mance"
						}
					}
				}
			}
		})
		MockApolloClientResult:writeQuery({
			variables = { userIds = { "456" } },
			query = UserProfilesFriendsLandingQueryByUserIds,
			data = {
				userProfiles = {
					{
						__typename = "UserProfile",
						id = "456",
						isVerified = false,
						isDeleted = false,
						names = {
							__typename = "Names",
							combinedName = "henry",
							username = "williams"
						}
					}
				}
			}
		})
		table.insert(List, {
			ApolloClientModule.ApolloProvider,
			{ client = MockApolloClientResult }
		})
		local config2 = {
			setFilterKeys = Jest.fn(),
			refreshPage = Jest.fn(),
			wideMode = true,
			screenSize = Vector2.new(512, 512),
			filter = FilterStatesModule.All,
			navigateToLuaAppPages = {
				[EnumScreensModule.FriendFinder] = Jest.fn(),
				[EnumScreensModule.ViewUserProfile] = Jest.fn()
			},
			getScreenTopBar = function()
				return { shouldRenderCenter = false }
			end,
			friendRequestCount = 0,
			setScreenTopBar = Jest.fn()
		}
		
		if p2.context then
			Llama.Dictionary.map(p2.context, function(p3, Key)
				-- upvalues: config2 (copy)
				config2[Key] = p3
			end)
		end
		table.insert(List, {
			FriendsLandingContextModule.Provider,
			{ value = config2 }
		})
		table.insert(List, {
			FriendsLandingAnalyticsModule.Context.Provider,
			{
				value = p2.analytics or {
					buttonClick = Jest.fn(),
					pageLoaded = Jest.fn(),
					navigate = Jest.fn(),
					pageLoadingTimeReport = Jest.fn(),
					pageLoadedWithArgs = Jest.fn(),
					pageMountingTimeReport = Jest.fn(),
					impressionEvent = Jest.fn()
				}
			}
		})
		table.insert(List, {
			RoactNavigation.Provider,
			{ value = Llama.Dictionary.join(config, p2.navigation) }
		})
		table.insert(List, {
			DesignTokenProvider,
			{
				tokenMappers = {
					App = function(_, p3)
						return {
							Page = {
								BackgroundColor = p3.Color.Surface.Surface_0.Color3,
								BackgroundTransparency = p3.Color.Surface.Surface_0.Transparency,
								SafeAreaMargin = Vector2.new(p3.Size.Size_1600, p3.Size.Size_600)
							}
						}
					end,
					FriendsLanding = function(_, _)
						return {
							AddFriendsPage = {
								GridViewItemMetrics = { minimumItemsPerRow = 6, minimumItemWidth = 258 }
							},
							FriendsLandingPage = {
								GridHorizontalSpacing = 24,
								GridVerticalSpacing = 24,
								GridViewItemMetrics = { minimumItemsPerRow = 6, minimumItemWidth = 258 }
							},
							ShowMore = {}
						}
					end
				}
			}
		})
		local NewFocusNavigationService = FocusNavigationService.new(CoreGui)
		table.insert(List, {
			ReactFocusNavigationModule.FocusNavigationContext.Provider,
			{ value = NewFocusNavigationService }
		})
		table.insert(List, {
			RoactRodux.StoreProvider,
			{ store = p2.store or NewResult }
		})
		table.insert(List, {
			UIBlox.App.Style.AppStyleProvider,
			{ style = { themeName = "Dark", fontName = "Gotham" } }
		})
		table.insert(List, {
			Foundation.FoundationProvider,
			{
				style = {
					theme = Foundation.Enums.Theme.Dark,
					device = Foundation.Enums.Device.Desktop
				}
			}
		})
		local MountResult = Roact.mount(Callback((FoldProvidersModule(Roact.createElement(p1, Llama.Dictionary.join(p2.props)), List))), ScreenGui)
		
		return ScreenGui, function()
			-- upvalues: Roact (upval), MountResult (copy), ScreenGui (copy), NewFocusNavigationService (copy)
			Roact.unmount(MountResult)
			ScreenGui:Destroy()
			NewFocusNavigationService:focusGuiObject(nil)
			NewFocusNavigationService:teardown()
		end
	end
end