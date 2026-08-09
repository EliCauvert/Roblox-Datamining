local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local baseMenu = UIBloxModule.App.Menu.BaseMenu
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local contactList = coreGuiService:WaitForChild("RobloxGui").Modules.ContactList
local dependenciesModule = require(contactList.dependencies)
local useSelector = dependenciesModule.Hooks.useSelector
local useAnalyticsModule = require(contactList.Analytics.useAnalytics)
local eventNamesEnumModule = require(contactList.Analytics.EventNamesEnum)
local friendActionModule = require(contactList.Enums.FriendAction)
local useLocalization = dependenciesModule.Hooks.useLocalization

return function(p0) --[[ line: 22 | named "ConfigureFriendMenu" ]]
	-- upvalues: useAnalyticsModule (ref), useStyle (ref), useSelector (ref), useLocalization (ref), roactModule (ref), baseMenu (ref), images (ref), eventNamesEnumModule (ref), friendActionModule (ref)
	local var8 = useAnalyticsModule()
	local theme = useStyle().Theme
	local var9 = useSelector(function(p1) --[[ line: 27 ]]
		return if p1.PlayerMenu.friend then p1.PlayerMenu.friend.combinedName else ""
	end)
	local var10 = useSelector(function(p2) --[[ line: 35 ]]
		return if p2.PlayerMenu.friend then p2.PlayerMenu.friend.userId else nil
	end)
	local var11 = useLocalization({
		blockLabel = { "Feature.Call.Label.Block", combinedName = var9 },
		unfriendLabel = { "Feature.Call.Label.Unfriend", combinedName = var9 }
	})
	
	return roactModule.createElement(baseMenu, {
		buttonProps = {
			{
				icon = images["icons/actions/block"],
				text = var11.blockLabel,
				onActivated = function() --[[ line: 59 ]]
					-- upvalues: var8 (ref), eventNamesEnumModule (copy), var10 (ref), p0 (ref), friendActionModule (copy)
					var8.fireEvent(eventNamesEnumModule.PhoneBookPlayerMenuBlockClicked, {
						eventTimestampMs = os.time() * 1000,
						friendUserId = var10
					})
					p0.initiateConfirmation(friendActionModule.Block)
				end
			},
			{
				icon = images["icons/actions/friends/friendRemove"],
				text = var11.unfriendLabel,
				onActivated = function() --[[ line: 70 ]]
					-- upvalues: var8 (ref), eventNamesEnumModule (copy), var10 (ref), p0 (ref), friendActionModule (copy)
					var8.fireEvent(eventNamesEnumModule.PhoneBookPlayerMenuUnfriendClicked, {
						eventTimestampMs = os.time() * 1000,
						friendUserId = var10
					})
					p0.initiateConfirmation(friendActionModule.Unfriend)
				end
			}
		},
		background = theme.BackgroundUIDefault,
		width = UDim.new(0, 352),
		position = UDim2.new(0.5, 0, 0.5, 0),
		anchorPoint = Vector2.new(0.5, 0.5)
	})
end