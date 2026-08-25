local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local foundationModule = require(corePackagesService.Packages.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local button = foundationModule.Button
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local peopleServiceModule = require(corePackagesService.Workspace.Packages.PeopleService)

return reactModule.memo(function(p0)
	-- upvalues: useLocalization (ref), reactModule (ref), peopleServiceModule (ref), playersService (ref), signalsReactModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var6 = useLocalization({
		isFriend = "CommonUI.Features.Label.Connection",
		addPerson = "CommonUI.Features.Label.Add",
		requestSent = "CommonUI.Features.Label.Sent"
	})
	local var7 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("Constants")
	end, {})
	local var8 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleAnalyticsManager")
	end, {})
	local var9 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("FriendStatusStore")
	end, {})
	local var10 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), playersService (copy)
		return if p0.userId then playersService:GetPlayerByUserId(p0.userId) else nil
	end, { p0.userId })
	local var11 = signalsReactModule.useSignalState(var9.getIsFriendButtonDisabled(p0.userId))
	
	return reactModule.createElement(button, {
		text = signalsReactModule.useSignalState(var9.getFriendButtonText(p0.userId, var6)),
		variant = if var11 then buttonVariant.Subtle else buttonVariant.Emphasis,
		fillBehavior = fillBehavior.Fill,
		isDisabled = var11,
		LayoutOrder = p0.layoutOrder,
		onActivated = function()
			-- upvalues: var8 (ref), var7 (ref), var9 (ref), var10 (ref)
			var8:trackRequestFriendship(var7.ANALYTICS.ENTRY_POINT.PLAYER_PROFILE)
			var9.sendFriendRequest(var10)
		end
	})
end)