local parent = script.Parent.Parent.Parent
local signalsModule = require(parent.Signals)
local fFlagIEMFocusNavPeoplePageToButtons = require(parent.SharedFlags).FFlagIEMFocusNavPeoplePageToButtons
local var1 = nil
local var2, var3 = signalsModule.createSignal(false)

return (function()
	-- upvalues: var1 (write), fFlagIEMFocusNavPeoplePageToButtons (ref), var2 (ref), var3 (ref)
	return {
		register = function(p1)
			-- upvalues: var1 (copy)
			var1 = p1
		end,
		hubRef = function()
			-- upvalues: var1 (copy)
			return if var1 then var1.HubRef else nil
		end,
		pageRef = if fFlagIEMFocusNavPeoplePageToButtons then function()
			-- upvalues: var1 (copy)
			return if var1 then var1.Page else nil
		end else nil,
		showMenuButtonsContainer = var2,
		setShowMenuButtonsContainer = var3
	}
end)()