local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local FoundationModule = require(Parent.Foundation)
local Game1 = require(Parent.DataHydration).Game
local SignalsModule = require(Parent.Signals)
local FFlagLuaAppAddUniverseIdToEngagementEvents = require(Parent.SharedFlags).FFlagLuaAppAddUniverseIdToEngagementEvents
local LocalizeStringsFunction = require(Parent.Localization).localizeStrings
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GameFollowFunction = require(Parent.DiscoveryAnalytics).Events.gameFollow
local GetSduiPageEntrySnackbarStoreFunction = require(Parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), Game1 (copy), Players (copy), GameFollowFunction (copy), FFlagLuaAppAddUniverseIdToEngagementEvents (copy), SignalsModule (copy), GetSduiPageEntrySnackbarStoreFunction (copy), FoundationModule (copy), LocalizeStringsFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = SduiActionType.ToggleExperienceFollow
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	local GameName = ActionParams.gameName or ""
	
	if UniverseId == nil or typeof(UniverseId) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing universeId",
			name = SduiActionType.ToggleExperienceFollow
		}, p2.appPage)
		
		return
	else
		local Ctx = ActionParams.ctx or ""
		local FollowingsStore = Game1.getFollowingsStore(false)
		local DataResult = FollowingsStore.getAndFetchFollowing(UniverseId).data(false)
		local Inverted = not (DataResult and DataResult.isFollowing or false)
		GameFollowFunction({
			uid = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId),
			placeId = tostring(ActionParams.placeId),
			state = if Inverted then "on" else "off",
			ctx = Ctx,
			universeId = if FFlagLuaAppAddUniverseIdToEngagementEvents then UniverseId else nil
		}, Ctx)
		local UpdateFollowingResult = FollowingsStore.updateFollowing(UniverseId, Inverted)
		local Localization = p2.dependencies.localization
		local t = {}
		t.dispose = SignalsModule.createEffect(function(p3)
			-- upvalues: UpdateFollowingResult (copy), p2 (copy), Localization (copy), GetSduiPageEntrySnackbarStoreFunction (upval), FoundationModule (upval), LocalizeStringsFunction (upval), GameName (copy), t (copy)
			local UpdateFollowingResultResult = UpdateFollowingResult(p3)
			
			if UpdateFollowingResultResult == nil then return end
			local ConfigKey = p2.configKey
			
			if UpdateFollowingResultResult.type == "error" then
				if ConfigKey then
					GetSduiPageEntrySnackbarStoreFunction().show(ConfigKey, {
						title = Localization:Format(if UpdateFollowingResultResult.errorType == "LimitReached" then "Feature.GameFollows.TooltipNotificationsLimitReached" else "Feature.Toast.NetworkingError.SomethingIsWrong"),
						icon = FoundationModule.Enums.IconName.TriangleExclamation
					})
				end
			elseif UpdateFollowingResultResult.type == "success" and ConfigKey then
				local LocalizeStringsResult = LocalizeStringsFunction(Localization, {
					notificationsTurnedOn = {
						"Feature.GameFollows.TooltipTurnedOnNotifications",
						experienceName = GameName
					},
					notificationsTurnedOff = {
						"Feature.GameFollows.TooltipTurnedOffNotifications",
						experienceName = GameName
					}
				})
				GetSduiPageEntrySnackbarStoreFunction().show(ConfigKey, {
					title = if UpdateFollowingResultResult.isFollowing then LocalizeStringsResult.notificationsTurnedOn else LocalizeStringsResult.notificationsTurnedOff,
					icon = if UpdateFollowingResultResult.isFollowing then FoundationModule.Enums.IconName.Bell else FoundationModule.Enums.IconName.BellSlash
				})
			end
			local DisposeFunction: () -> () = t.dispose
			
			if DisposeFunction then
				DisposeFunction()
				t.dispose = nil
			end
		end)
	end
end