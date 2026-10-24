local Frozen = table.freeze({
	wave = table.freeze({ r6 = 128777973, r15 = 507770239 }),
	point = table.freeze({ r6 = 128853357, r15 = 507770453 }),
	dance = table.freeze({ r6 = 182435998, r15 = 507771019 }),
	dance2 = table.freeze({ r6 = 182436842, r15 = 507776043 }),
	dance3 = table.freeze({ r6 = 182436935, r15 = 507777268 }),
	laugh = table.freeze({ r6 = 129423131, r15 = 507770818 }),
	cheer = table.freeze({ r6 = 129423030, r15 = 507770677 })
})
local Tbl = {}

for i in Frozen do
	Tbl[i] = true
end
table.freeze(Tbl)

return {
	resolve = function(p1, HumanoidRigType)
		-- upvalues: Frozen (copy)
		local FrozenEntry = Frozen[p1]
		
		return if HumanoidRigType == Enum.HumanoidRigType.R6 then FrozenEntry.r6 else FrozenEntry.r15
	end,
	isName = function(p1): boolean
		-- upvalues: Tbl (copy)
		return typeof(p1) == "string" and Tbl[p1] == true
	end
}