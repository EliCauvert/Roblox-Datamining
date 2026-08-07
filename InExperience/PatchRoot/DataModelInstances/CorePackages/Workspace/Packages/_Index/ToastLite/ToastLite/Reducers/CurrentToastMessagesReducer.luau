local parent = script:FindFirstAncestor("ToastLite").Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local toastRoduxModule = require(parent.ToastRodux)

local function _(p0, p1) --[[ line: 8 | named "messagesAreEqual" ]]
	return p0.toastTitle == p1.toastTitle and (p0.toastSubtitle == p1.toastSubtitle and p0.toastType == p1.toastType)
end

local _ = function(p2, p3) --[[ line: 14 | named "messageIsAlreadyPresent" ]]
	for i, v in ipairs(p2) do
		if v.toastTitle == p3.toastTitle and (v.toastSubtitle == p3.toastSubtitle and v.toastType == p3.toastType) then
			return true
		end
	end
	return false
end

local var3 = 0

return roduxModule.createReducer({}, {
	[toastRoduxModule.Actions.SetCurrentToastMessage.name] = function(p4, p5) --[[ line: 26 ]]
		-- upvalues: cryoModule (ref), var3 (write)
		local var5
		local var4 = cryoModule.Dictionary.join(p5.toastMessage, { sequenceNumber = var3 })
		var3 += 1
		
		for i, v in ipairs(p4) do
			if v.toastTitle == var4.toastTitle and (v.toastSubtitle == var4.toastSubtitle and v.toastType == var4.toastType) then
				var5 = true
				return if var5 then p4 else cryoModule.List.join(p4, { var4 })
			end
		end
		var5 = false
	end,
	[toastRoduxModule.Actions.RemoveCurrentToastMessage.name] = function(p6, _) --[[ line: 39 ]]
		-- upvalues: cryoModule (ref)
		return if #p6 == 0 then p6 else cryoModule.List.removeIndex(p6, 1)
	end,
	[toastRoduxModule.Actions.RemoveAllToastMessages.name] = function(_, _) --[[ line: 46 ]]
		return {}
	end
})