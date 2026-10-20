local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(Modules.LuaApp.Promise)
local FollowingsPostFollowModule = require(Modules.LuaApp.Http.Requests.FollowingsPostFollow)
local FollowingsDeleteFollowModule = require(Modules.LuaApp.Http.Requests.FollowingsDeleteFollow)
local SetGameFollowModule = require(Modules.LuaApp.Actions.SetGameFollow)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local Localization = require(CorePackages.Workspace.Packages.RobloxAppLocales).Localization
local LocalizationService = game:GetService("LocalizationService")
local SetExperienceNotificationsEnabledCountModule = require(Modules.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount)
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer

local function _(p1, p2)
	-- upvalues: LocalizationService (copy), Localization (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local NewLocalization = Localization.new(RobloxLocaleId)
	NewLocalization:SetLocale(RobloxLocaleId)
	
	return NewLocalization:Format(p1, p2)
end

local function SendGameFollow(p1, Text: string, p2: boolean, p3, p4, p5)
	-- upvalues: PerformFetch (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), PromiseModule (copy), SetExperienceNotificationsEnabledCountModule (copy), SetGameFollowModule (copy), FollowingsPostFollowModule (copy), GameInfosReducer (copy), LocalizationService (copy), Localization (copy), SendGameFollow (copy), SetNetworkingErrorToastModule (copy), FollowingsDeleteFollowModule (copy)
	if type(Text) ~= "string" then
		error("SendGameFollow thunk expects universeId to be a string")
	end
	if type(p2) ~= "boolean" then
		error("SendGameFollow thunk expects isFollowed to be a boolean")
	end
	return PerformFetch.Single("SendGameFollow" .. Text, function(p6)
		-- upvalues: p3 (copy), p5 (copy), p4 (copy), p2 (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), PromiseModule (upval), SetExperienceNotificationsEnabledCountModule (upval), SetGameFollowModule (upval), Text (copy), FollowingsPostFollowModule (upval), p1 (copy), GameInfosReducer (upval), LocalizationService (upval), Localization (upval), SendGameFollow (upval), SetNetworkingErrorToastModule (upval), FollowingsDeleteFollowModule (upval)
		local LocalUserId = p6:getState().LocalUserId
		
		if p3 then
			local P7 = p5 or 0
			local P6 = p4 or 0
			
			if p2 then
				if P7 <= P6 then
					p6:dispatch(SetCurrentToastMessageModule({
						toastMessage = "Feature.GameFollows.TooltipNotificationsLimitReached",
						toastType = ToastTypeModule.GameFollowError
					}))
					
					return PromiseModule.resolve()
				end
				p6:dispatch(SetExperienceNotificationsEnabledCountModule(P6 + 1))
			else
				p6:dispatch(SetExperienceNotificationsEnabledCountModule(P6 - 1))
			end
			p6:dispatch(SetGameFollowModule(Text, p2))
		end
		return if p2 then FollowingsPostFollowModule(p1, LocalUserId, Text):andThen(function(Result)
			-- upvalues: p6 (copy), Text (upval), p3 (upval), GameInfosReducer (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), LocalizationService (upval), Localization (upval), PromiseModule (upval), SendGameFollow (upval), p1 (upval), p4 (upval), p5 (upval)
			if not p6:getState().GameFollowings[Text].isFollowed then
				return SendGameFollow(p1, Text, false, p3, p4, p5)
			end
			if p3 then
				local PersonalizationEntry = p6:getState().Personalization[GameInfosReducer.key][Text]
				local config = {
					isLocalized = true,
					toastType = ToastTypeModule.NotificationsTurnedOn
				}
				local config1 = {
					experienceName = PersonalizationEntry and PersonalizationEntry.name or ""
				}
				local RobloxLocaleId = LocalizationService.RobloxLocaleId
				local NewLocalization = Localization.new(RobloxLocaleId)
				NewLocalization:SetLocale(RobloxLocaleId)
				config.toastMessage = NewLocalization:Format("Feature.GameFollows.TooltipTurnedOnNotifications", config1)
				p6:dispatch(SetCurrentToastMessageModule(config))
			end
			return PromiseModule.resolve(Result)
		end, function(p7)
			-- upvalues: p6 (copy), SetGameFollowModule (upval), Text (upval), p4 (upval), SetExperienceNotificationsEnabledCountModule (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), p3 (upval), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
			p6:dispatch(SetGameFollowModule(Text, false))
			p6:dispatch(SetExperienceNotificationsEnabledCountModule(p4 or 0))
			
			if p7.StatusCode == 400 then
				p6:dispatch(SetCurrentToastMessageModule({
					toastType = ToastTypeModule.GameFollowError,
					toastMessage = if p3 then "Feature.GameFollows.TooltipNotificationsLimitReached" else "Feature.GameFollows.TooltipFollowLimitReached"
				}))
			else
				p6:dispatch(SetNetworkingErrorToastModule(p7))
			end
			return PromiseModule.reject(p7)
		end) else FollowingsDeleteFollowModule(p1, LocalUserId, Text):andThen(function(Result)
			-- upvalues: p6 (copy), Text (upval), p3 (upval), GameInfosReducer (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), LocalizationService (upval), Localization (upval), PromiseModule (upval), SendGameFollow (upval), p1 (upval), p4 (upval), p5 (upval)
			if p6:getState().GameFollowings[Text].isFollowed then
				return SendGameFollow(p1, Text, true, p3, p4, p5)
			end
			if p3 then
				local PersonalizationEntry = p6:getState().Personalization[GameInfosReducer.key][Text]
				local config = {
					isLocalized = true,
					toastType = ToastTypeModule.NotificationsTurnedOff
				}
				local config1 = {
					experienceName = PersonalizationEntry and PersonalizationEntry.name or ""
				}
				local RobloxLocaleId = LocalizationService.RobloxLocaleId
				local NewLocalization = Localization.new(RobloxLocaleId)
				NewLocalization:SetLocale(RobloxLocaleId)
				config.toastMessage = NewLocalization:Format("Feature.GameFollows.TooltipTurnedOffNotifications", config1)
				p6:dispatch(SetCurrentToastMessageModule(config))
			end
			return PromiseModule.resolve(Result)
		end, function(p7)
			-- upvalues: p6 (copy), SetGameFollowModule (upval), Text (upval), p4 (upval), SetExperienceNotificationsEnabledCountModule (upval), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
			p6:dispatch(SetGameFollowModule(Text, true))
			p6:dispatch(SetExperienceNotificationsEnabledCountModule(p4 or 0))
			p6:dispatch(SetNetworkingErrorToastModule(p7))
			
			return PromiseModule.reject(p7)
		end)
	end)
end

return SendGameFollow