local Parent = script:FindFirstAncestor("SocialCommon").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ConfigResult = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({})
local StatusCodesToRetryModule = require(script.Parent.StatusCodesToRetry)

local function _(p1) --[[ Line: 10 | Named "shouldRetryRequest" ]]
	-- upvalues: ConfigResult (copy), StatusCodesToRetryModule (copy)
	if p1.error then
		local ErrorGraphQLErrorsDeepValue = ConfigResult.Dictionary.getDeepValue(p1, "error.graphQLErrors")
		
		if ErrorGraphQLErrorsDeepValue and ErrorGraphQLErrorsDeepValue[1] then
			return StatusCodesToRetryModule[ConfigResult.Dictionary.getDeepValue(ErrorGraphQLErrorsDeepValue[1], "extensions.status")] or false
		end
	end
	return false
end

return function(p1, p2) --[[ Line: 22 | Named "useApolloAutoRetry" ]]
	-- upvalues: ReactModule (copy), ConfigResult (copy), StatusCodesToRetryModule (copy), CryoModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 26 ]]
		-- upvalues: p1 (copy), ConfigResult (upval), StatusCodesToRetryModule (upval), UseStateResult (copy), p2 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy)
		local v1 = nil
		repeat
			if p1.error then
				local ErrorGraphQLErrorsDeepValue = ConfigResult.Dictionary.getDeepValue(p1, "error.graphQLErrors")
				
				if ErrorGraphQLErrorsDeepValue and ErrorGraphQLErrorsDeepValue[1] then
					v1 = StatusCodesToRetryModule[ConfigResult.Dictionary.getDeepValue(ErrorGraphQLErrorsDeepValue[1], "extensions.status")] or false
					break
				end
			end
			v1 = false
		until true
		if v1 and UseStateResult < p2.retryCount and not UseStateResult1 then
			UseStateResult2_1(true)
			task.delay(2 ^ UseStateResult + math.random(), function() --[[ Line: 30 ]]
				-- upvalues: p1 (upval), UseStateResult2_1 (upval), UseStateResult2 (upval), UseStateResult (upval)
				p1:refetch()
				UseStateResult2_1(false)
				UseStateResult2(UseStateResult + 1)
			end)
		end
	end, { p1, UseStateResult1, UseStateResult })
	
	return (ReactModule.useMemo(function() --[[ Line: 38 ]]
		-- upvalues: CryoModule (upval), p1 (copy), ConfigResult (upval), StatusCodesToRetryModule (upval), UseStateResult (copy), p2 (copy)
		local JoinFunction = CryoModule.Dictionary.join
		local t = {}
		local IsRetryCountAbove = nil
		repeat
			if p1.error then
				local ErrorGraphQLErrorsDeepValue = ConfigResult.Dictionary.getDeepValue(p1, "error.graphQLErrors")
				
				if ErrorGraphQLErrorsDeepValue and ErrorGraphQLErrorsDeepValue[1] then
					IsRetryCountAbove = StatusCodesToRetryModule[ConfigResult.Dictionary.getDeepValue(ErrorGraphQLErrorsDeepValue[1], "extensions.status")] or false
					break
				end
			end
			IsRetryCountAbove = false
		until true
		if IsRetryCountAbove then
			IsRetryCountAbove = UseStateResult < p2.retryCount
		end
		t.isRetrying = IsRetryCountAbove
		t.retryCount = UseStateResult
		
		return JoinFunction(p1, t)
	end, { p1, UseStateResult }))
end