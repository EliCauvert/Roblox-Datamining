local promiseModule = require(script:FindFirstAncestor("DataHydration").Parent.Promise)
local _ = require(script.Parent.BuildLibraryDataStoreTypes)
local list = {
	"Workspace", "ReplicatedStorage", "ReplicatedFirst", "Lighting",
	"SoundService", "StarterGui", "StarterPack", "StarterPlayer"
}
local t = {
	Decal = "Texture",
	Texture = "Texture",
	ImageLabel = "Image",
	ImageButton = "Image",
	ParticleEmitter = "Texture",
	Beam = "Texture",
	Trail = "Texture",
	MeshPart = "TextureID",
	SpecialMesh = "TextureId"
}
local list_1 = {
	{
		className = "Model",
		stopAtMatch = true,
		roots = { "Workspace" },
		properties = {}
	},
	{
		className = "Sound",
		roots = list,
		properties = { "SoundId" },
		nonEmptyProperties = { "SoundId" }
	}
}

for i, v in t do
	table.insert(list_1, {
		className = i,
		roots = list,
		properties = { v },
		nonEmptyProperties = { v }
	})
end
table.sort(list_1, function(p1, p2)
	return p1.className < p2.className
end)

local function _(p1, p2, p3)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p4, p5)
		-- upvalues: p1 (ref), p2 (ref), p3 (ref)
		local ok, status = pcall(function()
			-- upvalues: p1 (copy), p2 (copy), p3 (copy), p4 (ref), p5 (ref)
			game:GetService("ExperienceService"):ExecuteCrossExperienceCall(p1, p2, function(p6)
				-- upvalues: p3 (copy), p4 (copy), p5 (copy)
				local ok, status = pcall(p3, p6)
				
				if ok then
					p4(status)
					
					return
				end
				p5(status)
			end, p5)
		end)
		
		if not ok then
			p5(status)
		end
	end)
end

return {
	createQuery = function(p1)
		-- upvalues: promiseModule (ref), t (ref)
		return {
			executeQuery = function(p2)
				-- upvalues: p1 (ref), promiseModule (copy)
				local var1 = 0
				
				local function attempt()
					-- upvalues: p1 (copy), var1 (write), p2 (ref), promiseModule (copy), attempt (ref)
					assert(p1(), "Library request belongs to a disposed state")
					var1 += 1
					
					local var2 = function(p3)
						-- upvalues: p1 (copy)
						assert(p1(), "Library request belongs to a disposed state")
						
						return p3
					end
					
					local var3 = "TeamCreate.QueryInstances"
					
					return promiseModule.new(function(p3, p4)
						-- upvalues: var3 (ref), p2 (ref), var2 (ref)
						local ok, status = pcall(function()
							-- upvalues: var3 (copy), p2 (copy), var2 (copy), p3 (ref), p4 (ref)
							game:GetService("ExperienceService"):ExecuteCrossExperienceCall(var3, p2, function(p5)
								-- upvalues: var2 (copy), p3 (copy), p4 (copy)
								local ok, status = pcall(var2, p5)
								
								if ok then
									p3(status)
									
									return
								end
								p4(status)
							end, p4)
						end)
						
						if not ok then
							p4(status)
						end
					end):catch(function(p3)
						-- upvalues: p1 (copy), var1 (copy), promiseModule (copy), attempt (copy)
						return if p1() and (if p3 ~= "TeamCreate viewer is not ready." then p3 == "TeamCreate viewer replication is still settling." else true) and var1 < 60 then promiseModule.delay(1):andThen(attempt) else promiseModule.reject(p3)
					end)
				end
				
				return attempt()
			end,
			decodeItems = function(p2, p3)
				-- upvalues: p1 (ref), t (copy)
				local t_1 = {}
				local serializationError = p2.serializationError
				
				if p3 == "Model" and p2.serializedBytes ~= nil and p2.serializedBytes ~= "" then
					local serializationService = game:GetService("SerializationService")
					local ok, status = pcall(function()
						-- upvalues: serializationService (ref), p2 (ref)
						local serializedBytes = serializationService:DeserializeInstancesAsync(buffer.fromstring(p2.serializedBytes))
						assert(#serializedBytes == #p2.instances, "Instance preview count does not match metadata")
						
						for i, v in serializedBytes do
							assert(v:IsA("Model"), "Instance preview is not a Model")
						end
						return serializedBytes
					end)
					
					if ok then
						t_1 = status
					else
						serializationError = tostring(status)
					end
				end
				assert(p1(), "Library request belongs to a disposed state")
				local t_2 = {}
				
				for i, v in p2.instances do
					table.insert(t_2, {
						id = v.id,
						displayName = v.displayName,
						path = v.path,
						className = v.className,
						kind = p3,
						model = if t_1[i] ~= nil then t_1[i] else v.model,
						image = if p3 == "Image" then v.properties[t[v.className]] else nil,
						soundId = if p3 == "Sound" then v.properties.SoundId else nil
					})
				end
				return t_2, serializationError
			end
		}
	end,
	selectorsForKind = function(p4)
		-- upvalues: list_1 (ref), t (ref)
		local t_1 = {}
		
		for i, v in list_1 do
			if p4 == "Model" and v.className == "Model" or p4 == "Sound" and v.className == "Sound" or p4 == "Image" and t[v.className] ~= nil then
				table.insert(t_1, v)
			end
		end
		return t_1
	end,
	AUTHORED_ROOTS = list,
	IMAGE_PROPERTIES = t,
	SELECTORS = list_1
}