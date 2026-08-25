local nullModule = require(script.Parent.null)

return {
	isNillish = function(p0)
		-- upvalues: nullModule (ref)
		return if p0 ~= nil then p0 == nullModule else true
	end,
	isNotNillish = function(p1)
		-- upvalues: nullModule (ref)
		return p1 ~= nil and p1 ~= nullModule
	end
}