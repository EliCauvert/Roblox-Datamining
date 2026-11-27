local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local MotionModule = require(Parent.Motion)
local RoactNavigationModule = require(Parent.RoactNavigation)
local LibraryBrowserContainerModule = require(script.Parent.LibraryBrowser.LibraryBrowserContainer)
local LibraryCategoryContainerModule = require(script.Parent.LibraryCategory.LibraryCategoryContainer)
local LibraryDetailContainerModule = require(script.Parent.LibraryDetail.LibraryDetailContainer)
local _ = require(BuildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local _ = require(script.Parent.LibraryCategories)
local _ = require(script.Parent.LibraryTypes)
local _ = require(script.Parent.LibraryWorldCutout.LibraryWorldCutoutView)
local UserGameSettings = UserSettings():GetService("UserGameSettings")

local function CategoryScreen(p1)
	-- upvalues: ReactModule (copy), LibraryCategoryContainerModule (copy)
	local ScreenProps = p1.screenProps
	local Params = p1.navigation.state.params
	local UseRefResult = ReactModule.useRef(ScreenProps.query)
	
	if ScreenProps.query ~= "" then
		UseRefResult.current = ScreenProps.query
	end
	return ReactModule.createElement(LibraryCategoryContainerModule, {
		itemKind = Params.itemKind,
		categoryKey = Params.categoryKey,
		folderId = Params.folderId,
		query = if p1.navigation.state.routeName == "Search" then UseRefResult.current else "",
		onOpenItem = ScreenProps.onOpenItem,
		onOpenCategory = ScreenProps.onOpenCategory,
		library = ScreenProps.library,
		isReady = ScreenProps.isReady
	})
end

return RoactNavigationModule.createAppContainer(RoactNavigationModule.createRobloxStackNavigator({
	{
		Browser = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), LibraryBrowserContainerModule (copy)
				local ScreenProps = p1.screenProps
				
				return ReactModule.createElement(LibraryBrowserContainerModule, {
					query = "",
					onOpenItem = ScreenProps.onOpenItem,
					onOpenCategory = ScreenProps.onOpenCategory,
					library = ScreenProps.library,
					isReady = ScreenProps.isReady,
					worldCutout = ScreenProps.worldCutout
				})
			end
		}
	},
	{ Category = { screen = CategoryScreen } },
	{
		Search = {
			screen = function(p1)
				-- upvalues: FoundationModule (copy), UserGameSettings (copy), MotionModule (copy), ReactModule (copy), CategoryScreen (copy)
				local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion or UserGameSettings.ReducedMotion
				local IsNotQueryMatch = p1.screenProps.query ~= ""
				local UseMotionResult, UseMotionResult2 = MotionModule.useMotion({ transparency = if ReducedMotion then 0 else 1 })
				ReactModule.useEffect(function()
					-- upvalues: UseMotionResult2 (copy), MotionModule (upval), IsNotQueryMatch (copy), ReducedMotion (copy)
					UseMotionResult2(MotionModule.createState({ transparency = if IsNotQueryMatch then 0 else 1 }, {
						default = MotionModule.transition({ duration = if ReducedMotion then 0 else 0.15 })
					}))
				end, { IsNotQueryMatch, ReducedMotion, UseMotionResult2 })
				
				return ReactModule.createElement(FoundationModule.View, {
					tag = "size-full bg-surface-0",
					testId = "Library.Search.Results",
					GroupTransparency = UseMotionResult.transparency
				}, { Grid = ReactModule.createElement(CategoryScreen, p1) })
			end,
			navigationOptions = { transparent = true }
		}
	},
	{
		Detail = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), LibraryDetailContainerModule (copy)
				local ScreenProps = p1.screenProps
				local State = p1.navigation.state
				local IsActiveRouteKeyMatch = ScreenProps.activeRouteKey == State.key
				
				return ReactModule.createElement(LibraryDetailContainerModule, {
					isActive = ScreenProps.isOpen and IsActiveRouteKeyMatch,
					itemId = State.params.itemId,
					itemKind = State.params.itemKind,
					library = ScreenProps.library,
					isReady = ScreenProps.isReady,
					onBack = function()
						-- upvalues: IsActiveRouteKeyMatch (copy), ScreenProps (copy)
						if IsActiveRouteKeyMatch then
							ScreenProps.onBack()
						end
					end,
					chatActions = ScreenProps.chatActions,
					resourceActions = ScreenProps.resourceActions,
					unavailableText = ScreenProps.unavailableText
				})
			end
		}
	}
}, {
	initialRouteName = "Browser",
	transitionConfig = function(p1, p2)
		-- upvalues: RoactNavigationModule (copy), UserGameSettings (copy)
		local RouteName = if p2 == nil then nil else p2.scene.route.routeName
		local RouteName1 = p1.scene.route.routeName
		
		if (RouteName1 == "Search" or RouteName == "Search") and not (RouteName1 == "Detail" or RouteName == "Detail") then
			local Copy = table.clone(RoactNavigationModule.StackViewTransitionConfigs.FadeInPlace)
			
			function Copy.screenInterpolator(p3)
				-- upvalues: p1 (copy), p2 (copy)
				return {
					initialPosition = UDim2.fromScale(0, 0),
					forceHidden = p3.scene.index ~= p1.index and (p2 == nil or p3.scene.index ~= p2.index)
				}
			end
			
			return Copy
		else
			return if UserGameSettings.ReducedMotion then RoactNavigationModule.StackViewTransitionConfigs.FadeInPlace else RoactNavigationModule.StackViewTransitionConfigs.SlideFromRight
		end
	end,
	defaultNavigationOptions = { absorbInputSelectable = false }
}))