local SocialProof = script:FindFirstAncestor("SocialProof")
local Parent = SocialProof.Parent
local FoundationModule = require(Parent.Foundation)
local Chip = FoundationModule.Chip
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local AvatarGroupType = FoundationModule.Enums.AvatarGroupType
local UseEntityConnectionsPaginationModule = require(SocialProof.Hooks.useEntityConnectionsPagination)
local EnumsModule = require(SocialProof.Common.Enums)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(SocialProof.Common.Types)
local FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation = require(Parent.SharedFlags).FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation

return ReactModule.forwardRef(function(Gui, Ref)
	-- upvalues: UseDispatchFunction (copy), UseEntityConnectionsPaginationModule (copy), EnumsModule (copy), ReactModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), UseLocalizationFunction (copy), FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation (copy), Chip (copy), AvatarGroupType (copy)
	local FromProfile = Gui.fromProfile
	local ItemId = Gui.itemId
	local ItemType = Gui.itemType
	local UseDispatchResult = UseDispatchFunction()
	local UseEntityConnectionsPaginationModuleResult = UseEntityConnectionsPaginationModule({
		entityId = ItemId,
		entityType = ItemType,
		connectionType = EnumsModule.ConnectionType.Friend
	})
	local UserIds = UseEntityConnectionsPaginationModuleResult.userIds or {}
	local Avatars = { table.unpack(UserIds, 1, (math.min(2, #UserIds))) }
	local TotalConnections = UseEntityConnectionsPaginationModuleResult.totalConnections or 0
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: AppPage (upval), ItemId (copy), ItemType (copy), FromProfile (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			name = AppPage.FriendsOwnedUserList,
			extraProps = {
				entityId = ItemId,
				entityType = ItemType,
				source = if FromProfile then "profile" else "marketplace"
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { UseDispatchResult, ItemId, ItemType, FromProfile })
	local UseLocalizationResult = UseLocalizationFunction({
		singleConnectionOwns = "Feature.Friends.Label.FriendOwns",
		connectionsOwn = {
			"Feature.Friends.Label.FriendsOwn",
			numberOfConnections = TotalConnections
		}
	})
	local SingleConnectionOwns = if TotalConnections == 1 then UseLocalizationResult.singleConnectionOwns else UseLocalizationResult.connectionsOwn
	
	if FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation then
		ReactModule.useEffect(function()
			-- upvalues: TotalConnections (copy), Gui (copy)
			if TotalConnections > 0 and Gui.chipIsRenderedCallback then
				Gui.chipIsRenderedCallback(true)
			end
		end, { TotalConnections, Gui.chipIsRenderedCallback })
	end
	return if TotalConnections == 0 then nil else ReactModule.createElement(Chip, {
		LayoutOrder = Gui.layoutOrder or 0,
		text = SingleConnectionOwns,
		onActivated = UseResult,
		leading = {
			type = "AvatarGroup",
			props = {
				max = 2,
				avatars = Avatars,
				type = AvatarGroupType.Stacked
			}
		},
		ref = Ref,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown,
		NextSelectionRight = Gui.NextSelectionRight,
		NextSelectionLeft = Gui.NextSelectionLeft
	})
end)