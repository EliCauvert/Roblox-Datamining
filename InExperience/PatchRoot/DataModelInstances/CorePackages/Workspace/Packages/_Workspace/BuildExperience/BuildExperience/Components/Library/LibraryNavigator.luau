local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local motionModule = require(parent.Motion)
local roactNavigationModule = require(parent.RoactNavigation)
local libraryBrowserContainerModule = require(script.Parent.LibraryBrowser.LibraryBrowserContainer)
local libraryCategoryContainerModule = require(script.Parent.LibraryCategory.LibraryCategoryContainer)
local libraryDetailContainerModule = require(script.Parent.LibraryDetail.LibraryDetailContainer)
local _ = require(buildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local _ = require(script.Parent.LibraryCategories)
local _ = require(script.Parent.LibraryTypes)
local _ = require(script.Parent.LibraryWorldCutout.LibraryWorldCutoutView)
local userGameSettingsService = UserSettings():GetService("UserGameSettings")

local function CategoryScreen(p1)
	-- upvalues: reactModule (ref), libraryCategoryContainerModule (ref)
	local screenProps = p1.screenProps
	local params = p1.navigation.state.params
	local var1 = reactModule.useRef(screenProps.query)
	
	if screenProps.query ~= "" then
		var1.current = screenProps.query
	end
	return reactModule.createElement(libraryCategoryContainerModule, {
		itemKind = params.itemKind,
		categoryKey = params.categoryKey,
		folderId = params.folderId,
		query = if p1.navigation.state.routeName == "Search" then var1.current else "",
		onOpenItem = screenProps.onOpenItem,
		onOpenCategory = screenProps.onOpenCategory,
		library = screenProps.library,
		isReady = screenProps.isReady
	})
end

return roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator({
	{
		Browser = {
			screen = function(p1)
				-- upvalues: reactModule (ref), libraryBrowserContainerModule (ref)
				local screenProps = p1.screenProps
				
				return reactModule.createElement(libraryBrowserContainerModule, {
					query = "",
					onOpenItem = screenProps.onOpenItem,
					onOpenCategory = screenProps.onOpenCategory,
					library = screenProps.library,
					isReady = screenProps.isReady,
					worldCutout = screenProps.worldCutout
				})
			end
		}
	},
	{ Category = { screen = CategoryScreen } },
	{
		Search = {
			screen = function(p1)
				-- upvalues: foundationModule (ref), userGameSettingsService (ref), motionModule (ref), reactModule (ref), CategoryScreen (ref)
				local reducedMotion = foundationModule.Hooks.usePreferences().reducedMotion or userGameSettingsService.ReducedMotion
				local var1 = p1.screenProps.query ~= ""
				local var2, var3 = motionModule.useMotion({ transparency = if reducedMotion then 0 else 1 })
				reactModule.useEffect(function()
					-- upvalues: var3 (ref), motionModule (copy), var1 (ref), reducedMotion (ref)
					var3(motionModule.createState({ transparency = if var1 then 0 else 1 }, {
						default = motionModule.transition({ duration = if reducedMotion then 0 else 0.15 })
					}))
				end, { var1, reducedMotion, var3 })
				
				return reactModule.createElement(foundationModule.View, {
					tag = "size-full bg-surface-0",
					testId = "Library.Search.Results",
					GroupTransparency = var2.transparency
				}, { Grid = reactModule.createElement(CategoryScreen, p1) })
			end,
			navigationOptions = { transparent = true }
		}
	},
	{
		Detail = {
			screen = function(p1)
				-- upvalues: reactModule (ref), libraryDetailContainerModule (ref)
				local screenProps = p1.screenProps
				local state = p1.navigation.state
				local var1 = screenProps.activeRouteKey == state.key
				
				return reactModule.createElement(libraryDetailContainerModule, {
					isActive = screenProps.isOpen and var1,
					itemId = state.params.itemId,
					itemKind = state.params.itemKind,
					library = screenProps.library,
					isReady = screenProps.isReady,
					onBack = function()
						-- upvalues: var1 (ref), screenProps (ref)
						if var1 then
							screenProps.onBack()
						end
					end,
					chatActions = screenProps.chatActions,
					resourceActions = screenProps.resourceActions,
					unavailableText = screenProps.unavailableText
				})
			end
		}
	}
}, {
	initialRouteName = "Browser",
	transitionConfig = function(p1, p2)
		-- upvalues: roactNavigationModule (ref), userGameSettingsService (ref)
		local var1 = if p2 ~= nil then nil else p2.scene.route.routeName
		local routeName = p1.scene.route.routeName
		
		if (if routeName ~= "Search" then var1 == "Search" else true) and not (if routeName ~= "Detail" then var1 == "Detail" else true) then
			local cloned = table.clone(roactNavigationModule.StackViewTransitionConfigs.FadeInPlace)
			
			function cloned.screenInterpolator(p3)
				-- upvalues: p1 (ref), p2 (ref)
				return {
					initialPosition = UDim2.fromScale(0, 0),
					forceHidden = p3.scene.index ~= p1.index and (if p2 ~= nil then p3.scene.index ~= p2.index else true)
				}
			end
			
			return cloned
		end
		return if userGameSettingsService.ReducedMotion then roactNavigationModule.StackViewTransitionConfigs.FadeInPlace else roactNavigationModule.StackViewTransitionConfigs.SlideFromRight
	end,
	defaultNavigationOptions = { absorbInputSelectable = false }
}))