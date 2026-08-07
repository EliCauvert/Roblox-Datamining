local parent = script.Parent.Parent.Parent
local signalsModule = require(parent.Signals)
local fFlagIEMFocusNavPeoplePageToButtons = require(parent.SharedFlags).FFlagIEMFocusNavPeoplePageToButtons
local var1 = nil
local var2, var3 = signalsModule.createSignal(false)

return (function() --[[ line: 14 | named "createSettingsHubService" ]]
	-- upvalues: var1 (write), fFlagIEMFocusNavPeoplePageToButtons (ref), var2 (ref), var3 (ref)
	return {
		register = function(p0) --[[ line: 17 ]]
			-- upvalues: var1 (copy)
			var1 = p0
		end,
		hubRef = function() --[[ line: 22 ]]
			-- upvalues: var1 (copy)
			return if var1 then var1.HubRef else nil
		end,
		pageRef = if fFlagIEMFocusNavPeoplePageToButtons then function() --[[ line: 26 ]]
			-- upvalues: var1 (copy)
			return if var1 then var1.Page else nil
		end else nil,
		showMenuButtonsContainer = var2,
		setShowMenuButtonsContainer = var3
	}
end)()