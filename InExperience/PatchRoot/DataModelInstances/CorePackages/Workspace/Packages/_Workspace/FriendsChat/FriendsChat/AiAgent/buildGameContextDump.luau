local playersService = game:GetService("Players")
local workspaceService = game:GetService("Workspace")
local list = {
	"ClassName", "Text", "PlaceholderText", "Position", "AbsolutePosition", "Size",
	"AbsoluteSize", "Color", "BackgroundColor3", "TextColor3", "ImageColor3",
	"BorderColor3", "Transparency", "BackgroundTransparency", "TextTransparency",
	"Visible", "Enabled", "Image", "Texture", "Material", "TextSize",
	"DisplayName", "UserId"
}

local function getLocalCharacterPosition() --[[ line: 60 ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer == nil then
		return nil
	end
	local character = localPlayer.Character
	
	if character == nil then
		return nil
	end
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart == nil or not humanoidRootPart:IsA("BasePart") then
		humanoidRootPart = character.PrimaryPart
	end
	return if humanoidRootPart == nil or not humanoidRootPart:IsA("BasePart") then nil else humanoidRootPart.Position
end

local function _(p0, p1) --[[ line: 79 | named "truncate" ]]
	return if #p0 <= p1 then p0 else string.sub(p0, 1, p1 - 3) .. "..."
end

local _ = function(value) --[[ line: 86 | named "round" ]]
	return math.floor(value + 0.5)
end

local function compactColor3(p2) --[[ line: 90 ]]
	return string.format("#%02x%02x%02x", math.clamp(math.floor(p2.R * 255 + 0.5), 0, 255), math.clamp(math.floor(p2.G * 255 + 0.5), 0, 255), math.clamp(math.floor(p2.B * 255 + 0.5), 0, 255))
end

local _ = function(p3) --[[ line: 97 | named "compactVector3" ]]
	return `({math.floor(p3.X + 0.5)},{math.floor(p3.Y + 0.5)},{math.floor(p3.Z + 0.5)})`
end

local _ = function(p4) --[[ line: 101 | named "compactVector2" ]]
	return `({math.floor(p4.X + 0.5)},{math.floor(p4.Y + 0.5)})`
end

local function compactUDim2(p5) --[[ line: 105 ]]
	return string.format("{%.2f,%d}{%.2f,%d}", p5.X.Scale, math.floor(p5.X.Offset + 0.5), p5.Y.Scale, math.floor(p5.Y.Offset + 0.5))
end

local t = {
	Text = true,
	PlaceholderText = true,
	Image = true,
	Texture = true
}

local _ = function(p6, p7) --[[ line: 122 | named "isDefaultVisual" ]]
	-- upvalues: t (ref)
	return if t[p6] then p7 == "" elseif p6 == "Visible" or p6 == "Enabled" then p7 == true elseif p6 == "Transparency" or p6 == "TextTransparency" then p7 == 0 elseif p6 == "BackgroundTransparency" then p7 == 1 else p6 == "Material" and (if p7 ~= Enum.Material.Plastic then p7 == Enum.Material.SmoothPlastic else true)
end

local function compactValue(p8) --[[ line: 138 ]]
	-- upvalues: compactColor3 (ref), compactUDim2 (ref)
	local var16 = typeof(p8)
	
	return if var16 == "string" then if #p8 <= 40 then p8 else string.sub(p8, 1, 37) .. "..." elseif var16 == "Color3" then compactColor3(p8) elseif var16 == "Vector3" then `({math.floor(p8.X + 0.5)},{math.floor(p8.Y + 0.5)},{math.floor(p8.Z + 0.5)})` elseif var16 == "Vector2" then `({math.floor(p8.X + 0.5)},{math.floor(p8.Y + 0.5)})` elseif var16 == "UDim2" then compactUDim2(p8) elseif var16 == "EnumItem" then p8.Name elseif var16 == "number" then tostring(math.floor(p8 * 100 + 0.5) / 100) else tostring(p8)
end

local function dumpProperty(p9, p10) --[[ line: 158 ]]
	-- upvalues: t (ref), compactValue (ref)
	local ok, status = pcall(function() --[[ line: 159 ]]
		-- upvalues: p9 (ref), p10 (ref)
		return p9[p10]
	end)
	
	if ok and status ~= nil then
		local var17
		if t[p10] then
			local _ = status == ""
		elseif p10 == "Visible" or p10 == "Enabled" then
			local _ = status == true
		elseif p10 == "Transparency" or p10 == "TextTransparency" then
			local _ = status == 0
		elseif p10 == "BackgroundTransparency" then
			local _ = status == 1
		elseif p10 == "Material" then
			var17 = true
			
			if status ~= Enum.Material.Plastic then
				local _ = status == Enum.Material.SmoothPlastic
			end
		else
			var17 = false
		end
		return if var17 then nil else compactValue(status)
	end
end

local function dumpInstance(p11, p12) --[[ line: 169 ]]
	-- upvalues: dumpProperty (ref)
	local name = p11.Name
	local var18 = false
	
	for i, v in p12 do
		if v ~= "ClassName" then
			local var19 = dumpProperty(p11, v)
			
			if var19 then
				if var18 then
					name ..= ", "
				else
					var18 = true
					name ..= "   ("
				end
				name ..= v .. "=" .. var19
			end
		end
		if var18 then
			name ..= ", "
		else
			var18 = true
			name ..= "   ("
		end
		name ..= "ClassName=" .. p11.ClassName
	end
	if var18 then
		name ..= ")"
	end
	return name
end

local function isVisuallyInterestingGui(p13) --[[ line: 200 ]]
	-- upvalues: dumpProperty (ref)
	return if p13:IsA("GuiObject") then if dumpProperty(p13, "Visible") == "false" then false elseif p13:IsA("TextLabel") or p13:IsA("TextButton") or p13:IsA("TextBox") then if dumpProperty(p13, "Text") == nil then dumpProperty(p13, "PlaceholderText") ~= nil else true elseif p13:IsA("ImageLabel") or p13:IsA("ImageButton") then dumpProperty(p13, "Image") ~= nil elseif p13:IsA("ViewportFrame") or p13:IsA("VideoFrame") then true else dumpProperty(p13, "BackgroundColor3") ~= nil and dumpProperty(p13, "BackgroundTransparency") ~= nil else false
end

local function collectNearbyWorkspace(p14) --[[ line: 220 ]]
	-- upvalues: getLocalCharacterPosition (ref), workspaceService (ref), dumpInstance (ref), list (ref)
	local t = {}
	local var21 = getLocalCharacterPosition()
	
	if var21 == nil then
		table.insert(p14, "[WorkspaceNearby] skipped \226\128\148 no LocalPlayer character position")
		
		return { label = "NEARBY", count = 0, entries = t }
	end
	table.insert(p14, `[WorkspaceNearby] radius={50} origin={`({math.floor(var21.X + 0.5)},{math.floor(var21.Y + 0.5)},{math.floor(var21.Z + 0.5)})`}`)
	local var22 = workspaceService:GetPartBoundsInRadius(var21, 50)
	local t_1 = {}
	local t_2 = {}
	local var25 = 0
	
	for i, v in var22 do
		if var25 < 100 then
			var25 += 1
			table.insert(p14, `[WorkspaceNearby] {dumpInstance(v, list)}`)
			local var27 = dumpInstance(v, {
				"ClassName",
				"Color",
				"Material",
				"Size",
				"Transparency"
			})
			
			if t_2[var27] == nil then
				t_2[var27] = 0
				table.insert(t_1, var27)
			end
			t_2[var27] += 1
		end
		table.insert(p14, `[WorkspaceNearby] truncated at {100}`)
		break
	end
	for i, v_1 in t_1 do
		local var26 = t_2[v_1]
		table.insert(t, if var26 > 1 then `{v_1} x{var26}` else v_1)
	end
	return { label = "NEARBY", count = var25, entries = t }
end

local function collectLocalPlayerUi(p15) --[[ line: 265 ]]
	-- upvalues: playersService (ref), isVisuallyInterestingGui (ref), dumpInstance (ref), list (ref)
	local t = {}
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer == nil then
		table.insert(p15, "[PlayerGui] skipped \226\128\148 no LocalPlayer")
		
		return { label = "UI", count = 0, entries = t }
	end
	local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
	
	if playerGui == nil then
		table.insert(p15, "[PlayerGui] skipped \226\128\148 PlayerGui missing")
		
		return { label = "UI", count = 0, entries = t }
	end
	table.insert(p15, "[PlayerGui] visual instances")
	local var30 = 0
	
	for i, v in playerGui:GetDescendants() do
		if var30 >= 100 then
			table.insert(p15, `[PlayerGui] truncated at {100}`)
			break
		elseif isVisuallyInterestingGui(v) then
			var30 += 1
			local var31 = dumpInstance(v, list)
			table.insert(p15, `[PlayerGui] {var31}`)
			table.insert(t, var31)
		end
	end
	return { label = "UI", count = var30, entries = t }
end

local function collectPlayers(p16) --[[ line: 297 ]]
	-- upvalues: playersService (ref), dumpInstance (ref)
	local t = {}
	local localPlayer = playersService.LocalPlayer
	local var33 = if localPlayer then localPlayer.UserId else nil
	table.insert(p16, "[Players]")
	local var34 = 0
	
	for i, v in playersService:GetPlayers() do
		var34 += 1
		local var35 = dumpInstance(v, { "ClassName", "DisplayName", "UserId" })
		
		if var33 ~= nil and v.UserId == var33 then
			var35 ..= " local=true"
		end
		if v.Character ~= nil then
			var35 ..= " character=true"
		end
		table.insert(p16, `[Players] {var35}`)
		table.insert(t, var35)
	end
	return { label = "PLAYERS", count = var34, entries = t }
end

local function collectSection(p17, p18, p19) --[[ line: 318 ]]
	local ok, status = pcall(p19, p17)
	
	if ok then
		return status
	end
	table.insert(p17, `[{p18}] error: {tostring(status)}`)
	
	return {
		count = 0,
		label = p18,
		entries = { `error: {tostring(status)}` }
	}
end

local _ = function(p20, p21) --[[ line: 327 | named "appendSection" ]]
	table.insert(p20, `{p21.label}({p21.count}):`)
	
	if #p21.entries == 0 then
		table.insert(p20, "none")
		
		return
	end
	for i, v in p21.entries do
		table.insert(p20, v)
	end
end

return function() --[[ line: 338 | named "buildGameContextDump" ]]
	-- upvalues: collectSection (ref), collectNearbyWorkspace (ref), collectLocalPlayerUi (ref), collectPlayers (ref)
	local list = { "[ChatAiAgent][GameContext] begin" }
	local var37 = collectSection(list, "WorkspaceNearby", collectNearbyWorkspace)
	local var38 = collectSection(list, "PlayerGui", collectLocalPlayerUi)
	local var39 = collectSection(list, "Players", collectPlayers)
	table.insert(list, "[ChatAiAgent][GameContext] end")
	local t = {}
	table.insert(t, `{var37.label}({var37.count}):`)
	
	if #var37.entries == 0 then
		table.insert(t, "none")
	else
		for i, v in var37.entries do
			table.insert(t, v)
		end
	end
	table.insert(t, `{var38.label}({var38.count}):`)
	
	if #var38.entries == 0 then
		table.insert(t, "none")
	else
		for i, v in var38.entries do
			table.insert(t, v)
		end
	end
	table.insert(t, `{var39.label}({var39.count}):`)
	
	if #var39.entries == 0 then
		table.insert(t, "none")
	else
		for i, v in var39.entries do
			table.insert(t, v)
		end
	end
	return {
		lines = list,
		chatItems = t,
		summary = `nearby={var37.count} ui={var38.count} players={var39.count}`
	}
end