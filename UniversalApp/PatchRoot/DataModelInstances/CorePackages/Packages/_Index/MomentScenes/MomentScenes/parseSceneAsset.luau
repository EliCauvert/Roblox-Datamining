local _ = require(script.Parent.Types)

local function readValue(Object)
	-- upvalues: readValue (copy)
	if Object:IsA("StringValue") then
		return Object.Value
	end
	if Object:IsA("IntValue") or Object:IsA("NumberValue") then
		return Object.Value
	end
	if Object:IsA("BoolValue") then
		return Object.Value
	end
	if Object:IsA("Color3Value") then
		return Object.Value
	end
	if Object:IsA("Vector3Value") then
		return Object.Value
	end
	if Object:IsA("CFrameValue") then
		return Object.Value
	end
	if Object:IsA("ObjectValue") then
		return Object.Value
	end
	if not Object:IsA("Folder") then
		return nil
	end
	local Children = Object:GetChildren()
	local List = {}
	local Flag = #Children > 0
	for _, child in Children do
		local Number: number? = tonumber(child.Name)
		
		if Number == nil or Number < 1 or Number % 1 ~= 0 then
			Flag = false
			break
		else
			table.insert(List, { index = Number, child = child })
			continue
		end
	end
	if Flag then
		table.sort(List, function(A, B): boolean
			return A.index < B.index
		end)
		local t = {}
		
		for i, value in List do
			local Value = readValue(value.child)
			t[i] = Value
			
			if Value == nil then
				warn(`parseSceneAsset: {value.child:GetFullName()} is a {value.child.ClassName}, which holds no value this parser reads. Slot {i} is empty.`)
			end
		end
		return t
	else
		local t1 = {}
		
		for _, child1 in Children do
			t1[child1.Name] = readValue(child1)
		end
		return t1
	end
end

local function findSceneFolder(Object)
	local MomentScene = Object:FindFirstChild("MomentScene")
	
	if MomentScene ~= nil then
		return MomentScene
	end
	if Object:FindFirstChild("Type") ~= nil then
		return Object
	end
	if Object:FindFirstChild("Args") ~= nil then
		return Object
	end
	for _, child in Object:GetChildren() do
		if child:FindFirstChild("Type") ~= nil or child:FindFirstChild("Args") ~= nil then
			return child
		end
	end
	return Object
end

return function(p1)
	-- upvalues: findSceneFolder (copy), readValue (copy)
	local SceneFolder = findSceneFolder(p1)
	local v1 = nil
	local Type = if SceneFolder then SceneFolder:FindFirstChild("Type") else nil
	
	if Type ~= nil and Type:IsA("StringValue") then
		v1 = Type.Value
	end
	local Args = {}
	local Args1 = if SceneFolder then SceneFolder:FindFirstChild("Args") else nil
	
	if Args1 ~= nil then
		for _, child in Args1:GetChildren() do
			Args[child.Name] = readValue(child)
		end
	end
	return { type = v1, args = Args }
end