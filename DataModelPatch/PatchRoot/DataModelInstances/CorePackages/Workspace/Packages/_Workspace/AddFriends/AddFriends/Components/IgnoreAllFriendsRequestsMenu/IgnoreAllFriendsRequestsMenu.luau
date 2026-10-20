local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local BaseMenu = UIBloxModule.App.Menu.BaseMenu
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ToastRoduxModule = require(Parent.ToastRodux)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local FriendsNetworking = require(Parent.AddFriendsState).Networking.FriendsNetworking
local UseFireAnalyticsEventModule = require(AddFriends.Analytics.useFireAnalyticsEvent)
local EventNames = require(AddFriends.Analytics).EventNames

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), UseDesignTokensFunction (copy), UseLocalUserIdFunction (copy), UseFireAnalyticsEventModule (copy), ReactModule (copy), ToastRoduxModule (copy), EventNames (copy), FriendsNetworking (copy), Images (copy), BaseMenu (copy)
	local Open = p1.open
	local Width = p1.width or UDim.new(0, 300)
	local OpenPositionY = p1.openPositionY or UDim.new(0, 0)
	local CloseMenuFunction = p1.closeMenu
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({ ignoreAllLabel = "Feature.AddFriends.Action.IgnoreAll" })
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseFireAnalyticsEventModuleResult = UseFireAnalyticsEventModule()
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), ToastRoduxModule (upval)
		if p2 then
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage({ toastMessage = p2.toastTitle, toastIcon = p2.iconImage }))
			
			return
		end
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseFireAnalyticsEventModuleResult (copy), EventNames (upval), UseDispatchResult (copy), FriendsNetworking (upval), UseLocalUserIdResult (copy), UseResult (copy), Images (upval)
		UseFireAnalyticsEventModuleResult(EventNames.IgnoreAllBtnClick)
		
		return UseDispatchResult(FriendsNetworking.DeclineAllFriendRequests.API({ currentUserId = UseLocalUserIdResult })):andThen(function(Result)
			-- upvalues: UseResult (upval), Images (upval)
			UseResult({
				toastTitle = if Result and Result.responseBody and Result.responseBody.backgrounded then "Feature.AddFriends.Label.DeclineAllBackgrounded" else "Feature.Profile.Action.AllRequestsIgnored",
				iconImage = Images["icons/actions/reject"]
			})
		end)
	end, { UseLocalUserIdResult, UseFireAnalyticsEventModuleResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult1 (copy), CloseMenuFunction (copy)
		UseResult1()
		CloseMenuFunction()
	end, { UseResult1, CloseMenuFunction })
	
	return Open and ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		ZIndex = 5,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		IgnoreAllMenuFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_1200)
		}, {
			IgnoreAllFriendsRequestsMenu = ReactModule.createElement(BaseMenu, {
				width = Width,
				buttonProps = {
					{
						text = UseLocalizationResult.ignoreAllLabel,
						onActivated = UseResult2
					}
				},
				anchorPoint = Vector2.new(1, 0),
				position = UDim2.new(UDim.new(1, 0), OpenPositionY)
			})
		})
	}) or nil
end