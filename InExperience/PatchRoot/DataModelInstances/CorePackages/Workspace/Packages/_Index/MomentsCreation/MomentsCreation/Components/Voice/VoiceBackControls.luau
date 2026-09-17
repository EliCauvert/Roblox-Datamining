local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local menu = foundationModule.Menu
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useToggleState = momentsCommonModule.Hooks.useToggleState
local useCreationController = require(momentsCreation.CreationController).useCreationController
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local eventNames = momentsCommonModule.Analytics.EventNames

return function()
	-- upvalues: useCreationController (ref), useTokens (ref), useDeviceInsets (ref), useToggleState (ref), useLocalization (ref), fireAnalyticsEventModule (ref), eventNames (ref), makeCreationEventFieldsModule (ref), reactModule (ref), view (ref), menu (ref), foundationModule (ref), icon (ref), builderIconsModule (ref)
	local var1 = useCreationController()
	local var2 = useTokens()
	local var3 = useDeviceInsets()
	local var4 = useToggleState(false)
	local var5 = useLocalization({
		discard = "Feature.Moments.Action.DiscardChange",
		keep = "Feature.Moments.Action.KeepEditing"
	})
	
	local function _()
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowVoiceContinueEditingPressed, makeCreationEventFieldsModule.makeVoiceEventFields())
	end
	
	return reactModule.createElement(view, {
		tag = "position-top-left anchor-top-left auto-xy",
		ZIndex = 10,
		padding = {
			top = UDim.new(0, var3.top + var2.Padding.Medium),
			left = UDim.new(0, var3.left + var2.Padding.Medium)
		}
	}, {
		DiscardMenu = reactModule.createElement(menu, {
			isOpen = var4.enabled,
			side = foundationModule.Enums.PopoverSide.Bottom,
			align = foundationModule.Enums.PopoverAlign.Start,
			onPressedOutside = function()
				-- upvalues: var4 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
				if var4.enabled then
					var4.disable()
					fireAnalyticsEventModule(eventNames.EditingFlowVoiceContinueEditingPressed, makeCreationEventFieldsModule.makeVoiceEventFields())
					
					return
				end
			end,
			onActivated = function(p1)
				-- upvalues: var4 (ref), var1 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy)
				var4.disable()
				
				if p1 == "discard" then
					var1.discardActiveTool()
					
					return
				elseif p1 == "keep" then
					fireAnalyticsEventModule(eventNames.EditingFlowVoiceContinueEditingPressed, makeCreationEventFieldsModule.makeVoiceEventFields())
				end
			end,
			items = {
				{ id = "discard", text = var5.discard },
				{ id = "keep", text = var5.keep }
			}
		}, {
			BackButton = reactModule.createElement(view, {
				tag = "auto-xy padding-small radius-circle",
				onActivated = function()
					-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), var1 (ref), var4 (ref)
					fireAnalyticsEventModule(eventNames.EditingFlowVoiceBackButtonPressed, makeCreationEventFieldsModule.makeVoiceEventFields())
					local activeSession = var1.getActiveSession(false)
					
					if activeSession ~= nil and activeSession.getIsDirty(false) then
						var4.toggle()
						
						return
					end
					var1.commitActiveTool()
				end,
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.Background
				}
			}, {
				BackIcon = reactModule.createElement(icon, {
					name = builderIconsModule.Icon.ChevronLargeLeft,
					size = foundationModule.Enums.IconSize.Large,
					style = var2.Color.Content.Emphasis
				})
			})
		})
	})
end