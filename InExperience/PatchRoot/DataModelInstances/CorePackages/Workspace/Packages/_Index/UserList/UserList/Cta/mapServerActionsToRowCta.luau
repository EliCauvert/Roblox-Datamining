local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local FoundationModule = require(Parent.Foundation)
local EnumsModule = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)
local FFlagUserListCanonicalCtaAnalyticsModule = require(UserList.Flags.FFlagUserListCanonicalCtaAnalytics)
local FFlagUserListActionsV2 = require(Parent.SharedFlags).FFlagUserListActionsV2
local FFlagUserListHideNotJoinableJoin = require(Parent.SharedFlags).FFlagUserListHideNotJoinableJoin
local IconName = FoundationModule.Enums.IconName
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonTypes = EnumsModule.ButtonTypes
local Joinability = EnumsModule.Joinability
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
		variant = ButtonVariant.Standard
	},
	JoinExperience = { buttonType = ButtonTypes.Join }
}

local function v13() end

local function _(List, p1): boolean
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

local _ = function(p2, p3): boolean
	-- upvalues: ButtonTypes (copy), Joinability (copy)
	return not p3 or not p3.enableJoinabilityCheck or p2.type ~= ButtonTypes.JoinExperience or p2.joinability ~= Joinability.NotJoinable
end

return function(p2, p3, p4, p5, p6)
	-- upvalues: config (copy), FFlagUserListHideNotJoinableJoin (copy), ButtonTypes (copy), Joinability (copy), FFlagUserListCanonicalCtaAnalyticsModule (copy), v13 (copy), FFlagUserListActionsV2 (copy), IconName (copy)
	if not p2 or not p2.buttons then
		return { primaryCta = nil, secondaryCta = nil }
	end
	local SupportedActions = if p5 then p5.supportedActions else nil
	local Entry = nil
	local Flag = nil
	for _, button in p2.buttons do
		Entry = config[button.type]
		
		if (not FFlagUserListHideNotJoinableJoin or (not p5 or not p5.enableJoinabilityCheck or button.type ~= ButtonTypes.JoinExperience or button.joinability ~= Joinability.NotJoinable)) and Entry then
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
					onActivated = if Callback then function()
						-- upvalues: Callback (copy), p4 (copy), FFlagUserListCanonicalCtaAnalyticsModule (upval), p6 (copy)
						Callback(p4, if FFlagUserListCanonicalCtaAnalyticsModule then p6 else nil)
					end else v13,
					isDisabled = if FFlagUserListActionsV2 then if Entry.isDisabled or button.disabledReason ~= nil then true else nil else Entry.isDisabled,
					disabledReason = button.disabledReason,
					variant = Entry.variant,
					minWidth = if p5 then p5.primaryCtaMinWidth else nil,
					maxWidth = if p5 then p5.primaryCtaMaxWidth else nil
				}
				local SecondaryCta = nil
				
				if Entry.supportsDismiss and p5 and p5.showDismissForRequests then
					local Callback1 = p3[ButtonTypes.Dismiss]
					SecondaryCta = {
						type = ButtonTypes.Dismiss,
						icon = IconName.X,
						onActivated = if Callback1 then function()
							-- upvalues: Callback1 (copy), p4 (copy), FFlagUserListCanonicalCtaAnalyticsModule (upval), p6 (copy)
							Callback1(p4, if FFlagUserListCanonicalCtaAnalyticsModule then p6 else nil)
						end else v13
					}
				end
				return { primaryCta = PrimaryCta, secondaryCta = SecondaryCta }
			end
		end
	end
	return { primaryCta = nil, secondaryCta = nil }
end