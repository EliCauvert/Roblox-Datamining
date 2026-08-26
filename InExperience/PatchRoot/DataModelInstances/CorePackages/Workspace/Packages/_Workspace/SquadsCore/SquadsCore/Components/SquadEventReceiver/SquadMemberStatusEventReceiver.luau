local parent = script:FindFirstAncestor("SquadsCore").Parent
local guiService = game:GetService("GuiService")
local cryoModule = require(parent.Cryo)
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local reactModule = require(parent.React)
local roduxSquadsModule = require(parent.RoduxSquads)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local userProfileStore = require(parent.UserProfiles).Stores.UserProfileStore
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useCurrentSquadSelector = roduxSquadsModule.Hooks.useCurrentSquadSelector

return function()
	-- upvalues: useCurrentSquadSelector (ref), useLocalUserId (ref), reactModule (ref), useLocalization (ref), useSelector (ref), cryoModule (ref), guiService (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), userProfileStore (ref)
	local var1 = useCurrentSquadSelector()
	local var2 = useLocalUserId()
	local var3 = reactModule.useRef(nil)
	local var4 = useLocalization({
		friendJoinedYourPartyText = "Feature.Squads.Label.FriendJoinedYourParty",
		multiplePeopleJoinedYourPartyText = "Feature.Squads.Label.MultiplePeopleJoinedYourParty",
		twoFriendsJoinedYourPartyText = "Feature.Squads.Label.TwoFriendsJoinedYourParty"
	})
	local var5 = useSelector(reactModule.useCallback(function(p1)
		return p1.Squad.UserBlocking.isBlockedByMe
	end, {}))
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref), cryoModule (copy), var2 (ref), var5 (ref), guiService (copy), var4 (ref), getStandardSizeAvatarHeadShotRbxthumb (copy), userProfileStore (copy)
		local var6 = if var1 then var1.members else nil
		
		if var3.current and var6 then
			local var7 = cryoModule.List.toSet(cryoModule.List.map(var3.current, function(p1)
				return tostring(p1.userId)
			end))
			local t = {}
			
			for i, v in var6 do
				local var8 = tostring(v.userId)
				
				if not var7[var8] and var8 ~= var2 and not var5[var8] then
					table.insert(t, var8)
				end
			end
			local tCount = #t
			
			if tCount > 0 then
				if tCount > 2 then
					guiService:SendNotification({
						Title = var4.multiplePeopleJoinedYourPartyText,
						Icon = getStandardSizeAvatarHeadShotRbxthumb(t[1])
					})
				else
					userProfileStore.get().fetchNamesByUserIds(t, function(p1)
						-- upvalues: tCount (ref), var4 (copy), getStandardSizeAvatarHeadShotRbxthumb (copy), t (ref), guiService (copy)
						if #p1.data > 0 and p1.status == "success" then
							guiService:SendNotification({
								Title = if tCount == 1 then var4.friendJoinedYourPartyText:gsub("{(.-)}", { combinedName = p1.data[1].names.getCombinedName(false) }) else var4.twoFriendsJoinedYourPartyText:gsub("{(.-)}", {
									combinedName1 = p1.data[1].names.getCombinedName(false),
									combinedName2 = p1.data[2].names.getCombinedName(false)
								}),
								Icon = if tCount == 1 then getStandardSizeAvatarHeadShotRbxthumb(t[1]) else getStandardSizeAvatarHeadShotRbxthumb(t[1])
							})
						end
					end)
				end
			end
		end
		var3.current = var6
	end, { var1 and var1.members })
	
	return nil
end