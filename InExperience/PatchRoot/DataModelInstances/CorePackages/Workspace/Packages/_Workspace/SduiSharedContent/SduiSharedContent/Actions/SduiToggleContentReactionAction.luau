local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local PromiseModule = require(Parent.Promise)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetSduiContentReactionVerticalRegistryModule = require(SduiSharedContent.Actions.getSduiContentReactionVerticalRegistry)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetStringParamFunction = SduiCoreSystemModule.SduiActionParams.getStringParam
local list = { "entityId", "vertical", "emoteId" }

local function rejectInvalidParams(p1, Message, PropName)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), PromiseModule (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.ToggleContentReaction,
		message = Message,
		propName = PropName
	}, p1.appPage)
	
	return PromiseModule.reject(Message)
end

return function(p1, _, p2, _)
	-- upvalues: rejectInvalidParams (copy), list (copy), GetStringParamFunction (copy), GetSduiContentReactionVerticalRegistryModule (copy), PromiseModule (copy), SduiErrorType (copy), SduiActionType (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		return rejectInvalidParams(p2, "Missing actionParams", nil)
	end
	for _, value in list do
		local StringParam = GetStringParamFunction(ActionParams, value)
		
		if StringParam == nil or StringParam == "" then
			return rejectInvalidParams(p2, `Missing actionParam: {value}`, value)
		end
	end
	local ShouldAdd = ActionParams.shouldAdd
	
	if typeof(ShouldAdd) == "boolean" then
		local Vertical = ActionParams.vertical
		local Vertical1 = GetSduiContentReactionVerticalRegistryModule().getVertical(Vertical)
		
		return if Vertical1 == nil then rejectInvalidParams(p2, `No content reaction adapter for vertical: {Vertical}`, "vertical") else PromiseModule.try(Vertical1.toggle, {
			entityId = ActionParams.entityId,
			vertical = Vertical,
			emoteId = ActionParams.emoteId,
			shouldAdd = ShouldAdd
		}):catch(function(Err)
			-- upvalues: p2 (copy), SduiErrorType (upval), SduiActionType (upval), PromiseModule (upval)
			p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
				name = SduiActionType.ToggleContentReaction,
				message = tostring(Err)
			}, p2.appPage)
			
			return PromiseModule.reject(Err)
		end)
	else
		return rejectInvalidParams(p2, "actionParam shouldAdd must be a boolean", "shouldAdd")
	end
end