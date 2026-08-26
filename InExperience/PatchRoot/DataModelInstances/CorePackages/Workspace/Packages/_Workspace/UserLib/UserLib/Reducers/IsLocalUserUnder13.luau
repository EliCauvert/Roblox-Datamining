local setLocalUserUnder13Module = require(script:FindFirstAncestor("UserLib").Actions.SetLocalUserUnder13)

return function(p1, p2)
	-- upvalues: setLocalUserUnder13Module (ref)
	return if p2.type == setLocalUserUnder13Module.name then p2.isUnder13 elseif p1 ~= true then false else true
end