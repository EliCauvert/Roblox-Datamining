local userList = script:FindFirstAncestor("UserList")
local foundationModule = require(userList.Parent.Foundation)
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)
local fFlagUserListChatCtaStandardVariantModule = require(userList.Flags.FFlagUserListChatCtaStandardVariant)
local iconName = foundationModule.Enums.IconName
local buttonTypes = enumsModule.ButtonTypes
local t = {
	AddFriend = {
		buttonType = buttonTypes.Add,
		handlerKey = buttonTypes.Add
	},
	AcceptFriendRequest = {
		supportsDismiss = true,
		buttonType = buttonTypes.Accept,
		handlerKey = buttonTypes.Accept
	},
	PendingFriendRequest = { isDisabled = true, buttonType = buttonTypes.Pending },
	CannotAddFriend = { isDisabled = true, buttonType = buttonTypes.Add },
	Chat = {
		buttonType = buttonTypes.Chat,
		handlerKey = buttonTypes.Chat,
		variant = if fFlagUserListChatCtaStandardVariantModule then foundationModule.Enums.ButtonVariant.Standard else nil
	},
	JoinExperience = { buttonType = buttonTypes.Join }
}

local var1 = function() end

local function _(p1, p2)
	if not p1 then
		return true
	end
	for i, v in p1 do
		if v == p2 then
			return true
		end
	end
	return false
end

return function(p3, p4, p5, p6)
	-- upvalues: t (ref), var1 (ref), fFlagUserListChatCtaStandardVariantModule (ref), buttonTypes (ref), iconName (ref)
	if not p3 or not p3.buttons then
		return { primaryCta = nil, secondaryCta = nil }
	end
	local var2 = if p6 then p6.supportedActions else nil
	
	for i, v in p3.buttons do
		local type = t[v.type]
		
		if type then
			local var3
			local type_1 = v.type
			
			if var2 then
				for i_1, v_1 in var2 do
					if v_1 == type_1 then
						var3 = true
					end
				end
				var3 = false
			else
				var3 = true
			end
			if var3 then
				local var4 = if type.handlerKey then p4[type.handlerKey] else nil
				type_1 = {
					type = type.buttonType,
					onActivated = if var4 then function()
						-- upvalues: var4 (ref), p5 (ref)
						var4(p5)
					end else var1,
					isDisabled = type.isDisabled,
					disabledReason = v.disabledReason,
					variant = if fFlagUserListChatCtaStandardVariantModule then type.variant else nil,
					minWidth = if p6 then p6.primaryCtaMinWidth else nil,
					maxWidth = if p6 then p6.primaryCtaMaxWidth else nil
				}
				local t_1 = nil
				
				if type.supportsDismiss and p6 and p6.showDismissForRequests then
					local dismiss = p4[buttonTypes.Dismiss]
					t_1 = {
						type = buttonTypes.Dismiss,
						icon = iconName.X,
						onActivated = if dismiss then function()
							-- upvalues: dismiss (ref), p5 (ref)
							dismiss(p5)
						end else var1
					}
				end
				return { primaryCta = type_1, secondaryCta = t_1 }
			end
		end
	end
	return { primaryCta = nil, secondaryCta = nil }
end