local PromiseModule = require(script.Parent.Parent.Parent.Promise)

function createFetch(Callback)
	-- upvalues: PromiseModule (copy)
	return function(p1, p2)
		-- upvalues: Callback (copy), PromiseModule (upval)
		if p2 == nil then
			p2 = {}
		end
		local Method = p2.method or "GET"
		p2.method = nil
		p2.data = p2.body
		p2.body = nil
		
		return Callback(Method, p1, p2):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			local Text = Result.text
			
			function Result.text()
				-- upvalues: PromiseModule (upval), Text (copy)
				return PromiseModule.resolve(Text)
			end
			
			Result.status = Result.code
			
			return Result
		end)
	end
end

return createFetch