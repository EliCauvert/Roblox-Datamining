local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local autoScrollPolicyModule = require(viewRecycler.Core.Enums.AutoScrollPolicy)
local autoScrollTargetModule = require(viewRecycler.Core.Enums.AutoScrollTarget)
local _ = require(viewRecycler.Core.Types)

return {
	resolveTarget = function(p1, p2, p3)
		-- upvalues: autoScrollPolicyModule (ref), autoScrollTargetModule (ref)
		return if p1 == autoScrollPolicyModule.WhenAtEnd then if p3.atEnd then autoScrollTargetModule.End else false else type(p1) == "function" and p1(p2, p3)
	end,
	getTargetOffset = function(value, p1, p2)
		-- upvalues: autoScrollTargetModule (ref)
		return if value == autoScrollTargetModule.Start then 0 else math.max(0, p1 - p2)
	end,
	create = function()
		-- upvalues: autoScrollTargetModule (ref)
		local var1 = false
		
		return {
			onDataSourceChanged = function(p1)
				-- upvalues: autoScrollTargetModule (copy), var1 (write)
				if p1 == autoScrollTargetModule.End then
					var1 = true
					
					return p1
				end
				var1 = false
				
				return p1
			end,
			getContentLengthCorrection = function(p1, p2)
				-- upvalues: var1 (write)
				return if var1 then math.max(0, p1 - p2) else nil
			end,
			onScrollOffsetChanged = function(value, p1)
				-- upvalues: var1 (write)
				var1 = value and p1
			end
		}
	end
}