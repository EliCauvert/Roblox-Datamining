local PromiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)
local GetProductInfoModule = require(script.Parent.getProductInfo)
local _ = require(script.Parent.multiGetProductInfo)

return function(Requests, p1)
	-- upvalues: PromiseModule (copy), GetProductInfoModule (copy)
	local CountRequests = #Requests
	
	if CountRequests == 0 then
		return PromiseModule.resolve({})
	else
		local Buffer = table.create(CountRequests)
		local Count = 0
		
		return PromiseModule.new(function(Callback)
			-- upvalues: Requests (copy), GetProductInfoModule (upval), Buffer (copy), p1 (copy), Count (ref), CountRequests (copy)
			for i, request in ipairs(Requests) do
				GetProductInfoModule(request.id, request.infoType):andThen(function(Result)
					-- upvalues: request (copy)
					return { ok = true, request = request, value = Result }
				end):catch(function(Err)
					-- upvalues: request (copy)
					return { ok = false, request = request, err = Err }
				end):andThen(function(Result)
					-- upvalues: Buffer (upval), i (copy), p1 (upval), Count (upval), CountRequests (upval), Callback (copy)
					Buffer[i] = Result
					p1.onResult(Result)
					Count += 1
					
					if Count == CountRequests then
						Callback(Buffer)
					end
				end)
			end
		end)
	end
end