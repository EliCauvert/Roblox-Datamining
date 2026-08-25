local sduiCoreSystemModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers

return function(p0, _, p1, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sduiParseHelpers (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.ActionSequence
		}, p1.appPage)
		
		return
	end
	local actions = var1.actions
	
	if typeof(actions) ~= "table" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "actions",
			name = sduiActionType.ActionSequence,
			message = `Invalid actionParam: actions is {typeof(actions)}`
		}, p1.appPage)
		
		return
	end
	local var2 = 0
	
	for i in actions do
		if typeof(i) == "number" and var2 < i then
			var2 = i
		end
	end
	for i_1 = 1, var2 do
		local var3 = actions[i_1]
		
		if var3 == nil then
			continue
		end
		if typeof(var3) == "function" then
			local ok, status = pcall(var3, nil, p2)
			
			if not ok then
				p1.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
					name = sduiActionType.ActionSequence,
					message = `Child action at index {i_1} failed: ` .. sduiParseHelpers.stringifyValue(status)
				}, p1.appPage)
			end
		else
			p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				propName = "actions",
				name = sduiActionType.ActionSequence,
				message = `Child action at index {i_1} is not callable: {typeof(var3)}`
			}, p1.appPage)
		end
	end
end