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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local fFlagMutualConnectionsListPagination = require(parent.SharedFlags).FFlagMutualConnectionsListPagination
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local var2 = if fFlagEnableSplitPane then require(parent.SplitPane).SplitPaneStore else nil
local useSignalState = require(parent.SignalsReact).useSignalState

return function(_)
	-- upvalues: useDispatch (ref), useNavigationProps (ref), useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), fFlagEnableSplitPane (ref), useSignalState (ref), var2 (ref), fFlagMutualConnectionsListPagination (ref), reactModule (ref), useLocalization (ref), textKeysModule (ref), userListViewAdaptor (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var3
	local var4 = useDispatch()
	local var5 = useNavigationProps(function(_, p1)
		return { mutualFriendIds = p1.mutualFriendIds }
	end)
	local var6 = getSafeAreaSize(useScreenSize(), useSelector(function(p1)
		return p1.GlobalGuiInset
	end))
	
	if fFlagProfilePlatformNewProfileHeader then
		var3 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
		var3 = nil
	else
		var3 = false
	end
	local t = {
		position = UDim2.fromScale(1, 0),
		size = UDim2.fromScale(if fFlagEnableSplitPane and (if fFlagEnableSplitPane then useSignalState(var2.getStore().getIsSplitEnabled) else false) then 1 else (if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var3) else math.min(var6.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)) / var6.X.Offset, 1),
		anchorPoint = Vector2.new(1, 0)
	}
	local mutualFriendIds = var5.mutualFriendIds
	local var7 = if fFlagMutualConnectionsListPagination then mutualFriendIds else nil
	local var8 = nil
	local var9 = nil
	
	if fFlagMutualConnectionsListPagination then
		local var10, var11 = reactModule.useState(25)
		reactModule.useEffect(function()
			-- upvalues: var11 (ref)
			var11(25)
		end, { mutualFriendIds })
		var9 = reactModule.useCallback(function()
			-- upvalues: var11 (ref), mutualFriendIds (ref)
			var11(function(p1)
				-- upvalues: mutualFriendIds (copy)
				return math.min(p1 + 25, #mutualFriendIds)
			end)
		end, { mutualFriendIds })
		var7 = reactModule.useMemo(function()
			-- upvalues: var10 (ref), mutualFriendIds (ref)
			if var10 >= #mutualFriendIds then
				return mutualFriendIds
			end
			local t = {}
			
			for i = 1, var10 do
				table.insert(t, mutualFriendIds[i])
			end
			return t
		end, { mutualFriendIds, var10 })
		var8 = var10 < #mutualFriendIds
	end
	local var12 = useLocalization({
		mutualConnections = {
			textKeysModule.MutualConnectionsTitle,
			numConnections = #mutualFriendIds
		},
		mutualConnection = textKeysModule.MutualConnectionTitle
	})
	
	return if #mutualFriendIds == 0 then nil else reactModule.createElement(userListViewAdaptor, {
		users = if fFlagMutualConnectionsListPagination then var7 else mutualFriendIds,
		title = if #mutualFriendIds == 1 then var12.mutualConnection else var12.mutualConnections,
		wideModePeekViewLayout = t,
		onUserSelected = function(p1)
			-- upvalues: appPage (copy), enumsModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var4 (ref), navigateDown (copy)
			local t = {
				name = appPage.ProfilePlatform,
				detail = p1,
				extraProps = {
					profileType = enumsModule.ProfileTypes.User,
					source = enumsModule.Sources.MutualConnectionsList
				}
			}
			
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(t))
				
				return
			end
			var4(navigateDown(t))
		end,
		hasMore = if fFlagMutualConnectionsListPagination then var8 else nil,
		onLoadMore = if fFlagMutualConnectionsListPagination then var9 else nil
	})
end