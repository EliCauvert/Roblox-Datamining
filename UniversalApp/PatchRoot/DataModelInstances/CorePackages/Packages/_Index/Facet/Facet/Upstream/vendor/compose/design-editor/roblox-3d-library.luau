local UiModule = require("./ui")
local _ = require("./environment")
local MathModule = require("./math")
local CoreModule = require("../core")
local _ = require("../design")
local PatternsModule = require("../design/patterns")
local Options = {
	"Block",
	"Ball",
	"Cylinder",
	"Wedge",
	"CornerWedge"
}
local Options1 = {
	"Front", "Back", "Top", "Bottom", "Left", "Right"
}
local Options2 = { "Default", "Atomic", "Persistent", "PersistentPerPlayer" }
local Options3 = { "Default", "Box", "Hull", "PreciseConvexDecomposition" }
local Options4 = { "Automatic", "Precise", "Performance" }
local Options5 = { "Box", "Sphere", "Cylinder", "Disc" }
local Options6 = { "Volume", "Surface" }
local Options7 = {
	"FacingCamera",
	"FacingCameraWorldUp",
	"VelocityParallel",
	"VelocityPerpendicular"
}
local Tbl = {
	position = { type = "vector3", group = "Transform", order = 1 },
	rotation = { type = "vector3", group = "Transform", order = 2 },
	transform = {
		type = "value",
		group = "Transform",
		order = 3,
		advanced = true
	}
}

local function _(Tbl, List)
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		Copy[i] = value
	end
	return Copy
end

local _ = function(p1, Group, Order, Options)
	return {
		type = p1,
		group = Group,
		order = Order,
		options = Options
	}
end

local Tbl1 = {
	canCollide = {
		type = "boolean",
		group = "Physics",
		order = 1,
		default = true
	},
	canQuery = {
		type = "boolean",
		group = "Physics",
		order = 2,
		default = true
	},
	canTouch = {
		type = "boolean",
		group = "Physics",
		order = 3,
		default = true
	},
	castShadow = {
		type = "boolean",
		group = "Physics",
		order = 4,
		default = true
	}
}
local config = {
	attributes = {
		type = "value",
		group = "Attributes",
		order = 1,
		advanced = true
	}
}
local config1 = {
	canCollide = { property = "CanCollide", convert = "boolean" },
	canQuery = { property = "CanQuery", convert = "boolean" },
	canTouch = { property = "CanTouch", convert = "boolean" },
	castShadow = { property = "CastShadow", convert = "boolean" }
}
local Tbl2 = {
	color = {
		type = "color",
		group = "Surface",
		order = 1,
		options = nil
	},
	material = {
		type = "choice",
		group = "Surface",
		order = 2,
		options = {
			"SmoothPlastic", "Plastic", "Neon", "Glass", "Metal", "CorrodedMetal", "Wood",
			"WoodPlanks", "Concrete", "Cobblestone", "Rock", "Slate", "Basalt",
			"Limestone", "Grass", "Ground", "Mud", "Fabric", "ForceField"
		}
	},
	transparency = {
		type = "number",
		group = "Surface",
		order = 3,
		options = nil
	},
	materialVariant = {
		type = "string",
		group = "Surface",
		order = 4,
		options = nil
	},
	topSurface = {
		type = "choice",
		group = "Surface",
		order = 5,
		advanced = true,
		options = {
			"Smooth", "Glue", "Weld", "Studs", "Inlet", "Universal", "Hinge", "Motor",
			"SteppingMotor", "SmoothNoOutlines"
		}
	},
	bottomSurface = {
		type = "choice",
		group = "Surface",
		order = 6,
		advanced = true,
		options = {
			"Smooth", "Glue", "Weld", "Studs", "Inlet", "Universal", "Hinge", "Motor",
			"SteppingMotor", "SmoothNoOutlines"
		}
	}
}

local function light(List)
	local Copy = table.clone({
		color = {
			type = "color",
			group = "Light",
			order = 1,
			options = nil
		},
		brightness = {
			type = "number",
			group = "Light",
			order = 2,
			options = nil
		},
		range = {
			type = "number",
			group = "Light",
			order = 3,
			options = nil
		},
		shadows = {
			type = "boolean",
			group = "Light",
			order = 4,
			options = nil
		},
		enabled = {
			type = "boolean",
			group = "Light",
			order = 7,
			default = true
		}
	})
	
	for i, value in List do
		Copy[i] = value
	end
	return {
		children = "none",
		category = "Light",
		call = "",
		fields = Copy,
		defaults = { color = "#FFE8C2", brightness = 1, range = 12 },
		build = function()
			error("schema only")
		end
	}
end

local function surfaceImage(List)
	-- upvalues: Options1 (copy)
	local Copy = table.clone({
		image = {
			type = "string",
			group = "Image",
			order = 1,
			options = nil
		},
		face = {
			type = "choice",
			group = "Image",
			order = 2,
			options = Options1
		},
		color = {
			type = "color",
			group = "Image",
			order = 3,
			options = nil
		},
		transparency = {
			type = "number",
			group = "Image",
			order = 4,
			options = nil
		}
	})
	
	for i, value in List do
		Copy[i] = value
	end
	return {
		children = "none",
		category = "Surface",
		call = "",
		fields = Copy,
		defaults = { face = "Front" },
		build = function()
			error("schema only")
		end
	}
end

local _ = function(Category, Fields, p1)
	return {
		call = "",
		fields = Fields,
		children = p1 or "none",
		category = Category,
		build = function()
			error("schema only")
		end
	}
end

local Defaults = {
	color = "#A3A2A5",
	material = "SmoothPlastic",
	size = { 4, 1, 4 },
	position = { 0, 0.5, 0 }
}

local function kinds()
	-- upvalues: PatternsModule (copy), Tbl (copy), config (copy), Options2 (copy), Tbl1 (copy), Tbl2 (copy), Options (copy), Defaults (copy), Options3 (copy), Options4 (copy), light (copy), Options1 (copy), surfaceImage (copy), Options7 (copy), Options5 (copy), Options6 (copy)
	local config1 = {
		Pattern = {
			children = "template",
			template = "render",
			category = "Structure",
			call = "",
			fields = {
				mode = {
					type = "choice",
					group = "Pattern",
					order = 1,
					options = { "linear", "grid", "radial" }
				},
				count = {
					type = "number",
					group = "Pattern",
					order = 2,
					options = nil
				},
				columns = {
					type = "number",
					group = "Pattern",
					order = 3,
					options = nil
				},
				rows = {
					type = "number",
					group = "Pattern",
					order = 4,
					options = nil
				},
				radius = {
					type = "number",
					group = "Pattern",
					order = 5,
					options = nil
				},
				phase = {
					type = "number",
					group = "Pattern",
					order = 15,
					advanced = true
				},
				extent = {
					type = "vector3",
					group = "Pattern",
					order = 6,
					options = nil
				},
				spacing = {
					type = "vector3",
					group = "Pattern",
					order = 7,
					options = nil
				},
				position = {
					type = "vector3",
					group = "Transform",
					order = 1,
					options = nil
				},
				rotation = {
					type = "vector3",
					group = "Transform",
					order = 2,
					options = nil
				},
				size = {
					type = "vector3",
					group = "Geometry",
					order = 1,
					options = nil
				},
				color = {
					type = "color",
					group = "Surface",
					order = 1,
					options = nil
				},
				namePattern = {
					type = "string",
					group = "Pattern",
					order = 8,
					options = nil
				},
				indexOrigin = {
					type = "number",
					group = "Pattern",
					order = 9,
					options = nil
				},
				variantBy = {
					type = "choice",
					group = "Pattern",
					order = 10,
					options = { "index", "sum" }
				},
				variants = {
					type = "value",
					group = "Pattern",
					order = 11,
					advanced = true
				},
				order = {
					type = "choice",
					group = "Pattern",
					order = 12,
					options = { "row", "column" }
				},
				fit = {
					type = "boolean",
					group = "Pattern",
					order = 13,
					options = nil
				},
				gap = {
					type = "vector3",
					group = "Pattern",
					order = 14,
					options = nil
				}
			},
			iteration = { fields = PatternsModule.fields },
			build = function()
				error("schema only")
			end
		},
		Array = {
			children = "template",
			template = "render",
			source = "from",
			key = "key",
			staticRows = true,
			category = "Structure",
			call = "",
			fields = {},
			build = function()
				error("schema only")
			end
		}
	}
	local Model = { children = "list", category = "Structure", call = "" }
	local Copy = table.clone(config)
	
	for i, value in {
		streamingMode = {
			type = "choice",
			group = "Model",
			order = 1,
			options = Options2
		}
	} do
		Copy[i] = value
	end
	local Copy1 = table.clone(Tbl)
	
	for i1, value1 in Copy do
		Copy1[i1] = value1
	end
	Model.fields = Copy1
	
	function Model.build()
		error("schema only")
	end
	
	config1.Model = Model
	config1.Fragment = {
		children = "list",
		category = "Structure",
		call = "",
		fields = Tbl,
		build = function()
			error("schema only")
		end
	}
	config1.Folder = {
		children = "list",
		category = "Structure",
		call = "",
		fields = {},
		build = function()
			error("schema only")
		end
	}
	config1.SpecialMesh = {
		children = "none",
		category = "Mesh",
		call = "",
		fields = {
			meshId = {
				type = "string",
				group = "Mesh",
				order = 1,
				options = nil
			},
			textureId = {
				type = "string",
				group = "Mesh",
				order = 2,
				options = nil
			},
			scale = {
				type = "vector3",
				group = "Mesh",
				order = 3,
				options = nil
			},
			offset = {
				type = "vector3",
				group = "Mesh",
				order = 4,
				options = nil
			},
			vertexColor = {
				type = "vector3",
				group = "Mesh",
				order = 6,
				options = nil
			},
			meshType = {
				type = "choice",
				group = "Mesh",
				order = 5,
				options = {
					"FileMesh", "Brick", "Sphere", "Cylinder", "Head", "Wedge", "Torso"
				}
			}
		},
		build = function()
			error("schema only")
		end
	}
	local Part = { children = "list", category = "Structure", call = "" }
	local Copy2 = table.clone(Tbl1)
	
	for i2, value2 in config do
		Copy2[i2] = value2
	end
	local Copy21 = table.clone(Tbl)
	
	for i3, value3 in Copy2 do
		Copy21[i3] = value3
	end
	local Copy3 = table.clone(Tbl2)
	
	for i4, value4 in {
		shape = {
			type = "choice",
			group = "Shape",
			order = 1,
			options = Options
		},
		partClass = {
			type = "choice",
			group = "Shape",
			order = 3,
			advanced = true,
			options = { "Auto", "Part", "WedgePart", "CornerWedgePart" }
		},
		size = {
			type = "vector3",
			group = "Shape",
			order = 2,
			options = nil
		},
		meshId = {
			type = "string",
			group = "Mesh",
			order = 1,
			options = nil
		},
		textureId = {
			type = "string",
			group = "Mesh",
			order = 2,
			options = nil
		}
	} do
		Copy3[i4] = value4
	end
	local Copy31 = table.clone(Copy21)
	
	for i5, value5 in Copy3 do
		Copy31[i5] = value5
	end
	Part.fields = Copy31
	Part.defaults = Defaults
	
	function Part.build()
		error("schema only")
	end
	
	config1.Part = Part
	local MeshPart = { children = "list", category = "Structure", call = "" }
	local Copy4 = table.clone(Tbl1)
	
	for i6, value6 in config do
		Copy4[i6] = value6
	end
	local Copy41 = table.clone(Tbl)
	
	for i7, value7 in Copy4 do
		Copy41[i7] = value7
	end
	local Copy5 = table.clone(Tbl2)
	
	for i8, value8 in {
		size = {
			type = "vector3",
			group = "Shape",
			order = 2,
			options = nil
		},
		meshId = {
			type = "string",
			group = "Mesh",
			order = 1,
			options = nil
		},
		textureId = {
			type = "string",
			group = "Mesh",
			order = 2,
			options = nil
		},
		collisionFidelity = {
			type = "choice",
			group = "Mesh",
			order = 3,
			options = Options3
		},
		renderFidelity = {
			type = "choice",
			group = "Mesh",
			order = 4,
			options = Options4
		}
	} do
		Copy5[i8] = value8
	end
	local Copy51 = table.clone(Copy41)
	
	for i9, value9 in Copy5 do
		Copy51[i9] = value9
	end
	MeshPart.fields = Copy51
	MeshPart.defaults = Defaults
	
	function MeshPart.build()
		error("schema only")
	end
	
	config1.MeshPart = MeshPart
	local Attachment = { children = "list", category = "Structure", call = "" }
	local Copy6 = table.clone(Tbl)
	
	for i10, value10 in {} do
		Copy6[i10] = value10
	end
	Attachment.fields = Copy6
	
	function Attachment.build()
		error("schema only")
	end
	
	config1.Attachment = Attachment
	config1.PointLight = light({})
	config1.SpotLight = light({
		face = {
			type = "choice",
			group = "Light",
			order = 5,
			options = Options1
		},
		angle = {
			type = "number",
			group = "Light",
			order = 6,
			options = nil
		}
	})
	config1.SurfaceLight = light({
		face = {
			type = "choice",
			group = "Light",
			order = 5,
			options = Options1
		},
		angle = {
			type = "number",
			group = "Light",
			order = 6,
			options = nil
		}
	})
	config1.Decal = surfaceImage({})
	config1.Texture = surfaceImage({
		tileU = {
			type = "number",
			group = "Image",
			order = 5,
			options = nil
		},
		tileV = {
			type = "number",
			group = "Image",
			order = 6,
			options = nil
		},
		offsetU = {
			type = "number",
			group = "Image",
			order = 7,
			options = nil
		},
		offsetV = {
			type = "number",
			group = "Image",
			order = 8,
			options = nil
		}
	})
	config1.ParticleEmitter = {
		children = "none",
		category = "Effect",
		call = "",
		fields = {
			texture = {
				type = "string",
				group = "Appearance",
				order = 1,
				options = nil
			},
			color = {
				type = "value",
				group = "Appearance",
				order = 2,
				options = nil
			},
			size = {
				type = "value",
				group = "Appearance",
				order = 3,
				options = nil
			},
			transparency = {
				type = "value",
				group = "Appearance",
				order = 4,
				options = nil
			},
			lightEmission = {
				type = "number",
				group = "Appearance",
				order = 5,
				options = nil
			},
			lightInfluence = {
				type = "number",
				group = "Appearance",
				order = 6,
				options = nil
			},
			rotation = {
				type = "value",
				group = "Appearance",
				order = 7,
				options = nil
			},
			rotSpeed = {
				type = "value",
				group = "Appearance",
				order = 8,
				options = nil
			},
			orientation = {
				type = "choice",
				group = "Appearance",
				order = 9,
				options = Options7
			},
			rate = {
				type = "number",
				group = "Emission",
				order = 1,
				options = nil
			},
			lifetime = {
				type = "value",
				group = "Emission",
				order = 2,
				options = nil
			},
			speed = {
				type = "value",
				group = "Emission",
				order = 3,
				options = nil
			},
			spreadAngle = {
				type = "value",
				group = "Emission",
				order = 4,
				options = nil
			},
			acceleration = {
				type = "vector3",
				group = "Emission",
				order = 5,
				options = nil
			},
			drag = {
				type = "number",
				group = "Emission",
				order = 6,
				options = nil
			},
			windAffectsDrag = {
				type = "boolean",
				group = "Emission",
				order = 7,
				options = nil
			},
			shape = {
				type = "choice",
				group = "Emission",
				order = 8,
				options = Options5
			},
			shapeStyle = {
				type = "choice",
				group = "Emission",
				order = 9,
				options = Options6
			},
			emissionDirection = {
				type = "choice",
				group = "Emission",
				order = 10,
				options = Options1
			},
			enabled = {
				type = "boolean",
				group = "Emission",
				order = 11,
				default = true
			}
		},
		build = function()
			error("schema only")
		end
	}
	config1.Beam = {
		children = "none",
		category = "Effect",
		call = "",
		fields = {
			attachment0 = { type = "node", group = "Beam", order = 1, options = nil },
			attachment1 = { type = "node", group = "Beam", order = 2, options = nil },
			width0 = {
				type = "number",
				group = "Beam",
				order = 3,
				options = nil
			},
			width1 = {
				type = "number",
				group = "Beam",
				order = 4,
				options = nil
			},
			curveSize0 = {
				type = "number",
				group = "Beam",
				order = 5,
				options = nil
			},
			curveSize1 = {
				type = "number",
				group = "Beam",
				order = 6,
				options = nil
			},
			segments = {
				type = "number",
				group = "Beam",
				order = 7,
				options = nil
			},
			faceCamera = {
				type = "boolean",
				group = "Beam",
				order = 8,
				options = nil
			},
			color = {
				type = "value",
				group = "Appearance",
				order = 1,
				options = nil
			},
			transparency = {
				type = "value",
				group = "Appearance",
				order = 2,
				options = nil
			},
			lightEmission = {
				type = "number",
				group = "Appearance",
				order = 3,
				options = nil
			},
			lightInfluence = {
				type = "number",
				group = "Appearance",
				order = 4,
				options = nil
			},
			texture = {
				type = "string",
				group = "Appearance",
				order = 5,
				options = nil
			},
			textureLength = {
				type = "number",
				group = "Appearance",
				order = 6,
				options = nil
			},
			textureSpeed = {
				type = "number",
				group = "Appearance",
				order = 7,
				options = nil
			},
			textureMode = {
				type = "choice",
				group = "Appearance",
				order = 8,
				options = { "Stretch", "Wrap", "Static" }
			},
			enabled = {
				type = "boolean",
				group = "Beam",
				order = 9,
				default = true
			}
		},
		build = function()
			error("schema only")
		end
	}
	config1.Fire = {
		children = "none",
		category = "Effect",
		call = "",
		fields = {
			color = { type = "color", group = "Fire", order = 1, options = nil },
			secondaryColor = { type = "color", group = "Fire", order = 2, options = nil },
			heat = {
				type = "number",
				group = "Fire",
				order = 3,
				options = nil
			},
			size = {
				type = "number",
				group = "Fire",
				order = 4,
				options = nil
			},
			enabled = {
				type = "boolean",
				group = "Fire",
				order = 5,
				default = true
			}
		},
		build = function()
			error("schema only")
		end
	}
	config1.Smoke = {
		children = "none",
		category = "Effect",
		call = "",
		fields = {
			color = {
				type = "color",
				group = "Smoke",
				order = 1,
				options = nil
			},
			opacity = {
				type = "number",
				group = "Smoke",
				order = 2,
				options = nil
			},
			riseVelocity = {
				type = "number",
				group = "Smoke",
				order = 3,
				options = nil
			},
			size = {
				type = "number",
				group = "Smoke",
				order = 4,
				options = nil
			},
			enabled = {
				type = "boolean",
				group = "Smoke",
				order = 5,
				default = true
			}
		},
		build = function()
			error("schema only")
		end
	}
	config1.Sparkles = {
		children = "none",
		category = "Effect",
		call = "",
		fields = {
			color = {
				type = "color",
				group = "Sparkles",
				order = 1,
				options = nil
			},
			enabled = {
				type = "boolean",
				group = "Sparkles",
				order = 2,
				default = true
			}
		},
		build = function()
			error("schema only")
		end
	}
	config1.Sound = {
		children = "none",
		category = "Audio",
		call = "",
		fields = {
			soundId = {
				type = "string",
				group = "Sound",
				order = 1,
				options = nil
			},
			volume = {
				type = "number",
				group = "Sound",
				order = 2,
				options = nil
			},
			playbackSpeed = {
				type = "number",
				group = "Sound",
				order = 3,
				options = nil
			},
			looped = {
				type = "boolean",
				group = "Sound",
				order = 4,
				options = nil
			},
			playing = {
				type = "boolean",
				group = "Sound",
				order = 5,
				options = nil
			},
			rollOffMinDistance = {
				type = "number",
				group = "Sound",
				order = 6,
				options = nil
			},
			rollOffMaxDistance = {
				type = "number",
				group = "Sound",
				order = 7,
				options = nil
			}
		},
		build = function()
			error("schema only")
		end
	}
	
	return config1
end

local _ = function()
	return {
		"Structure",
		"Light",
		"Surface",
		"Effect",
		"Audio"
	}
end

local config2 = {
	color = { property = "Color", convert = "color" },
	brightness = { property = "Brightness", convert = "number" },
	range = { property = "Range", convert = "reach" },
	shadows = { property = "Shadows", convert = "boolean" },
	enabled = { property = "Enabled", convert = "boolean" },
	face = { property = "Face", convert = "string", enum = "NormalId" },
	angle = { property = "Angle", convert = "angle" }
}
local config3 = {
	transparency = { property = "Transparency", convert = "unit" },
	face = { property = "Face", convert = "string", enum = "NormalId" },
	tileU = { property = "StudsPerTileU", convert = "tile" },
	tileV = { property = "StudsPerTileV", convert = "tile" },
	offsetU = { property = "OffsetStudsU", convert = "number" },
	offsetV = { property = "OffsetStudsV", convert = "number" }
}
local config4 = {
	texture = { property = "Texture", convert = "string" },
	color = { property = "Color", convert = "colorSequence" },
	size = { property = "Size", convert = "numberSequence" },
	transparency = { property = "Transparency", convert = "numberSequence" },
	lightEmission = { property = "LightEmission", convert = "unit" },
	lightInfluence = { property = "LightInfluence", convert = "unit" },
	rotation = { property = "Rotation", convert = "range" },
	rotSpeed = { property = "RotSpeed", convert = "range" },
	orientation = {
		property = "Orientation",
		convert = "string",
		enum = "ParticleOrientation"
	},
	rate = { property = "Rate", convert = "nonNegative" },
	lifetime = { property = "Lifetime", convert = "range" },
	speed = { property = "Speed", convert = "range" },
	spreadAngle = { property = "SpreadAngle", convert = "vector2" },
	acceleration = { property = "Acceleration", convert = "vector3" },
	drag = { property = "Drag", convert = "nonNegative" },
	windAffectsDrag = { property = "WindAffectsDrag", convert = "boolean" },
	shape = {
		property = "Shape",
		convert = "string",
		enum = "ParticleEmitterShape"
	},
	shapeStyle = {
		property = "ShapeStyle",
		convert = "string",
		enum = "ParticleEmitterShapeStyle"
	},
	emissionDirection = {
		property = "EmissionDirection",
		convert = "string",
		enum = "NormalId"
	},
	enabled = { property = "Enabled", convert = "boolean" }
}
local config5 = {
	width0 = { property = "Width0", convert = "nonNegative" },
	width1 = { property = "Width1", convert = "nonNegative" },
	curveSize0 = { property = "CurveSize0", convert = "number" },
	curveSize1 = { property = "CurveSize1", convert = "number" },
	segments = { property = "Segments", convert = "nonNegative" },
	faceCamera = { property = "FaceCamera", convert = "boolean" },
	color = { property = "Color", convert = "colorSequence" },
	transparency = { property = "Transparency", convert = "numberSequence" },
	lightEmission = { property = "LightEmission", convert = "unit" },
	lightInfluence = { property = "LightInfluence", convert = "unit" },
	texture = { property = "Texture", convert = "string" },
	textureLength = { property = "TextureLength", convert = "tile" },
	textureSpeed = { property = "TextureSpeed", convert = "number" },
	textureMode = {
		property = "TextureMode",
		convert = "string",
		enum = "TextureMode"
	},
	enabled = { property = "Enabled", convert = "boolean" }
}
local config6 = {
	color = { property = "Color", convert = "color" },
	secondaryColor = { property = "SecondaryColor", convert = "color" },
	heat = { property = "Heat", convert = "number" },
	size = { property = "Size", convert = "nonNegative" },
	enabled = { property = "Enabled", convert = "boolean" }
}
local config7 = {
	color = { property = "Color", convert = "color" },
	opacity = { property = "Opacity", convert = "unit" },
	riseVelocity = { property = "RiseVelocity", convert = "number" },
	size = { property = "Size", convert = "nonNegative" },
	enabled = { property = "Enabled", convert = "boolean" }
}
local config8 = {
	color = { property = "SparkleColor", convert = "color" },
	enabled = { property = "Enabled", convert = "boolean" }
}
local config9 = {
	soundId = { property = "SoundId", convert = "string" },
	volume = { property = "Volume", convert = "nonNegative" },
	playbackSpeed = { property = "PlaybackSpeed", convert = "nonNegative" },
	looped = { property = "Looped", convert = "boolean" },
	playing = { property = "Playing", convert = "boolean" },
	rollOffMinDistance = { property = "RollOffMinDistance", convert = "nonNegative" },
	rollOffMaxDistance = { property = "RollOffMaxDistance", convert = "nonNegative" }
}
local config10 = {
	collisionFidelity = {
		property = "CollisionFidelity",
		convert = "string",
		enum = "CollisionFidelity"
	},
	renderFidelity = {
		property = "RenderFidelity",
		convert = "string",
		enum = "RenderFidelity"
	}
}

local function schema()
	-- upvalues: kinds (copy)
	local KindsResult = kinds()
	
	for i, value in KindsResult do
		value.call = "Design." .. i
	end
	return {
		name = "Roblox3D",
		containerKind = "Model",
		parameter = "Host",
		parameterType = "nil",
		returnType = "Instance",
		readable = "Compose.ReadOnlyValue",
		cell = "Compose.Cell",
		newCell = "Compose.cell",
		space = "3d",
		prelude = {},
		categories = {
			"Structure",
			"Light",
			"Surface",
			"Effect",
			"Audio"
		},
		kinds = KindsResult
	}
end

return {
	create = function(p1, p2, p3)
		-- upvalues: UiModule (copy), CoreModule (copy), MathModule (copy), config1 (copy), PatternsModule (copy), config10 (copy), config2 (copy), config4 (copy), config5 (copy), config6 (copy), config7 (copy), config8 (copy), config9 (copy), config3 (copy), schema (copy)
		local NewUi = UiModule.create(p1, p2, true)
		
		local function _(p4, Callback: (any) -> ())
			-- upvalues: CoreModule (upval)
			if p4 == nil then return end
			local Readable = p4.readable
			
			if Readable then
				CoreModule.watch(function(Callback)
					-- upvalues: Callback (copy), Readable (copy)
					Callback(Callback(Readable))
				end)
				
				return
			else
				Callback(p4.literal)
			end
		end
		
		local function _vector(Entry, p4)
			if type(Entry) == "table" then
				local Entry1 = Entry[1]
				local Entry2 = Entry[2]
				local Entry3 = Entry[3]
				
				if type(Entry1) == "number" and type(Entry2) == "number" and type(Entry3) == "number" then
					return { X = Entry1, Y = Entry2, Z = Entry3 }
				end
			end
			return p4
		end
		
		local function enumItem(p4, Literal, p5)
			-- upvalues: NewUi (copy)
			return NewUi.values.enum(p4, if type(Literal) == "string" then Literal else p5)
		end
		
		local function place(p4, Callback)
			-- upvalues: MathModule (upval), _vector (copy), CoreModule (upval)
			local config = { X = 0, Y = 0, Z = 0 }
			local config1 = { X = 0, Y = 0, Z = 0 }
			local FrameResult = MathModule.frame({ X = 0, Y = 0, Z = 0 })
			
			local function update()
				-- upvalues: Callback (copy), MathModule (upval), FrameResult (ref), config (ref), config1 (ref)
				Callback(MathModule.multiply(FrameResult, MathModule.multiply(MathModule.frame(config), MathModule.rotation(math.rad(config1.X), math.rad(config1.Y), (math.rad(config1.Z))))))
			end
			
			local Position = p4.position
			
			local function v102(p5)
				-- upvalues: config (ref), _vector (upval), update (copy)
				config = _vector(p5, { X = 0, Y = 0, Z = 0 })
				update()
			end
			
			if Position ~= nil then
				local Readable = Position.readable
				
				if Readable then
					CoreModule.watch(function(Callback)
						-- upvalues: v102 (copy), Readable (copy)
						v102(Callback(Readable))
					end)
				else
					config = _vector(Position.literal, { X = 0, Y = 0, Z = 0 })
					update()
				end
			end
			local Rotation = p4.rotation
			
			local function v105(p5)
				-- upvalues: config1 (ref), _vector (upval), update (copy)
				config1 = _vector(p5, { X = 0, Y = 0, Z = 0 })
				update()
			end
			
			if Rotation ~= nil then
				local Readable1 = Rotation.readable
				
				if Readable1 then
					CoreModule.watch(function(Callback)
						-- upvalues: v105 (copy), Readable1 (copy)
						v105(Callback(Readable1))
					end)
				else
					config1 = _vector(Rotation.literal, { X = 0, Y = 0, Z = 0 })
					update()
				end
			end
			local Transform = p4.transform
			
			local function v108(Entry)
				-- upvalues: FrameResult (ref), MathModule (upval), update (copy)
				FrameResult = MathModule.frame({ X = 0, Y = 0, Z = 0 })
				
				if type(Entry) == "table" then
					local Entry1 = if type(Entry[1]) == "table" then Entry else { Entry }
					for _, value in Entry1 do
						assert(type(value) == "table", "A transform needs an operation or twelve numeric CFrame components")
						local Position = value.position
						local Angles = value.angles
						
						if Position == nil and Angles == nil then
							assert(#value == 12, "A transform has twelve numeric CFrame components")
							local t = {}
							
							for i = 1, 12 do
								local Entry2 = value[i]
								assert(type(Entry2) == "number", "A transform has twelve numeric CFrame components")
								t[i] = Entry2
							end
							FrameResult = MathModule.multiply(FrameResult, t)
							continue
						else
							assert(Position ~= nil ~= (Angles ~= nil) and #value == 0, "A transform operation has one position or angles")
							
							for i1 in value do
								assert(i1 == (if Position == nil then "angles" else "position"), "A transform operation has one operand")
							end
							local Angles1 = if Position == nil then Angles else Position
							assert(type(Angles1) == "table" and #Angles1 == 3, "A transform operation needs three numbers")
							local Angle = Angles1[1]
							local Angle1 = Angles1[2]
							local Angle2 = Angles1[3]
							assert(type(Angle) == "number" and type(Angle1) == "number" and type(Angle2) == "number", "A transform operation needs three numbers")
							FrameResult = MathModule.multiply(FrameResult, if Position == nil then MathModule.multiply(MathModule.multiply(MathModule.rotation(Angle, 0, 0), MathModule.rotation(0, Angle1, 0)), MathModule.rotation(0, 0, Angle2)) else MathModule.frame({ X = Angle, Y = Angle1, Z = Angle2 }))
							continue
						end
					end
				end
				update()
			end
			
			if Transform ~= nil then
				local Readable2 = Transform.readable
				
				if Readable2 then
					CoreModule.watch(function(Callback)
						-- upvalues: v108 (copy), Readable2 (copy)
						v108(Callback(Readable2))
					end)
				else
					v108(Transform.literal)
				end
			end
			update()
		end
		
		local _ = function(p5)
			return if type(p5) == "string" then p5 else nil
		end
		
		local function hexColor(Entry: string)
			-- upvalues: NewUi (copy)
			if type(Entry) == "string" and string.match(Entry, "^#%x%x%x%x%x%x$") then
				return NewUi.hex(Entry)
			end
			if type(Entry) ~= "table" then
				return nil
			end
			local Entry1 = Entry[1]
			local Entry2 = Entry[2]
			local Entry3 = Entry[3]
			assert(type(Entry1) == "number" and (type(Entry2) == "number" and type(Entry3) == "number") and #Entry == 3, "A color has three RGB channels")
			
			for i in Entry do
				assert(i == 1 or (i == 2 or i == 3), "A color has three RGB channels")
			end
			return NewUi.values.color(Entry1, Entry2, Entry3)
		end
		
		local function rgb(Text: string)
			return if type(Text) == "string" and string.match(Text, "^#%x%x%x%x%x%x$") then {
				(tonumber(string.sub(Text, 2, 3), 16) or 0) / 255,
				(tonumber(string.sub(Text, 4, 5), 16) or 0) / 255,
				(tonumber(string.sub(Text, 6, 7), 16) or 0) / 255
			} else nil
		end
		
		local _ = function(Entry)
			if type(Entry) ~= "table" then
				return nil, nil
			end
			local Entry1 = Entry[1]
			local Entry2 = Entry[2]
			
			if type(Entry1) == "number" and type(Entry2) == "number" then
				return Entry1, Entry2
			else
				return nil, nil
			end
		end
		
		local function sequence(List, p5)
			-- upvalues: rgb (copy)
			if type(List) == "string" and p5 then
				local RgbResult = rgb(List)
				
				return if RgbResult then {
					{ 0, RgbResult[1], RgbResult[2], RgbResult[3] },
					{ 1, RgbResult[1], RgbResult[2], RgbResult[3] }
				} else nil
			end
			if type(List) == "number" and not p5 then
				return { { 0, List }, { 1, List } }
			end
			if type(List) ~= "table" then
				return nil
			end
			local List1 = {}
			
			for _, value in List do
				if type(value) ~= "table" then
					return nil
				end
				local Entry = value[1]
				local Entry1 = value[2]
				
				if type(Entry) ~= "number" then
					return nil
				end
				if p5 then
					local RgbResult = rgb(Entry1)
					
					if RgbResult == nil then
						return nil
					end
					table.insert(List1, { Entry, RgbResult[1], RgbResult[2], RgbResult[3] })
				elseif type(Entry1) ~= "number" then
					return nil
				else
					table.insert(List1, { Entry, Entry1 })
				end
			end
			return if #List1 > 0 then List1 else nil
		end
		
		local function converted(p6, Entry: number)
			-- upvalues: NewUi (copy), hexColor (copy), _vector (copy), p3 (copy), sequence (copy)
			local Convert = p6.convert
			
			if Convert == "number" then
				return if type(Entry) == "number" then Entry else nil
			end
			if Convert == "nonNegative" then
				return if type(Entry) == "number" then math.max(Entry, 0) else nil
			end
			if Convert == "unit" then
				return if type(Entry) == "number" then math.clamp(Entry, 0, 1) else nil
			end
			if Convert == "reach" then
				return if type(Entry) == "number" then math.clamp(Entry, 0, 60) else nil
			end
			if Convert == "angle" then
				return if type(Entry) == "number" then math.clamp(Entry, 0, 180) else nil
			end
			if Convert == "tile" then
				return if type(Entry) == "number" then math.max(Entry, 0.01) else nil
			end
			if Convert == "boolean" then
				return Entry == true
			end
			if Convert == "string" then
				local Entry1 = if type(Entry) == "string" then Entry else nil
				
				return if Entry1 == nil then nil elseif p6.enum then NewUi.values.enum(p6.enum, Entry1) else Entry1
			end
			if Convert == "color" then
				return hexColor(Entry)
			end
			if Convert == "vector3" then
				local Vector = _vector(Entry, { X = 0, Y = 0, Z = 0 })
				
				return NewUi.values.vector3(Vector.X, Vector.Y, Vector.Z)
			end
			if Convert == "vector2" then
				local v1 = nil
				local v2 = nil
				if type(Entry) == "table" then
					local Entry2 = Entry[1]
					local Entry3 = Entry[2]
					
					if type(Entry2) == "number" and type(Entry3) == "number" then
						v1 = Entry2
						v2 = Entry3
					else
						v1 = nil
						v2 = nil
					end
				else
					v1 = nil
					v2 = nil
				end
				local Vector2Function = NewUi.values.vector2
				
				return if v1 and v2 then Vector2Function(v1, v2) else nil
			elseif Convert == "range" then
				local v3 = nil
				local v4 = nil
				if type(Entry) == "table" then
					local Entry4 = Entry[1]
					local Entry5 = Entry[2]
					
					if type(Entry4) == "number" and type(Entry5) == "number" then
						v4 = Entry4
						v3 = Entry5
					else
						v4 = nil
						v3 = nil
					end
				else
					v4 = nil
					v3 = nil
				end
				local _NumberRange = if p3 then p3.numberRange else nil
				
				return if v4 and v3 and _NumberRange then _NumberRange(v4, v3) else nil
			elseif Convert == "numberSequence" then
				local SequenceResult = sequence(Entry, false)
				local NumberSequence = if p3 then p3.numberSequence else nil
				
				return if SequenceResult and NumberSequence then NumberSequence(SequenceResult) else nil
			else
				local SequenceResult = sequence(Entry, true)
				local ColorSequence = if p3 then p3.colorSequence else nil
				
				return if SequenceResult and ColorSequence then ColorSequence(SequenceResult) else nil
			end
		end
		
		local function bind(NewResult, p6, List)
			-- upvalues: converted (copy), NewUi (copy), CoreModule (upval)
			for i, value in List do
				local v1 = p6[i]
				
				local function v146(p7)
					-- upvalues: converted (upval), value (copy), NewUi (upval), NewResult (copy)
					local ConvertedResult = converted(value, p7)
					
					if ConvertedResult ~= nil then
						NewUi.set(NewResult, value.property, ConvertedResult)
					end
				end
				
				if v1 ~= nil then
					local Readable = v1.readable
					
					if Readable then
						CoreModule.watch(function(Callback)
							-- upvalues: v146 (copy), Readable (copy)
							v146(Callback(Readable))
						end)
					else
						local ConvertedResult = converted(value, v1.literal)
						
						if ConvertedResult ~= nil then
							NewUi.set(NewResult, value.property, ConvertedResult)
						end
					end
				end
			end
		end
		
		local function attach(Attachment, List)
			-- upvalues: NewUi (copy)
			for _, value in List do
				if value ~= nil then
					NewUi.set(value, "Parent", Attachment)
				end
			end
		end
		
		local _ = function(p7, p8)
			-- upvalues: NewUi (copy), CoreModule (upval)
			local Attributes = p8.attributes
			
			local function v151(Literal)
				-- upvalues: NewUi (upval), p7 (copy)
				if type(Literal) ~= "table" then return end
				local Attributes = {}
				
				for i, value in Literal do
					if type(i) == "string" and type(value) ~= "table" then
						Attributes[i] = value
					end
				end
				NewUi.runtime.decorate(p7, { Attributes = Attributes })
			end
			
			if Attributes == nil then return end
			local Readable = Attributes.readable
			
			if Readable then
				CoreModule.watch(function(Callback)
					-- upvalues: v151 (copy), Readable (copy)
					v151(Callback(Readable))
				end)
				
				return
			else
				v151(Attributes.literal)
			end
		end
		
		local function body(MeshPart, p9, p10)
			-- upvalues: NewUi (copy), enumItem (copy), CoreModule (upval), _vector (copy), hexColor (copy), bind (copy), config1 (upval), attach (copy), place (copy)
			NewUi.set(MeshPart, "Anchored", true)
			local TopSurface = p9.topSurface
			
			local function v155(p11)
				-- upvalues: NewUi (upval), MeshPart (copy), enumItem (upval)
				NewUi.set(MeshPart, "TopSurface", enumItem("SurfaceType", p11, "Smooth"))
			end
			
			if TopSurface ~= nil then
				local Readable = TopSurface.readable
				
				if Readable then
					CoreModule.watch(function(Callback)
						-- upvalues: v155 (copy), Readable (copy)
						v155(Callback(Readable))
					end)
				else
					NewUi.set(MeshPart, "TopSurface", enumItem("SurfaceType", TopSurface.literal, "Smooth"))
				end
			end
			local BottomSurface = p9.bottomSurface
			
			local function v158(p11)
				-- upvalues: NewUi (upval), MeshPart (copy), enumItem (upval)
				NewUi.set(MeshPart, "BottomSurface", enumItem("SurfaceType", p11, "Smooth"))
			end
			
			if BottomSurface ~= nil then
				local Readable1 = BottomSurface.readable
				
				if Readable1 then
					CoreModule.watch(function(Callback)
						-- upvalues: v158 (copy), Readable1 (copy)
						v158(Callback(Readable1))
					end)
				else
					NewUi.set(MeshPart, "BottomSurface", enumItem("SurfaceType", BottomSurface.literal, "Smooth"))
				end
			end
			local Size = p9.size
			
			local function v161(Literal)
				-- upvalues: _vector (upval), NewUi (upval), MeshPart (copy)
				local Vector = _vector(Literal, { X = 4, Y = 1, Z = 4 })
				NewUi.set(MeshPart, "Size", NewUi.values.vector3(Vector.X, Vector.Y, Vector.Z))
			end
			
			if Size ~= nil then
				local Readable2 = Size.readable
				
				if Readable2 then
					CoreModule.watch(function(Callback)
						-- upvalues: v161 (copy), Readable2 (copy)
						v161(Callback(Readable2))
					end)
				else
					v161(Size.literal)
				end
			end
			local Color = p9.color
			
			local function v164(p11)
				-- upvalues: hexColor (upval), NewUi (upval), MeshPart (copy)
				local HexColorResult = hexColor(p11)
				
				if HexColorResult ~= nil then
					NewUi.set(MeshPart, "Color", HexColorResult)
				end
			end
			
			if Color ~= nil then
				local Readable3 = Color.readable
				
				if Readable3 then
					CoreModule.watch(function(Callback)
						-- upvalues: v164 (copy), Readable3 (copy)
						v164(Callback(Readable3))
					end)
				else
					local HexColorResult = hexColor(Color.literal)
					
					if HexColorResult ~= nil then
						NewUi.set(MeshPart, "Color", HexColorResult)
					end
				end
			end
			local Material = p9.material
			
			local function v167(p11)
				-- upvalues: NewUi (upval), MeshPart (copy), enumItem (upval)
				NewUi.set(MeshPart, "Material", enumItem("Material", p11, "SmoothPlastic"))
			end
			
			if Material ~= nil then
				local Readable4 = Material.readable
				
				if Readable4 then
					CoreModule.watch(function(Callback)
						-- upvalues: v167 (copy), Readable4 (copy)
						v167(Callback(Readable4))
					end)
				else
					NewUi.set(MeshPart, "Material", enumItem("Material", Material.literal, "SmoothPlastic"))
				end
			end
			local Transparency = p9.transparency
			
			local function v171(Value: number)
				-- upvalues: NewUi (upval), MeshPart (copy)
				NewUi.set(MeshPart, "Transparency", if type(Value) == "number" then math.clamp(Value, 0, 1) else 0)
			end
			
			if Transparency ~= nil then
				local Readable6 = Transparency.readable
				
				if Readable6 then
					CoreModule.watch(function(Callback)
						-- upvalues: v171 (copy), Readable6 (copy)
						v171(Callback(Readable6))
					end)
				else
					local Literal: number = Transparency.literal
					NewUi.set(MeshPart, "Transparency", if type(Literal) == "number" then math.clamp(Literal, 0, 1) else 0)
				end
			end
			local MaterialVariant = p9.materialVariant
			
			local function v175(p11)
				-- upvalues: NewUi (upval), MeshPart (copy)
				NewUi.set(MeshPart, "MaterialVariant", (if type(p11) == "string" then p11 else nil) or "")
			end
			
			if MaterialVariant ~= nil then
				local Readable7 = MaterialVariant.readable
				
				if Readable7 then
					CoreModule.watch(function(Callback)
						-- upvalues: v175 (copy), Readable7 (copy)
						v175(Callback(Readable7))
					end)
				else
					local Literal = MaterialVariant.literal
					NewUi.set(MeshPart, "MaterialVariant", (if type(Literal) == "string" then Literal else nil) or "")
				end
			end
			bind(MeshPart, p9, config1)
			local Attributes = p9.attributes
			
			local function v179(Literal)
				-- upvalues: NewUi (upval), MeshPart (copy)
				if type(Literal) ~= "table" then return end
				local Attributes = {}
				
				for i, value in Literal do
					if type(i) == "string" and type(value) ~= "table" then
						Attributes[i] = value
					end
				end
				NewUi.runtime.decorate(MeshPart, { Attributes = Attributes })
			end
			
			if Attributes ~= nil then
				local Readable5 = Attributes.readable
				
				if Readable5 then
					CoreModule.watch(function(Callback)
						-- upvalues: v179 (copy), Readable5 (copy)
						v179(Callback(Readable5))
					end)
				else
					v179(Attributes.literal)
				end
			end
			attach(MeshPart, p10)
			place(p9, function(p11)
				-- upvalues: NewUi (upval), MeshPart (copy)
				NewUi.set(MeshPart, "CFrame", NewUi.values.cframe(p11))
			end)
		end
		
		local _ = function(p11, p12)
			-- upvalues: NewUi (copy), bind (copy)
			return function(p13)
				-- upvalues: NewUi (upval), p11 (copy), bind (upval), p12 (copy)
				local NewNewUi = NewUi.new(p11)
				bind(NewNewUi, p13, p12)
				
				return NewNewUi
			end
		end
		
		local config = {
			meshId = { property = "MeshId", convert = "string" },
			textureId = { property = "TextureId", convert = "string" },
			scale = { property = "Scale", convert = "vector3" },
			offset = { property = "Offset", convert = "vector3" },
			meshType = {
				property = "MeshType",
				convert = "string",
				enum = "MeshType"
			},
			vertexColor = { property = "VertexColor", convert = "vector3" }
		}
		local v2 = "SpecialMesh"
		
		local function SpecialMesh(p11)
			-- upvalues: NewUi (copy), v2 (copy), bind (copy), config (copy)
			local NewNewUi = NewUi.new(v2)
			bind(NewNewUi, p11, config)
			
			return NewNewUi
		end
		
		local v3 = "PointLight"
		
		local function PointLight(p11)
			-- upvalues: NewUi (copy), v3 (copy), bind (copy), config2 (copy)
			local NewNewUi = NewUi.new(v3)
			bind(NewNewUi, p11, config2)
			
			return NewNewUi
		end
		
		local v4 = "SpotLight"
		
		local function SpotLight(p11)
			-- upvalues: NewUi (copy), v4 (copy), bind (copy), config2 (copy)
			local NewNewUi = NewUi.new(v4)
			bind(NewNewUi, p11, config2)
			
			return NewNewUi
		end
		
		local v5 = "SurfaceLight"
		
		local function SurfaceLight(p11)
			-- upvalues: NewUi (copy), v5 (copy), bind (copy), config2 (copy)
			local NewNewUi = NewUi.new(v5)
			bind(NewNewUi, p11, config2)
			
			return NewNewUi
		end
		
		local v6 = "ParticleEmitter"
		
		local function ParticleEmitter(p11)
			-- upvalues: NewUi (copy), v6 (copy), bind (copy), config4 (copy)
			local NewNewUi = NewUi.new(v6)
			bind(NewNewUi, p11, config4)
			
			return NewNewUi
		end
		
		local v7 = "Fire"
		
		local function Fire(p11)
			-- upvalues: NewUi (copy), v7 (copy), bind (copy), config6 (copy)
			local NewNewUi = NewUi.new(v7)
			bind(NewNewUi, p11, config6)
			
			return NewNewUi
		end
		
		local v8 = "Smoke"
		
		local function Smoke(p11)
			-- upvalues: NewUi (copy), v8 (copy), bind (copy), config7 (copy)
			local NewNewUi = NewUi.new(v8)
			bind(NewNewUi, p11, config7)
			
			return NewNewUi
		end
		
		local v9 = "Sparkles"
		
		local function Sparkles(p11)
			-- upvalues: NewUi (copy), v9 (copy), bind (copy), config8 (copy)
			local NewNewUi = NewUi.new(v9)
			bind(NewNewUi, p11, config8)
			
			return NewNewUi
		end
		
		local v10 = "Sound"
		local config11 = {
			Pattern = function(List)
				-- upvalues: NewUi (copy), PatternsModule (upval), CoreModule (upval)
				local Render = List.render
				local Template = if Render then Render.template else nil
				
				if Template == nil then
					return NewUi.new("Model")
				end
				local PeekResults = {}
				
				for i, value in List do
					if i ~= "render" then
						PeekResults[i] = if value.readable then value.readable:peek() else value.literal
					end
				end
				local RowsResult = PatternsModule.rows(PeekResults)
				local Model = NewUi.new("Model")
				
				local function _(List)
					local t = {}
					
					for i, value in List do
						t[i] = value
					end
					return t
				end
				
				for _, value1 in RowsResult do
					local config = {
						id = value1.id,
						name = value1.name,
						visible = value1.visible
					}
					local Position = {}
					
					for i1, value2 in value1.position do
						Position[i1] = value2
					end
					config.position = Position
					local Rotation = {}
					
					for i2, value3 in value1.rotation do
						Rotation[i2] = value3
					end
					config.rotation = Rotation
					local Size = {}
					
					for i3, value4 in value1.size do
						Size[i3] = value4
					end
					config.size = Size
					local Color = nil
					
					if type(value1.color) == "string" then
						Color = value1.color
					else
						Color = {}
						
						for i4, value5 in value1.color do
							Color[i4] = value5
						end
					end
					config.color = Color
					NewUi.set(Template(CoreModule.cell(config)), "Parent", Model)
				end
				return Model
			end,
			Array = function(p11)
				-- upvalues: NewUi (copy), CoreModule (upval)
				local From = p11.from
				local Render = p11.render
				local Rows = if From then From.rows else nil
				local Template = if Render then Render.template else nil
				
				if Rows == nil or Template == nil then
					return NewUi.new("Model")
				end
				local AnArrayNeedsAKey = assert(From and From.key, "An Array needs a key")
				local PeekResult = Rows:peek()
				local t = {}
				
				for _, value in PeekResult do
					local v11 = value[AnArrayNeedsAKey]
					assert(type(v11) == "string" or type(v11) == "number", "An Array row needs a string or number key")
					assert(not t[v11], `Duplicate Array key {v11}`)
					t[v11] = true
				end
				local Model = NewUi.new("Model")
				
				for _, value1 in PeekResult do
					NewUi.set(Template(CoreModule.cell(value1)), "Parent", Model)
				end
				return Model
			end,
			Model = function(p12, p13)
				-- upvalues: NewUi (copy), enumItem (copy), CoreModule (upval), attach (copy), place (copy), MathModule (upval)
				local Model = NewUi.new("Model")
				local Part = NewUi.new("Part")
				NewUi.set(Part, "Name", "Pivot")
				NewUi.set(Part, "Anchored", true)
				NewUi.set(Part, "Transparency", 1)
				NewUi.set(Part, "CanCollide", false)
				NewUi.set(Part, "CanQuery", false)
				NewUi.set(Part, "Size", NewUi.values.vector3(0.2, 0.2, 0.2))
				NewUi.set(Part, "Parent", Model)
				NewUi.set(Model, "PrimaryPart", Part)
				local StreamingMode = p12.streamingMode
				
				local function v208(p14)
					-- upvalues: NewUi (upval), Model (copy), enumItem (upval)
					NewUi.set(Model, "ModelStreamingMode", enumItem("ModelStreamingMode", p14, "Default"))
				end
				
				if StreamingMode ~= nil then
					local Readable = StreamingMode.readable
					
					if Readable then
						CoreModule.watch(function(Callback)
							-- upvalues: v208 (copy), Readable (copy)
							v208(Callback(Readable))
						end)
					else
						NewUi.set(Model, "ModelStreamingMode", enumItem("ModelStreamingMode", StreamingMode.literal, "Default"))
					end
				end
				local Attributes = p12.attributes
				
				local function v211(Literal)
					-- upvalues: NewUi (upval), Model (copy)
					if type(Literal) ~= "table" then return end
					local Attributes = {}
					
					for i, value in Literal do
						if type(i) == "string" and type(value) ~= "table" then
							Attributes[i] = value
						end
					end
					NewUi.runtime.decorate(Model, { Attributes = Attributes })
				end
				
				if Attributes ~= nil then
					local Readable1 = Attributes.readable
					
					if Readable1 then
						CoreModule.watch(function(Callback)
							-- upvalues: v211 (copy), Readable1 (copy)
							v211(Callback(Readable1))
						end)
					else
						v211(Attributes.literal)
					end
				end
				local ComponentsResults = {}
				attach(Model, p13)
				
				for _, value in NewUi.descendants(Model) do
					if value ~= Part and NewUi.isA(value, "BasePart") then
						ComponentsResults[value] = NewUi.components(NewUi.get(value, "CFrame"))
					end
				end
				place(p12, function(p14)
					-- upvalues: NewUi (upval), Part (copy), ComponentsResults (copy), MathModule (upval)
					NewUi.set(Part, "CFrame", NewUi.values.cframe(p14))
					
					for i, componentsResult in ComponentsResults do
						NewUi.set(i, "CFrame", NewUi.values.cframe(MathModule.multiply(p14, componentsResult)))
					end
				end)
				
				return Model
			end,
			Folder = function(_, p14)
				-- upvalues: NewUi (copy), attach (copy)
				local Folder = NewUi.new("Folder")
				attach(Folder, p14)
				
				return Folder
			end,
			SpecialMesh = SpecialMesh,
			Part = function(p14, p15)
				-- upvalues: NewUi (copy), enumItem (copy), CoreModule (upval), body (copy)
				local Literal = p14.shape and p14.shape.literal
				local Literal1 = p14.partClass and p14.partClass.literal
				local NewNewUi = if Literal1 == "Part" or Literal1 == "WedgePart" or Literal1 == "CornerWedgePart" then NewUi.new(Literal1) elseif Literal == "Wedge" then NewUi.new("WedgePart") elseif Literal == "CornerWedge" then NewUi.new("CornerWedgePart") else NewUi.new("Part")
				
				if NewUi.isA(NewNewUi, "Part") then
					local Shape = p14.shape
					
					local function v219(p16)
						-- upvalues: NewUi (upval), NewNewUi (copy), enumItem (upval)
						NewUi.set(NewNewUi, "Shape", enumItem("PartType", p16, "Block"))
					end
					
					if Shape ~= nil then
						local Readable = Shape.readable
						
						if Readable then
							CoreModule.watch(function(Callback)
								-- upvalues: v219 (copy), Readable (copy)
								v219(Callback(Readable))
							end)
						else
							NewUi.set(NewNewUi, "Shape", enumItem("PartType", Shape.literal, "Block"))
						end
					end
				end
				if p14.meshId ~= nil or p14.textureId ~= nil then
					local SpecialMesh = NewUi.new("SpecialMesh")
					NewUi.set(SpecialMesh, "MeshType", NewUi.values.enum("MeshType", "FileMesh"))
					local MeshId = p14.meshId
					
					local function v223(p16)
						-- upvalues: NewUi (upval), SpecialMesh (copy)
						NewUi.set(SpecialMesh, "MeshId", (if type(p16) == "string" then p16 else nil) or "")
					end
					
					if MeshId ~= nil then
						local Readable1 = MeshId.readable
						
						if Readable1 then
							CoreModule.watch(function(Callback)
								-- upvalues: v223 (copy), Readable1 (copy)
								v223(Callback(Readable1))
							end)
						else
							local Literal2 = MeshId.literal
							NewUi.set(SpecialMesh, "MeshId", (if type(Literal2) == "string" then Literal2 else nil) or "")
						end
					end
					local TextureId = p14.textureId
					
					local function v226(p16)
						-- upvalues: NewUi (upval), SpecialMesh (copy)
						NewUi.set(SpecialMesh, "TextureId", (if type(p16) == "string" then p16 else nil) or "")
					end
					
					if TextureId ~= nil then
						local Readable2 = TextureId.readable
						
						if Readable2 then
							CoreModule.watch(function(Callback)
								-- upvalues: v226 (copy), Readable2 (copy)
								v226(Callback(Readable2))
							end)
						else
							local Literal3 = TextureId.literal
							NewUi.set(SpecialMesh, "TextureId", (if type(Literal3) == "string" then Literal3 else nil) or "")
						end
					end
					NewUi.set(SpecialMesh, "Parent", NewNewUi)
				end
				body(NewNewUi, p14, p15)
				
				return NewNewUi
			end,
			MeshPart = function(p14, p15)
				-- upvalues: NewUi (copy), CoreModule (upval), bind (copy), config10 (upval), body (copy)
				local MeshPart = NewUi.new("MeshPart")
				local MeshId = p14.meshId
				
				local function v232(p16)
					-- upvalues: NewUi (upval), MeshPart (copy)
					pcall(NewUi.set, MeshPart, "MeshId", (if type(p16) == "string" then p16 else nil) or "")
				end
				
				if MeshId ~= nil then
					local Readable = MeshId.readable
					
					if Readable then
						CoreModule.watch(function(Callback)
							-- upvalues: v232 (copy), Readable (copy)
							v232(Callback(Readable))
						end)
					else
						local Literal = MeshId.literal
						pcall(NewUi.set, MeshPart, "MeshId", (if type(Literal) == "string" then Literal else nil) or "")
					end
				end
				local TextureId = p14.textureId
				
				local function v235(p16)
					-- upvalues: NewUi (upval), MeshPart (copy)
					pcall(NewUi.set, MeshPart, "TextureID", (if type(p16) == "string" then p16 else nil) or "")
				end
				
				if TextureId ~= nil then
					local Readable1 = TextureId.readable
					
					if Readable1 then
						CoreModule.watch(function(Callback)
							-- upvalues: v235 (copy), Readable1 (copy)
							v235(Callback(Readable1))
						end)
					else
						local Literal = TextureId.literal
						pcall(NewUi.set, MeshPart, "TextureID", (if type(Literal) == "string" then Literal else nil) or "")
					end
				end
				bind(MeshPart, p14, config10)
				body(MeshPart, p14, p15)
				
				return MeshPart
			end,
			Attachment = function(p14, p15)
				-- upvalues: NewUi (copy), attach (copy), place (copy)
				local Attachment = NewUi.new("Attachment")
				attach(Attachment, p15)
				place(p14, function(p16)
					-- upvalues: NewUi (upval), Attachment (copy)
					NewUi.set(Attachment, "CFrame", NewUi.values.cframe(p16))
				end)
				
				return Attachment
			end,
			PointLight = PointLight,
			SpotLight = SpotLight,
			SurfaceLight = SurfaceLight,
			ParticleEmitter = ParticleEmitter,
			Beam = function(p14)
				-- upvalues: NewUi (copy), bind (copy), config5 (upval), CoreModule (upval)
				local Beam = NewUi.new("Beam")
				bind(Beam, p14, config5)
				
				for _, value in { "attachment0", "attachment1" } do
					local v12 = p14[value]
					local Node = if v12 then v12.node else nil
					
					if Node then
						local Attachment: string = if value == "attachment0" then "Attachment0" else "Attachment1"
						local v13 = assert(CoreModule.currentOwner())
						NewUi.runtime.scheduler(v13).after(0, function()
							-- upvalues: CoreModule (upval), v13 (copy), NewUi (upval), Beam (copy), Attachment (copy), Node (copy)
							CoreModule.withOwner(v13, function()
								-- upvalues: NewUi (upval), Beam (upval), Attachment (upval), Node (upval)
								NewUi.runtime.decorate(Beam, { [Attachment] = Node })
							end)
						end)
					end
				end
				return Beam
			end,
			Fire = Fire,
			Smoke = Smoke,
			Sparkles = Sparkles,
			Sound = function(p15)
				-- upvalues: NewUi (copy), v10 (copy), bind (copy), config9 (copy)
				local NewNewUi = NewUi.new(v10)
				bind(NewNewUi, p15, config9)
				
				return NewNewUi
			end
		}
		config11.Fragment = config11.Model
		
		for _, value in { "Decal", "Texture" } do
			config11[value] = function(p15)
				-- upvalues: NewUi (copy), value (copy), CoreModule (upval), hexColor (copy), bind (copy), config3 (upval)
				local NewNewUi = NewUi.new(value)
				local Image = p15.image
				
				local function v247(p16)
					-- upvalues: NewUi (upval), NewNewUi (copy)
					NewUi.set(NewNewUi, "Texture", (if type(p16) == "string" then p16 else nil) or "")
				end
				
				if Image ~= nil then
					local Readable = Image.readable
					
					if Readable then
						CoreModule.watch(function(Callback)
							-- upvalues: v247 (copy), Readable (copy)
							v247(Callback(Readable))
						end)
					else
						local Literal = Image.literal
						NewUi.set(NewNewUi, "Texture", (if type(Literal) == "string" then Literal else nil) or "")
					end
				end
				local Color = p15.color
				
				local function v250(p16)
					-- upvalues: hexColor (upval), NewUi (upval), NewNewUi (copy)
					local HexColorResult = hexColor(p16)
					
					if HexColorResult ~= nil then
						NewUi.set(NewNewUi, "Color3", HexColorResult)
					end
				end
				
				if Color ~= nil then
					local Readable1 = Color.readable
					
					if Readable1 then
						CoreModule.watch(function(Callback)
							-- upvalues: v250 (copy), Readable1 (copy)
							v250(Callback(Readable1))
						end)
					else
						local HexColorResult = hexColor(Color.literal)
						
						if HexColorResult ~= nil then
							NewUi.set(NewNewUi, "Color3", HexColorResult)
						end
					end
				end
				bind(NewNewUi, p15, config3)
				
				return NewNewUi
			end
		end
		local SchemaResult = schema()
		
		for i, kind in SchemaResult.kinds do
			local Callback = assert(config11[i], `{i} has no build`)
			
			function kind.build(p15, p16, p17)
				-- upvalues: Callback (copy), NewUi (copy)
				local CallbackResult = Callback(p15, p16, p17)
				
				if CallbackResult ~= nil then
					NewUi.set(CallbackResult, "Name", p17)
				end
				return CallbackResult
			end
		end
		return SchemaResult
	end,
	schema = schema
}