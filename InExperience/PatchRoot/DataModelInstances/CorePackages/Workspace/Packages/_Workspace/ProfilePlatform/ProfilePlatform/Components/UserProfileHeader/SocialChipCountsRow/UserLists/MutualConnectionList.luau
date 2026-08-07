local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local constantsModule = require(profilePlatform.Common.Constants)
local reactModule = require(parent.React)
local userListModule = require(parent.UserList)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigationProps = require(parent.RobloxAppNavigation).useNavigationProps
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local roactUtilsModule = require(parent.RoactUtils)
local inputUiModule = require(parent.InputUi)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local appPage = require(parent.RobloxAppEnums).AppPage
local enumsModule = require(profilePlatform.Common.Enums)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local userListViewAdaptor = userListModule.Components.UserListViewAdaptor
local useScreenSize = robloxAppHooksModule.useScreenSize
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local getSafeAreaSize = inputUiModule.getSafeAreaSize
local useProfileCardWidthModule = require(profilePlatform.Hooks.useProfileCardWidth)
local useProfileCardWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local fFlagSwitchProfileWidthHookToSocialCommon = require(parent.SharedFlags).FFlagSwitchProfileWidthHookToSocialCommon
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var11 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local fFlagMutualConnectionsListPagination = require(parent.SharedFlags).FFlagMutualConnectionsListPagination

return function(_) --[[ line: 40 | named "MutualConnectionList" ]]
	-- upvalues: useDispatch (ref), useNavigationProps (ref), useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), fFlagMutualConnectionsListPagination (ref), reactModule (ref), useLocalization (ref), textKeysModule (ref), userListViewAdaptor (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var11 (ref), navigateDown (ref)
	local var15
	local var12 = useDispatch()
	local var13 = useNavigationProps(function(_, p0) --[[ line: 42 ]]
		return { mutualFriendIds = p0.mutualFriendIds }
	end)
	local var14 = getSafeAreaSize(useScreenSize(), useSelector(function(p1) --[[ line: 50 ]]
		return p1.GlobalGuiInset
	end))
	
	if fFlagProfilePlatformNewProfileHeader then
		var15 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
		var15 = nil
	else
		var15 = false
	end
	local t = {
		position = UDim2.fromScale(1, 0),
		size = UDim2.fromScale((if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var15) else math.min(var14.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)) / var14.X.Offset, 1),
		anchorPoint = Vector2.new(1, 0)
	}
	local mutualFriendIds = var13.mutualFriendIds
	local var17 = if fFlagMutualConnectionsListPagination then mutualFriendIds else nil
	local var18 = nil
	local var19 = nil
	
	if fFlagMutualConnectionsListPagination then
		local var20, var21 = reactModule.useState(25)
		reactModule.useEffect(function() --[[ line: 78 ]]
			-- upvalues: var21 (ref)
			var21(25)
		end, { mutualFriendIds })
		var19 = reactModule.useCallback(function() --[[ line: 82 ]]
			-- upvalues: var21 (ref), mutualFriendIds (ref)
			var21(function(p2) --[[ line: 83 ]]
				-- upvalues: mutualFriendIds (copy)
				return math.min(p2 + 25, #mutualFriendIds)
			end)
		end, { mutualFriendIds })
		var17 = reactModule.useMemo(function() --[[ line: 88 ]]
			-- upvalues: var20 (ref), mutualFriendIds (ref)
			if var20 >= #mutualFriendIds then
				return mutualFriendIds
			end
			local t = {}
			
			for i = 1, var20 do
				table.insert(t, mutualFriendIds[i])
			end
			return t
		end, { mutualFriendIds, var20 })
		var18 = var20 < #mutualFriendIds
	end
	local var22 = useLocalization({
		mutualConnections = {
			textKeysModule.MutualConnectionsTitle,
			numConnections = #mutualFriendIds
		},
		mutualConnection = textKeysModule.MutualConnectionTitle
	})
	
	return if #mutualFriendIds == 0 then nil else reactModule.createElement(userListViewAdaptor, {
		users = if fFlagMutualConnectionsListPagination then var17 else mutualFriendIds,
		title = if #mutualFriendIds == 1 then var22.mutualConnection else var22.mutualConnections,
		wideModePeekViewLayout = t,
		onUserSelected = function(p3) --[[ line: 120 ]]
			-- upvalues: appPage (copy), enumsModule (copy), fFlagSignalsNavP3Dispatch (copy), var11 (copy), var12 (ref), navigateDown (copy)
			local t = {
				name = appPage.ProfilePlatform,
				detail = p3,
				extraProps = {
					profileType = enumsModule.ProfileTypes.User,
					source = enumsModule.Sources.MutualConnectionsList
				}
			}
			
			if fFlagSignalsNavP3Dispatch then
				var11.down(var11.fromLegacyPage(t))
				
				return
			end
			var12(navigateDown(t))
		end,
		hasMore = if fFlagMutualConnectionsListPagination then var18 else nil,
		onLoadMore = if fFlagMutualConnectionsListPagination then var19 else nil
	})
end