local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)

local function _(p1, p2): boolean
	return p1.toastMessage == p2.toastMessage and (p1.toastSubMessage == p2.toastSubMessage and (p1.toastType == p2.toastType and p1.universeId == p2.universeId)) and p1.isLocalized == p2.isLocalized
end

local function messageIsAlreadyPresent(p1, JoinResult): boolean
	local CurrentToastMessage = p1.currentToastMessage
	
	if CurrentToastMessage.toastMessage == JoinResult.toastMessage and (CurrentToastMessage.toastSubMessage == JoinResult.toastSubMessage and (CurrentToastMessage.toastType == JoinResult.toastType and (CurrentToastMessage.universeId == JoinResult.universeId and CurrentToastMessage.isLocalized == JoinResult.isLocalized))) then
		return true
	end
	for _, enqueuedToastMessage in ipairs(p1.enqueuedToastMessages) do
		if enqueuedToastMessage.toastMessage == JoinResult.toastMessage and (enqueuedToastMessage.toastSubMessage == JoinResult.toastSubMessage and (enqueuedToastMessage.toastType == JoinResult.toastType and (enqueuedToastMessage.universeId == JoinResult.universeId and enqueuedToastMessage.isLocalized == JoinResult.isLocalized))) then
			return true
		end
	end
	return false
end

local SequenceNumber = 0

return require(CorePackages.Packages.Rodux).createReducer({ currentToastMessage = nil, enqueuedToastMessages = {} }, {
	[require(Modules.LuaApp.Actions.SetCurrentToastMessage).name] = function(p2, p3)
		-- upvalues: CryoModule (copy), SequenceNumber (ref), messageIsAlreadyPresent (copy)
		local config = { enqueuedToastMessages = {} }
		local JoinResult = CryoModule.Dictionary.join(p3.toastMessage, { sequenceNumber = SequenceNumber })
		SequenceNumber += 1
		
		if not p2.currentToastMessage then
			config.currentToastMessage = JoinResult
			
			return config
		elseif messageIsAlreadyPresent(p2, JoinResult) then
			return p2
		else
			config.currentToastMessage = p2.currentToastMessage
			config.enqueuedToastMessages = CryoModule.List.join(p2.enqueuedToastMessages, { JoinResult })
			
			return config
		end
	end,
	[require(Modules.LuaApp.Actions.RemoveCurrentToastMessage).name] = function(p2, _)
		-- upvalues: CryoModule (copy)
		local config = { enqueuedToastMessages = {} }
		
		if #p2.enqueuedToastMessages > 0 then
			config.currentToastMessage = p2.enqueuedToastMessages[1]
			config.enqueuedToastMessages = CryoModule.List.removeIndex(p2.enqueuedToastMessages, 1)
		end
		return config
	end,
	[require(Modules.LuaApp.Actions.RemoveAllToastMessages).name] = function(_, _)
		return { enqueuedToastMessages = {} }
	end
})