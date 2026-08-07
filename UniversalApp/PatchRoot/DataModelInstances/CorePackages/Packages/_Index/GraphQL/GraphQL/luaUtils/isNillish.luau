local nullModule = require(script.Parent.null)

return {
	isNillish = function(p0) --[[ line: 3 ]]
		-- upvalues: nullModule (ref)
		return if p0 ~= nil then p0 == nullModule else true
	end,
	isNotNillish = function(p1) --[[ line: 7 ]]
		-- upvalues: nullModule (ref)
		return p1 ~= nil and p1 ~= nullModule
	end
}