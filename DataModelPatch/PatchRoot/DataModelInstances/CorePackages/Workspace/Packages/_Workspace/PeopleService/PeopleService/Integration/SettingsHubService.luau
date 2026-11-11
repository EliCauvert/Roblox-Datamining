local Parent = script.Parent.Parent.Parent
local FFlagIEMFocusNavPeoplePageToButtons = require(Parent.SharedFlags).FFlagIEMFocusNavPeoplePageToButtons
local v1 = nil
local Signal, Signal2 = require(Parent.Signals).createSignal(false)

return ((function()
	-- upvalues: v1 (ref), FFlagIEMFocusNavPeoplePageToButtons (copy), Signal (copy), Signal2 (copy)
	return {
		register = function(p1)
			-- upvalues: v1 (upval)
			v1 = p1
		end,
		hubRef = function()
			-- upvalues: v1 (upval)
			return v1 and v1.HubRef or nil
		end,
		pageRef = if FFlagIEMFocusNavPeoplePageToButtons then function()
			-- upvalues: v1 (upval)
			return v1 and v1.Page or nil
		end else nil,
		showMenuButtonsContainer = Signal,
		setShowMenuButtonsContainer = Signal2
	}
end)())