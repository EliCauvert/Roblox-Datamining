local _ = require("../vendor/compose/core")
local RobloxModule = require("../vendor/compose/roblox")
local _ = require("./types")
local config = { normal = 0, limited = 1, none = 2 }
local t = {}
local t1 = {}

local function codecs(p1)
	-- upvalues: RobloxModule (copy)
	if p1.motionCodecs == nil then
		local Types = p1.types
		local CodecsResult = RobloxModule.codecs({
			datatypes = {
				Vector2 = Types.Vector2.new,
				Vector3 = Types.Vector3.new,
				Color3 = Types.Color3.new,
				UDim = Types.UDim.new,
				UDim2 = Types.UDim2.new,
				CFrame = function(Vector, Entry)
					-- upvalues: Types (copy)
					return Types.CFrame.new(Vector.X, Vector.Y, Vector.Z, Entry[1], Entry[2], Entry[3], Entry[4], Entry[5], Entry[6], Entry[7], Entry[8], Entry[9])
				end
			},
			readCFrame = function(CF)
				local list = { CF:GetComponents() }
				
				return list[1], list[2], list[3], {
					list[4], list[5], list[6], list[7], list[8], list[9], list[10], list[11],
					list[12]
				}
			end
		})
		p1.motionCodecs = CodecsResult
		
		return CodecsResult
	else
		return p1.motionCodecs
	end
end

local function resolve(ReadResult, p1)
	-- upvalues: t (copy), config (copy)
	local Limited: string = if p1 then "limited" else "normal"
	
	if ReadResult == nil then
		return Limited
	end
	if ReadResult == "normal" or ReadResult == "limited" or ReadResult == "none" then
		return if config[Limited] < config[ReadResult] then ReadResult else Limited
	end
	local Text = tostring(ReadResult)
	
	if not t[Text] then
		t[Text] = true
		warn(`Facet motionLevel must be "normal", "limited" or "none", got {Text}; following the device`)
	end
	return Limited
end

return {
	forValue = function(p1, p2)
		-- upvalues: codecs (copy)
		if type(p2) == "number" then
			return p1.runtime.motion(p1.Compose.numberCodec)
		else
			local CodecsResult = codecs(p1)
			local v1 = (p1.runtime.host.typeNameOf or typeof)(p2)
			local CodecsResultVector2 = if v1 == "Vector2" then CodecsResult.Vector2 elseif v1 == "Vector3" then CodecsResult.Vector3 elseif v1 == "Color3" then CodecsResult.Color3 elseif v1 == "UDim" then CodecsResult.UDim elseif v1 == "UDim2" then CodecsResult.UDim2 elseif v1 == "CFrame" then CodecsResult.CFrame else nil
			assert(CodecsResultVector2 ~= nil, "Facet motion requires a number or a supported Roblox datatype")
			
			return p1.runtime.motion(CodecsResultVector2)
		end
	end,
	level = function(p1)
		-- upvalues: resolve (copy)
		local Config = p1.config
		local GuiService = Config.guiService
		local ReducedMotionEnabledResult = if GuiService then p1.observe.ReducedMotionEnabled(GuiService) else nil
		
		return function(Callback)
			-- upvalues: resolve (upval), p1 (copy), Config (copy), ReducedMotionEnabledResult (copy)
			return (resolve(p1.read(Config.motionLevel, Callback), ReducedMotionEnabledResult ~= nil and (if Callback then Callback(ReducedMotionEnabledResult) else ReducedMotionEnabledResult:peek()) == true))
		end
	end,
	reduced = function(p1)
		-- upvalues: resolve (copy)
		local Config = p1.config
		local GuiService = Config.guiService
		local ReducedMotionEnabledResult = if GuiService then p1.observe.ReducedMotionEnabled(GuiService) else nil
		
		local function v26(Callback)
			-- upvalues: resolve (upval), p1 (copy), Config (copy), ReducedMotionEnabledResult (copy)
			return (resolve(p1.read(Config.motionLevel, Callback), ReducedMotionEnabledResult ~= nil and (if Callback then Callback(ReducedMotionEnabledResult) else ReducedMotionEnabledResult:peek()) == true))
		end
		
		return function(p2): boolean
			-- upvalues: v26 (copy)
			return v26(p2) ~= "normal"
		end
	end,
	resolve = resolve,
	check = function(p1)
		if p1 ~= nil and p1 ~= "normal" and p1 ~= "limited" and p1 ~= "none" then
			error(`Facet motionLevel must be "normal", "limited" or "none", got {tostring(p1)}`, 0)
		end
	end,
	publish = function(p1, p2, p3)
		-- upvalues: t1 (copy)
		if p3 == nil then return end
		local List = p2[t1] or {}
		p2[t1] = List
		local Value = { p3 }
		table.insert(List, Value)
		
		if p1.currentOwner() ~= nil then
			p1.cleanup(function()
				-- upvalues: List (copy), Value (copy)
				local FoundIndex: number? = table.find(List, Value)
				
				if FoundIndex then
					table.remove(List, FoundIndex)
				end
			end)
		end
	end,
	published = function(p1)
		-- upvalues: t1 (copy)
		local List = {}
		local v1 = p1[t1] or {}
		for _, value in v1 do
			table.insert(List, value[1])
		end
		return List
	end
}