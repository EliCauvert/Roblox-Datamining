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

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), peopleServiceModule (ref), playersService (ref), signalsReactModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var1 = useLocalization({
		isFriend = "CommonUI.Features.Label.Connection",
		addPerson = "CommonUI.Features.Label.Add",
		requestSent = "CommonUI.Features.Label.Sent"
	})
	local var2 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("Constants")
	end, {})
	local var3 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleAnalyticsManager")
	end, {})
	local var4 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("FriendStatusStore")
	end, {})
	local var5 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), playersService (copy)
		return if p1.userId then playersService:GetPlayerByUserId(p1.userId) else nil
	end, { p1.userId })
	local var6 = signalsReactModule.useSignalState(var4.getIsFriendButtonDisabled(p1.userId))
	
	return reactModule.createElement(button, {
		text = signalsReactModule.useSignalState(var4.getFriendButtonText(p1.userId, var1)),
		variant = if var6 then buttonVariant.Subtle else buttonVariant.Emphasis,
		fillBehavior = fillBehavior.Fill,
		isDisabled = var6,
		LayoutOrder = p1.layoutOrder,
		onActivated = function()
			-- upvalues: var3 (ref), var2 (ref), var4 (ref), var5 (ref)
			var3:trackRequestFriendship(var2.ANALYTICS.ENTRY_POINT.PLAYER_PROFILE)
			var4.sendFriendRequest(var5)
		end
	})
end)