local FIntBuildExperienceLibraryWorldFocusRadiusModule = require(script:FindFirstAncestor("BuildExperience").Flags.FIntBuildExperienceLibraryWorldFocusRadius)
local GetModelBoxModule = require(script.Parent.getModelBox)

local function _(List)
	table.sort(List)
	local v1 = #List // 2
	
	return if #List % 2 == 1 then List[v1 + 1] else (List[v1] + List[v1 + 1]) / 2
end

local _ = function(Object)
	local SpawnLocation = if Object == nil then nil else Object:FindFirstChildWhichIsA("SpawnLocation", true)
	
	return if SpawnLocation == nil then nil else SpawnLocation.Position
end

local function getMiddleModelCenter(Entry)
	local List = {}
	local List1 = {}
	local List2 = {}
	
	for _, value in Entry do
		table.insert(List, value.center.X)
		table.insert(List1, value.center.Y)
		table.insert(List2, value.center.Z)
	end
	table.sort(List)
	local v1 = #List // 2
	local X = if #List % 2 == 1 then List[v1 + 1] else (List[v1] + List[v1 + 1]) / 2
	table.sort(List1)
	local v2 = #List1 // 2
	local Y = if #List1 % 2 == 1 then List1[v2 + 1] else (List1[v2] + List1[v2 + 1]) / 2
	table.sort(List2)
	local v3 = #List2 // 2
	local _Vector3 = Vector3.new(X, Y, if #List2 % 2 == 1 then List2[v3 + 1] else (List2[v3] + List2[v3 + 1]) / 2)
	local Center = Entry[1].center
	
	for i = 2, #Entry do
		if (Entry[i].center - _Vector3).Magnitude < (Center - _Vector3).Magnitude then
			Center = Entry[i].center
		end
	end
	return Center
end

return function(List, Object)
	-- upvalues: GetModelBoxModule (copy), getMiddleModelCenter (copy), FIntBuildExperienceLibraryWorldFocusRadiusModule (copy)
	local List1 = {}
	
	for _, value in List do
		local ModelBoxModule = GetModelBoxModule(value)
		
		if ModelBoxModule ~= nil then
			table.insert(List1, ModelBoxModule)
		end
	end
	if #List1 == 0 then
		return nil
	end
	local SpawnLocation = if Object == nil then nil else Object:FindFirstChildWhichIsA("SpawnLocation", true)
	local Position = (if SpawnLocation == nil then nil else SpawnLocation.Position) or getMiddleModelCenter(List1)
	local Distances = {}
	
	for _, value1 in List1 do
		Distances[value1] = (value1.center - Position).Magnitude
	end
	table.sort(List1, function(A, B): boolean
		-- upvalues: Distances (copy)
		return Distances[A] < Distances[B]
	end)
	local Minimum = List1[1].minimum
	local Maximum = List1[1].maximum
	
	for i = 2, math.max(1, (math.ceil(#List1 * 0.8))) do
		Minimum = Minimum:Min(List1[i].minimum)
		Maximum = Maximum:Max(List1[i].maximum)
	end
	local MagnitudeRatio = (Maximum - Minimum).Magnitude / 2
	local Largest = math.max(1, FIntBuildExperienceLibraryWorldFocusRadiusModule)
	
	return if Largest < MagnitudeRatio then { position = Position, radius = Largest } else {
		position = (Minimum + Maximum) / 2,
		radius = MagnitudeRatio
	}
end