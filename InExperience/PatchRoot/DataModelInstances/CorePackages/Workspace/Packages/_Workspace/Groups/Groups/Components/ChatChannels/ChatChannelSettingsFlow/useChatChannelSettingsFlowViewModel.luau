local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local ResponsiveModule = require(Parent.Responsive)
local ChatChannelSettingsFlowLayoutModule = require(script.Parent.ChatChannelSettingsFlowLayout)
local _ = require(script.Parent.Parent.ChatChannelSettings)
local _ = require(script.Parent.ChatChannelSettingsFlowView)
local UseSettingsTextInputDraftModule = require(script.Parent.Parent.SettingsFields.SettingsTextInputField.useSettingsTextInputDraft)
local NavigateBack = FocusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack
local config = {
	[Enum.KeyCode.ButtonB] = NavigateBack,
	[Enum.KeyCode.Escape] = NavigateBack
}

return function(p1)
	-- upvalues: ReactModule (copy), UseSettingsTextInputDraftModule (copy), LocalizationModule (copy), NavigateBack (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), config (copy), FocusNavigationUtilsModule (copy), ResponsiveModule (copy), ChatChannelSettingsFlowLayoutModule (copy)
	local Settings, Settings2 = ReactModule.useState("Settings")
	local UseSettingsTextInputDraftModuleResult = UseSettingsTextInputDraftModule(p1.name, p1.maxNameLength)
	local SetDraftFunction = UseSettingsTextInputDraftModuleResult.setDraft
	local HasOnSave: boolean = p1.canRename and p1.onSave ~= nil
	local HasOnLeave: boolean = p1.canLeave and p1.onLeave ~= nil
	local HasOnDelete: boolean = p1.canDelete and p1.onDelete ~= nil
	local Settings1 = if Settings == "EditName" and not HasOnSave then "Settings" else Settings
	ReactModule.useEffect(function()
		-- upvalues: Settings (copy), Settings1 (copy), Settings2 (copy)
		if Settings ~= Settings1 then
			Settings2(Settings1)
		end
	end, { Settings, Settings1 })
	local UseLocalizationResult = LocalizationModule.Hooks.useLocalization({
		settings = "Feature.ChatChannels.Heading.Settings",
		members = "Feature.ChatChannels.Heading.Members",
		channelName = "Feature.ChatChannels.Label.ChannelName",
		leaveTitle = "Feature.ChatChannels.Heading.LeaveChannel",
		deleteTitle = "Feature.ChatChannels.Heading.DeleteChannel",
		confirmLeave = "Feature.ChatChannels.Description.ConfirmLeaveChannel",
		confirmDelete = "Feature.ChatChannels.Description.ConfirmDeleteChannel",
		confirm = "CommonUI.Controls.Action.Confirm",
		cancel = "CommonUI.Controls.Action.Cancel"
	})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: Settings2 (copy)
		if p2 == "Settings" or p2 == "Members" then
			Settings2(p2)
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: HasOnSave (copy), SetDraftFunction (copy), p1 (copy), Settings2 (copy)
		if HasOnSave then
			SetDraftFunction(p1.name)
			Settings2("EditName")
		end
	end, { HasOnSave, p1.name, SetDraftFunction })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: HasOnLeave (copy), Settings2 (copy)
		if HasOnLeave then
			Settings2("ConfirmLeave")
		end
	end, { HasOnLeave })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: HasOnDelete (copy), Settings2 (copy)
		if HasOnDelete then
			Settings2("ConfirmDelete")
		end
	end, { HasOnDelete })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: Settings1 (copy), Settings2 (copy), p1 (copy)
		if Settings1 == "Settings" or Settings1 == "Members" then
			p1.onClose()
			
			return
		else
			Settings2("Settings")
		end
	end, { Settings1, p1.onClose })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: Settings1 (copy), HasOnSave (copy), UseSettingsTextInputDraftModuleResult (copy), p1 (copy), Settings2 (copy)
		if Settings1 == "EditName" and HasOnSave and UseSettingsTextInputDraftModuleResult.canSave and p1.onSave then
			p1.onSave({
				name = UseSettingsTextInputDraftModuleResult.draftValue,
				iconAssetId = p1.iconAssetId
			})
			Settings2("Settings")
		end
	end, {
		Settings1, HasOnSave, UseSettingsTextInputDraftModuleResult.canSave,
		UseSettingsTextInputDraftModuleResult.draftValue, p1.onSave, p1.iconAssetId
	})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: Settings1 (copy), p1 (copy), Settings2 (copy)
		if Settings1 == "ConfirmLeave" and p1.onLeave then
			p1.onLeave()
			Settings2("Settings")
			
			return
		end
		if Settings1 == "ConfirmDelete" and p1.onDelete then
			p1.onDelete()
			Settings2("Settings")
		end
	end, { Settings1, p1.onLeave, p1.onDelete })
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior((ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: NavigateBack (upval), InputHandlersModule (upval), UseResult4 (copy)
		return {
			[NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: UseResult4 (upval)
					UseResult4()
					p2:cancel()
				end)
			}
		}
	end, { UseResult4 }), (ReactFocusNavigationModule.useEventMap(config)))))
	local UseFocusOnMountResult = FocusNavigationUtilsModule.useFocusOnMount(UseDefaultFocusBehaviorResult)
	local TestId = p1.testId or "--chat-channel-settings-flow"
	
	return {
		screen = Settings1,
		title = if Settings1 == "EditName" then UseLocalizationResult.channelName elseif Settings1 == "ConfirmLeave" then UseLocalizationResult.leaveTitle elseif Settings1 == "ConfirmDelete" then UseLocalizationResult.deleteTitle else p1.name,
		iconAssetId = p1.iconAssetId,
		settingsTabText = UseLocalizationResult.settings,
		membersTabText = UseLocalizationResult.members,
		settings = {
			name = p1.name,
			createdBy = p1.createdBy,
			createdAt = p1.createdAt,
			canRename = HasOnSave,
			canLeave = HasOnLeave,
			canDelete = HasOnDelete,
			canBeNotified = p1.canBeNotified,
			notificationPreference = p1.notificationPreference,
			onEditName = if HasOnSave then UseResult1 else nil,
			onLeave = if HasOnLeave then UseResult2 else nil,
			onDelete = if HasOnDelete then UseResult3 else nil,
			onNotificationPreferenceChanged = p1.onNotificationPreferenceChanged,
			testId = `{TestId}--settings`
		},
		editor = {
			draft = UseSettingsTextInputDraftModuleResult.draft,
			hasError = UseSettingsTextInputDraftModuleResult.hasError,
			canSave = UseSettingsTextInputDraftModuleResult.canSave,
			saveText = UseLocalizationResult.confirm,
			cancelText = UseLocalizationResult.cancel,
			remainingCharacters = UseSettingsTextInputDraftModuleResult.remainingCharacters,
			inputRef = UseFocusOnMountResult,
			onCancel = UseResult4,
			onDraftChanged = UseSettingsTextInputDraftModuleResult.onDraftChanged,
			onSave = UseResult5,
			testId = `{TestId}--name-editor`
		},
		confirmation = {
			message = if Settings1 == "ConfirmDelete" then UseLocalizationResult.confirmDelete else UseLocalizationResult.confirmLeave,
			confirmText = UseLocalizationResult.confirm,
			cancelText = UseLocalizationResult.cancel,
			cancelRef = UseFocusOnMountResult,
			onConfirm = UseResult6
		},
		onTabChanged = UseResult,
		onBack = UseResult4,
		onClose = p1.onClose,
		hideCloseButton = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional,
		containerRef = UseDefaultFocusBehaviorResult2,
		Layout = p1.Layout or ChatChannelSettingsFlowLayoutModule,
		testId = TestId
	}
end