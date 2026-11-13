local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local ArchiveGameDialogModule = require(BuildExperience.Components.GameConfigurations.ArchiveGameDialog)
local _ = require(BuildExperience.Chat.chatTypes)
local ExperienceShareOverlaysModule = require(BuildExperience.Components.ShareAudience.ExperienceShareOverlays)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local UseArchiveGameFlowModule = require(BuildExperience.utils.useArchiveGameFlow)
local UseClosableFocusRootModule = require(BuildExperience.utils.useClosableFocusRoot)
local UseExperienceShareFlowModule = require(BuildExperience.utils.useExperienceShareFlow)
local UseGamePermissionsModule = require(BuildExperience.useGamePermissions)
local FFlagBuildExperiencePrivateInvitesModule = require(BuildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local FFlagBuildExperienceHomeTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceHomeTelemetry)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local Menu = FoundationModule.Menu
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local PrivacyType = UniverseConfigurationModule.PrivacyType

local function _(TelemetryGranularity)
	return {
		universeId = TelemetryGranularity.universeId,
		placeId = TelemetryGranularity.placeId,
		conversationId = TelemetryGranularity.sessionId
	}
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseScaledValueFunction (copy), UseExperienceShareFlowModule (copy), UseArchiveGameFlowModule (copy), FFlagBuildCheckGamePermissionsModule (copy), UseGamePermissionsModule (copy), PrivacyType (copy), FFlagBuildExperiencePrivateInvitesModule (copy), ReactModule (copy), FFlagBuildExperienceHomeTelemetryModule (copy), SendBuildExperienceEventModule (copy), UseClosableFocusRootModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), Menu (copy), PopoverSide (copy), PopoverAlign (copy), InputSize (copy), ExperienceShareOverlaysModule (copy), ArchiveGameDialogModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		archiveGame = LocalizationStringsModule.GAME_CONFIGURATION_ARCHIVE_GAME,
		publish = LocalizationStringsModule.BUILD_MENU_PUBLISH,
		settings = LocalizationStringsModule.BUILD_MENU_SETTINGS,
		share = LocalizationStringsModule.BUILD_MENU_SHARE
	})
	local ArchiveGame = UseLocalizationResult.archiveGame
	local Publish = UseLocalizationResult.publish
	local Settings = UseLocalizationResult.settings
	local Share = UseLocalizationResult.share
	local UseScaledValueResult = UseScaledValueFunction(216)
	local Target = p1.target
	local UseExperienceShareFlowModuleResult = UseExperienceShareFlowModule(if Target == nil then nil else Target.universeId, if Target == nil then nil else Target.placeId)
	local UseArchiveGameFlowModuleResult = UseArchiveGameFlowModule({ context = "games_list" })
	local CanPublish = true
	local CanEdit = true
	
	if FFlagBuildCheckGamePermissionsModule then
		local UseGamePermissionsModuleResult = UseGamePermissionsModule({
			universeId = if Target == nil then nil else Target.universeId
		})
		CanPublish = UseGamePermissionsModuleResult.canPublish
		CanEdit = UseGamePermissionsModuleResult.canEdit
	end
	local NoAudience: boolean = UseExperienceShareFlowModuleResult.audience == nil or UseExperienceShareFlowModuleResult.audience == PrivacyType.Private and not FFlagBuildExperiencePrivateInvitesModule
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return { current = p1.anchor }
	end, { p1.anchor })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Publish (copy), CanPublish (ref), Share (copy), NoAudience (copy), Settings (copy), CanEdit (ref), ArchiveGame (copy)
		return {
			{
				id = "publish",
				text = Publish,
				isDisabled = not CanPublish
			},
			{ id = "share", text = Share, isDisabled = NoAudience },
			{
				id = "settings",
				text = Settings,
				isDisabled = not CanEdit
			},
			{
				id = "archive-game",
				text = ArchiveGame,
				isDisabled = not CanEdit
			}
		}
	end, {
		ArchiveGame, CanEdit, CanPublish, NoAudience, Publish, Settings, Share
	})
	local OnCloseFunction = p1.onClose
	local OnOpenConfigurationPageFunction = p1.onOpenConfigurationPage
	local OnShareFunction = UseExperienceShareFlowModuleResult.onShare
	local RequestArchiveFunction = UseArchiveGameFlowModuleResult.requestArchive
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: OnCloseFunction (copy), Target (copy), FFlagBuildExperienceHomeTelemetryModule (upval), SendBuildExperienceEventModule (upval), OnOpenConfigurationPageFunction (copy), OnShareFunction (copy), RequestArchiveFunction (copy)
		OnCloseFunction()
		
		if Target == nil then return end
		if FFlagBuildExperienceHomeTelemetryModule then
			SendBuildExperienceEventModule("MY_CREATIONS_MENU_ITEM_CLICK", {
				universeId = Target.universeId,
				placeId = Target.placeId,
				conversationId = Target.sessionId
			}, { item = tostring(p2) })
		end
		if p2 == "publish" then
			OnOpenConfigurationPageFunction("publish", Target)
			
			return
		end
		if p2 == "share" then
			OnShareFunction()
			
			return
		end
		if p2 == "settings" then
			OnOpenConfigurationPageFunction("settings", Target)
			
			return
		end
		if p2 == "archive-game" and Target.universeId ~= nil then
			RequestArchiveFunction(Target.universeId)
		end
	end, {
		OnCloseFunction,
		OnOpenConfigurationPageFunction,
		OnShareFunction,
		RequestArchiveFunction,
		Target
	})
	local HasAnchor: boolean = p1.isOpen and (Target ~= nil and p1.anchor ~= nil)
	
	if FFlagBuildExperienceHomeTelemetryModule then
		ReactModule.useEffect(function()
			-- upvalues: HasAnchor (copy), Target (copy), SendBuildExperienceEventModule (upval)
			if HasAnchor and Target ~= nil then
				SendBuildExperienceEventModule("MY_CREATIONS_MENU_OPEN", {
					universeId = Target.universeId,
					placeId = Target.placeId,
					conversationId = Target.sessionId
				})
			end
		end, { HasAnchor, Target })
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Menu = ReactModule.createElement(Menu, {
			testId = "ExperienceRowActionsMenu",
			ref = UseClosableFocusRootModule({
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
				isOpen = HasAnchor,
				onClose = OnCloseFunction
			}),
			isOpen = HasAnchor,
			items = UseMemoResult1,
			anchorRef = UseMemoResult,
			side = PopoverSide.Bottom,
			align = if p1.isAtPointer then PopoverAlign.Start else PopoverAlign.End,
			size = InputSize.Large,
			width = UDim.new(0, UseScaledValueResult),
			onActivated = UseResult,
			onPressedOutside = OnCloseFunction
		}),
		ShareOverlays = ReactModule.createElement(ExperienceShareOverlaysModule, {
			activeDialog = UseExperienceShareFlowModuleResult.activeDialog,
			hasShareError = UseExperienceShareFlowModuleResult.hasShareError,
			onCancel = UseExperienceShareFlowModuleResult.onCancelDialog,
			onConfirmFriends = UseExperienceShareFlowModuleResult.onConfirmFriends,
			onConfirmPlaytesters = UseExperienceShareFlowModuleResult.onConfirmPlaytesters
		}),
		ArchiveDialog = ReactModule.createElement(ArchiveGameDialogModule, {
			isOpen = UseArchiveGameFlowModuleResult.isOpen,
			onArchive = UseArchiveGameFlowModuleResult.confirm,
			onCancel = UseArchiveGameFlowModuleResult.cancel
		})
	})
end