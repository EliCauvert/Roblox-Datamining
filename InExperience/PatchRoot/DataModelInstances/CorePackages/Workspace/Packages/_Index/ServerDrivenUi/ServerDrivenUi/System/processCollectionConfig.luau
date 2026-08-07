local sduiCoreSystemModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem)
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local t = {}

for i in game:DefineFastString("SduiEagerProcessCollectionIds", "400000000"):gmatch("(%w+)") do
	t[i] = true
end
return function(p0, p1, p2) --[[ line: 21 | named "processCollectionConfig" ]]
	-- upvalues: t (ref), sduiBuilder (ref), sduiErrors (ref)
	if not p1 or not t[tostring(p1)] then
		return p0
	end
	local ok = `{p2.appPage}-{p1}`
	ok, status = pcall(function() --[[ line: 30 ]]
		-- upvalues: sduiBuilder (copy), p0 (ref), p2 (ref), ok (ref)
		local var3, var4 = sduiBuilder.tryCreateEagerProcessedComponentConfig(p0, p2, ok, {}, true)
		
		if var3 then
			return var4
		end
		error(var4)
	end)
	
	if ok and status then
		return status
	end
	p2.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToEagerlyProcess, {
		name = ok,
		message = `Failed to process collection config {if typeof(status) == "string" then status else ""}`
	}, p2.appPage)
	
	return p0
end