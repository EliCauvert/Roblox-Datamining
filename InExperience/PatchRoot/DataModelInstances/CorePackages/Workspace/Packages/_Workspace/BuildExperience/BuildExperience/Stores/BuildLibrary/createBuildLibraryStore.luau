local SignalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)
local BuildExperienceLibraryImageClasses = game:DefineFastString("BuildExperienceLibraryImageClasses", "Decal,Texture,ImageLabel,ImageButton")
local BuildExperienceLibraryRoots = game:DefineFastString("BuildExperienceLibraryRoots", "Workspace,ReplicatedStorage,ReplicatedFirst,Lighting,SoundService,StarterGui,StarterPack,StarterPlayer")
local BuildExperienceLibraryDescriptionAttribute = game:DefineFastString("BuildExperienceLibraryDescriptionAttribute", "SemanticDescription")
local config = {
	Decal = "Texture",
	Texture = "Texture",
	ImageLabel = "Image",
	ImageButton = "Image",
	ParticleEmitter = "Texture",
	Beam = "Texture",
	Trail = "Texture"
}
local config1 = { Model = 1, Image = 2, Sound = 3 }

local function parseList(Text: string) --[[ Line: 46 ]]
	local List = {}
	
	for i in string.gmatch(Text, "[^,]+") do
		local Match: string? = string.match(i, "^%s*(.-)%s*$")
		
		if Match ~= "" and not table.find(List, Match) then
			table.insert(List, Match)
		end
	end
	return List
end

return function(p1) --[[ Line: 57 | Named "createBuildLibraryStore" ]]
	-- upvalues: parseList (copy), BuildExperienceLibraryImageClasses (copy), BuildExperienceLibraryRoots (copy), SignalsModule (copy), config (copy), BuildExperienceLibraryDescriptionAttribute (copy), config1 (copy)
	local P0 = p1 or game
	local ParseListResult = parseList(BuildExperienceLibraryImageClasses)
	local ParseListResult1 = parseList(BuildExperienceLibraryRoots)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local self = setmetatable({}, { __mode = "k" })
	local Count = 0
	local Ancestor = nil
	
	local function _(Key) --[[ Line: 65 | Named "getId" ]]
		-- upvalues: self (copy), Count (ref)
		if self[Key] == nil then
			Count += 1
			self[Key] = `Instance:{Count}`
		end
		return self[Key]
	end
	
	local t = {}
	
	local function sameItems(p2, List): boolean --[[ Line: 76 ]]
		if #p2 ~= #List then
			return false
		end
		for i, value in List do
			local v1 = p2[i]
			
			for i1, value1 in value do
				if v1[i1] ~= value1 then
					return false
				end
			end
			for i2 in v1 do
				if value[i2] == nil then
					return false
				end
			end
		end
		return true
	end
	
	return {
		refresh = function() --[[ Line: 96 ]]
			-- upvalues: Ancestor (ref), self (copy), Count (ref), ParseListResult1 (copy), P0 (copy), ParseListResult (copy), config (upval), BuildExperienceLibraryDescriptionAttribute (upval), config1 (upval), sameItems (copy), Signal (copy), t (ref), Signal2 (copy)
			local List = {}
			local t1 = {}
			Ancestor = nil
			
			local function parentFolderId(Parent, Parent1, RootName, Kind): string? --[[ Line: 100 ]]
				-- upvalues: self (upval), Count (upval), t1 (copy), List (copy), parentFolderId (copy)
				local Parent2 = Parent.Parent
				while Parent2 ~= nil and Parent2 ~= Parent1 do
					if Parent2.ClassName ~= "Folder" then
						Parent2 = Parent2.Parent
						continue
					end
					local v2 = "%*:%*"
					local Parent3 = Parent2
					
					if self[Parent3] == nil then
						Count += 1
						self[Parent3] = `Instance:{Count}`
					end
					local FormatResult: string = v2:format(self[Parent3], Kind)
					
					if not t1[FormatResult] then
						t1[FormatResult] = true
						table.insert(List, {
							className = "Folder",
							id = FormatResult,
							instance = Parent2,
							displayName = Parent2.Name,
							path = Parent2:GetFullName(),
							kind = Kind,
							folderId = parentFolderId(Parent2, Parent1, RootName, Kind),
							rootName = RootName
						})
					end
					return FormatResult
				end
				return nil
			end
			
			for _, RootName in ParseListResult1 do
				local Success, Result = pcall(function() --[[ Line: 130 ]]
					-- upvalues: P0 (upval), RootName (copy)
					return P0:GetService(RootName)
				end)
				
				if Success and Result ~= nil then
					if RootName == "Workspace" then
						Ancestor = Result
					end
					local Children = Result:GetChildren()
					local Count1 = 1
					while Count1 <= #Children do
						local Child = Children[Count1]
						Count1 += 1
						local ClassName = Child.ClassName
						
						if ClassName ~= "Model" then
							for _, child in Child:GetChildren() do
								table.insert(Children, child)
							end
						end
						local Entry = if table.find(ParseListResult, ClassName) then config[ClassName] else nil
						local Kind = nil
						
						if ClassName == "Model" then
							Kind = "Model"
						elseif ClassName == "Sound" then
							Kind = "Sound"
							Entry = "SoundId"
						else
							if Entry == nil then continue end
							Kind = "Image"
						end
						local ChildEntry = if Entry == nil then nil else Child[Entry]
						
						if ChildEntry == "" then continue end
						local Attribute = Child:GetAttribute(BuildExperienceLibraryDescriptionAttribute)
						local t2 = {}
						
						if self[Child] == nil then
							Count += 1
							self[Child] = `Instance:{Count}`
						end
						t2.id = self[Child]
						t2.instance = Child
						t2.displayName = Child.Name
						t2.path = Child:GetFullName()
						t2.className = ClassName
						t2.kind = Kind
						t2.folderId = parentFolderId(Child, Result, RootName, Kind)
						t2.rootName = RootName
						t2.description = if type(Attribute) == "string" and Attribute ~= "" then Attribute else nil
						t2.image = if Kind == "Image" then ChildEntry else nil
						t2.soundId = if Kind == "Sound" then ChildEntry else nil
						t2.model = if Kind == "Model" then Child else nil
						table.insert(List, t2)
					end
				end
			end
			local t3 = {}
			
			for _, value in List do
				t3[value] = string.lower(value.displayName)
			end
			table.sort(List, function(A, B): boolean --[[ Line: 187 ]]
				-- upvalues: config1 (upval), t3 (copy)
				if A.kind == B.kind then
					local Entry = t3[A]
					local Entry1 = t3[B]
					
					return if Entry == Entry1 then if A.path == B.path then A.id < B.id else A.path < B.path else Entry < Entry1
				else
					return config1[A.kind] < config1[B.kind]
				end
			end)
			
			if sameItems(Signal(false), List) then return end
			t = {}
			
			for _, value1 in List do
				t[value1.id] = value1
			end
			Signal2(List)
		end,
		getItems = Signal,
		getItem = function(p3, p4) --[[ Line: 210 ]]
			-- upvalues: Signal (copy), t (ref)
			Signal(p3)
			
			return t[p4]
		end,
		resolveWorldItem = function(Parent) --[[ Line: 215 ]]
			-- upvalues: self (copy), t (ref), Ancestor (ref)
			local Parent1 = Parent
			local Entry = nil
			while Parent1 ~= nil do
				local SelfEntry = self[Parent1]
				Entry = if SelfEntry == nil then nil else t[SelfEntry]
				
				if Entry ~= nil and Entry.model == Parent1 then
					return if Ancestor == nil or not Parent1:IsDescendantOf(Ancestor) then nil else Entry
				end
				Parent1 = Parent1.Parent
			end
			return nil
		end
	}
end