local discoverabilityModal = script:FindFirstAncestor("DiscoverabilityModal")
local parent = discoverabilityModal.Parent
local reactModule = require(parent.React)
local analytics = discoverabilityModal.Analytics
local useAnalyticsModule = require(analytics.useAnalytics)
local eventNamesModule = require(analytics.Enums.EventNames)
local constantsModule = require(discoverabilityModal.Common.Constants)
local legallySensitiveContentModule = require(parent.LegallySensitiveContent)
local useLegallySensitiveContentAndActions = legallySensitiveContentModule.useLegallySensitiveContentAndActions
local consentName = legallySensitiveContentModule.ConsentName
local useNavigation = require(parent.Navigation).useNavigation
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local updateIsDiscoverabilityUnset = require(parent.SocialModalsCommon).Actions.UpdateIsDiscoverabilityUnset
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(_)
	-- upvalues: useNavigation (ref), useDispatch (ref), useAnalyticsModule (ref), useLegallySensitiveContentAndActions (ref), consentName (ref), reactModule (ref), eventNamesModule (ref), constantsModule (ref), updateIsDiscoverabilityUnset (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local var1 = useNavigation()
	local var2 = useDispatch()
	local var3 = useAnalyticsModule()
	local var4, var5 = useLegallySensitiveContentAndActions(consentName.phoneNumberDiscoverabilityUpsell, "generic-lua-discoverability-setting-upsell")
	local wordsOfConsent = var4.wordsOfConsent
	local updateSettingWithAuditing = var5.updateSettingWithAuditing
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), eventNamesModule (copy), constantsModule (copy)
		var3.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalLoad, {
			version = "audit_version",
			wordingVersion = constantsModule.WORDING_VERSION_1
		})
	end, {})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), updateIsDiscoverabilityUnset (copy)
		var2(updateIsDiscoverabilityUnset({ isDiscoverabilityUnset = false }))
	end, {})
	local param = var1.getParam(constantsModule.NAVIGATE_ON_ACTIVATED)
	
	return reactModule.createElement(dialog.Root, { hasBackdrop = true, size = dialogSize.Medium }, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = wordsOfConsent.title }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogView = reactModule.createElement(dialog.Text, { Text = wordsOfConsent.content })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = wordsOfConsent.notNow,
					variant = buttonVariant.Standard,
					onActivated = function()
						-- upvalues: var3 (ref), eventNamesModule (copy), constantsModule (copy), var6 (ref), var1 (ref), param (ref)
						var3.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalClose, { selected = constantsModule.UNSET })
						var6()
						var1.pop()
						param()
					end
				},
				{
					text = wordsOfConsent.turnOn,
					variant = buttonVariant.Emphasis,
					onActivated = function()
						-- upvalues: var3 (ref), eventNamesModule (copy), constantsModule (copy), updateSettingWithAuditing (ref), var6 (ref), var1 (ref), param (ref)
						var3.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalContinue, { selected = constantsModule.DISCOVERABLE })
						updateSettingWithAuditing("phoneNumberDiscoverability", "Discoverable")
						var6()
						var1.pop()
						param()
					end
				}
			}
		})
	})
end