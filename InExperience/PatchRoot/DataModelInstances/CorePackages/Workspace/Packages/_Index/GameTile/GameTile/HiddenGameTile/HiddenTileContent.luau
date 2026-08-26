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
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), useTokens (ref), useFocusGuiObject (ref), useRoactService (ref), roactNetworking (ref), useLocalization (ref), default (ref), notInterestedUserSignalTelemetryEventConfigsModule (ref), setNetworkingErrorToast (ref), guiService (ref), postSendUserSignal (ref), userSignalTypes (ref), mutedError (ref), view (ref), fFlagLuaAppEnableSponsoredReportAd (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref)
	local var1 = useDispatch()
	local var2 = reactModule.useRef(nil)
	local var3 = useTokens()
	local var4 = useFocusGuiObject()
	local var5 = useRoactService(roactNetworking)
	local var6 = useLocalization({
		undoLabel = "Feature.GameDetails.Action.Undo",
		hiddenTileMessage = "Feature.GameDetails.Message.SuggestLessOften"
	})
	
	return reactModule.createElement(view, {
		tag = if fFlagLuaAppEnableSponsoredReportAd then "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium padding-medium" else "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium"
	}, {
		Message = reactModule.createElement(text, {
			LayoutOrder = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			fontStyle = var3.Typography.BodySmall,
			Size = UDim2.fromScale(1, 0),
			Text = var6.hiddenTileMessage,
			textStyle = var3.Color.Content.Default
		}),
		UndoButton = reactModule.createElement(button, {
			LayoutOrder = 2,
			onActivated = reactModule.useCallback(function()
				-- upvalues: p1 (ref), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy), var1 (ref), setNetworkingErrorToast (copy), guiService (copy), var2 (ref), var4 (ref), postSendUserSignal (copy), var5 (ref), userSignalTypes (copy), mutedError (copy)
				if not p1.appPage then
					default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
					var1(setNetworkingErrorToast())
					
					return
				end
				p1.setGameHidden(p1.universeId, false)
				
				if guiService.SelectedCoreObject == var2.current then
					task.delay(0, function()
						-- upvalues: p1 (copy), var4 (copy)
						if p1.parentRef then
							var4(p1.parentRef.current)
						end
					end)
				end
				local ok, status = pcall(function()
					-- upvalues: postSendUserSignal (copy), var5 (copy), p1 (copy), userSignalTypes (copy), var1 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
					postSendUserSignal(var5, { boolValue = false }, {
						id = p1.universeId,
						assetType = if p1.isSponsored then userSignalTypes.AssetType.SponsoredGame else userSignalTypes.AssetType.Game,
						signalOrigin = {
							productSurface = p1.appPage,
							topicId = p1.collectionId or "",
							subIds = { p1.collectionId or "" }
						}
					}, userSignalTypes.SignalValueType.Bool, userSignalTypes.SignalType.NotInterested):catch(function(p2)
						-- upvalues: p1 (copy), var1 (copy), setNetworkingErrorToast (copy), default (copy), notInterestedUserSignalTelemetryEventConfigsModule (copy)
						p1.setGameHidden(p1.universeId, true)
						var1(setNetworkingErrorToast(p2))
						default:logRobloxTelemetryCounter(notInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
					end)
				end)
				
				if not ok then
					p1.setGameHidden(p1.universeId, true)
					mutedError(status)
				end
			end, {
				var5, var4, p1.setGameHidden, p1.universeId, p1.collectionId, p1.appPage,
				p1.parentRef, var1, p1.isSponsored
			}),
			size = inputSize.XSmall,
			text = var6.undoLabel,
			variant = buttonVariant.Standard,
			ref = var2
		})
	})
end)