local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local RefreshHomePageFunction = require(Parent.Home).refreshHomePage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

local function _(p1, Message, PropName)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.RefreshHome,
		message = Message,
		propName = PropName
	}, p1.appPage)
end

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), RefreshHomePageFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	local RequestIntent = if ActionParams then ActionParams.requestIntent else nil
	
	if RequestIntent ~= nil and (typeof(RequestIntent) ~= "string" or RequestIntent == "") then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "requestIntent",
			name = SduiActionType.RefreshHome,
			message = `Invalid requestIntent: {tostring(RequestIntent)}`
		}, p2.appPage)
		RequestIntent = nil
	end
	return RefreshHomePageFunction(RequestIntent)
end