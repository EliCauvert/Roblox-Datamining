local t = {
	AreCollisionCostsShown = {
		name = "AreCollisionCostsShown",
		description = "Highlights assemblies in the world with color from green to red based on how costly the collision computation is.",
		type = "Box",
		tags = { "Performance", "Collision" }
	},
	AreAnchorsShown = {
		name = "AreAnchorsShown",
		description = "When set to true, parts that are BasePart.Anchored will show a gray surface outline on the surface of the part\226\128\153s bounding box that is currently facing the ground.",
		type = "Adorn",
		tags = { "Behavior", "Constraints" }
	},
	AreUnalignedPartsShown = {
		name = "AreUnalignedPartsShown",
		description = "When set to true, parts that aren\226\128\153t aligned on the 1x1x1 grid will be outlined yellow.",
		type = "Box",
		tags = { "Behavior" }
	},
	AreContactIslandsShown = {
		name = "AreContactIslandsShown",
		description = "When set to true, each contact island will render SelectionBox adorns on the parts in contact islands, where each contact island is assigned a random color.",
		type = "Box",
		tags = { "Performance", "Collision" }
	},
	AreOwnersShown = {
		name = "AreOwnersShown",
		description = "When set to true, each Player\226\128\153s character is outlined with a unique color, and each part that the player has network ownership over is outlined with the same color.",
		type = "Box",
		tags = { "Behavior", "Networking" }
	},
	AreRegionsShown = {
		name = "AreRegionsShown",
		description = "When set to true, a cylinder is drawn around each Player\226\128\153s character, representing their Player.SimulationRadius.",
		type = "Adorn",
		tags = { "Behavior", "Networking" }
	},
	AreAwakePartsHighlighted = {
		name = "AreAwakePartsHighlighted",
		description = "When set to true, parts that are actively being physically simulated will have a red outline.",
		type = "Box",
		tags = { "Performance", "Forces", "Collison" }
	},
	AreContactPointsShown = {
		name = "AreContactPointsShown",
		description = "When set to true, sphere adorns will be drawn at the contact points of each part where physics interactions are occurring. Each sphere also has an arrow drawn in 3D, facing the surface that the contact point is detecting.",
		type = "Adorn",
		tags = { "Performance", "Contacts" }
	},
	AreJointCoordinatesShown = {
		name = "AreJointCoordinatesShown",
		description = "When set to true, XYZ axes are rendered at the BasePart.CFrame of every part.",
		type = "Adorn",
		tags = { "Behavior" }
	},
	AreMechanismsShown = {
		name = "AreMechanismsShown",
		description = "When set to true, every individual mechanism of parts is given a unique color.",
		type = "Box",
		tags = { "Behavior", "Constraints" }
	},
	AreAssembliesShown = {
		name = "AreAssembliesShown",
		description = "When set to true, each physics assembly is assigned a unique color and the Part associated with the assembly are outlined with the color. Parts that are attached together by JointInstance will share the same color.",
		type = "Box",
		tags = { "Behavior", "Constraints" }
	},
	IsTreeShown = {
		name = "IsTreeShown",
		description = "When set to true, the joint connections of each part, and the states of their underlying primitive components are visualized as a spanning tree.",
		type = "Adorn",
		tags = { "Behavior", "Constraints" }
	},
	AreTimestepsShown = {
		name = "AreTimestepsShown",
		description = "When set to true, all non-sleeping parts are outlined with red, yellow, or green corresponding to their simulation timestep of 240hz, 120hz, or 60hz.",
		type = "Box",
		tags = { "Performance", "Forces" }
	}
}

if game:DefineFastFlag("SlimDevConsole2", false) then
	for i, v in pairs(t) do
		v.learnMoreUrl = "https://create.roblox.com/docs/reference/engine/classes/PhysicsSettings#" .. i
	end
	t.SlimTintMode = {
		name = "SlimTintMode",
		description = "None - No tint will be applied.\nLOD - Distinct colors for each LOD. Blue is always the lowest.\nMeshes - Distinct colors for each mesh.\nMeshResourcePtr - Distinct colors for each shared Mesh Resource.\nContentId - Distinct colors based on Content Id.\nZone - Green for HL zone (datamodel is present), Yellow for LL zone (datamodel is absent).",
		type = "Tint",
		kind = "Dropdown",
		getter = "GetTintMode",
		setter = "SetTintMode",
		service = "SlimDebugSettings",
		tags = { "Performance" }
	}
end
return t