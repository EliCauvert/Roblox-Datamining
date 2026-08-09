local guiService = game:GetService("GuiService")
local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local loggersModule = require(parent.Loggers)
local loggingProtocolModule = require(parent.LoggingProtocol)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local robloxAppToastsRoduxModule = require(parent.RobloxAppToastsRodux)
local sharedFlagsModule = require(parent.SharedFlags)
local userSignalsModule = require(parent.UserSignals)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization
local mutedError = loggersModule.mutedError
local default = loggingProtocolModule.default
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local roactNetworking = roactServiceTagsModule.RoactNetworking
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useRoactService = robloxAppHooksModule.useRoactService
local setNetworkingErrorToast = robloxAppToastsRoduxModule.Thunks.SetNetworkingErrorToast
local postSendUserSignal = userSignalsModule.PostSendUserSignal
local userSignalTypes = userSignalsModule.UserSignalTypes
local notInterestedUserSignalTelemetryEventConfigsModule = require(gameTile.NotInterestedUserSignalTelemetryEventConfigs)
local updateHiddenGameTileText = game:DefineFastFlag("UpdateHiddenGameTileText", false)
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppSupportSponsoredExplicitFeedback = sharedFlagsModule.FFlagLuaAppSupportSponsoredExplicitFeedback

return reactModule.memo(function(p0) --[[ line: 51 | named "HiddenTileContent" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), useTokens (ref), useFocusGuiObject (ref), useRoactService (ref), roactNetworking (ref), useLocalization (ref), updateHiddenGameTileText (ref), default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), setNetworkingErrorToast (ref), guiService (ref), postSendUserSignal (ref), fFlagLuaAppSupportSponsoredExplicitFeedback (ref), userSignalTypes (ref), mutedError (ref), view (ref), fFlagLuaAppEnableSponsoredReportAd (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref)
	local var16 = useDispatch()
	local var17 = reactModule.useRef(nil)
	local var18 = useTokens()
	local var19 = useFocusGuiObject()
	local var20 = useRoactService(roactNetworking)
	local var21 = useLocalization({
		undoLabel = "Feature.GameDetails.Action.Undo",
		hiddenTileMessage = if updateHiddenGameTileText then "Feature.GameDetails.Message.SuggestLessOften" else "Feature.GameDetails.Message.SuggestLessExperiences"
	})
	
	return reactModule.createElement(view, {
		tag = if fFlagLuaAppEnableSponsoredReportAd then "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium padding-medium" else "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium"
	}, {
		Message = reactModule.createElement(text, {
			LayoutOrder = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			fontStyle = var18.Typography.BodySmall,
			Size = UDim2.fromScale(1, 0),
			Text = var21.hiddenTileMessage,
			textStyle = var18.Color.Content.Default
		}),
		UndoButton = reactModule.createElement(button, {
			LayoutOrder = 2,
			onActivated = reactModule.useCallback(function() --[[ line: 65 ]]
				-- upvalues: p0 (ref), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), var16 (ref), setNetworkingErrorToast (copy), guiService (copy), var17 (ref), var19 (ref), postSendUserSignal (copy), var20 (ref), fFlagLuaAppSupportSponsoredExplicitFeedback (copy), userSignalTypes (copy), mutedError (copy)
				if not p0.appPage then
					default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
					var16(setNetworkingErrorToast())
					
					return
				end
				p0.setGameHidden(p0.universeId, false)
				
				if guiService.SelectedCoreObject == var17.current then
					task.delay(0, function() --[[ line: 78 ]]
						-- upvalues: p0 (copy), var19 (copy)
						if p0.parentRef then
							var19(p0.parentRef.current)
						end
					end)
				end
				local ok, status = pcall(function() --[[ line: 85 ]]
					-- upvalues: postSendUserSignal (copy), var20 (copy), p0 (copy), fFlagLuaAppSupportSponsoredExplicitFeedback (copy), userSignalTypes (copy), var16 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
					postSendUserSignal(var20, { boolValue = false }, {
						id = p0.universeId,
						assetType = if fFlagLuaAppSupportSponsoredExplicitFeedback and p0.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
						signalOrigin = {
							productSurface = p0.appPage,
							topicId = p0.collectionId or "",
							subIds = { p0.collectionId or "" }
						}
					}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p1) --[[ line: 99 ]]
						-- upvalues: p0 (copy), var16 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
						p0.setGameHidden(p0.universeId, true)
						var16(setNetworkingErrorToast(p1))
						default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
					end)
				end)
				
				if not ok then
					p0.setGameHidden(p0.universeId, true)
					mutedError(status)
				end
			end, {
				var20, var19, p0.setGameHidden, p0.universeId, p0.collectionId, p0.appPage,
				p0.parentRef, var16,
				if fFlagLuaAppSupportSponsoredExplicitFeedback then p0.isSponsored else nil
			}),
			size = inputSize.XSmall,
			text = var21.undoLabel,
			variant = buttonVariant.Standard,
			ref = var17
		})
	})
end)