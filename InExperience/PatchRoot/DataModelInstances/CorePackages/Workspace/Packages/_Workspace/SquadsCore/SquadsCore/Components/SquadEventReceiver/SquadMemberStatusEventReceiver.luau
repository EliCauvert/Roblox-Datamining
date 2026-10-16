local Parent = script:FindFirstAncestor("SquadsCore").Parent
local GuiService = game:GetService("GuiService")
local CryoModule = require(Parent.Cryo)
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseCurrentSquadSelectorFunction = require(Parent.RoduxSquads).Hooks.useCurrentSquadSelector

return function() --[[ Line: 18 ]]
	-- upvalues: UseCurrentSquadSelectorFunction (copy), UseLocalUserIdFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), CryoModule (copy), GuiService (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), UserProfileStore (copy)
	local UseCurrentSquadSelectorResult = UseCurrentSquadSelectorFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		friendJoinedYourPartyText = "Feature.Squads.Label.FriendJoinedYourParty",
		multiplePeopleJoinedYourPartyText = "Feature.Squads.Label.MultiplePeopleJoinedYourParty",
		twoFriendsJoinedYourPartyText = "Feature.Squads.Label.TwoFriendsJoinedYourParty"
	})
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p1) --[[ Line: 29 ]]
		return p1.Squad.UserBlocking.isBlockedByMe
	end, {})))
	ReactModule.useEffect(function() --[[ Line: 34 ]]
		-- upvalues: UseCurrentSquadSelectorResult (copy), UseRefResult (copy), CryoModule (upval), UseLocalUserIdResult (copy), UseSelectorResult (copy), GuiService (upval), UseLocalizationResult (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (upval), UserProfileStore (upval)
		local Members = if UseCurrentSquadSelectorResult then UseCurrentSquadSelectorResult.members else nil
		
		if UseRefResult.current and Members then
			local Set = CryoModule.List.toSet(CryoModule.List.map(UseRefResult.current, function(p1): string --[[ Line: 39 ]]
				return (tostring(p1.userId))
			end))
			local List = {}
			
			for _, member in Members do
				local Text = tostring(member.userId)
				
				if not Set[Text] and Text ~= UseLocalUserIdResult and not UseSelectorResult[Text] then
					table.insert(List, Text)
				end
			end
			local CountList = #List
			
			if CountList > 0 then
				if CountList > 2 then
					GuiService:SendNotification({
						Title = UseLocalizationResult.multiplePeopleJoinedYourPartyText,
						Icon = GetStandardSizeAvatarHeadShotRbxthumbFunction(List[1])
					})
				else
					UserProfileStore.get().fetchNamesByUserIds(List, function(p1) --[[ Line: 63 ]]
						-- upvalues: CountList (copy), UseLocalizationResult (upval), GetStandardSizeAvatarHeadShotRbxthumbFunction (upval), List (copy), GuiService (upval)
						if #p1.data > 0 and p1.status == "success" then
							GuiService:SendNotification({
								Title = if CountList == 1 then UseLocalizationResult.friendJoinedYourPartyText:gsub("{(.-)}", { combinedName = p1.data[1].names.getCombinedName(false) }) else UseLocalizationResult.twoFriendsJoinedYourPartyText:gsub("{(.-)}", {
									combinedName1 = p1.data[1].names.getCombinedName(false),
									combinedName2 = p1.data[2].names.getCombinedName(false)
								}),
								Icon = if CountList == 1 then GetStandardSizeAvatarHeadShotRbxthumbFunction(List[1]) else GetStandardSizeAvatarHeadShotRbxthumbFunction(List[1])
							})
						end
					end)
				end
			end
		end
		UseRefResult.current = Members
	end, {
		UseCurrentSquadSelectorResult and UseCurrentSquadSelectorResult.members
	})
	
	return nil
end