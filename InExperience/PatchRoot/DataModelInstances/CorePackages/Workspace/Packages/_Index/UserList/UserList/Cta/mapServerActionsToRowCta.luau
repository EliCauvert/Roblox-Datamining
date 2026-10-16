local UserList = script:FindFirstAncestor("UserList")
local FoundationModule = require(UserList.Parent.Foundation)
local _ = require(UserList.Common.Types)
local FFlagUserListChatCtaStandardVariantModule = require(UserList.Flags.FFlagUserListChatCtaStandardVariant)
local FFlagUserListCanonicalCtaAnalyticsModule = require(UserList.Flags.FFlagUserListCanonicalCtaAnalytics)
local IconName = FoundationModule.Enums.IconName
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonTypes = require(UserList.Common.Enums).ButtonTypes
local config = {
	AddFriend = {
		buttonType = ButtonTypes.Add,
		handlerKey = ButtonTypes.Add
	},
	AcceptFriendRequest = {
		supportsDismiss = true,
		buttonType = ButtonTypes.Accept,
		handlerKey = ButtonTypes.Accept
	},
	PendingFriendRequest = { isDisabled = true, buttonType = ButtonTypes.Pending },
	CannotAddFriend = { isDisabled = true, buttonType = ButtonTypes.Add },
	Chat = {
		buttonType = ButtonTypes.Chat,
		handlerKey = ButtonTypes.Chat,
		variant = if FFlagUserListChatCtaStandardVariantModule then ButtonVariant.Standard else nil
	},
	JoinExperience = { buttonType = ButtonTypes.Join }
}

local function v9() --[[ Line: 52 ]] end

local function _(List, p1): boolean --[[ Line: 54 | Named "isSupported" ]]
	if not List then
		return true
	end
	for _, value in List do
		if value == p1 then
			return true
		end
	end
	return false
end

return function(p2, p3, p4, p5, p6) --[[ Line: 66 | Named "mapServerActionsToRowCta" ]]
	-- upvalues: config (copy), FFlagUserListCanonicalCtaAnalyticsModule (copy), v9 (copy), FFlagUserListChatCtaStandardVariantModule (copy), ButtonTypes (copy), IconName (copy)
	if not p2 or not p2.buttons then
		return { primaryCta = nil, secondaryCta = nil }
	end
	local SupportedActions = if p5 then p5.supportedActions else nil
	local Entry = nil
	local Flag = nil
	for _, button in p2.buttons do
		Entry = config[button.type]
		
		if Entry then
			local Type = button.type
			
			if SupportedActions then
				Flag = false
				
				for _, supportedAction in SupportedActions do
					if supportedAction == Type then
						Flag = true
						break
					end
				end
			else
				Flag = true
			end
			if Flag then
				local Callback = if Entry.handlerKey then p3[Entry.handlerKey] else nil
				local PrimaryCta = {
					type = Entry.buttonType,
					onActivated = if Callback then function() --[[ Line: 86 ]]
						-- upvalues: Callback (copy), p4 (copy), FFlagUserListCanonicalCtaAnalyticsModule (upval), p6 (copy)
						Callback(p4, if FFlagUserListCanonicalCtaAnalyticsModule then p6 else nil)
					end else v9,
					isDisabled = Entry.isDisabled,
					disabledReason = button.disabledReason,
					variant = if FFlagUserListChatCtaStandardVariantModule then Entry.variant else nil,
					minWidth = if p5 then p5.primaryCtaMinWidth else nil,
					maxWidth = if p5 then p5.primaryCtaMaxWidth else nil
				}
				local SecondaryCta = nil
				
				if Entry.supportsDismiss and p5 and p5.showDismissForRequests then
					local Callback1 = p3[ButtonTypes.Dismiss]
					SecondaryCta = {
						type = ButtonTypes.Dismiss,
						icon = IconName.X,
						onActivated = if Callback1 then function() --[[ Line: 104 ]]
							-- upvalues: Callback1 (copy), p4 (copy), FFlagUserListCanonicalCtaAnalyticsModule (upval), p6 (copy)
							Callback1(p4, if FFlagUserListCanonicalCtaAnalyticsModule then p6 else nil)
						end else v9
					}
				end
				return { primaryCta = PrimaryCta, secondaryCta = SecondaryCta }
			end
		end
	end
	return { primaryCta = nil, secondaryCta = nil }
end