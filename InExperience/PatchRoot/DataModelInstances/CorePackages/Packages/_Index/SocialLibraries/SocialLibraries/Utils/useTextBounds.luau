local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local React = DependenciesModule.React
local GetTextBoundsAsyncFunction = DependenciesModule.Foundation.Utility.getTextBoundsAsync

return function(p1, p2, p3, p4) --[[ Line: 7 ]]
	-- upvalues: React (copy), GetTextBoundsAsyncFunction (copy)
	local UseStateResult, UseStateResult2 = React.useState(nil)
	React.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: GetTextBoundsAsyncFunction (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), UseStateResult2 (copy)
		local Flag = false
		task.spawn(function() --[[ Line: 12 ]]
			-- upvalues: GetTextBoundsAsyncFunction (upval), p1 (upval), p2 (upval), p3 (upval), p4 (upval), Flag (ref), UseStateResult2 (upval)
			local TextBoundsAsync = GetTextBoundsAsyncFunction(p1, p2, p3, p4)
			
			if TextBoundsAsync and not Flag then
				UseStateResult2(TextBoundsAsync)
			end
		end)
		
		return function() --[[ Line: 19 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { p1, p2, p3, p4 })
	
	return UseStateResult
end