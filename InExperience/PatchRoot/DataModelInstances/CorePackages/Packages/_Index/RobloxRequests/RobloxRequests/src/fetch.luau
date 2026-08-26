local promiseModule = require(script.Parent.Parent.Parent.Promise)

function createFetch(p1)
	-- upvalues: promiseModule (ref)
	return function(p2, p3)
		-- upvalues: p1 (ref), promiseModule (copy)
		if p3 == nil then
			p3 = {}
		end
		local method = p3.method or "GET"
		p3.method = nil
		p3.data = p3.body
		p3.body = nil
		
		return p1(method, p2, p3):andThen(function(p4)
			-- upvalues: promiseModule (copy)
			local text = p4.text
			
			function p3.text()
				-- upvalues: promiseModule (copy), text (ref)
				return promiseModule.resolve(text)
			end
			
			p4.status = p4.code
			
			return p4
		end)
	end
end

return createFetch