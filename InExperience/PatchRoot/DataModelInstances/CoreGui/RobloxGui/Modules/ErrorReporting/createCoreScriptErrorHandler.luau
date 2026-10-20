local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ScriptContext = game:GetService("ScriptContext")
local ReactModule = require(CorePackages.Packages.React)
local FFlagCoreScriptErrorReporterIncludeScriptContextModule = require(script.Parent.Parent.Flags.FFlagCoreScriptErrorReporterIncludeScriptContext)

local function isCoreScript(Object)
	-- upvalues: CoreGui (copy), CorePackages (copy), FFlagCoreScriptErrorReporterIncludeScriptContextModule (copy), ScriptContext (copy)
	return Object:IsDescendantOf(CoreGui) or (Object:IsDescendantOf(CorePackages) or FFlagCoreScriptErrorReporterIncludeScriptContextModule and (Object:IsA("CoreScript") and Object:IsDescendantOf(ScriptContext)))
end

return function(p1)
	-- upvalues: isCoreScript (copy), ReactModule (copy)
	local PiiFilter = p1.piiFilter
	local RateLimiter = p1.rateLimiter
	local IsReportableScript = p1.isReportableScript or isCoreScript
	
	return function(p2, p3, p4, p5)
		-- upvalues: IsReportableScript (copy), ReactModule (upval), PiiFilter (copy), RateLimiter (copy), p1 (copy)
		if p4 == nil or not IsReportableScript(p4) then return end
		local Unstable_parseReactErrorResult, Unstable_parseReactErrorResult2 = ReactModule.unstable_parseReactError(p2)
		local P5 = p5 or Unstable_parseReactErrorResult2
		local CleanPiiResult = PiiFilter:cleanPii(Unstable_parseReactErrorResult.message)
		local CleanPiiResult1 = PiiFilter:cleanPii(Unstable_parseReactErrorResult.stack or p3)
		local CleanPiiResult2 = if P5 == nil then nil else PiiFilter:cleanPii(P5)
		
		if RateLimiter ~= nil then
			local Text = CleanPiiResult .. CleanPiiResult1
			
			if RateLimiter:isRateLimited(Text) then return end
			RateLimiter:increment(Text)
		end
		for _, reporter in p1.reporters do
			reporter:reportErrorDeferred(CleanPiiResult, CleanPiiResult1, CleanPiiResult2)
		end
		if p1.onErrorReported ~= nil then
			p1.onErrorReported()
		end
	end
end