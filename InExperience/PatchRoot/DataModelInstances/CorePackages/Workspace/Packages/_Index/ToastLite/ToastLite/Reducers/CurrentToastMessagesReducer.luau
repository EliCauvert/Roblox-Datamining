local parent = script:FindFirstAncestor("ToastLite").Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local toastRoduxModule = require(parent.ToastRodux)

local function _(p1, p2)
	return p1.toastTitle == p2.toastTitle and (p1.toastSubtitle == p2.toastSubtitle and p1.toastType == p2.toastType)
end

local _ = function(p1, p2)
	for i, v in ipairs(p1) do
		if v.toastTitle == p2.toastTitle and (v.toastSubtitle == p2.toastSubtitle and v.toastType == p2.toastType) then
			return true
		end
	end
	return false
end

local var1 = 0

return roduxModule.createReducer({}, {
	[toastRoduxModule.Actions.SetCurrentToastMessage.name] = function(p3, p4)
		-- upvalues: cryoModule (ref), var1 (write)
		local var2
		local var3 = cryoModule.Dictionary.join(p4.toastMessage, { sequenceNumber = var1 })
		var1 += 1
		
		for i, v in ipairs(p3) do
			if v.toastTitle == var3.toastTitle and (v.toastSubtitle == var3.toastSubtitle and v.toastType == var3.toastType) then
				var2 = true
				return if var2 then p3 else cryoModule.List.join(p3, { var3 })
			end
		end
		var2 = false
	end,
	[toastRoduxModule.Actions.RemoveCurrentToastMessage.name] = function(p5, _)
		-- upvalues: cryoModule (ref)
		return if #p5 == 0 then p5 else cryoModule.List.removeIndex(p5, 1)
	end,
	[toastRoduxModule.Actions.RemoveAllToastMessages.name] = function(_, _)
		return {}
	end
})