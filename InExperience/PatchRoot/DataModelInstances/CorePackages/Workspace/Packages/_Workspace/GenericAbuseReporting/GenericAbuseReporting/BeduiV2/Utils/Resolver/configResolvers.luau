local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(script.Parent.ResolverTypes)
local transformJsonLeafFirstModule = require(script.Parent.transformJsonLeafFirst)
local _ = require(genericAbuseReporting.BeduiV2.Types)

local function getByPath(p0, p1) --[[ line: 18 ]]
	local var4 = p0
	
	for i, v in ipairs(string.split(p1, ".")) do
		if type(var4) == "table" and var4 ~= nil then
			var4 = var4[v]
			
			if var4 == nil then
				return nil
			end
		end
		return nil
	end
	return var4
end

local function _(p2) --[[ line: 47 | named "isTruthy" ]]
	return p2 ~= nil and (p2 ~= false and p2 ~= "")
end

local t = {
	["$attribute"] = {
		is = function(p3) --[[ line: 57 ]]
			return type(p3) == "table" and (p3["$attribute"] ~= nil and type(p3["$attribute"]) == "string")
		end,
		resolve = function(p4, p5) --[[ line: 60 ]]
			-- upvalues: getByPath (ref)
			return getByPath(p5.attribute, p4["$attribute"])
		end
	},
	["$resource"] = {
		is = function(p6) --[[ line: 66 ]]
			return type(p6) == "table" and (p6["$resource"] ~= nil and type(p6["$resource"]) == "string")
		end,
		resolve = function(p7, p8) --[[ line: 69 ]]
			local var5 = p8.resources[p7["$resource"]]
			
			return if var5 then var5.value else nil
		end
	},
	["$switch"] = {
		is = function(p9) --[[ line: 75 ]]
			return type(p9) == "table" and (p9["$switch"] ~= nil and type(p9["$switch"]) == "table")
		end,
		resolve = function(p10, _) --[[ line: 78 ]]
			for i, v in ipairs(p10["$switch"]) do
				if type(v) ~= "string" then
					if type(v) == "table" and v.condition then
						local condition = v.condition
						
						if condition ~= nil and (condition ~= false and condition ~= "") then
							return v.value
						end
					end
				end
				return v
			end
			return nil
		end
	},
	["$store"] = {
		is = function(p11) --[[ line: 93 ]]
			return type(p11) == "table" and (p11["$store"] ~= nil and type(p11["$store"]) == "string")
		end,
		resolve = function(p12, p13) --[[ line: 96 ]]
			-- upvalues: getByPath (ref)
			return getByPath(p13.store, p12["$store"])
		end
	}
}

return {
	resolveArConfig = function(p14, p15) --[[ line: 139 ]]
		-- upvalues: t (ref), transformJsonLeafFirstModule (ref)
		local t_1 = {
			attribute = p14.attributes,
			resources = {},
			store = p15.store
		}
		t_1 = {
			attribute = p14.attributes,
			resources = transformJsonLeafFirstModule(p14.resources, function(p16) --[[ line: 113 | named "replacerFn" ]]
				-- upvalues: t (copy), t_1 (ref)
				if type(p16) == "table" then
					return if t["$attribute"].is(p16) then t["$attribute"].resolve(p16, t_1) elseif t["$resource"].is(p16) then t["$resource"].resolve(p16, t_1) elseif t["$switch"].is(p16) then t["$switch"].resolve(p16, t_1) elseif t["$store"].is(p16) then t["$store"].resolve(p16, t_1) else p16
				end
			end),
			store = p15.store
		}
		
		return transformJsonLeafFirstModule(p14, function(p17) --[[ line: 113 | named "replacerFn" ]]
			-- upvalues: t (copy), t_1 (ref)
			if type(p17) == "table" then
				return if t["$attribute"].is(p17) then t["$attribute"].resolve(p17, t_1) elseif t["$resource"].is(p17) then t["$resource"].resolve(p17, t_1) elseif t["$switch"].is(p17) then t["$switch"].resolve(p17, t_1) elseif t["$store"].is(p17) then t["$store"].resolve(p17, t_1) else p17
			end
		end)
	end,
	resolveConfig = function(p18, p19) --[[ line: 105 ]]
		-- upvalues: t (ref), transformJsonLeafFirstModule (ref)
		return transformJsonLeafFirstModule(p18, function(p20) --[[ line: 113 | named "replacerFn" ]]
			-- upvalues: t (copy), p19 (ref)
			if type(p20) == "table" then
				return if t["$attribute"].is(p20) then t["$attribute"].resolve(p20, p19) elseif t["$resource"].is(p20) then t["$resource"].resolve(p20, p19) elseif t["$switch"].is(p20) then t["$switch"].resolve(p20, p19) elseif t["$store"].is(p20) then t["$store"].resolve(p20, p19) else p20
			end
		end)
	end
}