local SduiCoreSystemModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers

return function(p1, _, p2, p3)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), SduiParseHelpers (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.ActionSequence
		}, p2.appPage)
		
		return
	end
	local Actions = ActionParams.actions
	
	if typeof(Actions) ~= "table" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "actions",
			name = SduiActionType.ActionSequence,
			message = `Invalid actionParam: actions is {typeof(Actions)}`
		}, p2.appPage)
		
		return
	end
	local v1 = 0
	
	for action in Actions do
		if typeof(action) == "number" and v1 < action then
			v1 = action
		end
	end
	for i = 1, v1 do
		local Action = Actions[i]
		
		if Action ~= nil then
			if typeof(Action) == "function" then
				local Success, Result = pcall(Action, nil, p3)
				
				if not Success then
					p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
						name = SduiActionType.ActionSequence,
						message = `Child action at index {i} failed: ` .. SduiParseHelpers.stringifyValue(Result)
					}, p2.appPage)
				end
			else
				p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
					propName = "actions",
					name = SduiActionType.ActionSequence,
					message = `Child action at index {i} is not callable: {typeof(Action)}`
				}, p2.appPage)
			end
		end
	end
end