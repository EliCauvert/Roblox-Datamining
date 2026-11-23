local _ = require(script:FindFirstAncestor("UserList").Common.Types)
local ClientCtaRegistryModule = require(script.Parent.ClientCtaRegistry)

return function(p1, p2, p3, p4, p5)
	-- upvalues: ClientCtaRegistryModule (copy)
	local ClientActions = if p4 then p4.clientActions else nil
	
	if not ClientActions or p3 then
		return nil
	end
	local ClientCtaRegistryModuleEntry = nil
	local Callback = nil
	for _, clientAction in ClientActions do
		ClientCtaRegistryModuleEntry = ClientCtaRegistryModule[clientAction]
		Callback = if ClientCtaRegistryModuleEntry and ClientCtaRegistryModuleEntry.handlerKey then p1[ClientCtaRegistryModuleEntry.handlerKey] else nil
		
		if ClientCtaRegistryModuleEntry and Callback then
			return {
				secondaryCta = nil,
				primaryCta = {
					type = ClientCtaRegistryModuleEntry.buttonType,
					onActivated = function()
						-- upvalues: Callback (copy), p2 (copy), p5 (copy)
						Callback(p2, p5)
					end,
					variant = ClientCtaRegistryModuleEntry.variant,
					minWidth = if p4 then p4.primaryCtaMinWidth else nil,
					maxWidth = if p4 then p4.primaryCtaMaxWidth else nil
				}
			}
		end
	end
	return nil
end