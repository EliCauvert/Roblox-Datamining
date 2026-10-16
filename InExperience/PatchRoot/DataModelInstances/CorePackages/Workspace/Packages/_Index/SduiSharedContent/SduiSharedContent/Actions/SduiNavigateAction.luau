local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetStringParamFunction = SduiCoreSystemModule.SduiActionParams.getStringParam

return function(p1, _, p2, _) --[[ Line: 21 | Named "SduiNavigateAction" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), GetStringParamFunction (copy), AppPage (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.Navigate
		}, p2.appPage)
		
		return
	end
	local Destination = GetStringParamFunction(ActionParams, "destination")
	
	if Destination == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: destination",
			propName = "destination",
			name = SduiActionType.Navigate
		}, p2.appPage)
		
		return
	end
	local AppPageEntry = AppPage[Destination]
	
	if AppPageEntry == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "destination",
			name = SduiActionType.Navigate,
			message = `Unknown destination: {Destination}`
		}, p2.appPage)
		
		return
	else
		p2.dependencies.getNavigation().navigate(AppPageEntry)
	end
end