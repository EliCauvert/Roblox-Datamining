return function(p1, Callback)
	local EventStream = p1.EventStream
	
	return {
		ButtonActivated = function(p2, p3)
			-- upvalues: Callback (copy), EventStream (copy)
			Callback(EventStream, "TenFootUiGlobalNav", p2, p3)
		end
	}
end