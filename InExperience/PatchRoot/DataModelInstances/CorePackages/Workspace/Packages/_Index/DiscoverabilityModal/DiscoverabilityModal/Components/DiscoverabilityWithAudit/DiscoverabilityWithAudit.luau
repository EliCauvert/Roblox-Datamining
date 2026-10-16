local DiscoverabilityModal = script:FindFirstAncestor("DiscoverabilityModal")
local Parent = DiscoverabilityModal.Parent
local ReactModule = require(Parent.React)
local Analytics = DiscoverabilityModal.Analytics
local UseAnalyticsModule = require(Analytics.useAnalytics)
local EventNamesModule = require(Analytics.Enums.EventNames)
local ConstantsModule = require(DiscoverabilityModal.Common.Constants)
local LegallySensitiveContentModule = require(Parent.LegallySensitiveContent)
local UseLegallySensitiveContentAndActionsFunction = LegallySensitiveContentModule.useLegallySensitiveContentAndActions
local ConsentName = LegallySensitiveContentModule.ConsentName
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UpdateIsDiscoverabilityUnsetFunction = require(Parent.SocialModalsCommon).Actions.UpdateIsDiscoverabilityUnset
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return function(_) --[[ Line: 24 | Named "DiscoverabilityWithAudit" ]]
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), UseAnalyticsModule (copy), UseLegallySensitiveContentAndActionsFunction (copy), ConsentName (copy), ReactModule (copy), EventNamesModule (copy), ConstantsModule (copy), UpdateIsDiscoverabilityUnsetFunction (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local GenericLuaDiscoverabilitySettingUpsell, GenericLuaDiscoverabilitySettingUpsell2 = UseLegallySensitiveContentAndActionsFunction(ConsentName.phoneNumberDiscoverabilityUpsell, "generic-lua-discoverability-setting-upsell")
	local WordsOfConsent = GenericLuaDiscoverabilitySettingUpsell.wordsOfConsent
	local UpdateSettingWithAuditingFunction = GenericLuaDiscoverabilitySettingUpsell2.updateSettingWithAuditing
	ReactModule.useEffect(function() --[[ Line: 37 ]]
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), ConstantsModule (upval)
		UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.DiscoverabilityModalLoad, {
			version = "audit_version",
			wordingVersion = ConstantsModule.WORDING_VERSION_1
		})
	end, {})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 44 ]]
		-- upvalues: UseDispatchResult (copy), UpdateIsDiscoverabilityUnsetFunction (upval)
		UseDispatchResult(UpdateIsDiscoverabilityUnsetFunction({ isDiscoverabilityUnset = false }))
	end, {})
	local Param = UseNavigationResult.getParam(ConstantsModule.NAVIGATE_ON_ACTIVATED)
	
	return ReactModule.createElement(Dialog.Root, { hasBackdrop = true, size = DialogSize.Medium }, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = WordsOfConsent.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogView = ReactModule.createElement(Dialog.Text, { Text = WordsOfConsent.content })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = WordsOfConsent.notNow,
					variant = ButtonVariant.Standard,
					onActivated = function() --[[ Line: 56 ]]
						-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), ConstantsModule (upval), UseResult (copy), UseNavigationResult (copy), Param (copy)
						UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.DiscoverabilityModalClose, { selected = ConstantsModule.UNSET })
						UseResult()
						UseNavigationResult.pop()
						Param()
					end
				},
				{
					text = WordsOfConsent.turnOn,
					variant = ButtonVariant.Emphasis,
					onActivated = function() --[[ Line: 68 ]]
						-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), ConstantsModule (upval), UpdateSettingWithAuditingFunction (copy), UseResult (copy), UseNavigationResult (copy), Param (copy)
						UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.DiscoverabilityModalContinue, { selected = ConstantsModule.DISCOVERABLE })
						UpdateSettingWithAuditingFunction("phoneNumberDiscoverability", "Discoverable")
						UseResult()
						UseNavigationResult.pop()
						Param()
					end
				}
			}
		})
	})
end