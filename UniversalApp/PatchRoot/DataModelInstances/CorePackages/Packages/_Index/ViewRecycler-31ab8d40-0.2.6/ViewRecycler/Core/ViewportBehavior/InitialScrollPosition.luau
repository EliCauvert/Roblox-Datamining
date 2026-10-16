local ScrollAlignmentModule = require(script:FindFirstAncestor("ViewRecycler").Core.Enums.ScrollAlignment)

local function _(p1, Start, Callback) --[[ Line: 14 | Named "getInitialOffset" ]]
	-- upvalues: ScrollAlignmentModule (copy)
	return if Start == nil or Start == ScrollAlignmentModule.Start or p1 == 0 then nil else Callback(p1, Start)
end

return function() --[[ Line: 21 | Named "createInitialScrollPosition" ]]
	-- upvalues: ScrollAlignmentModule (copy)
	local Flag = false
	
	return {
		onDataSourceChange = function(p1, Start, Callback) --[[ Line: 25 ]]
			-- upvalues: Flag (ref), ScrollAlignmentModule (upval)
			if Flag then
				return nil
			end
			local CallbackResult = if Start == nil or Start == ScrollAlignmentModule.Start or p1 == 0 then nil else Callback(p1, Start)
			
			if CallbackResult ~= nil then
				Flag = true
			end
			return CallbackResult
		end,
		onDataSourceReplaced = function(p1, Start, Callback) --[[ Line: 36 ]]
			-- upvalues: Flag (ref), ScrollAlignmentModule (upval)
			Flag = true
			
			return (if Start == nil or Start == ScrollAlignmentModule.Start or p1 == 0 then nil else Callback(p1, Start)) or 0
		end,
		onViewportChanged = function(p1, Start, Callback) --[[ Line: 41 ]]
			-- upvalues: Flag (ref), ScrollAlignmentModule (upval)
			if Flag then
				return nil
			end
			local CallbackResult = if Start == nil or Start == ScrollAlignmentModule.Start or p1 == 0 then nil else Callback(p1, Start)
			
			if CallbackResult ~= nil or Start == nil or Start == ScrollAlignmentModule.Start then
				Flag = true
			end
			return CallbackResult
		end
	}
end