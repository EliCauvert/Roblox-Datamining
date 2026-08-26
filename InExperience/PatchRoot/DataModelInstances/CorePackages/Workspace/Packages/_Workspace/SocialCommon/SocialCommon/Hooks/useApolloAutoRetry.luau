local parent = script:FindFirstAncestor("SocialCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local var1 = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({})
local statusCodesToRetryModule = require(script.Parent.StatusCodesToRetry)

local function _(p1)
	-- upvalues: var1 (ref), statusCodesToRetryModule (ref)
	if p1.error then
		local deepValue = var1.Dictionary.getDeepValue(p1, "error.graphQLErrors")
		
		return if deepValue and deepValue[1] then statusCodesToRetryModule[var1.Dictionary.getDeepValue(deepValue[1], "extensions.status")] or false else false
	end
end

return function(p1, p2)
	-- upvalues: reactModule (ref), var1 (ref), statusCodesToRetryModule (ref), cryoModule (ref)
	local var2, var3 = reactModule.useState(0)
	local var4, var5 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (copy), statusCodesToRetryModule (copy), var2 (ref), p2 (ref), var4 (ref), var5 (ref), var3 (ref)
		local var6
		local var7 = p1
		
		if var7.error then
			local deepValue = var1.Dictionary.getDeepValue(var7, "error.graphQLErrors")
			var6 = if deepValue and deepValue[1] then statusCodesToRetryModule[var1.Dictionary.getDeepValue(deepValue[1], "extensions.status")] or false else false
		end
		if var6 and var2 < p2.retryCount and not var4 then
			var5(true)
			task.delay(2 ^ var2 + math.random(), function()
				-- upvalues: p1 (copy), var5 (copy), var3 (copy), var2 (copy)
				p1:refetch()
				var5(false)
				var3(var2 + 1)
			end)
		end
	end, { p1, var4, var2 })
	
	return reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref), var1 (copy), statusCodesToRetryModule (copy), var2 (ref), p2 (ref)
		local var6
		local join = cryoModule.Dictionary.join
		local t = {}
		local var7 = p1
		
		if var7.error then
			local deepValue = var1.Dictionary.getDeepValue(var7, "error.graphQLErrors")
			var6 = if deepValue and deepValue[1] then statusCodesToRetryModule[var1.Dictionary.getDeepValue(deepValue[1], "extensions.status")] or false else false
		end
		t.isRetrying = var6 and var2 < p2.retryCount
		t.retryCount = var2
		
		return join(p1, t)
	end, { p1, var2 })
end