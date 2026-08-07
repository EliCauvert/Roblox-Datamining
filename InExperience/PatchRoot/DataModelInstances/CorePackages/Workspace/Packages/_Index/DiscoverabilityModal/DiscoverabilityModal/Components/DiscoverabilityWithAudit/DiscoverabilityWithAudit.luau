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

return function(_) --[[ line: 24 | named "DiscoverabilityWithAudit" ]]
	-- upvalues: useNavigation (ref), useDispatch (ref), useAnalyticsModule (ref), useLegallySensitiveContentAndActions (ref), consentName (ref), reactModule (ref), eventNamesModule (ref), constantsModule (ref), updateIsDiscoverabilityUnset (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local var7 = useNavigation()
	local var8 = useDispatch()
	local var9 = useAnalyticsModule()
	local var10, var11 = useLegallySensitiveContentAndActions(consentName.phoneNumberDiscoverabilityUpsell, "generic-lua-discoverability-setting-upsell")
	local wordsOfConsent = var10.wordsOfConsent
	local updateSettingWithAuditing = var11.updateSettingWithAuditing
	reactModule.useEffect(function() --[[ line: 37 ]]
		-- upvalues: var9 (ref), eventNamesModule (copy), constantsModule (copy)
		var9.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalLoad, {
			version = "audit_version",
			wordingVersion = constantsModule.WORDING_VERSION_1
		})
	end, {})
	local var12 = reactModule.useCallback(function() --[[ line: 44 ]]
		-- upvalues: var8 (ref), updateIsDiscoverabilityUnset (copy)
		var8(updateIsDiscoverabilityUnset({ isDiscoverabilityUnset = false }))
	end, {})
	local param = var7.getParam(constantsModule.NAVIGATE_ON_ACTIVATED)
	
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
					onActivated = function() --[[ line: 56 ]]
						-- upvalues: var9 (ref), eventNamesModule (copy), constantsModule (copy), var12 (ref), var7 (ref), param (ref)
						var9.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalClose, { selected = constantsModule.UNSET })
						var12()
						var7.pop()
						param()
					end
				},
				{
					text = wordsOfConsent.turnOn,
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 68 ]]
						-- upvalues: var9 (ref), eventNamesModule (copy), constantsModule (copy), updateSettingWithAuditing (ref), var12 (ref), var7 (ref), param (ref)
						var9.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalContinue, { selected = constantsModule.DISCOVERABLE })
						updateSettingWithAuditing("phoneNumberDiscoverability", "Discoverable")
						var12()
						var7.pop()
						param()
					end
				}
			}
		})
	})
end