local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(script.Parent.ResolverTypes)
local TransformJsonLeafFirstModule = require(script.Parent.transformJsonLeafFirst)
local _ = require(GenericAbuseReporting.BeduiV2.Types)

local function getByPath(Attribute, Text: string) --[[ Line: 18 ]]
	local Attribute1 = Attribute
	
	for _, value in ipairs((string.split(Text, "."))) do
		if type(Attribute1) ~= "table" or Attribute1 == nil then
			return nil
		end
		Attribute1 = Attribute1[value]
		
		if Attribute1 == nil then
			return nil
		end
	end
	return Attribute1
end

local function _(Enabled): boolean --[[ Line: 47 | Named "isTruthy" ]]
	return Enabled ~= nil and (Enabled ~= false and Enabled ~= "")
end

local config = {
	["$attribute"] = {
		is = function(p1): boolean --[[ Line: 57 ]]
			return type(p1) == "table" and (p1["$attribute"] ~= nil and type(p1["$attribute"]) == "string")
		end,
		resolve = function(p1, p2) --[[ Line: 60 ]]
			-- upvalues: getByPath (copy)
			return (getByPath(p2.attribute, p1["$attribute"]))
		end
	},
	["$resource"] = {
		is = function(p1): boolean --[[ Line: 66 ]]
			return type(p1) == "table" and (p1["$resource"] ~= nil and type(p1["$resource"]) == "string")
		end,
		resolve = function(p1, p2) --[[ Line: 69 ]]
			local Resource = p2.resources[p1["$resource"]]
			
			return if Resource then Resource.value else nil
		end
	},
	["$switch"] = {
		is = function(p1): boolean --[[ Line: 75 ]]
			return type(p1) == "table" and (p1["$switch"] ~= nil and type(p1["$switch"]) == "table")
		end,
		resolve = function(p1, _) --[[ Line: 78 ]]
			for _, value in ipairs(p1["$switch"]) do
				if type(value) == "string" then
					return value
				elseif type(value) == "table" and value.condition then
					local Condition = value.condition
					
					if Condition ~= nil and (Condition ~= false and Condition ~= "") then
						return value.value
					end
				end
			end
			return nil
		end
	},
	["$store"] = {
		is = function(p2): boolean --[[ Line: 93 ]]
			return type(p2) == "table" and (p2["$store"] ~= nil and type(p2["$store"]) == "string")
		end,
		resolve = function(p2, p3) --[[ Line: 96 ]]
			-- upvalues: getByPath (copy)
			return (getByPath(p3.store, p2["$store"]))
		end
	}
}

return {
	resolveArConfig = function(p2, p3) --[[ Line: 139 ]]
		-- upvalues: config (copy), TransformJsonLeafFirstModule (copy)
		local config1 = {
			attribute = p2.attributes,
			resources = {},
			store = p3.store
		}
		local config2 = {
			attribute = p2.attributes,
			resources = TransformJsonLeafFirstModule(p2.resources, function(p4) --[[ Line: 113 | Named "replacerFn" ]]
				-- upvalues: config (upval), config1 (copy)
				if type(p4) == "table" then
					if config["$attribute"].is(p4) then
						return config["$attribute"].resolve(p4, config1)
					elseif config["$resource"].is(p4) then
						return config["$resource"].resolve(p4, config1)
					elseif config["$switch"].is(p4) then
						return config["$switch"].resolve(p4, config1)
					elseif config["$store"].is(p4) then
						return config["$store"].resolve(p4, config1)
					end
				end
				return p4
			end),
			store = p3.store
		}
		
		return (TransformJsonLeafFirstModule(p2, function(p4) --[[ Line: 113 | Named "replacerFn" ]]
			-- upvalues: config (upval), config2 (copy)
			if type(p4) == "table" then
				if config["$attribute"].is(p4) then
					return config["$attribute"].resolve(p4, config2)
				elseif config["$resource"].is(p4) then
					return config["$resource"].resolve(p4, config2)
				elseif config["$switch"].is(p4) then
					return config["$switch"].resolve(p4, config2)
				elseif config["$store"].is(p4) then
					return config["$store"].resolve(p4, config2)
				end
			end
			return p4
		end))
	end,
	resolveConfig = function(p2, p3) --[[ Line: 105 ]]
		-- upvalues: config (copy), TransformJsonLeafFirstModule (copy)
		return (TransformJsonLeafFirstModule(p2, function(p4) --[[ Line: 113 | Named "replacerFn" ]]
			-- upvalues: config (upval), p3 (copy)
			if type(p4) == "table" then
				if config["$attribute"].is(p4) then
					return config["$attribute"].resolve(p4, p3)
				elseif config["$resource"].is(p4) then
					return config["$resource"].resolve(p4, p3)
				elseif config["$switch"].is(p4) then
					return config["$switch"].resolve(p4, p3)
				elseif config["$store"].is(p4) then
					return config["$store"].resolve(p4, p3)
				end
			end
			return p4
		end))
	end
}