local _ = require(script:FindFirstAncestor("InGameAssetReporting").Analysis.Types)

function extractAssetIdsFromInstance(Object)
	local config = {
		Package = {},
		Model = {},
		Image = {},
		Mesh = {},
		Text = {},
		Video = {}
	}
	
	if Object:IsA("PackageLink") and Object.PackageId ~= "" and Object.VersionNumber > 0 then
		table.insert(config.Package, { id = Object.PackageId, version = Object.VersionNumber })
		
		return config
	end
	if Object:IsA("Model") and Object.SourceAssetId > 0 then
		table.insert(config.Model, (tostring(Object.SourceAssetId)))
		
		return config
	end
	if Object:IsA("MeshPart") and Object.MeshId ~= "" then
		table.insert(config.Mesh, Object.MeshId)
		
		if Object.TextureID ~= "" then
			table.insert(config.Image, Object.TextureID)
			
			return config
		end
	elseif (Object.ClassName == "FileMesh" or Object.ClassName == "SpecialMesh" and Object.MeshType == Enum.MeshType.FileMesh) and Object.MeshId ~= "" then
		table.insert(config.Mesh, Object.MeshId)
		
		if Object.TextureId ~= "" then
			table.insert(config.Image, Object.TextureId)
			
			return config
		end
	else
		if Object:IsA("ImageLabel") and Object.Image ~= "" then
			table.insert(config.Image, Object.Image)
			
			return config
		end
		if Object:IsA("ImageButton") then
			if Object.Image ~= "" then
				table.insert(config.Image, Object.Image)
			end
			if Object.HoverImage ~= "" then
				table.insert(config.Image, Object.HoverImage)
			end
			if Object.PressedImage ~= "" then
				table.insert(config.Image, Object.PressedImage)
				
				return config
			end
		elseif Object:IsA("Decal") and Object.Texture ~= "" then
			table.insert(config.Image, Object.Texture)
			
			return config
		elseif Object:IsA("SurfaceAppearance") and Object.ColorMap ~= "" then
			table.insert(config.Image, Object.ColorMap)
			
			return config
		elseif Object:IsA("TextLabel") and Object.Text ~= "" and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
			table.insert(config.Text, Object.Text)
			
			return config
		elseif Object:IsA("TextButton") and Object.Text ~= "" and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
			table.insert(config.Text, Object.Text)
			
			return config
		elseif Object:IsA("TextBox") and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
			if Object.Text ~= "" then
				table.insert(config.Text, Object.Text)
				
				return config
			elseif Object.PlaceholderText ~= "" then
				table.insert(config.Text, Object.PlaceholderText)
				
				return config
			end
		elseif not Object:IsA("VideoFrame") then
			return nil
		elseif Object.Video ~= "" then
			table.insert(config.Video, Object.Video)
			
			return config
		end
	end
	return config
end

return extractAssetIdsFromInstance