local _ = require(script:FindFirstAncestor("InGameAssetReporting").Analysis.Types)

function extractAssetIdsFromInstance(a)
	local t = {
		Package = {},
		Model = {},
		Image = {},
		Mesh = {},
		Text = {},
		Video = {}
	}
	
	if a:IsA("PackageLink") and a.PackageId ~= "" and a.VersionNumber > 0 then
		table.insert(t.Package, { id = a.PackageId, version = a.VersionNumber })
		
		return t
	elseif a:IsA("Model") and a.SourceAssetId > 0 then
		table.insert(t.Model, tostring(a.SourceAssetId))
		
		return t
	elseif a:IsA("MeshPart") and a.MeshId ~= "" then
		table.insert(t.Mesh, a.MeshId)
		
		if a.TextureID == "" then
			return t
		else
			table.insert(t.Image, a.TextureID)
			
			return t
		end
	elseif (a.ClassName == "FileMesh" or a.ClassName == "SpecialMesh" and a.MeshType == Enum.MeshType.FileMesh) and a.MeshId ~= "" then
		table.insert(t.Mesh, a.MeshId)
		
		if a.TextureId == "" then
		else
			table.insert(t.Image, a.TextureId)
			
			return t
		end
	elseif a:IsA("ImageLabel") and a.Image ~= "" then
		table.insert(t.Image, a.Image)
		
		return t
	elseif a:IsA("ImageButton") then
		if a.Image ~= "" then
			table.insert(t.Image, a.Image)
		end
		if a.HoverImage ~= "" then
			table.insert(t.Image, a.HoverImage)
		end
		if a.PressedImage == "" then
		else
			table.insert(t.Image, a.PressedImage)
			
			return t
		end
	elseif a:IsA("Decal") and a.Texture ~= "" then
		table.insert(t.Image, a.Texture)
		
		return t
	elseif a:IsA("SurfaceAppearance") and a.ColorMap ~= "" then
		table.insert(t.Image, a.ColorMap)
		
		return t
	elseif a:IsA("TextLabel") and a.Text ~= "" and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
		table.insert(t.Text, a.Text)
		
		return t
	elseif a:IsA("TextButton") and a.Text ~= "" and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
		table.insert(t.Text, a.Text)
		
		return t
	elseif a:IsA("TextBox") and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
		if a.Text ~= "" then
			table.insert(t.Text, a.Text)
			
			return t
		elseif a.PlaceholderText == "" then
		else
			table.insert(t.Text, a.PlaceholderText)
			
			return t
		end
	elseif not a:IsA("VideoFrame") then
		return nil
	elseif a.Video == "" then
	else
		table.insert(t.Video, a.Video)
		
		return t
	end
end

return extractAssetIdsFromInstance