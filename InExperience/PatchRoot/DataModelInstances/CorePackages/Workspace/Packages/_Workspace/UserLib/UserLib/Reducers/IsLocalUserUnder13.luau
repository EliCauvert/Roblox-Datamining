local setLocalUserUnder13Module = require(script:FindFirstAncestor("UserLib").Actions.SetLocalUserUnder13)

return function(p0, p1) --[[ line: 4 ]]
	-- upvalues: setLocalUserUnder13Module (ref)
	return if p1.type == setLocalUserUnder13Module.name then p1.isUnder13 elseif p0 ~= true then false else true
end