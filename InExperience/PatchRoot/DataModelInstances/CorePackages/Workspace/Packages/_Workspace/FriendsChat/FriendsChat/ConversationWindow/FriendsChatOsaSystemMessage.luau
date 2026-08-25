local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local userProfilesModule = require(parent.UserProfiles)
local friendsChatTextMessageModule = require(script.Parent.Parent.Message.FriendsChatTextMessage)
local buildRowDisplayModule = require(script.Parent.Parent.Message.MessageDisplayStore.buildRowDisplay)
local friendsChatOsaAcknowledgementModule = require(script.Parent.FriendsChatOsaAcknowledgement)
local userProfileStore = userProfilesModule.Stores.UserProfileStore

local function getProfileDisplayName(p0, p1)
	if p0 == nil then
		return nil, false
	elseif p0.status == "failed" then
		return nil, true
	end
	local var8 = if p0.data then p0.data[1] else nil
	local var9 = if var8 then var8.names else nil
	
	if var9 == nil then
		return nil, false
	end
	local var10 = if var9.getCombinedName then var9.getCombinedName(p1) else nil
	
	if var10 ~= nil and var10 ~= "" then
		return var10, false
	end
	local var11 = if var9.getDisplayName then var9.getDisplayName(p1) else nil
	
	if var11 == nil or var11 == "" then
		return if var9.getUsername then var9.getUsername(p1) else nil, false
	end
	return var11, false
end

local function buildDisplay(p2, p3, p4, p5)
	-- upvalues: universalAppPolicyModule (ref), buildRowDisplayModule (ref)
	local canSeeChatTerminology = universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology()
	p3 = p3 or p2 == nil
	
	return buildRowDisplayModule({
		kind = "systemMessage",
		variant = "default",
		body = `{p4(if canSeeChatTerminology then if p3 then "Feature.Chat.Heading.SafeChattingWithThisUser" else {
			"Feature.Chat.Heading.SafeChattingWithUsername",
			displayName = p2
		} elseif p3 then "Feature.Chat.Heading.FirstInteractionWithThisPerson" else {
			"Feature.Chat.Heading.FirstInteractionWith",
			displayName = p2
		})}\n{p4(if canSeeChatTerminology then "Feature.Chat.Description.InlineContextCardDescription" else "Feature.Chat.Description.OSAContextCardDescription")}`
	}, {}, { systemTextSize = p5 })
end

return function(p6)
	-- upvalues: reactModule (ref), friendsChatOsaAcknowledgementModule (ref), userProfileStore (ref), getProfileDisplayName (ref), buildDisplay (ref), friendsChatTextMessageModule (ref)
	local var14 = reactModule.useRef(nil)
	friendsChatOsaAcknowledgementModule.useAcknowledgement({
		conversationId = p6.conversationId,
		userId = p6.userId,
		guiObjectRef = var14
	})
	local var15 = reactModule.useMemo(function()
		-- upvalues: userProfileStore (copy), p6 (ref)
		return userProfileStore.get().fetchNamesByUserIds({ p6.userId })
	end, { p6.userId })
	
	return reactModule.createElement(friendsChatTextMessageModule, {
		getDisplayId = reactModule.useCallback(function()
			-- upvalues: p6 (ref)
			return `osa-system-message-{p6.conversationId}`
		end, { p6.conversationId }),
		getDisplayFromId = reactModule.useCallback(function(_, p7, p8)
			-- upvalues: getProfileDisplayName (copy), var15 (ref), buildDisplay (copy), p6 (ref)
			local var16, var17 = getProfileDisplayName(var15(p7), p7)
			
			return buildDisplay(var16, var17, if p8 and p8.localize then p8.localize else p6.localize, if p8 then p8.systemTextSize else nil)
		end, { var15, p6.localize }),
		getLayoutOrder = reactModule.useCallback(function()
			return 0
		end, {}),
		chatWindowSettings = p6.chatWindowSettings,
		textTransparency = p6.textTransparency,
		isSpatialUIEnabled = p6.isSpatialUIEnabled,
		localize = p6.localize,
		guiObjectRef = var14
	})
end