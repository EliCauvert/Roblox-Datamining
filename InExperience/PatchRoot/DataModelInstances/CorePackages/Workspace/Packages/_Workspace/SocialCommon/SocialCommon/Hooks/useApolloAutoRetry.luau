local parent = script:FindFirstAncestor("SocialCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local var2 = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({})
local statusCodesToRetryModule = require(script.Parent.StatusCodesToRetry)

local function _(p0)
	-- upvalues: var2 (ref), statusCodesToRetryModule (ref)
	if p0.error then
		local deepValue = var2.Dictionary.getDeepValue(p0, "error.graphQLErrors")
		
		return if deepValue and deepValue[1] then statusCodesToRetryModule[var2.Dictionary.getDeepValue(deepValue[1], "extensions.status")] or false else false
	end
end

return function(p1, p2)
	-- upvalues: reactModule (ref), var2 (ref), statusCodesToRetryModule (ref), cryoModule (ref)
	local var5, var6 = reactModule.useState(0)
	local var7, var8 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (copy), statusCodesToRetryModule (copy), var5 (ref), p2 (ref), var7 (ref), var8 (ref), var6 (ref)
		local var11
		local var9 = p1
		
		if var9.error then
			local deepValue = var2.Dictionary.getDeepValue(var9, "error.graphQLErrors")
			var11 = if deepValue and deepValue[1] then statusCodesToRetryModule[var2.Dictionary.getDeepValue(deepValue[1], "extensions.status")] or false else false
		end
		if var11 and var5 < p2.retryCount and not var7 then
			var8(true)
			task.delay(2 ^ var5 + math.random(), function()
				-- upvalues: p1 (copy), var8 (copy), var6 (copy), var5 (copy)
				p1:refetch()
				var8(false)
				var6(var5 + 1)
			end)
		end
	end, { p1, var7, var5 })
	
	return reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref), var2 (copy), statusCodesToRetryModule (copy), var5 (ref), p2 (ref)
		local var15
		local join = cryoModule.Dictionary.join
		local t = {}
		local var13 = p1
		
		if var13.error then
			local deepValue = var2.Dictionary.getDeepValue(var13, "error.graphQLErrors")
			var15 = if deepValue and deepValue[1] then statusCodesToRetryModule[var2.Dictionary.getDeepValue(deepValue[1], "extensions.status")] or false else false
		end
		t.isRetrying = var15 and var5 < p2.retryCount
		t.retryCount = var5
		
		return join(p1, t)
	end, { p1, var5 })
end