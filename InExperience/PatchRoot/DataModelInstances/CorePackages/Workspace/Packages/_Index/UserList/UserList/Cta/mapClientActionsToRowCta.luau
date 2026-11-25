local UserList = script:FindFirstAncestor("UserList")
local EnumsModule = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)
local ButtonTypes = EnumsModule.ButtonTypes
local config = {
	[EnumsModule.ClientCtaActions.ViewProfile] = {
		buttonType = ButtonTypes.View,
		handlerKey = ButtonTypes.View,
		variant = require(UserList.Parent.Foundation).Enums.ButtonVariant.Standard
	}
}

return function(p1, p2, p3, p4, p5)
	-- upvalues: config (copy)
	local ClientActions = if p4 then p4.clientActions else nil
	
	if not ClientActions or p3 then
		return nil
	end
	local Entry = nil
	local Callback = nil
	for _, clientAction in ClientActions do
		Entry = config[clientAction]
		Callback = if Entry then p1[Entry.handlerKey] else nil
		
		if Entry and Callback then
			return {
				secondaryCta = nil,
				primaryCta = {
					type = Entry.buttonType,
					onActivated = function()
						-- upvalues: Callback (copy), p2 (copy), p5 (copy)
						Callback(p2, p5)
					end,
					variant = Entry.variant,
					minWidth = if p4 then p4.primaryCtaMinWidth else nil,
					maxWidth = if p4 then p4.primaryCtaMaxWidth else nil
				}
			}
		end
	end
	return nil
end