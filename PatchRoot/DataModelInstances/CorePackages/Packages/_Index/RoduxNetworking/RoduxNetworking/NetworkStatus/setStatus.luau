-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:08 2026 Pacific Standard Time.

local enumNetworkStatusModule = require(script.Parent.EnumNetworkStatus)
local buildActionNameModule = require(script.Parent.buildActionName)
local promiseModule = require(script.Parent.Promise)

return function(p0) --[[ line: 5 ]]
	-- upvalues: buildActionNameModule (ref), enumNetworkStatusModule (ref), promiseModule (ref)
	local var3 = require(script.Parent.getStatus)(p0)
	
	local function _(p1, p2, p3) --[[ line: 8 | named "actionCreator" ]]
		-- upvalues: buildActionNameModule (copy), p0 (ref)
		return {
			ids = p1,
			keymapper = p2,
			status = p3,
			type = buildActionNameModule(p0)
		}
	end
	
	local function filter(p4, p5, p6) --[[ line: 17 ]]
		-- upvalues: var3 (ref), enumNetworkStatusModule (copy)
		local t = {}
		
		for i, v in ipairs(p5) do
			if var3(p4, p6(v)) ~= enumNetworkStatusModule.Fetching then
				table.insert(t, v)
			end
		end
		return t
	end
	
	return function(p7, p8, p9, p10) --[[ line: 28 ]]
		-- upvalues: filter (ref), p0 (ref), promiseModule (copy), enumNetworkStatusModule (copy), buildActionNameModule (copy)
		local var6 = filter(p7:getState(), p8, p9)
		
		if p0.killRequestWithFilteredIds and #p8 > 0 and #var6 == 0 then
			return promiseModule.reject("Request with provided IDs already fetching.")
		end
		p7:dispatch({
			ids = var6,
			keymapper = p9,
			status = enumNetworkStatusModule.Fetching,
			type = buildActionNameModule(p0)
		})
		
		return p10(p7, var6):andThen(function(p11) --[[ line: 38 ]]
			-- upvalues: p7 (ref), var6 (ref), p9 (ref), enumNetworkStatusModule (copy), buildActionNameModule (copy), p0 (copy)
			p7:dispatch({
				ids = var6,
				keymapper = p9,
				status = enumNetworkStatusModule.Done,
				type = buildActionNameModule(p0)
			})
			
			return p11
		end, function(p12) --[[ line: 41 ]]
			-- upvalues: p7 (ref), var6 (ref), p9 (ref), enumNetworkStatusModule (copy), buildActionNameModule (copy), p0 (copy), promiseModule (copy)
			p7:dispatch({
				ids = var6,
				keymapper = p9,
				status = enumNetworkStatusModule.Failed,
				type = buildActionNameModule(p0)
			})
			
			return promiseModule.reject(p12)
		end)
	end
end