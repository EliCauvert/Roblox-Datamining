local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local archiveGameDialogModule = require(buildExperience.Components.GameConfigurations.ArchiveGameDialog)
local _ = require(buildExperience.Chat.chatTypes)
local experienceShareOverlaysModule = require(buildExperience.Components.ShareAudience.ExperienceShareOverlays)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local useArchiveGameFlowModule = require(buildExperience.utils.useArchiveGameFlow)
local useClosableFocusRootModule = require(buildExperience.utils.useClosableFocusRoot)
local useExperienceShareFlowModule = require(buildExperience.utils.useExperienceShareFlow)
local fFlagBuildExperiencePrivateInvitesModule = require(buildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local menu = foundationModule.Menu
local useScaledValue = foundationModule.Hooks.useScaledValue
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local privacyType = universeConfigurationModule.PrivacyType

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useScaledValue (ref), useExperienceShareFlowModule (ref), useArchiveGameFlowModule (ref), privacyType (ref), fFlagBuildExperiencePrivateInvitesModule (ref), reactModule (ref), useClosableFocusRootModule (ref), focusNavigableSurfaceIdentifierEnum (ref), menu (ref), popoverSide (ref), popoverAlign (ref), inputSize (ref), experienceShareOverlaysModule (ref), archiveGameDialogModule (ref)
	local var1 = useLocalization({
		archiveGame = localizationStringsModule.GAME_CONFIGURATION_ARCHIVE_GAME,
		publish = localizationStringsModule.BUILD_MENU_PUBLISH,
		settings = localizationStringsModule.BUILD_MENU_SETTINGS,
		share = localizationStringsModule.BUILD_MENU_SHARE
	})
	local archiveGame = var1.archiveGame
	local publish = var1.publish
	local settings = var1.settings
	local share = var1.share
	local var2 = useScaledValue(216)
	local target = p1.target
	local var3 = useExperienceShareFlowModule(if target ~= nil then nil else target.universeId, if target ~= nil then nil else target.placeId)
	local var4 = useArchiveGameFlowModule()
	local var5 = if var3.audience ~= nil then var3.audience == privacyType.Private and not fFlagBuildExperiencePrivateInvitesModule else true
	local var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return { current = p1.anchor }
	end, { p1.anchor })
	local var7 = reactModule.useMemo(function()
		-- upvalues: publish (ref), share (ref), var5 (ref), settings (ref), archiveGame (ref)
		return {
			{ id = "publish", text = publish },
			{ id = "share", text = share, isDisabled = var5 },
			{ id = "settings", text = settings },
			{ id = "archive-game", text = archiveGame }
		}
	end, {
		archiveGame,
		var5,
		publish,
		settings,
		share
	})
	local onClose = p1.onClose
	local onOpenConfigurationPage = p1.onOpenConfigurationPage
	local onShare = var3.onShare
	local requestArchive = var4.requestArchive
	local var8 = p1.isOpen and (target ~= nil and p1.anchor ~= nil)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			testId = "ExperienceRowActionsMenu",
			ref = useClosableFocusRootModule({
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
				isOpen = var8,
				onClose = onClose
			}),
			isOpen = var8,
			items = var7,
			anchorRef = var6,
			side = popoverSide.Bottom,
			align = if p1.isAtPointer then popoverAlign.Start else popoverAlign.End,
			size = inputSize.Large,
			width = UDim.new(0, var2),
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: onClose (ref), target (ref), onOpenConfigurationPage (ref), onShare (ref), requestArchive (ref)
				onClose()
				
				if target == nil then return end
				if p2 == "publish" then
					onOpenConfigurationPage("publish", target)
					
					return
				elseif p2 == "share" then
					onShare()
					
					return
				elseif p2 == "settings" then
					onOpenConfigurationPage("settings", target)
					
					return
				elseif p2 == "archive-game" and target.universeId ~= nil then
					requestArchive(target.universeId)
				end
			end, {
				onClose,
				onOpenConfigurationPage,
				onShare,
				requestArchive,
				target
			}),
			onPressedOutside = onClose
		}),
		ShareOverlays = reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var3.activeDialog,
			hasShareError = var3.hasShareError,
			onCancel = var3.onCancelDialog,
			onConfirmFriends = var3.onConfirmFriends,
			onConfirmPlaytesters = var3.onConfirmPlaytesters
		}),
		ArchiveDialog = reactModule.createElement(archiveGameDialogModule, {
			isOpen = var4.isOpen,
			onArchive = var4.confirm,
			onCancel = var4.cancel
		})
	})
end