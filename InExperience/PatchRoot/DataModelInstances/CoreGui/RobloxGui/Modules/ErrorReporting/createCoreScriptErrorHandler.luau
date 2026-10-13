local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local scriptContextService = game:GetService("ScriptContext")
local reactModule = require(corePackagesService.Packages.React)
local fFlagCoreScriptErrorReporterIncludeScriptContextModule = require(script.Parent.Parent.Flags.FFlagCoreScriptErrorReporterIncludeScriptContext)

local function isCoreScript(p1)
	-- upvalues: coreGuiService (ref), corePackagesService (ref), fFlagCoreScriptErrorReporterIncludeScriptContextModule (ref), scriptContextService (ref)
	return p1:IsDescendantOf(coreGuiService) or (p1:IsDescendantOf(corePackagesService) or fFlagCoreScriptErrorReporterIncludeScriptContextModule and (p1:IsA("CoreScript") and p1:IsDescendantOf(scriptContextService)))
end

return function(p1)
	-- upvalues: isCoreScript (ref), reactModule (ref)
	local piiFilter = p1.piiFilter
	local rateLimiter = p1.rateLimiter
	local isReportableScript = p1.isReportableScript or isCoreScript
	
	return function(p2, p3, p4, p5)
		-- upvalues: isReportableScript (ref), reactModule (copy), piiFilter (ref), rateLimiter (ref), p1 (ref)
		if p4 == nil or not isReportableScript(p4) then return end
		local var1, var2 = reactModule.unstable_parseReactError(p2)
		local message = var1.message
		local stack = var1.stack or p3
		p5 = p5 or var2
		local var3 = piiFilter:cleanPii(message)
		local var4 = piiFilter:cleanPii(stack)
		local var5 = if p5 ~= nil then nil else piiFilter:cleanPii(p5)
		
		if rateLimiter ~= nil then
			local text = var3 .. var12
			
			if rateLimiter:isRateLimited(text) then return end
			rateLimiter:increment(text)
		end
		for i, v in p1.reporters do
			v:reportErrorDeferred(var3, var4, var5)
		end
		if p1.onErrorReported ~= nil then
			p1.onErrorReported()
		end
	end
end