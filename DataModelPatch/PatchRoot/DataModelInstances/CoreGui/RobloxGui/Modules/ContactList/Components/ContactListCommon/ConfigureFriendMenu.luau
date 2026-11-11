local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local BaseMenu = UIBloxModule.App.Menu.BaseMenu
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ContactList = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList
local DependenciesModule = require(ContactList.dependencies)
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseAnalyticsModule = require(ContactList.Analytics.useAnalytics)
local EventNamesEnumModule = require(ContactList.Analytics.EventNamesEnum)
local FriendActionModule = require(ContactList.Enums.FriendAction)
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseStyleFunction (copy), UseSelectorFunction (copy), UseLocalizationFunction (copy), RoactModule (copy), BaseMenu (copy), Images (copy), EventNamesEnumModule (copy), FriendActionModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local Theme = UseStyleFunction().Theme
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return if p2.PlayerMenu.friend then p2.PlayerMenu.friend.combinedName else ""
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return if p2.PlayerMenu.friend then p2.PlayerMenu.friend.userId else nil
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		blockLabel = {
			"Feature.Call.Label.Block",
			combinedName = UseSelectorResult
		},
		unfriendLabel = {
			"Feature.Call.Label.Unfriend",
			combinedName = UseSelectorResult
		}
	})
	
	return RoactModule.createElement(BaseMenu, {
		buttonProps = {
			{
				icon = Images["icons/actions/block"],
				text = UseLocalizationResult.blockLabel,
				onActivated = function()
					-- upvalues: UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), UseSelectorResult1 (copy), p1 (copy), FriendActionModule (upval)
					UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookPlayerMenuBlockClicked, {
						eventTimestampMs = os.time() * 1000,
						friendUserId = UseSelectorResult1
					})
					p1.initiateConfirmation(FriendActionModule.Block)
				end
			},
			{
				icon = Images["icons/actions/friends/friendRemove"],
				text = UseLocalizationResult.unfriendLabel,
				onActivated = function()
					-- upvalues: UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), UseSelectorResult1 (copy), p1 (copy), FriendActionModule (upval)
					UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookPlayerMenuUnfriendClicked, {
						eventTimestampMs = os.time() * 1000,
						friendUserId = UseSelectorResult1
					})
					p1.initiateConfirmation(FriendActionModule.Unfriend)
				end
			}
		},
		background = Theme.BackgroundUIDefault,
		width = UDim.new(0, 352),
		position = UDim2.new(0.5, 0, 0.5, 0),
		anchorPoint = Vector2.new(0.5, 0.5)
	})
end