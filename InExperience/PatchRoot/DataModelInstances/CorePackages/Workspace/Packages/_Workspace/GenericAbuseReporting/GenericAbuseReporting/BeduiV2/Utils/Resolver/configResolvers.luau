local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(script.Parent.ResolverTypes)
local transformJsonLeafFirstModule = require(script.Parent.transformJsonLeafFirst)
local _ = require(genericAbuseReporting.BeduiV2.Types)
local fFlagAbuseReportConfigStoreResolver = require(parent.SharedFlags).FFlagAbuseReportConfigStoreResolver

local function getByPath(p0, p1) --[[ line: 23 ]]
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

local function _(p2) --[[ line: 54 | named "isTruthy" ]]
	return p2 ~= nil and (p2 ~= false and p2 ~= "")
end

local t = {
	["$attribute"] = {
		is = function(p3) --[[ line: 64 ]]
			return type(p3) == "table" and (p3["$attribute"] ~= nil and type(p3["$attribute"]) == "string")
		end,
		resolve = function(p4, p5) --[[ line: 67 ]]
			-- upvalues: getByPath (ref)
			return getByPath(p5.attribute, p4["$attribute"])
		end
	},
	["$resource"] = {
		is = function(p6) --[[ line: 73 ]]
			return type(p6) == "table" and (p6["$resource"] ~= nil and type(p6["$resource"]) == "string")
		end,
		resolve = function(p7, p8) --[[ line: 76 ]]
			local var5 = p8.resources[p7["$resource"]]
			
			return if var5 then var5.value else nil
		end
	},
	["$context"] = {
		is = function(p9) --[[ line: 82 ]]
			return type(p9) == "table" and (p9["$context"] ~= nil and type(p9["$context"]) == "string")
		end,
		resolve = function(p10, p11) --[[ line: 85 ]]
			-- upvalues: getByPath (ref)
			return getByPath(p11.context, p10["$context"])
		end
	},
	["$switch"] = {
		is = function(p12) --[[ line: 90 ]]
			return type(p12) == "table" and (p12["$switch"] ~= nil and type(p12["$switch"]) == "table")
		end,
		resolve = function(p13, _) --[[ line: 93 ]]
			for i, v in ipairs(p13["$switch"]) do
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
	["$formData"] = {
		is = function(p14) --[[ line: 108 ]]
			return type(p14) == "table" and (p14["$formData"] ~= nil and type(p14["$formData"]) == "string")
		end,
		resolve = function(p15, p16) --[[ line: 111 ]]
			-- upvalues: getByPath (ref)
			return getByPath(p16.formData, p15["$formData"])
		end
	},
	["$store"] = {
		is = function(p17) --[[ line: 116 ]]
			return type(p17) == "table" and (p17["$store"] ~= nil and type(p17["$store"]) == "string")
		end,
		resolve = function(p18, p19) --[[ line: 119 ]]
			-- upvalues: getByPath (ref)
			return getByPath(p19.store, p18["$store"])
		end
	}
}

return {
	resolveArConfig = function(p20, p21) --[[ line: 168 ]]
		-- upvalues: fFlagAbuseReportConfigStoreResolver (ref), t (ref), transformJsonLeafFirstModule (ref)
		local t_1 = {
			attribute = p20.attributes,
			resources = {},
			context = if not fFlagAbuseReportConfigStoreResolver then p21.context else {},
			formData = if not fFlagAbuseReportConfigStoreResolver then p21.formData else {},
			store = if fFlagAbuseReportConfigStoreResolver then p21.store else {}
		}
		t_1 = {
			attribute = p20.attributes,
			resources = transformJsonLeafFirstModule(p20.resources, function(p22) --[[ line: 138 | named "replacerFn" ]]
				-- upvalues: t (copy), t_1 (ref), fFlagAbuseReportConfigStoreResolver (copy)
				if type(p22) == "table" then
					return if t["$attribute"].is(p22) then t["$attribute"].resolve(p22, t_1) elseif t["$resource"].is(p22) then t["$resource"].resolve(p22, t_1) elseif not (not fFlagAbuseReportConfigStoreResolver and t["$context"].is(p22)) then if t["$switch"].is(p22) then t["$switch"].resolve(p22, t_1) elseif not (not fFlagAbuseReportConfigStoreResolver and t["$formData"].is(p22)) then if fFlagAbuseReportConfigStoreResolver and t["$store"].is(p22) then t["$store"].resolve(p22, t_1) else p22 else t["$formData"].resolve(p22, t_1) else t["$context"].resolve(p22, t_1)
				end
			end),
			context = if not fFlagAbuseReportConfigStoreResolver then p21.context else {},
			formData = if not fFlagAbuseReportConfigStoreResolver then p21.formData else {},
			store = if fFlagAbuseReportConfigStoreResolver then p21.store else {}
		}
		
		return transformJsonLeafFirstModule(p20, function(p23) --[[ line: 138 | named "replacerFn" ]]
			-- upvalues: t (copy), t_1 (ref), fFlagAbuseReportConfigStoreResolver (copy)
			if type(p23) == "table" then
				return if t["$attribute"].is(p23) then t["$attribute"].resolve(p23, t_1) elseif t["$resource"].is(p23) then t["$resource"].resolve(p23, t_1) elseif not (not fFlagAbuseReportConfigStoreResolver and t["$context"].is(p23)) then if t["$switch"].is(p23) then t["$switch"].resolve(p23, t_1) elseif not (not fFlagAbuseReportConfigStoreResolver and t["$formData"].is(p23)) then if fFlagAbuseReportConfigStoreResolver and t["$store"].is(p23) then t["$store"].resolve(p23, t_1) else p23 else t["$formData"].resolve(p23, t_1) else t["$context"].resolve(p23, t_1)
			end
		end)
	end,
	resolveConfig = function(p24, p25) --[[ line: 128 ]]
		-- upvalues: t (ref), fFlagAbuseReportConfigStoreResolver (ref), transformJsonLeafFirstModule (ref)
		return transformJsonLeafFirstModule(p24, function(p26) --[[ line: 138 | named "replacerFn" ]]
			-- upvalues: t (copy), p25 (ref), fFlagAbuseReportConfigStoreResolver (copy)
			if type(p26) == "table" then
				return if t["$attribute"].is(p26) then t["$attribute"].resolve(p26, p25) elseif t["$resource"].is(p26) then t["$resource"].resolve(p26, p25) elseif not (not fFlagAbuseReportConfigStoreResolver and t["$context"].is(p26)) then if t["$switch"].is(p26) then t["$switch"].resolve(p26, p25) elseif not (not fFlagAbuseReportConfigStoreResolver and t["$formData"].is(p26)) then if fFlagAbuseReportConfigStoreResolver and t["$store"].is(p26) then t["$store"].resolve(p26, p25) else p26 else t["$formData"].resolve(p26, p25) else t["$context"].resolve(p26, p25)
			end
		end)
	end
}