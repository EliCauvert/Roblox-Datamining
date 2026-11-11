local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local Button = FoundationModule.Button
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local PeopleServiceModule = require(CorePackages.Workspace.Packages.PeopleService)

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), PeopleServiceModule (copy), Players (copy), SignalsReactModule (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("Constants")
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("PeopleAnalyticsManager")
	end, {})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("FriendStatusStore")
	end, {})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), Players (upval)
		return if p1.userId then Players:GetPlayerByUserId(p1.userId) else nil
	end, { p1.userId })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult2.getIsFriendButtonDisabled(p1.userId))
	
	return ReactModule.createElement(Button, {
		text = SignalsReactModule.useSignalState(UseMemoResult2.getFriendButtonText(p1.userId, (UseLocalizationFunction({
			isFriend = "CommonUI.Features.Label.Connection",
			addPerson = "CommonUI.Features.Label.Add",
			requestSent = "CommonUI.Features.Label.Sent"
		})))),
		variant = if UseSignalStateResult then ButtonVariant.Subtle else ButtonVariant.Emphasis,
		fillBehavior = FillBehavior.Fill,
		isDisabled = UseSignalStateResult,
		LayoutOrder = p1.layoutOrder,
		onActivated = function()
			-- upvalues: UseMemoResult1 (copy), UseMemoResult (copy), UseMemoResult2 (copy), UseMemoResult3 (copy)
			UseMemoResult1:trackRequestFriendship(UseMemoResult.ANALYTICS.ENTRY_POINT.PLAYER_PROFILE)
			UseMemoResult2.sendFriendRequest(UseMemoResult3)
		end
	})
end)