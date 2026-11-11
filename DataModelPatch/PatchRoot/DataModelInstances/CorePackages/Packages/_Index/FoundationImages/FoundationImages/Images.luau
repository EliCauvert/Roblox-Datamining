local Parent = script.Parent
local FallbackImagesModule = require(Parent.Generated.FallbackImages)
local _ = require(Parent.ImagesTypes)
local CorePackages = script:FindFirstAncestor("CorePackages")
local v1, v2 = require(Parent.Generated.GetImageSetData)((require(Parent.getResolutionScale)()))
local Uiblox = require(Parent.Parent.BuilderIcons).Migration.uiblox
local WhitelistedIconAssetsModule = require(Parent.whitelistedIconAssets)

local function _(p1, p2)
	-- upvalues: FallbackImagesModule (copy)
	return if p1 == nil then FallbackImagesModule[p2] else string.format("rbxasset://%s/SpriteSheets/%s.png", p1, p2)
end

local v3 = (function(): string?
	-- upvalues: Parent (copy), CorePackages (copy)
	if CorePackages == nil then
		return nil
	end
	local List = {}
	local Parent1 = Parent
	while Parent1 ~= nil and Parent1 ~= CorePackages do
		table.insert(List, 1, Parent1.Name)
		Parent1 = Parent1.Parent
	end
	return "LuaPackages/" .. table.concat(List, "/")
end)()
local ImagesModule = {}

for i, value in v1 do
	if WhitelistedIconAssetsModule[i] ~= nil or not Uiblox[i] then
		assert(typeof(value) == "table", "invalid sourceData from GetImageSetData for scale " .. tostring(v2))
		local t = {}
		
		for i1, value1 in value do
			if i1 == "ImageSet" then
				t.Image = if v3 == nil then FallbackImagesModule[value1] else string.format("rbxasset://%s/SpriteSheets/%s.png", v3, value1)
			else
				t[i1] = value1
			end
		end
		ImagesModule[i] = t
	end
end
setmetatable(ImagesModule, {
	__index = function(p1, Image)
		-- upvalues: Uiblox (copy)
		if not Uiblox[Image] then
			error(("%q is not a valid member of Images"):format((tostring(Image))), 2)
			
			return
		end
		local config = {
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			Image = Image
		}
		p1[Image] = config
		
		return config
	end
})

return ImagesModule