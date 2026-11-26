local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Parent
local AppBloxModule = require(Parent.AppBlox)
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local NavigateBack = FocusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack
local EventMap = {
	[Enum.KeyCode.ButtonB] = NavigateBack,
	[Enum.KeyCode.Escape] = NavigateBack
}

return ReactModule.memo(function()
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), HttpService (copy), AppBloxModule (copy), NavigateBack (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), FoundationModule (copy), Parent (copy)
	local Label = UseLocalizationFunction({
		label = "Feature.AccountSettings.Heading.Tab.PersonalizedRecommendations"
	}).label
	local UseStateResult = ReactModule.useState(function(): string
		-- upvalues: HttpService (upval)
		return `dev-store-see-all-personalized-recommendations-{HttpService:GenerateGUID(false)}`
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: AppBloxModule (upval), UseStateResult (copy)
		AppBloxModule.getOverflowMenuSignalStore().closeMenu(UseStateResult)
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return UseResult
	end, { UseResult })
	local UseFocusRootResult = UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: NavigateBack (upval), InputHandlersModule (upval), UseResult (copy)
			return {
				[NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p1)
						-- upvalues: UseResult (upval)
						UseResult()
						p1:cancel()
					end)
				}
			}
		end, { UseResult })
	})
	
	return ReactModule.createElement(AppBloxModule.OverflowMenu, {
		hasOverflowButton = true,
		shouldShowAnchor = true,
		menuKey = UseStateResult,
		setFocusRef = ReactModule.useCallback(function(p1)
			-- upvalues: UseFocusRootResult (copy)
			if type(UseFocusRootResult) == "function" then
				UseFocusRootResult(p1)
			end
		end, { UseFocusRootResult }),
		menuItems = {
			{
				id = "personalizedRecommendations",
				icon = FoundationModule.Enums.IconName.Gear,
				text = Label,
				onActivated = function()
					-- upvalues: Parent (upval)
					local AccountSettingsEntryPointsModule = require(Parent.AccountSettingsEntryPoints)
					AccountSettingsEntryPointsModule.openAccountSettings(AccountSettingsEntryPointsModule.Page.PersonalizedRecommendations, { surfaceKey = "ExperienceDetails_Store" })
				end
			}
		}
	})
end)