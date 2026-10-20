local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Menu = FoundationModule.Menu
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseToggleStateFunction = MomentsCommonModule.Hooks.useToggleState
local UseCreationControllerFunction = require(MomentsCreation.CreationController).useCreationController
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local EventNames = MomentsCommonModule.Analytics.EventNames

return function()
	-- upvalues: UseCreationControllerFunction (copy), UseTokensFunction (copy), UseDeviceInsetsFunction (copy), UseToggleStateFunction (copy), UseLocalizationFunction (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), ReactModule (copy), View (copy), Menu (copy), FoundationModule (copy), Icon (copy), BuilderIconsModule (copy)
	local UseCreationControllerResult = UseCreationControllerFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseToggleStateResult = UseToggleStateFunction(false)
	local UseLocalizationResult = UseLocalizationFunction({
		discard = "Feature.Moments.Action.DiscardChange",
		keep = "Feature.Moments.Action.KeepEditing"
	})
	
	local function _()
		-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
		FireAnalyticsEventModule(EventNames.EditingFlowVoiceContinueEditingPressed, MakeCreationEventFieldsModule.makeVoiceEventFields())
	end
	
	return ReactModule.createElement(View, {
		tag = "position-top-left anchor-top-left auto-xy",
		ZIndex = 10,
		padding = {
			top = UDim.new(0, UseDeviceInsetsResult.top + UseTokensResult.Padding.Medium),
			left = UDim.new(0, UseDeviceInsetsResult.left + UseTokensResult.Padding.Medium)
		}
	}, {
		DiscardMenu = ReactModule.createElement(Menu, {
			isOpen = UseToggleStateResult.enabled,
			side = FoundationModule.Enums.PopoverSide.Bottom,
			align = FoundationModule.Enums.PopoverAlign.Start,
			onPressedOutside = function()
				-- upvalues: UseToggleStateResult (copy), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
				if UseToggleStateResult.enabled then
					UseToggleStateResult.disable()
					FireAnalyticsEventModule(EventNames.EditingFlowVoiceContinueEditingPressed, MakeCreationEventFieldsModule.makeVoiceEventFields())
					
					return
				end
			end,
			onActivated = function(p1)
				-- upvalues: UseToggleStateResult (copy), UseCreationControllerResult (copy), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval)
				UseToggleStateResult.disable()
				
				if p1 == "discard" then
					UseCreationControllerResult.discardActiveTool()
					
					return
				end
				if p1 == "keep" then
					FireAnalyticsEventModule(EventNames.EditingFlowVoiceContinueEditingPressed, MakeCreationEventFieldsModule.makeVoiceEventFields())
				end
			end,
			items = {
				{ id = "discard", text = UseLocalizationResult.discard },
				{ id = "keep", text = UseLocalizationResult.keep }
			}
		}, {
			BackButton = ReactModule.createElement(View, {
				tag = "auto-xy padding-small radius-circle",
				onActivated = function()
					-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), UseCreationControllerResult (copy), UseToggleStateResult (copy)
					FireAnalyticsEventModule(EventNames.EditingFlowVoiceBackButtonPressed, MakeCreationEventFieldsModule.makeVoiceEventFields())
					local ActiveSession = UseCreationControllerResult.getActiveSession(false)
					
					if ActiveSession ~= nil and ActiveSession.getIsDirty(false) then
						UseToggleStateResult.toggle()
						
						return
					else
						UseCreationControllerResult.commitActiveTool()
					end
				end,
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.Background
				}
			}, {
				BackIcon = ReactModule.createElement(Icon, {
					name = BuilderIconsModule.Icon.ChevronLargeLeft,
					size = FoundationModule.Enums.IconSize.Large,
					style = UseTokensResult.Color.Content.Emphasis
				})
			})
		})
	})
end