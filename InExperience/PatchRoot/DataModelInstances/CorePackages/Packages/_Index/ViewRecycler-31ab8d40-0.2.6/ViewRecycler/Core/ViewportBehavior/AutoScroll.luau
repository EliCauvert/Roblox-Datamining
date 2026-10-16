local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local AutoScrollPolicyModule = require(ViewRecycler.Core.Enums.AutoScrollPolicy)
local AutoScrollTargetModule = require(ViewRecycler.Core.Enums.AutoScrollTarget)
local _ = require(ViewRecycler.Core.Types)

return {
	resolveTarget = function(Callback, p1, p2) --[[ Line: 20 ]]
		-- upvalues: AutoScrollPolicyModule (copy), AutoScrollTargetModule (copy)
		return if Callback == AutoScrollPolicyModule.WhenAtEnd then if p2.atEnd then AutoScrollTargetModule.End else false else type(Callback) == "function" and Callback(p1, p2)
	end,
	getTargetOffset = function(Start, p1, p2): number --[[ Line: 33 ]]
		-- upvalues: AutoScrollTargetModule (copy)
		return if Start == AutoScrollTargetModule.Start then 0 else math.max(0, p1 - p2)
	end,
	create = function() --[[ Line: 41 ]]
		-- upvalues: AutoScrollTargetModule (copy)
		local Flag = false
		
		return {
			onDataSourceChanged = function(End) --[[ Line: 45 ]]
				-- upvalues: AutoScrollTargetModule (upval), Flag (ref)
				if End == AutoScrollTargetModule.End then
					Flag = true
					
					return End
				else
					Flag = false
					
					return End
				end
			end,
			getContentLengthCorrection = function(p1, p2) --[[ Line: 54 ]]
				-- upvalues: Flag (ref)
				return if Flag then math.max(0, p1 - p2) else nil
			end,
			onScrollOffsetChanged = function(p1, p2) --[[ Line: 61 ]]
				-- upvalues: Flag (ref)
				Flag = p1 and p2
			end
		}
	end
}