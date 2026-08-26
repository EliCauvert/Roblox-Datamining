local nullModule = require(script.Parent.null)

return {
	isNillish = function(p1)
		-- upvalues: nullModule (ref)
		return if p1 ~= nil then p1 == nullModule else true
	end,
	isNotNillish = function(p1)
		-- upvalues: nullModule (ref)
		return p1 ~= nil and p1 ~= nullModule
	end
}