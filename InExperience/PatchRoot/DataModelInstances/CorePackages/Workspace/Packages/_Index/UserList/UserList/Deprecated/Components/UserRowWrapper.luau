local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
local PresenceType = require(UserList.Rodux.RoduxPresence).Enums.PresenceType
local RODUXKEY = require(UserList.Common.Constants).RODUX_KEY
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local UserPresence = require(Parent.Foundation).Enums.UserPresence
local FFlagUserListPresenceStoreMigrationModule = require(UserList.Flags.FFlagUserListPresenceStoreMigration)
local UseGetPresenceByUserId = if FFlagUserListPresenceStoreMigrationModule then require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local PresenceType1 = if FFlagUserListPresenceStoreMigrationModule then require(Parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
local UserProfileStoreDataFetchFix = game:DefineFastFlag("UserProfileStoreDataFetchFix", false)
local UserRowModule = require(script.Parent.UserRow)

return function(p1) --[[ Line: 34 | Named "UserRowWrapper" ]]
	-- upvalues: ReactModule (copy), UseEffectFunction (copy), UserProfileStore (copy), UserProfileStoreDataFetchFix (copy), FFlagUserListPresenceStoreMigrationModule (copy), UseGetPresenceByUserId (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), RODUXKEY (copy), PresenceType (copy), PresenceType1 (copy), UserPresence (copy), UserRowModule (copy)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 35 ]]
		-- upvalues: p1 (copy)
		p1.onActivated(p1.userId)
	end, { p1.onActivated, p1.userId })
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	UseEffectFunction(function() --[[ Line: 42 ]]
		-- upvalues: UserProfileStore (upval), p1 (copy), UserProfileStoreDataFetchFix (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		UserProfileStore.get().fetchNamesByUserIds({ (tostring(p1.userId)) }, function(p2) --[[ Line: 43 ]]
			-- upvalues: UserProfileStoreDataFetchFix (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
			if UserProfileStoreDataFetchFix then
				local Data = p2.data
				
				if p2.status == "success" and #Data > 0 and Data[1] and Data[1].names then
					local Username = Data[1].names.getUsername(false)
					UseStateResult2((Data[1].names.getCombinedName(false)))
					UseStateResult2_1(Username)
					
					return
				end
			else
				local Data1 = p2.data
				
				if p2.status == "success" then
					local Username = Data1[1].names.getUsername(false)
					UseStateResult2((Data1[1].names.getCombinedName(false)))
					UseStateResult2_1(Username)
				end
			end
		end)
	end, { p1.userId })
	local UseGetPresenceByUserIdResult = if FFlagUserListPresenceStoreMigrationModule then UseGetPresenceByUserId(p1.userId) else UseSelectorFunction(function(p2) --[[ Line: 66 ]]
		-- upvalues: GetDeepValueFunction (upval), RODUXKEY (upval), p1 (copy)
		return GetDeepValueFunction(p2, string.format("%s.Presence.byUserId.%s", RODUXKEY, p1.userId)) or {}
	end)
	local IsUserPresenceTypeMatch = if FFlagUserListPresenceStoreMigrationModule then nil else UseGetPresenceByUserIdResult.userPresenceType == PresenceType.Online or (UseGetPresenceByUserIdResult.userPresenceType == PresenceType.InStudio or UseGetPresenceByUserIdResult.userPresenceType == PresenceType.InGame)
	
	return ReactModule.createElement(UserRowModule, {
		userId = p1.userId,
		userPresence = if FFlagUserListPresenceStoreMigrationModule then ReactModule.useMemo(function() --[[ Line: 79 ]]
			-- upvalues: UseGetPresenceByUserIdResult (copy), PresenceType1 (upval), UserPresence (upval)
			local UserPresenceType = UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.userPresenceType
			local IsUserPresenceTypeMatch: boolean = UserPresenceType == PresenceType1.Online or (UserPresenceType == PresenceType1.InStudio or UserPresenceType == PresenceType1.InGame)
			
			return if IsUserPresenceTypeMatch then UserPresence.Active else UserPresence.None
		end, { UseGetPresenceByUserIdResult }) elseif IsUserPresenceTypeMatch then UserPresence.Active else UserPresence.None,
		displayName = UseStateResult,
		username = UseStateResult1,
		onActivated = UseResult
	})
end