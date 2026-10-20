local Parent = script:FindFirstAncestor("ToastLite").Parent
local CryoModule = require(Parent.Cryo)
local ToastRoduxModule = require(Parent.ToastRodux)

local function _(p1, p2): boolean
	return p1.toastTitle == p2.toastTitle and p1.toastSubtitle == p2.toastSubtitle and p1.toastType == p2.toastType
end

local _ = function(List, p1): boolean
	for _, value in ipairs(List) do
		if value.toastTitle == p1.toastTitle and (value.toastSubtitle == p1.toastSubtitle and value.toastType == p1.toastType) then
			return true
		end
	end
	return false
end

local SequenceNumber = 0

return require(Parent.Rodux).createReducer({}, {
	[ToastRoduxModule.Actions.SetCurrentToastMessage.name] = function(List, p2)
		-- upvalues: CryoModule (copy), SequenceNumber (ref)
		local JoinResult = CryoModule.Dictionary.join(p2.toastMessage, { sequenceNumber = SequenceNumber })
		SequenceNumber += 1
		local Flag = false
		
		for _, value in ipairs(List) do
			if value.toastTitle == JoinResult.toastTitle and (value.toastSubtitle == JoinResult.toastSubtitle and value.toastType == JoinResult.toastType) then
				Flag = true
				break
			end
		end
		return if Flag then List else CryoModule.List.join(List, { JoinResult })
	end,
	[ToastRoduxModule.Actions.RemoveCurrentToastMessage.name] = function(p3, _)
		-- upvalues: CryoModule (copy)
		return if #p3 == 0 then p3 else CryoModule.List.removeIndex(p3, 1)
	end,
	[ToastRoduxModule.Actions.RemoveAllToastMessages.name] = function(_, _)
		return {}
	end
})