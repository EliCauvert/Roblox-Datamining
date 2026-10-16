local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

return function(Tbl) --[[ Line: 6 | Named "sortRobuxPackagesByAmountDescending" ]]
	if #Tbl <= 1 then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		table.sort(Copy, function(A, B): boolean --[[ Line: 12 ]]
			return if A.robuxAmount == B.robuxAmount then A.id < B.id else B.robuxAmount < A.robuxAmount
		end)
		
		return Copy
	end
end