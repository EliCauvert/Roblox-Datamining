local parent = script.Parent
local staticFallbackImagesModule = require(parent.Deprecated.StaticFallbackImages)
local var1 = require(parent.Deprecated.GetDeprecatedIconImageSetData)(require(parent.getResolutionScale)())
local uiblox = require(parent.Parent.BuilderIcons).Migration.uiblox
local whitelistedIconAssetsModule = require(parent.whitelistedIconAssets)
local t = {}

for i, v in var1 do
	if uiblox[i] and whitelistedIconAssetsModule[i] == nil then
		local t_1 = {}
		
		for i_1, v_1 in v do
			if i_1 == "ImageSet" then
				t_1.Image = staticFallbackImagesModule[v_1]
			else
				t_1[i_1] = v_1
			end
		end
		t[i] = t_1
	end
end
return t