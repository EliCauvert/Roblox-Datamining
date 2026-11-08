local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local DesktopGameJoinCardModule = require(GameJoinCard.Components.DesktopGameJoinCard.DesktopGameJoinCard)
local BuildJoinCardMediaModule = require(script.Parent.BuildJoinCardMedia)
local UseBuildJoinCardViewModelModule = require(script.Parent.useBuildJoinCardViewModel)

local function noop(_) end

return function(p1)
	-- upvalues: UseBuildJoinCardViewModelModule (copy), UseLocalizationFunction (copy), ReactModule (copy), BuildJoinCardMediaModule (copy), DesktopGameJoinCardModule (copy), noop (copy)
	local UseBuildJoinCardViewModelModuleResult = UseBuildJoinCardViewModelModule({
		keepsOpenOnNavigation = false,
		userId = p1.userId,
		onClose = p1.onClose
	})
	local UseLocalizationResult = UseLocalizationFunction({
		isMakingGameIn = "Feature.Profile.Label.IsMakingGameIn",
		build = "CommonUI.Features.NavBar.Build"
	})
	
	return ReactModule.createElement(DesktopGameJoinCardModule, {
		layoutOrder = 1,
		gameIconUrl = "",
		isLoading = false,
		isConsole = false,
		consolePlatformLabel = "",
		playerName = p1.playerName,
		experienceName = UseLocalizationResult.build,
		onJoin = noop,
		onViewExperienceDetails = noop,
		anchorRef = p1.anchorRef,
		isOpen = p1.isOpen,
		onClose = p1.onClose,
		actions = UseBuildJoinCardViewModelModuleResult.actions,
		content = {
			media = ReactModule.createElement(BuildJoinCardMediaModule, { slot = "Icon", userId = p1.userId }),
			activityText = UseLocalizationResult.isMakingGameIn
		}
	})
end