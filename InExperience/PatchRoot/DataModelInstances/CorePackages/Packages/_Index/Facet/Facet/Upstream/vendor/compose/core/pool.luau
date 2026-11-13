local _ = require("./types")
local OwnerModule = require("./ownership/owner")
local DiagnosticsModule = require("./diagnostics")
local CacheOptionsModule = require("./ownership/cache-options")

return function(p1)
	-- upvalues: CacheOptionsModule (copy), OwnerModule (copy), DiagnosticsModule (copy)
	local Pool, Pool2 = CacheOptionsModule.validate(p1, "pool")
	local CreateResults = {}
	local CreateResults1 = {}
	local Flag = false
	OwnerModule.own(Pool, function()
		-- upvalues: Flag (ref), CacheOptionsModule (upval), p1 (copy), CreateResults (copy), CreateResults1 (copy)
		Flag = true
		CacheOptionsModule.destroyAll("pool", p1.destroy, function(Callback: (any) -> ())
			-- upvalues: CreateResults (upval), CreateResults1 (upval)
			for _, createResult in CreateResults do
				Callback(createResult)
			end
			for _, value in CreateResults1 do
				Callback(value)
			end
			table.clear(CreateResults)
			table.clear(CreateResults1)
		end)
	end)
	
	return {
		acquire = function()
			-- upvalues: Flag (ref), DiagnosticsModule (upval), CreateResults (copy), p1 (copy), CreateResults1 (copy), Pool2 (copy)
			if Flag then
				return DiagnosticsModule.raise("pool/disposed", "a disposed pool cannot acquire resources", { contract = "the pool shares its owner's lifetime" })
			end
			local CreateResult = nil
			
			if #CreateResults > 0 then
				CreateResult = CreateResults[#CreateResults]
				CreateResults[#CreateResults] = nil
			else
				CreateResult = p1.create()
			end
			local v1 = nil
			local Flag1 = false
			v1 = {
				value = CreateResult,
				release = function()
					-- upvalues: Flag1 (ref), CreateResults1 (upval), v1 (ref), Flag (upval), p1 (upval), CreateResult (ref), CreateResults (upval), Pool2 (upval)
					if Flag1 then return end
					Flag1 = true
					CreateResults1[v1] = nil
					
					if Flag then return end
					if p1.reset ~= nil then
						local Success, Result = pcall(p1.reset, CreateResult)
						
						if not Success then
							p1.destroy(CreateResult)
							error(Result, 0)
						end
					end
					if #CreateResults < Pool2 then
						CreateResults[#CreateResults + 1] = CreateResult
						
						return
					else
						p1.destroy(CreateResult)
					end
				end
			}
			CreateResults1[v1] = CreateResult
			
			return v1
		end,
		idle = function(): number
			-- upvalues: CreateResults (copy)
			return #CreateResults
		end,
		active = function(): number
			-- upvalues: CreateResults1 (copy)
			local Count = 0
			
			for _ in CreateResults1 do
				Count += 1
			end
			return Count
		end
	}
end