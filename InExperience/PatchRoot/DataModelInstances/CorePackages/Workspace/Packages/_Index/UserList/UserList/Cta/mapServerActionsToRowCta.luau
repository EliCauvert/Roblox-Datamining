local userList = script:FindFirstAncestor("UserList")
local foundationModule = require(userList.Parent.Foundation)
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)
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
		handlerKey = buttonTypes.Chat
	},
	JoinExperience = { buttonType = buttonTypes.Join }
}

local var4 = function() --[[ line: 41 ]] end

local function _(p0, p1) --[[ line: 43 | named "isSupported" ]]
	if not p0 then
		return true
	end
	for i, v in p0 do
		if v == p1 then
			return true
		end
	end
	return false
end

return function(p2, p3, p4, p5) --[[ line: 55 | named "mapServerActionsToRowCta" ]]
	-- upvalues: t (ref), var4 (ref), buttonTypes (ref), iconName (ref)
	if not p2 or not p2.buttons then
		return { primaryCta = nil, secondaryCta = nil }
	end
	local var5 = if p5 then p5.supportedActions else nil
	
	for i, v in p2.buttons do
		local type = t[v.type]
		
		if type then
			local var6
			local type_1 = v.type
			
			if var5 then
				for i_1, v_1 in var5 do
					if v_1 == type_1 then
						var6 = true
					end
				end
				var6 = false
			else
				var6 = true
			end
			if var6 then
				local var7 = if type.handlerKey then p3[type.handlerKey] else nil
				type_1 = {
					type = type.buttonType,
					onActivated = if var7 then function() --[[ line: 74 ]]
						-- upvalues: var7 (ref), p4 (ref)
						var7(p4)
					end else var4,
					isDisabled = type.isDisabled,
					disabledReason = v.disabledReason,
					minWidth = if p5 then p5.primaryCtaMinWidth else nil,
					maxWidth = if p5 then p5.primaryCtaMaxWidth else nil
				}
				local t_1 = nil
				
				if type.supportsDismiss and p5 and p5.showDismissForRequests then
					local dismiss = p3[buttonTypes.Dismiss]
					t_1 = {
						type = buttonTypes.Dismiss,
						icon = iconName.X,
						onActivated = if dismiss then function() --[[ line: 91 ]]
							-- upvalues: dismiss (ref), p4 (ref)
							dismiss(p4)
						end else var4
					}
				end
				return { primaryCta = type_1, secondaryCta = t_1 }
			end
		end
	end
	return { primaryCta = nil, secondaryCta = nil }
end