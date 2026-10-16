local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local FriendsChatTextMessageModule = require(script.Parent.Parent.Message.FriendsChatTextMessage)
local BuildRowDisplayModule = require(script.Parent.Parent.Message.MessageDisplayStore.buildRowDisplay)
local FriendsChatOsaAcknowledgementModule = require(script.Parent.FriendsChatOsaAcknowledgement)
local FFlagFriendsChatDiscloseUpdateSecondVersion = require(Parent.SharedFlags).FFlagFriendsChatDiscloseUpdateSecondVersion
local UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore

local function getProfileDisplayName(p1, p2) --[[ Line: 26 ]]
	if p1 == nil then
		return nil, false
	elseif p1.status == "failed" then
		return nil, true
	else
		local Entry = if p1.data then p1.data[1] else nil
		local Names = if Entry then Entry.names else nil
		
		if Names == nil then
			return nil, false
		end
		local CombinedName = if Names.getCombinedName then Names.getCombinedName(p2) else nil
		
		if CombinedName ~= nil and CombinedName ~= "" then
			return CombinedName, false
		end
		local DisplayName = if Names.getDisplayName then Names.getDisplayName(p2) else nil
		
		if DisplayName == nil or DisplayName == "" then
			return if Names.getUsername then Names.getUsername(p2) else nil, false
		else
			return DisplayName, false
		end
	end
end

local function buildDisplay(DisplayName, p1, Callback, SystemTextSize) --[[ Line: 52 ]]
	-- upvalues: UniversalAppPolicyModule (copy), FFlagFriendsChatDiscloseUpdateSecondVersion (copy), BuildRowDisplayModule (copy)
	local CanSeeChatTerminology = UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology()
	local P3 = p1 or DisplayName == nil
	
	return BuildRowDisplayModule({
		kind = "systemMessage",
		variant = "default",
		body = `{Callback(if CanSeeChatTerminology then if P3 then if FFlagFriendsChatDiscloseUpdateSecondVersion then "Feature.Chat.Heading.FirstConversationWithThisUser" else "Feature.Chat.Heading.SafeChattingWithThisUser" elseif FFlagFriendsChatDiscloseUpdateSecondVersion then {
			"Feature.Chat.Heading.FirstConversationWith",
			displayName = DisplayName
		} else {
			"Feature.Chat.Heading.SafeChattingWithUsername",
			displayName = DisplayName
		} elseif P3 then "Feature.Chat.Heading.FirstInteractionWithThisPerson" else {
			"Feature.Chat.Heading.FirstInteractionWith",
			displayName = DisplayName
		})}\n{Callback(if CanSeeChatTerminology then "Feature.Chat.Description.InlineContextCardDescription" else "Feature.Chat.Description.OSAContextCardDescription")}`
	}, {}, { systemTextSize = SystemTextSize })
end

return function(p1) --[[ Line: 83 | Named "FriendsChatOsaSystemMessage" ]]
	-- upvalues: ReactModule (copy), FriendsChatOsaAcknowledgementModule (copy), UserProfileStore (copy), getProfileDisplayName (copy), buildDisplay (copy), FriendsChatTextMessageModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	FriendsChatOsaAcknowledgementModule.useAcknowledgement({
		conversationId = p1.conversationId,
		userId = p1.userId,
		guiObjectRef = UseRefResult
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 91 ]]
		-- upvalues: UserProfileStore (upval), p1 (copy)
		return UserProfileStore.get().fetchNamesByUserIds({ p1.userId })
	end, { p1.userId })
	
	return ReactModule.createElement(FriendsChatTextMessageModule, {
		getDisplayId = ReactModule.useCallback(function(): string --[[ Line: 94 ]]
			-- upvalues: p1 (copy)
			return `osa-system-message-{p1.conversationId}`
		end, { p1.conversationId }),
		getDisplayFromId = ReactModule.useCallback(function(_, p2, p3) --[[ Line: 100 ]]
			-- upvalues: getProfileDisplayName (upval), UseMemoResult (copy), buildDisplay (upval), p1 (copy)
			local ProfileDisplayName, ProfileDisplayName2 = getProfileDisplayName(UseMemoResult(p2), p2)
			
			return buildDisplay(ProfileDisplayName, ProfileDisplayName2, if p3 and p3.localize then p3.localize else p1.localize, if p3 then p3.systemTextSize else nil)
		end, { UseMemoResult, p1.localize }),
		getLayoutOrder = ReactModule.useCallback(function(): number --[[ Line: 97 ]]
			return 0
		end, {}),
		chatWindowSettings = p1.chatWindowSettings,
		textTransparency = p1.textTransparency,
		isSpatialUIEnabled = p1.isSpatialUIEnabled,
		localize = p1.localize,
		guiObjectRef = UseRefResult
	})
end