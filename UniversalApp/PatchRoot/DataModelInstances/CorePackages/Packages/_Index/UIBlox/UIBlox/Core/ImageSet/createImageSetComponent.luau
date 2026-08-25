local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local uiblox = require(parent_2.BuilderIcons).Migration.uiblox
local foundationModule = require(parent_2.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useTextSizeOffset = foundationModule.Hooks.useTextSizeOffset
local scaleSliceToResolutionModule = require(parent_1.App.ImageSet.scaleSliceToResolution)
local imagesInverseModule = require(parent_1.App.ImageSet.ImagesInverse)
local getBuilderIconElementModule = require(parent.getBuilderIconElement)

return function(p1, p2)
	-- upvalues: roactModule (ref), uiblox (ref), useTokens (ref), useTextSizeOffset (ref), imagesInverseModule (ref), getBuilderIconElementModule (ref), scaleSliceToResolutionModule (ref)
	assert(p2 > 0, "resolutionScale for ImageSet must be greater than 0! got " .. tostring(p2))
	
	return roactModule.forwardRef(function(p1, p2)
		-- upvalues: roactModule (copy), uiblox (copy), useTokens (copy), useTextSizeOffset (copy), imagesInverseModule (copy), getBuilderIconElementModule (copy), p1 (ref), p2 (ref), scaleSliceToResolutionModule (copy)
		local t = {
			[roactModule.Ref] = p2,
			[roactModule.Children] = p1[roactModule.Children]
		}
		local var1 = nil
		local image = nil
		local var2 = false
		local var3 = false
		
		for i, v in pairs(p1) do
			if i ~= "Image" or typeof(v) ~= "table" then
				t[i] = v
			elseif uiblox[v.Image] then
				var3 = true
				image = v.Image
			else
				var2 = true
				var1 = v
			end
		end
		local var4 = useTokens()
		local var5 = useTextSizeOffset()
		
		if var2 or var3 then
			local var6 = if var3 then image else imagesInverseModule[var1]
			
			if var6 and uiblox[var6] then
				if not var4.Stroke then
					error(`No StyleProvider in tree for migrated icon ImageSetComponent.\n UIBlox Icon: {var6}, BuilderIcon: {uiblox[var6]}`)
				end
				return getBuilderIconElementModule(t, p1, uiblox[var6], var6, var4, var5, var4.Stroke.Standard)
			elseif var2 then
				for i_1, v_1 in pairs(var1) do
					if not t[i_1] then
						t[i_1] = v_1
					elseif i_1 == "ImageRectOffset" then
						t[i_1] = v_1 + t[i_1] * p2
					elseif i_1 == "ImageRectSize" then
						t[i_1] *= p2
					end
				end
			end
			if var2 then
				t = scaleSliceToResolutionModule(t, p2)
			end
			return roactModule.createElement(p1, t)
		end
	end)
end