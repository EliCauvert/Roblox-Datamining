local parent = script.Parent
local getImageSetDataModule = require(parent.Generated.GetImageSetData)
local fallbackImagesModule = require(parent.Generated.FallbackImages)
local _ = require(parent.ImagesTypes)
local corePackages = script:FindFirstAncestor("CorePackages")
local var1 = require(parent.getResolutionScale)()
local _ = nil
local _ = nil
local var2, var3 = getImageSetDataModule(var1)
local uiblox = require(parent.Parent.BuilderIcons).Migration.uiblox
local whitelistedIconAssetsModule = require(parent.whitelistedIconAssets)

local function _(p1, p2)
	-- upvalues: fallbackImagesModule (ref)
	return if p1 == nil then fallbackImagesModule[p2] else string.format("rbxasset://%s/SpriteSheets/%s.png", p1, p2)
end

local var4 = (function()
	-- upvalues: parent (ref), corePackages (ref)
	if corePackages == nil then
		return nil
	end
	local t = {}
	local var5 = parent
	while var5 ~= nil and var5 ~= corePackages do
		table.insert(t, 1, var5.Name)
		var5 = var5.Parent
	end
	return "LuaPackages/" .. table.concat(t, "/")
end)()
local t = {}

for i, v in var2 do
	if whitelistedIconAssetsModule[i] ~= nil or not uiblox[i] then
		assert(typeof(v) == "table", "invalid sourceData from GetImageSetData for scale " .. tostring(var3))
		local t_1 = {}
		
		for i_1, v_1 in v do
			if i_1 == "ImageSet" then
				t_1.Image = if var4 == nil then fallbackImagesModule[v_1] else string.format("rbxasset://%s/SpriteSheets/%s.png", var4, v_1)
			else
				t_1[i_1] = v_1
			end
		end
		t[i] = t_1
	end
end
setmetatable(t, {
	__index = function(p1, p2)
		-- upvalues: uiblox (ref)
		if uiblox[p2] then
			local t = {
				ImageRectOffset = Vector2.new(0, 0),
				ImageRectSize = Vector2.new(0, 0),
				Image = p2
			}
			p1[p2] = t
			
			return t
		end
		error(("%q is not a valid member of Images"):format(tostring(p2)), 2)
	end
})

return t