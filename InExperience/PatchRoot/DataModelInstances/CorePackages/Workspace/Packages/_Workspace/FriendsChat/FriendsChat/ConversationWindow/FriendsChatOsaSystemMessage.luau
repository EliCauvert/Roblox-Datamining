local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local userProfilesModule = require(parent.UserProfiles)
local friendsChatTextMessageModule = require(script.Parent.Parent.Message.FriendsChatTextMessage)
local buildRowDisplayModule = require(script.Parent.Parent.Message.MessageDisplayStore.buildRowDisplay)
local friendsChatOsaAcknowledgementModule = require(script.Parent.FriendsChatOsaAcknowledgement)
local userProfileStore = userProfilesModule.Stores.UserProfileStore

local function getProfileDisplayName(p1, p2)
	if p1 == nil then
		return nil, false
	elseif p1.status == "failed" then
		return nil, true
	end
	local var1 = if p1.data then p1.data[1] else nil
	local var2 = if var1 then var1.names else nil
	
	if var2 == nil then
		return nil, false
	end
	local var3 = if var2.getCombinedName then var2.getCombinedName(p2) else nil
	
	if var3 ~= nil and var3 ~= "" then
		return var3, false
	end
	local var4 = if var2.getDisplayName then var2.getDisplayName(p2) else nil
	
	if var4 == nil or var4 == "" then
		return if var2.getUsername then var2.getUsername(p2) else nil, false
	end
	return var4, false
end

local function buildDisplay(p1, p2, p3, p4)
	-- upvalues: universalAppPolicyModule (ref), buildRowDisplayModule (ref)
	local canSeeChatTerminology = universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology()
	p2 = p2 or p1 == nil
	
	return buildRowDisplayModule({
		kind = "systemMessage",
		variant = "default",
		body = `{p3(if canSeeChatTerminology then if p2 then "Feature.Chat.Heading.SafeChattingWithThisUser" else {
			"Feature.Chat.Heading.SafeChattingWithUsername",
			displayName = p1
		} elseif p2 then "Feature.Chat.Heading.FirstInteractionWithThisPerson" else {
			"Feature.Chat.Heading.FirstInteractionWith",
			displayName = p1
		})}\n{p3(if canSeeChatTerminology then "Feature.Chat.Description.InlineContextCardDescription" else "Feature.Chat.Description.OSAContextCardDescription")}`
	}, {}, { systemTextSize = p4 })
end

return function(p1)
	-- upvalues: reactModule (ref), friendsChatOsaAcknowledgementModule (ref), userProfileStore (ref), getProfileDisplayName (ref), buildDisplay (ref), friendsChatTextMessageModule (ref)
	local var1 = reactModule.useRef(nil)
	friendsChatOsaAcknowledgementModule.useAcknowledgement({
		conversationId = p1.conversationId,
		userId = p1.userId,
		guiObjectRef = var1
	})
	local var2 = reactModule.useMemo(function()
		-- upvalues: userProfileStore (copy), p1 (ref)
		return userProfileStore.get().fetchNamesByUserIds({ p1.userId })
	end, { p1.userId })
	
	return reactModule.createElement(friendsChatTextMessageModule, {
		getDisplayId = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			return `osa-system-message-{p1.conversationId}`
		end, { p1.conversationId }),
		getDisplayFromId = reactModule.useCallback(function(_, p2, p3)
			-- upvalues: getProfileDisplayName (copy), var2 (ref), buildDisplay (copy), p1 (ref)
			local var3, var4 = getProfileDisplayName(var2(p2), p2)
			
			return buildDisplay(var3, var4, if p3 and p3.localize then p3.localize else p1.localize, if p3 then p3.systemTextSize else nil)
		end, { var2, p1.localize }),
		getLayoutOrder = reactModule.useCallback(function()
			return 0
		end, {}),
		chatWindowSettings = p1.chatWindowSettings,
		textTransparency = p1.textTransparency,
		isSpatialUIEnabled = p1.isSpatialUIEnabled,
		localize = p1.localize,
		guiObjectRef = var1
	})
end