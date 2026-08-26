local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(script.Parent.ResolverTypes)
local transformJsonLeafFirstModule = require(script.Parent.transformJsonLeafFirst)
local _ = require(genericAbuseReporting.BeduiV2.Types)

local function getByPath(p1, p2)
	local var1 = p1
	
	for i, v in ipairs(string.split(p2, ".")) do
		if type(var1) == "table" and var1 ~= nil then
			var1 = var1[v]
			
			if var1 == nil then
				return nil
			end
		end
		return nil
	end
	return var1
end

local function _(p3)
	return p3 ~= nil and (p3 ~= false and p3 ~= "")
end

local t = {
	["$attribute"] = {
		is = function(p3)
			return type(p3) == "table" and (p3["$attribute"] ~= nil and type(p3["$attribute"]) == "string")
		end,
		resolve = function(p3, p4)
			-- upvalues: getByPath (ref)
			return getByPath(p4.attribute, p3["$attribute"])
		end
	},
	["$resource"] = {
		is = function(p3)
			return type(p3) == "table" and (p3["$resource"] ~= nil and type(p3["$resource"]) == "string")
		end,
		resolve = function(p3, p4)
			local var2 = p4.resources[p3["$resource"]]
			
			return if var2 then var2.value else nil
		end
	},
	["$switch"] = {
		is = function(p3)
			return type(p3) == "table" and (p3["$switch"] ~= nil and type(p3["$switch"]) == "table")
		end,
		resolve = function(p3, _)
			for i, v in ipairs(p3["$switch"]) do
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
		is = function(p4)
			return type(p4) == "table" and (p4["$store"] ~= nil and type(p4["$store"]) == "string")
		end,
		resolve = function(p4, p5)
			-- upvalues: getByPath (ref)
			return getByPath(p5.store, p4["$store"])
		end
	}
}

return {
	resolveArConfig = function(p4, p5)
		-- upvalues: t (ref), transformJsonLeafFirstModule (ref)
		local t_1 = {
			attribute = p4.attributes,
			resources = {},
			store = p5.store
		}
		t_1 = {
			attribute = p4.attributes,
			resources = transformJsonLeafFirstModule(p4.resources, function(p6)
				-- upvalues: t (copy), t_1 (ref)
				if type(p6) == "table" then
					return if t["$attribute"].is(p6) then t["$attribute"].resolve(p6, t_1) elseif t["$resource"].is(p6) then t["$resource"].resolve(p6, t_1) elseif t["$switch"].is(p6) then t["$switch"].resolve(p6, t_1) elseif t["$store"].is(p6) then t["$store"].resolve(p6, t_1) else p6
				end
			end),
			store = p5.store
		}
		
		return transformJsonLeafFirstModule(p4, function(p6)
			-- upvalues: t (copy), t_1 (ref)
			if type(p6) == "table" then
				return if t["$attribute"].is(p6) then t["$attribute"].resolve(p6, t_1) elseif t["$resource"].is(p6) then t["$resource"].resolve(p6, t_1) elseif t["$switch"].is(p6) then t["$switch"].resolve(p6, t_1) elseif t["$store"].is(p6) then t["$store"].resolve(p6, t_1) else p6
			end
		end)
	end,
	resolveConfig = function(p4, p5)
		-- upvalues: t (ref), transformJsonLeafFirstModule (ref)
		return transformJsonLeafFirstModule(p4, function(p6)
			-- upvalues: t (copy), p5 (ref)
			if type(p6) == "table" then
				return if t["$attribute"].is(p6) then t["$attribute"].resolve(p6, p5) elseif t["$resource"].is(p6) then t["$resource"].resolve(p6, p5) elseif t["$switch"].is(p6) then t["$switch"].resolve(p6, p5) elseif t["$store"].is(p6) then t["$store"].resolve(p6, p5) else p6
			end
		end)
	end
}