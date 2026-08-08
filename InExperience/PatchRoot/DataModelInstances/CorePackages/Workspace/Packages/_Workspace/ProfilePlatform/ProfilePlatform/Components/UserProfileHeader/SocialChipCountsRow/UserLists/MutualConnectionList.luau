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
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local var12 = if fFlagEnableSplitPane then require(parent.SplitPane).SplitPaneStore else nil
local useSignalState = require(parent.SignalsReact).useSignalState

return function(_) --[[ line: 43 | named "MutualConnectionList" ]]
	-- upvalues: useDispatch (ref), useNavigationProps (ref), useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), fFlagEnableSplitPane (ref), useSignalState (ref), var12 (ref), fFlagMutualConnectionsListPagination (ref), reactModule (ref), useLocalization (ref), textKeysModule (ref), userListViewAdaptor (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var11 (ref), navigateDown (ref)
	local var16
	local var13 = useDispatch()
	local var14 = useNavigationProps(function(_, p0) --[[ line: 45 ]]
		return { mutualFriendIds = p0.mutualFriendIds }
	end)
	local var15 = getSafeAreaSize(useScreenSize(), useSelector(function(p1) --[[ line: 53 ]]
		return p1.GlobalGuiInset
	end))
	
	if fFlagProfilePlatformNewProfileHeader then
		var16 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
		var16 = nil
	else
		var16 = false
	end
	local t = {
		position = UDim2.fromScale(1, 0),
		size = UDim2.fromScale(if fFlagEnableSplitPane and (if fFlagEnableSplitPane then useSignalState(var12.getStore().getIsSplitEnabled) else false) then 1 else (if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var16) else math.min(var15.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)) / var15.X.Offset, 1),
		anchorPoint = Vector2.new(1, 0)
	}
	local mutualFriendIds = var14.mutualFriendIds
	local var18 = if fFlagMutualConnectionsListPagination then mutualFriendIds else nil
	local var19 = nil
	local var20 = nil
	
	if fFlagMutualConnectionsListPagination then
		local var21, var22 = reactModule.useState(25)
		reactModule.useEffect(function() --[[ line: 90 ]]
			-- upvalues: var22 (ref)
			var22(25)
		end, { mutualFriendIds })
		var20 = reactModule.useCallback(function() --[[ line: 94 ]]
			-- upvalues: var22 (ref), mutualFriendIds (ref)
			var22(function(p2) --[[ line: 95 ]]
				-- upvalues: mutualFriendIds (copy)
				return math.min(p2 + 25, #mutualFriendIds)
			end)
		end, { mutualFriendIds })
		var18 = reactModule.useMemo(function() --[[ line: 100 ]]
			-- upvalues: var21 (ref), mutualFriendIds (ref)
			if var21 >= #mutualFriendIds then
				return mutualFriendIds
			end
			local t = {}
			
			for i = 1, var21 do
				table.insert(t, mutualFriendIds[i])
			end
			return t
		end, { mutualFriendIds, var21 })
		var19 = var21 < #mutualFriendIds
	end
	local var23 = useLocalization({
		mutualConnections = {
			textKeysModule.MutualConnectionsTitle,
			numConnections = #mutualFriendIds
		},
		mutualConnection = textKeysModule.MutualConnectionTitle
	})
	
	return if #mutualFriendIds == 0 then nil else reactModule.createElement(userListViewAdaptor, {
		users = if fFlagMutualConnectionsListPagination then var18 else mutualFriendIds,
		title = if #mutualFriendIds == 1 then var23.mutualConnection else var23.mutualConnections,
		wideModePeekViewLayout = t,
		onUserSelected = function(p3) --[[ line: 132 ]]
			-- upvalues: appPage (copy), enumsModule (copy), fFlagSignalsNavP3Dispatch (copy), var11 (copy), var13 (ref), navigateDown (copy)
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
			var13(navigateDown(t))
		end,
		hasMore = if fFlagMutualConnectionsListPagination then var19 else nil,
		onLoadMore = if fFlagMutualConnectionsListPagination then var20 else nil
	})
end