local SduiCoreSystemModule = require(script:FindFirstAncestor("BuildExperience").Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetStringParamFunction = SduiCoreSystemModule.SduiActionParams.getStringParam
local BuildInspirationPageScopeFieldsModule = require(script.Parent.BuildInspirationPageScopeFields)
local GetBuildInspirationPageScopeHandlerModule = require(script.Parent.getBuildInspirationPageScopeHandler)

return function(p1, _, p2, _)
	-- upvalues: GetStringParamFunction (copy), SduiErrorType (copy), SduiActionType (copy), GetBuildInspirationPageScopeHandlerModule (copy), BuildInspirationPageScopeFieldsModule (copy)
	local ActionParams = p1 and p1.actionParams
	local Sort = if ActionParams then GetStringParamFunction(ActionParams, "sort") else nil
	
	if Sort == nil or string.match(Sort, "^%s*$") then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing or blank sort",
			propName = "sort",
			name = SduiActionType.OpenBuildInspirationSeeMore
		}, p2.appPage)
		
		return
	end
	local BuildInspirationPageScopeHandlerModule: (any) -> () = GetBuildInspirationPageScopeHandlerModule(p2, BuildInspirationPageScopeFieldsModule.OpenSeeMore, SduiActionType.OpenBuildInspirationSeeMore)
	
	if BuildInspirationPageScopeHandlerModule then
		BuildInspirationPageScopeHandlerModule(Sort)
	end
end