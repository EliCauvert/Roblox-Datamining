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
	local var4 = useCurrentSquadSelector()
	local var5 = useLocalUserId()
	local var6 = reactModule.useRef(nil)
	local var7 = useLocalization({
		friendJoinedYourPartyText = "Feature.Squads.Label.FriendJoinedYourParty",
		multiplePeopleJoinedYourPartyText = "Feature.Squads.Label.MultiplePeopleJoinedYourParty",
		twoFriendsJoinedYourPartyText = "Feature.Squads.Label.TwoFriendsJoinedYourParty"
	})
	local var8 = useSelector(reactModule.useCallback(function(p0)
		return p0.Squad.UserBlocking.isBlockedByMe
	end, {}))
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var6 (ref), cryoModule (copy), var5 (ref), var8 (ref), guiService (copy), var7 (ref), getStandardSizeAvatarHeadShotRbxthumb (copy), userProfileStore (copy)
		local var9 = if var4 then var4.members else nil
		
		if var6.current and var9 then
			local var10 = cryoModule.List.toSet(cryoModule.List.map(var6.current, function(p1)
				return tostring(p1.userId)
			end))
			local t = {}
			
			for i, v in var9 do
				local var13 = tostring(v.userId)
				
				if not var10[var13] and var13 ~= var5 and not var8[var13] then
					table.insert(t, var13)
				end
			end
			local tCount = #t
			
			if tCount > 0 then
				if tCount > 2 then
					guiService:SendNotification({
						Title = var7.multiplePeopleJoinedYourPartyText,
						Icon = getStandardSizeAvatarHeadShotRbxthumb(t[1])
					})
				else
					userProfileStore.get().fetchNamesByUserIds(t, function(p2)
						-- upvalues: tCount (ref), var7 (copy), getStandardSizeAvatarHeadShotRbxthumb (copy), t (ref), guiService (copy)
						if #p2.data > 0 and p2.status == "success" then
							guiService:SendNotification({
								Title = if tCount == 1 then var7.friendJoinedYourPartyText:gsub("{(.-)}", { combinedName = p2.data[1].names.getCombinedName(false) }) else var7.twoFriendsJoinedYourPartyText:gsub("{(.-)}", {
									combinedName1 = p2.data[1].names.getCombinedName(false),
									combinedName2 = p2.data[2].names.getCombinedName(false)
								}),
								Icon = if tCount == 1 then getStandardSizeAvatarHeadShotRbxthumb(t[1]) else getStandardSizeAvatarHeadShotRbxthumb(t[1])
							})
						end
					end)
				end
			end
		end
		var6.current = var9
	end, { var4 and var4.members })
	
	return nil
end