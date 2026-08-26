local sduiCoreSystemModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem)
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local t = {}

for i in game:DefineFastString("SduiEagerProcessCollectionIds", "400000000"):gmatch("(%w+)") do
	t[i] = true
end
return function(p1, p2, p3)
	-- upvalues: t (ref), sduiBuilder (ref), sduiErrors (ref)
	if not p2 or not t[tostring(p2)] then
		return p1
	end
	local appPage = `{p3.appPage}-{p2}`
	local ok, status = pcall(function()
		-- upvalues: sduiBuilder (copy), p1 (ref), p3 (ref), appPage (ref)
		local var1, var2 = sduiBuilder.tryCreateEagerProcessedComponentConfig(p1, p3, appPage, {}, true)
		
		if var1 then
			return var2
		end
		error(var2)
	end)
	
	if ok and status then
		return status
	end
	p3.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToEagerlyProcess, {
		name = appPage,
		message = `Failed to process collection config {if typeof(status) == "string" then status else ""}`
	}, p3.appPage)
	
	return p1
end