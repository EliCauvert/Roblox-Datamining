local GuiService = game:GetService("GuiService")
local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UserSignalsModule = require(Parent.UserSignals)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MutedErrorFunction = require(Parent.Loggers).mutedError
local Default = require(Parent.LoggingProtocol).default
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local PostSendUserSignalFunction = UserSignalsModule.PostSendUserSignal
local UserSignalTypes = UserSignalsModule.UserSignalTypes
local NotInterestedUserSignalTelemetryEventConfigsModule = require(GameTile.NotInterestedUserSignalTelemetryEventConfigs)
local UndoGameNotInterestedModule = require(GameTile.undoGameNotInterested)
local FFlagLuaAppExtractNotInterestedHelper = require(Parent.SharedFlags).FFlagLuaAppExtractNotInterestedHelper

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), UseTokensFunction (copy), UseFocusGuiObjectFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseLocalizationFunction (copy), FFlagLuaAppExtractNotInterestedHelper (copy), GuiService (copy), UndoGameNotInterestedModule (copy), Default (copy), NotInterestedUserSignalTelemetryEventConfigsModule (copy), SetNetworkingErrorToastFunction (copy), PostSendUserSignalFunction (copy), UserSignalTypes (copy), MutedErrorFunction (copy), View (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseLocalizationResult = UseLocalizationFunction({
		undoLabel = "Feature.GameDetails.Action.Undo",
		hiddenTileMessage = "Feature.GameDetails.Message.SuggestLessOften"
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium padding-medium"
	}, {
		Message = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			fontStyle = UseTokensResult.Typography.BodySmall,
			Size = UDim2.fromScale(1, 0),
			Text = UseLocalizationResult.hiddenTileMessage,
			textStyle = UseTokensResult.Color.Content.Default
		}),
		UndoButton = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: FFlagLuaAppExtractNotInterestedHelper (upval), GuiService (upval), UseRefResult (copy), p1 (copy), UseFocusGuiObjectResult (copy), UndoGameNotInterestedModule (upval), UseDispatchResult (copy), UseRoactServiceResult (copy), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval), SetNetworkingErrorToastFunction (upval), PostSendUserSignalFunction (upval), UserSignalTypes (upval), MutedErrorFunction (upval)
				if FFlagLuaAppExtractNotInterestedHelper then
					UndoGameNotInterestedModule({
						appPage = p1.appPage,
						collectionId = p1.collectionId,
						dispatch = UseDispatchResult,
						isSponsored = p1.isSponsored,
						networking = UseRoactServiceResult,
						onOptimisticUnhide = function()
							-- upvalues: GuiService (upval), UseRefResult (upval), p1 (upval), UseFocusGuiObjectResult (upval)
							if GuiService.SelectedCoreObject == UseRefResult.current then
								task.delay(0, function()
									-- upvalues: p1 (upval), UseFocusGuiObjectResult (upval)
									if p1.parentRef then
										UseFocusGuiObjectResult(p1.parentRef.current)
									end
								end)
							end
						end,
						setGameHidden = p1.setGameHidden,
						universeId = p1.universeId
					})
					
					return
				end
				if not p1.appPage then
					Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
					UseDispatchResult(SetNetworkingErrorToastFunction())
					
					return
				end
				p1.setGameHidden(p1.universeId, false)
				
				if GuiService.SelectedCoreObject == UseRefResult.current then
					task.delay(0, function()
						-- upvalues: p1 (upval), UseFocusGuiObjectResult (upval)
						if p1.parentRef then
							UseFocusGuiObjectResult(p1.parentRef.current)
						end
					end)
				end
				local Success, Result = pcall(function()
					-- upvalues: PostSendUserSignalFunction (upval), UseRoactServiceResult (upval), p1 (upval), UserSignalTypes (upval), UseDispatchResult (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
					PostSendUserSignalFunction(UseRoactServiceResult, { boolValue = false }, {
						id = p1.universeId,
						assetType = if p1.isSponsored then UserSignalTypes.AssetType.SponsoredGame else UserSignalTypes.AssetType.Game,
						signalOrigin = {
							productSurface = p1.appPage,
							topicId = p1.collectionId or "",
							subIds = { p1.collectionId or "" }
						}
					}, UserSignalTypes.SignalValueType.Bool, UserSignalTypes.SignalType.NotInterested):catch(function(Err)
						-- upvalues: p1 (upval), UseDispatchResult (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
						p1.setGameHidden(p1.universeId, true)
						UseDispatchResult(SetNetworkingErrorToastFunction(Err))
						Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
					end)
				end)
				
				if not Success then
					p1.setGameHidden(p1.universeId, true)
					MutedErrorFunction(Result)
				end
			end, {
				UseRoactServiceResult, UseFocusGuiObjectResult, p1.setGameHidden,
				p1.universeId, p1.collectionId, p1.appPage, p1.parentRef, UseDispatchResult,
				p1.isSponsored
			}),
			size = InputSize.XSmall,
			text = UseLocalizationResult.undoLabel,
			variant = ButtonVariant.Standard,
			ref = UseRefResult,
			testId = `--game-tile-hidden-undo-{p0.universeId}`
		})
	})
end)