local ExtentsModule = {}
ExtentsModule.__index = ExtentsModule

function ExtentsModule.new() --[[ Line: 14 ]]
	-- upvalues: ExtentsModule (copy)
	local self = setmetatable({}, ExtentsModule)
	self.min = vector.create(1e999, 1e999, 1e999)
	self.max = vector.create(-1e999, -1e999, -1e999)
	
	return self
end

function ExtentsModule:fromMinMax(Vector1) --[[ Line: 22 ]]
	-- upvalues: ExtentsModule (copy)
	local NewExtents = ExtentsModule.new()
	local config = { X = self.X, Y = self.Y, Z = self.Z }
	local config1 = { X = Vector1.X, Y = Vector1.Y, Z = Vector1.Z }
	
	for _, value in { "X", "Y", "Z" } do
		if config1[value] ~= -1e999 and config[value] ~= 1e999 and config1[value] < config[value] then
			local Entry = config[value]
			config[value] = config1[value]
			config1[value] = Entry
		end
	end
	NewExtents.min = Vector3.new(config.X, config.Y, config.Z)
	NewExtents.max = Vector3.new(config1.X, config1.Y, config1.Z)
	
	return NewExtents
end

function ExtentsModule:unionExtents(p1) --[[ Line: 42 ]]
	-- upvalues: ExtentsModule (copy)
	local NewExtents = ExtentsModule.new()
	NewExtents.min = self.min:Min(p1.min)
	NewExtents.max = self.max:Max(p1.max)
	
	return NewExtents
end

function ExtentsModule:intersectExtents(p1) --[[ Line: 49 ]]
	-- upvalues: ExtentsModule (copy)
	local config = { X = 1e999, Y = 1e999, Z = 1e999 }
	local config1 = { X = -1e999, Y = -1e999, Z = -1e999 }
	
	for _, value in { "X", "Y", "Z" } do
		if self.max[value] >= self.min[value] and p1.max[value] >= p1.min[value] then
			local Largest = math.max(self.min[value], p1.min[value])
			local Smallest = math.min(self.max[value], p1.max[value])
			
			if Largest <= Smallest then
				config[value] = Largest
				config1[value] = Smallest
			end
		end
	end
	local NewExtents = ExtentsModule.new()
	NewExtents.min = Vector3.new(config.X, config.Y, config.Z)
	NewExtents.max = Vector3.new(config1.X, config1.Y, config1.Z)
	
	return NewExtents
end

function ExtentsModule:expandToInclude(p2) --[[ Line: 72 ]]
	-- upvalues: ExtentsModule (copy)
	local NewExtents = ExtentsModule.new()
	NewExtents.min = self.min:Min(p2)
	NewExtents.max = self.max:Max(p2)
	
	return NewExtents
end

function ExtentsModule:isValid(): boolean --[[ Line: 79 ]]
	for _, value in { "X", "Y", "Z" } do
		if self.max[value] < self.min[value] then
			return false
		end
	end
	return true
end

function ExtentsModule.size(p2) --[[ Line: 88 ]]
	return if p2:isValid() then p2.max - p2.min else nil
end

function ExtentsModule.center(p2) --[[ Line: 95 ]]
	return if p2:isValid() then (p2.max + p2.min) / 2 else nil
end

return ExtentsModule