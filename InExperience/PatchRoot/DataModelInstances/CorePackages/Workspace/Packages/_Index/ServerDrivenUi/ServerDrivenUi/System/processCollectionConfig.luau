local sduiCoreSystemModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem)
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local t = {}

for i in game:DefineFastString("SduiEagerProcessCollectionIds", "400000000"):gmatch("(%w+)") do
	t[i] = true
end
return function(p0, p1, p2)
	-- upvalues: t (ref), sduiBuilder (ref), sduiErrors (ref)
	if not p1 or not t[tostring(p1)] then
		return p0
	end
	local appPage = `{p2.appPage}-{p1}`
	local ok, status = pcall(function()
		-- upvalues: sduiBuilder (copy), p0 (ref), p2 (ref), appPage (ref)
		local var3, var4 = sduiBuilder.tryCreateEagerProcessedComponentConfig(p0, p2, appPage, {}, true)
		
		if var3 then
			return var4
		end
		error(var4)
	end)
	
	if ok and status then
		return status
	end
	p2.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToEagerlyProcess, {
		name = appPage,
		message = `Failed to process collection config {if typeof(status) == "string" then status else ""}`
	}, p2.appPage)
	
	return p0
end