local SduiCoreSystemModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem)
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local t = {}

for i in game:DefineFastString("SduiEagerProcessCollectionIds", "400000000"):gmatch("(%w+)") do
	t[i] = true
end
return function(p1, p2, p3) --[[ Line: 21 | Named "processCollectionConfig" ]]
	-- upvalues: t (copy), SduiBuilder (copy), SduiErrors (copy)
	if not p2 or not t[tostring(p2)] then
		return p1
	end
	local Text: string = `{p3.appPage}-{p2}`
	local Success, Result = pcall(function() --[[ Line: 30 ]]
		-- upvalues: SduiBuilder (upval), p1 (copy), p3 (copy), Text (copy)
		local TryCreateEagerProcessedComponentConfigResult, TryCreateEagerProcessedComponentConfigResult2 = SduiBuilder.tryCreateEagerProcessedComponentConfig(p1, p3, Text, {}, true)
		
		if TryCreateEagerProcessedComponentConfigResult then
			return TryCreateEagerProcessedComponentConfigResult2
		else
			error(TryCreateEagerProcessedComponentConfigResult2)
		end
	end)
	
	if Success and Result then
		return Result
	else
		p3.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToEagerlyProcess, {
			name = Text,
			message = `Failed to process collection config {if typeof(Result) == "string" then Result else ""}`
		}, p3.appPage)
		
		return p1
	end
end