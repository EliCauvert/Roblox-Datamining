local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local ReactModule = require(Parent.React)
local NavigationModule = require(Parent.Navigation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MobileGameJoinCardModule = require(GameJoinCard.Components.MobileGameJoinCard.MobileGameJoinCard)
local BuildJoinCardMediaModule = require(script.Parent.BuildJoinCardMedia)
local UseBuildJoinCardViewModelModule = require(script.Parent.useBuildJoinCardViewModel)
local UsePlayerNameModule = require(GameJoinCard.Hooks.usePlayerName)

local function noop(_) end

return function()
	-- upvalues: NavigationModule (copy), UsePlayerNameModule (copy), ReactModule (copy), UseBuildJoinCardViewModelModule (copy), UseLocalizationFunction (copy), BuildJoinCardMediaModule (copy), MobileGameJoinCardModule (copy), noop (copy)
	local UseNavigationResult = NavigationModule.useNavigation()
	local UserIdParam = UseNavigationResult.getParam("userId")
	assert(type(UserIdParam) == "string" and UserIdParam ~= "", "BuildJoinCard route needs a userId param")
	local UsePlayerNameModuleResult = UsePlayerNameModule(UserIdParam)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, { UseNavigationResult })
	
	return ReactModule.createElement(MobileGameJoinCardModule, {
		canUsePlatformChat = false,
		universeId = "",
		experienceName = "",
		isLoading = false,
		isInExperience = false,
		isNavigationFocused = NavigationModule.useNavigationFocus(),
		onClose = UseResult,
		onJoin = noop,
		onViewExperienceDetails = noop,
		onChat = noop,
		userId = UserIdParam,
		playerName = UsePlayerNameModuleResult,
		actions = UseBuildJoinCardViewModelModule({
			keepsOpenOnNavigation = true,
			userId = UserIdParam,
			onClose = UseResult
		}).actions,
		content = {
			media = ReactModule.createElement(BuildJoinCardMediaModule, { slot = "Banner", userId = UserIdParam }),
			title = UsePlayerNameModuleResult,
			subtitle = UseLocalizationFunction({ subtitle = "Feature.Profile.Label.IsMakingGameInBuild" }).subtitle
		}
	})
end