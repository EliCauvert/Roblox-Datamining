-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:33 2026 Pacific Standard Time.

local parent = script.Parent
local getImageSetDataModule = require(parent.Generated.GetImageSetData)
local fallbackImagesModule = require(parent.Generated.FallbackImages)
local _ = require(parent.ImagesTypes)
local corePackages = script:FindFirstAncestor("CorePackages")
local var3 = require(parent.getResolutionScale)()
local _ = nil
local _ = nil
local var4, var5 = getImageSetDataModule(var3)
local uiblox = require(parent.Parent.BuilderIcons).Migration.uiblox
local whitelistedIconAssetsModule = require(parent.whitelistedIconAssets)

local function _(p0, p1) --[[ line: 38 | named "getImagePath" ]]
	-- upvalues: fallbackImagesModule (ref)
	return if p0 == nil then fallbackImagesModule[p1] else string.format("rbxasset://%s/SpriteSheets/%s.png", p0, p1)
end

local var7 = (function() --[[ line: 20 | named "getPackagePath" ]]
	-- upvalues: parent (ref), corePackages (ref)
	if corePackages == nil then
		return nil
	end
	local t = {}
	local var11 = parent
	while var11 ~= nil and var11 ~= corePackages do
		table.insert(t, 1, var11.Name)
		var11 = var11.Parent
	end
	return "LuaPackages/" .. table.concat(t, "/")
end)()
local t = {}

for i, v in var4 do
	if whitelistedIconAssetsModule[i] ~= nil or not uiblox[i] then
		assert(typeof(v) == "table", "invalid sourceData from GetImageSetData for scale " .. tostring(var5))
		local t_1 = {}
		
		for i_1, v_1 in v do
			if i_1 == "ImageSet" then
				t_1.Image = if var7 == nil then fallbackImagesModule[v_1] else string.format("rbxasset://%s/SpriteSheets/%s.png", var7, v_1)
			else
				t_1[i_1] = v_1
			end
		end
		t[i] = t_1
	end
end
setmetatable(t, {
	__index = function(p2, p3) --[[ line: 70 ]]
		-- upvalues: uiblox (ref)
		if uiblox[p3] then
			local t = {
				ImageRectOffset = Vector2.new(0, 0),
				ImageRectSize = Vector2.new(0, 0),
				Image = p3
			}
			p2[p3] = t
			
			return t
		end
		error(("%q is not a valid member of Images"):format(tostring(p3)), 2)
	end
})

return t