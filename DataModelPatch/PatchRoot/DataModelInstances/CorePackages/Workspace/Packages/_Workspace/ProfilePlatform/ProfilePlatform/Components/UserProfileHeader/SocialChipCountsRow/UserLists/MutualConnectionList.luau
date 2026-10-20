local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local RoactUtilsModule = require(Parent.RoactUtils)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local EnumsModule = require(ProfilePlatform.Common.Enums)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UserListViewAdaptor = require(Parent.UserList).Components.UserListViewAdaptor
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local GetSafeAreaSizeFunction = require(Parent.InputUi).getSafeAreaSize
local UseProfileCardWidthModule = require(ProfilePlatform.Hooks.useProfileCardWidth)
local UseProfileCardWidthFunction = require(Parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FFlagSwitchProfileWidthHookToSocialCommon = require(Parent.SharedFlags).FFlagSwitchProfileWidthHookToSocialCommon
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FFlagMutualConnectionsListPagination = require(Parent.SharedFlags).FFlagMutualConnectionsListPagination

return function(_)
	-- upvalues: UseDispatchFunction (copy), UseNavigationPropsFunction (copy), UseScreenSizeFunction (copy), UseSelectorFunction (copy), GetSafeAreaSizeFunction (copy), FFlagProfilePlatformNewProfileHeader (copy), UseProfileFormFactorModule (copy), EnumsModule (copy), FFlagSwitchProfileWidthHookToSocialCommon (copy), UseProfileCardWidthFunction (copy), UseProfileCardWidthModule (copy), ConstantsModule (copy), FFlagMutualConnectionsListPagination (copy), ReactModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UserListViewAdaptor (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1)
		return { mutualFriendIds = p1.mutualFriendIds }
	end)
	local SafeAreaSize = GetSafeAreaSizeFunction(UseScreenSizeFunction(), (UseSelectorFunction(function(p1)
		return p1.GlobalGuiInset
	end)))
	local IsFormFactorMatch: boolean = if FFlagProfilePlatformNewProfileHeader then UseProfileFormFactorModule().formFactor == EnumsModule.ProfileFormFactor.Wide else false
	local WideModePeekViewLayout = {
		position = UDim2.fromScale(1, 0),
		size = UDim2.fromScale((if FFlagProfilePlatformNewProfileHeader then if FFlagSwitchProfileWidthHookToSocialCommon then UseProfileCardWidthFunction() else UseProfileCardWidthModule(IsFormFactorMatch) else math.min(SafeAreaSize.X.Offset, ConstantsModule.MAXIMUM_CONTAINER_WIDTH)) / SafeAreaSize.X.Offset, 1),
		anchorPoint = Vector2.new(1, 0)
	}
	local MutualFriendIds = UseNavigationPropsResult.mutualFriendIds
	local MutualFriendIds1 = if FFlagMutualConnectionsListPagination then MutualFriendIds else nil
	local v1: boolean? = nil
	local UseResult = nil
	
	if FFlagMutualConnectionsListPagination then
		local UseStateResult, UseStateResult2 = ReactModule.useState(25)
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(25)
		end, { MutualFriendIds })
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), MutualFriendIds (copy)
			UseStateResult2(function(p1: number): number
				-- upvalues: MutualFriendIds (upval)
				return (math.min(p1 + 25, #MutualFriendIds))
			end)
		end, { MutualFriendIds })
		MutualFriendIds1 = ReactModule.useMemo(function()
			-- upvalues: UseStateResult (copy), MutualFriendIds (copy)
			if UseStateResult >= #MutualFriendIds then
				return MutualFriendIds
			end
			local List = {}
			
			for i = 1, UseStateResult do
				table.insert(List, MutualFriendIds[i])
			end
			return List
		end, { MutualFriendIds, UseStateResult })
		v1 = UseStateResult < #MutualFriendIds
	end
	local UseLocalizationResult = UseLocalizationFunction({
		mutualConnections = {
			TextKeysModule.MutualConnectionsTitle,
			numConnections = #MutualFriendIds
		},
		mutualConnection = TextKeysModule.MutualConnectionTitle
	})
	
	return if #MutualFriendIds == 0 then nil else ReactModule.createElement(UserListViewAdaptor, {
		users = if FFlagMutualConnectionsListPagination then MutualFriendIds1 else MutualFriendIds,
		title = if #MutualFriendIds == 1 then UseLocalizationResult.mutualConnection else UseLocalizationResult.mutualConnections,
		wideModePeekViewLayout = WideModePeekViewLayout,
		onUserSelected = function(Detail)
			-- upvalues: AppPage (upval), EnumsModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
			local config = {
				name = AppPage.ProfilePlatform,
				detail = Detail,
				extraProps = {
					profileType = EnumsModule.ProfileTypes.User,
					source = EnumsModule.Sources.MutualConnectionsList
				}
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				UseDispatchResult(NavigateDownFunction(config))
			end
		end,
		hasMore = if FFlagMutualConnectionsListPagination then v1 else nil,
		onLoadMore = if FFlagMutualConnectionsListPagination then UseResult else nil
	})
end