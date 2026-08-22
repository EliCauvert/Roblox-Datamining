local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local autoScrollPolicyModule = require(viewRecycler.Core.Enums.AutoScrollPolicy)
local autoScrollTargetModule = require(viewRecycler.Core.Enums.AutoScrollTarget)
local _ = require(viewRecycler.Core.Types)

return {
	resolveTarget = function(p0, p1, p2) --[[ line: 20 ]]
		-- upvalues: autoScrollPolicyModule (ref), autoScrollTargetModule (ref)
		return if p0 == autoScrollPolicyModule.WhenAtEnd then if p2.atEnd then autoScrollTargetModule.End else false else type(p0) == "function" and p0(p1, p2)
	end,
	getTargetOffset = function(value, p3, p4) --[[ line: 33 ]]
		-- upvalues: autoScrollTargetModule (ref)
		return if value == autoScrollTargetModule.Start then 0 else math.max(0, p3 - p4)
	end,
	create = function() --[[ line: 41 ]]
		-- upvalues: autoScrollTargetModule (ref)
		local var3 = false
		
		return {
			onDataSourceChanged = function(p5) --[[ line: 45 ]]
				-- upvalues: autoScrollTargetModule (copy), var3 (write)
				if p5 == autoScrollTargetModule.End then
					var3 = true
					
					return p5
				end
				var3 = false
				
				return p5
			end,
			getContentLengthCorrection = function(p6, p7) --[[ line: 54 ]]
				-- upvalues: var3 (write)
				return if var3 then math.max(0, p6 - p7) else nil
			end,
			onScrollOffsetChanged = function(value, p8) --[[ line: 61 ]]
				-- upvalues: var3 (write)
				var3 = value and p8
			end
		}
	end
}